unit uploadpatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,ADODB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, StdCtrls,inifiles;

type
  TForm1 = class(TForm)
    Label8: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Button8: TButton;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    Memo1: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button8Click(Sender: TObject);
var
  BlobStream: TStream;
  FileStream: TStream;
  filename,cdir:string;
begin
  IF edit6.Text <>'' then
  begin
    cdir:=extractfilepath(application.ExeName);
    //setcurrentdir(cdir+'update');
    zquery1.Active:=false;
    zquery1.SQL.Text:='select * from erpupdate_info';
    zquery1.Open;
    filename:='Qxerp.exe';
    if fileexists(filename)=false then
    begin
      showmessage('�Բ����Ҳ��������ļ�!');
    //exit;
    end else
    begin
      label7.Visible:=true;
      if zquery1.State <> dsEdit then
          zquery1.Edit;
        zquery1.FieldByName('fver').AsString:=edit6.Text;
        zquery1.FieldByName('fname').AsString :=filename;
        zquery1.FieldByName('fmemo').AsString :=memo1.Text;
        BlobStream := zquery1.CreateBlobStream(zquery1.FieldByName('ffilestream'), bmWrite);
        try
          FileStream := TFileStream.Create(filename, fmOpenRead);
          try
            BlobStream.CopyFrom(FileStream, FileStream.Size);
          finally
            FileStream.Free;
          end;
        finally
          BlobStream.Free;
        end;
        zquery1.Post;
        showmessage('�����ļ�װ�����!');
    end;
  end else
    showmessage('����д���°汾��!');
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
          strPageCode:='GB2312';
          strVer:=cfginifile.ReadString('����������','�汾��','');
          edit7.Text:= strVer;
          ZConnection1.HostName:=strServerName;
          ZConnection1.Port:=strtoint(strPort);
          ZConnection1.Database:=strDBName;
          ZConnection1.User:=strUserName;
          ZConnection1.Password:=strPwd;
          ZConnection1.ClientCodepage:=strPageCode;
          ZConnection1.Connect();
        except
          application.MessageBox('���ӷ���������','UPPatch��ʾ');
        end;
    end;
end;

end.
