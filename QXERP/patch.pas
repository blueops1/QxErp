unit patch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls,strutils, ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection,inifiles;

type
  TForm1 = class(TForm)
    Label4: TLabel;
    Button1: TButton;
    Label1: TLabel;
    Bevel1: TBevel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  currenttime:longint;
  newfile:string;
  BlobStream: TStream;
  FileStream: TStream;
begin
  newfile:='Qxerp.exe';
  with zquery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select ffilestream from erpupdate_info');
    open;
    BlobStream:=zquery1.CreateBlobStream(zquery1.FieldByName('ffilestream'), bmRead);
    try
      FileStream := TFileStream.Create(newfile, fmcreate);
          try
            FileStream.CopyFrom(BlobStream, BlobStream.Size);
          finally
            BlobStream.Free;
          end;
    finally
      FileStream.Free;
    end;
  end;
  currenttime:=gettickcount div 1000;
  while((gettickcount div 1000) < (currenttime +3)) do;
  winexec('Qxerp.exe',1);
  application.Terminate;
end;


procedure TForm1.FormActivate(Sender: TObject);
var
cfginifile:tinifile;
filename:string;
  strDBName:string;
  strServerName:string;
  strUserName:string;
  strPwd:string;
  strPort:string;
  strPageCode:string;
  strVer:string;
  strRemoteVer:string;
begin
    filename:=extractfilepath(paramstr(0))+'config.ini';
    if FileExists(filename) = False then
    begin
      application.MessageBox('�޷���ȡ�����ļ������������������������','UPPatch��ʾ');
    end else
    begin
        try
          cfginifile:=tinifile.Create(filename);
          strServerName:=cfginifile.ReadString('����������','����������','');
          strDBName:=cfginifile.ReadString('����������','���ݿ�����','');
          strUserName:=cfginifile.ReadString('����������','�û�','');
          strPwd:=cfginifile.ReadString('����������','����','');
          strPort:=cfginifile.ReadString('����������','�˿�','');
          strPageCode:=cfginifile.ReadString('����������','����','');
          strVer:=cfginifile.ReadString('����������','�汾��','');
          ZConnection1.HostName:=strServerName;
          ZConnection1.Port:=strtoint(strPort);
          ZConnection1.Database:=strDBName;
          ZConnection1.User:=strUserName;
          ZConnection1.Password:=strPwd;
          ZConnection1.ClientCodepage:=strPageCode;
          ZConnection1.Connect();
          if ZConnection1.Connected then
            with zquery1 do
            begin
              close;
              sql.Clear;
              sql.Add('select max(fver) from erpupdate_info');
              open;
              if not eof then
              begin
              strRemoteVer:=fields.Fields[0].AsString;
              label1.Caption:='�µ������汾:'+strRemoteVer;
              end else
              begin
                  application.MessageBox('δ�����κ�������Ϣ��','UPPatch��ʾ');
                  button1.Enabled:=false;
              end;
              if (strRemoteVer='') or (strtoint(strVer)>=strtoint(strRemoteVer)) then
              begin
                application.MessageBox('δ�����κ�������Ϣ��','UPPatch��ʾ');
                button1.Enabled:=false;
              end;
            end;
          Except
              application.MessageBox('�޷����ӷ�������','UPPatch��ʾ');
          end;
    end;

end;

end.