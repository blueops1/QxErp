unit dlgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ADODB,inifiles,math, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForm10 = class(TForm)
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    ZQuery1: TZQuery;
    ComboBox1: TComboBox;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation
uses Main,dbconnecter;

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
begin
  if combobox1.Text<>'' then
  begin
    
    try
    with  ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fuser,fqx from User_info where fuser='''+combobox1.Text+''' and fpwd='''+edit2.Text+'''');
      open;
      if not Eof then
      begin
      main.strUser:=fields[0].AsString;
      main.strUserQX:=fields[1].AsString;
      main.isLogined:=true;
      Main.Form1.StatusBar1.Panels.Items[2].Text := '操作员:'+main.strUser ;
      form10.Close;
      end else
      begin
        main.isLogined:=false;
        application.MessageBox('用户名或者密码错误!','系统提示');
      end;
  end;
    Except
        Application.MessageBox('数据库查询失败！','系统提示');
    end;
  end;
end;

procedure TForm10.Button2Click(Sender: TObject);
begin
  form10.Close;
  main.isLogined:=false;
end;

procedure TForm10.Button3Click(Sender: TObject);
begin
  dlgl.Form10.Height:=320;
end;

procedure TForm10.ComboBox1DropDown(Sender: TObject);
begin
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fuser from user_info');
    open;
    combobox1.Items.Clear;
    while not eof do
    begin
       combobox1.Items.Add(fields[0].asstring);
       next;
    end;
  end;
end;

procedure TForm10.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (combobox1.Text<>'') then
  begin
    try
    with  ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fuser,fqx from User_info where fuser='''+combobox1.Text+''' and fpwd='''+edit2.Text+'''');
      open;
      if not Eof then
      begin
      main.strUser:=fields[0].AsString;
      main.strUserQX:=fields[1].AsString;
      main.isLogined:=true;
      Main.Form1.StatusBar1.Panels.Items[2].Text := '操作员:'+main.strUser ;
      form10.Close;
      end else
      begin
        main.isLogined:=false;
        application.MessageBox('用户名或者密码错误!','系统提示');
      end;
  end;
    Except
        Application.MessageBox('数据库查询失败！','系统提示');
    end;
  end;
end;

procedure TForm10.FormActivate(Sender: TObject);
var
  oldver,newver:string;
begin
    oldver:='2015121401'; //****版本更新，请更改版本号！！完整日期加当日两位流水号*****；
    main.filename:=extractfilepath(paramstr(0))+'config.ini';
    if FileExists(filename) = False then
    begin
      dbconnecter.Form3.ShowModal;
    end else
    begin
        try
          cfginifile:=tinifile.Create(filename);
          strServerName:=cfginifile.ReadString('服务器设置','服务器名称','');
          strDBName:=cfginifile.ReadString('服务器设置','数据库名称','');
          strUserName:=cfginifile.ReadString('服务器设置','用户','');
          strPwd:=cfginifile.ReadString('服务器设置','密码','');
          strPort:=cfginifile.ReadString('服务器设置','端口','');
          strPageCode:=cfginifile.ReadString('服务器设置','编码','');
          cfginifile.WriteString('服务器设置','版本号',oldver);
          main.Form1.ZConnection1.HostName:=strServerName;
          main.Form1.ZConnection1.Port:=strtoint(strPort);
          main.Form1.ZConnection1.Database:=strDBName;
          main.Form1.ZConnection1.User:=strUserName;
          main.Form1.ZConnection1.Password:=strPwd;
          main.Form1.ZConnection1.ClientCodepage:=strPageCode;
          main.Form1.ZConnection1.Connect();
          if main.Form1.ZConnection1.Connected then
          begin
              main.Form1.StatusBar1.Panels.Items[0].Text := '系统信息：数据库连接成功!';
              main.Form1.StatusBar1.Panels.Items[1].Text := '当前数据库:'+strDBName+'@'+strServerName;
              with zquery1 do
              begin
                close;
                sql.Clear;
                SQL.Add('select fver from erpupdate_info');
                Open;
                if (RecordCount >0) and (not Fields.Fields[0].IsNull ) then
                begin
                  newver:=Fields.Fields[0].AsString;
                  if trim(newver)>oldver then
                  begin
                    if messagedlg('系统发现新的软件版本，是否升级？',mtconfirmation,[mbok,mbcancel],0)=mrok then
                    begin
                      winexec('uppatch.exe',1);
                      application.Terminate;
                    end;
                  end;
                end;
              end;
          end else
          begin
               dbconnecter.Form3.ShowModal;
               main.Form1.StatusBar1.Panels.Items[0].Text := '系统信息：数据库连接失败!';
          end;
        Except
         dbconnecter.Form3.ShowModal;
        end;
    end;
end;

end.
