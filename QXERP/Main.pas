unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, StdCtrls, DB, Grids, ADODB,inifiles, ExtCtrls,StrUtils,math,
  ZAbstractConnection, ZConnection, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    C1: TMenuItem;
    X1: TMenuItem;
    L1: TMenuItem;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    Button8: TButton;
    Button4: TButton;
    N3: TMenuItem;
    Button6: TButton;
    Button10: TButton;
    Button11: TButton;
    Button7: TButton;
    Button9: TButton;
    Button12: TButton;
    N4: TMenuItem;
    TabSheet6: TTabSheet;
    Button13: TButton;
    Button14: TButton;
    Button17: TButton;
    ZConnection1: TZConnection;
    TabSheet7: TTabSheet;
    Button19: TButton;
    Button20: TButton;
    Timer1: TTimer;
    ZQuery1: TZQuery;
    Panel1: TPanel;
    Label1: TLabel;
    TabSheet8: TTabSheet;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    Button36: TButton;
    Button3: TButton;
    Button37: TButton;
    Button38: TButton;
    Button39: TButton;
    Button40: TButton;
    Button41: TButton;
    Button42: TButton;
    Button18: TButton;
    Button16: TButton;
    Button43: TButton;
    Button15: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure AppLoginFalse(islogined:boolean);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button36Click(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure Button38Click(Sender: TObject);
    procedure Button39Click(Sender: TObject);
    procedure Button40Click(Sender: TObject);
    procedure Button42Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button43Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  cfginifile:tinifile;
  strDBName:string;
  strServerName:string;
  strUserName:string;
  strPwd:string;
  isLogined:Boolean;
  strUserQX:string;
  strUser:string;
  filename:string;
  strPort:string;
  strPageCode:string;
  intMessage:integer;
  boolMesscandle:boolean;
implementation
uses dbconnecter,xsygl,zgdwgl,khgl,htgl,
     cpxxgl,ckgl,about,yskjz,dlgl,bcpxxgl,
     bcpgl,yskcx,zggl,zhqxgl,xgmm,sctjcx,
     scjh,message_online,fhdgl,fhdcx,
     fapiaohezhang,ckitemrkgl,gysgl,
     ccxxgl,fpwhzcx,fcpckgl,xzht,cprk,
     cpck,bcprk,kczgxxgl,cgkcgz,ckcx,
     xzscjh,ckitemgz,qjgl,qjcx,rwdjs,
     yskjs,yskcscx,bcptsck;

{$R *.dfm}



procedure TForm1.AppLoginFalse(islogined: Boolean);
begin
  if(islogined=false) then
    main.Form1.Close;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,11,1)='1') then
    bcpxxgl.Form11.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');

end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,12,1)='1') then
    bcpgl.Form12.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,20,1)='1') then
    zhqxgl.Form14.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,14,1)='1') then
    sctjcx.Form16.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    ckcx.Form34.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,7,1)='1') then
    yskcscx.Form43.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,17,1)='1') then
    scjh.Form17.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,7,1)='1') then
    yskjs.Form41.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,2,1)='1') then
    xsygl.Form2.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  boolmesscandle:=false;
  message_online.Form18.Show;
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,1,1)='1') then
    fhdgl.Form19.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,1,1)='1') then
    fhdcx.Form20.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    ckitemrkgl.Form22.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    fapiaohezhang.Form23.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    gysgl.Form24.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button28Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    ccxxgl.Form25.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button29Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    fpwhzcx.Form26.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,4,1)='1') then
    zgdwgl.Form4.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button30Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    fcpckgl.Form27.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button31Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,6,1)='1') then
    htgl.Form6.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button32Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,16,1)='1') then
    cprk.Form29.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button33Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,16,1)='1') then
    cpck.Form30.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button34Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,15,1)='1') then
    cgkcgz.Form33.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
  if(MidStr(main.strUserQX,9,1)='1') then
    cgkcgz.Form33.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button35Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    kczgxxgl.Form32.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button36Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,12,1)='1') then
    bcprk.Form31.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button37Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    ckitemgz.Form35.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button38Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,17,1)='1') then
    xzscjh.Form36.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button39Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,19,1)='1') then
    qjgl.Form37.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,16,1)='1') then
    ckgl.from9.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button40Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,19,1)='1') then
    qjcx.Form38.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button42Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,17,1)='1') then
    rwdjs.Form39.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button43Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,12,1)='1') then
    bcptsck.Form44.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,8,1)='1') then
    cpxxgl.Form8.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,5,1)='1') then
    khgl.Form5.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,10,1)='1') then
    yskjz.form9.Show  //权限设置位为第10位 ，因为FORM9与应收款管理的FORM9重复。
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,6,1)='1') then
    xzht.Form28.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,13,1)='1') then
    zggl.Form13.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.FormResize(Sender: TObject);
begin
      Main.Form1.StatusBar1.Panels.Items[0].Width:= floor(Main.Form1.Width/4);
      Main.Form1.StatusBar1.Panels.Items[1].Width:= floor(Main.Form1.Width/4);
      Main.Form1.StatusBar1.Panels.Items[2].Width:= floor(Main.Form1.Width/4);
      Main.Form1.StatusBar1.Panels.Items[3].Width:= floor(Main.Form1.Width/4);
      if form1.WindowState=wsMaximized then
      begin
      panel1.Left:=form1.ClientWidth-panel1.Width-10;
      panel1.Top:=form1.ClientHeight-statusbar1.Height-panel1.Height-10;
      //label1.Caption:=inttostr(form1.Width)+inttostr(form1.Height);
      end else
      begin
      panel1.Left:=form1.ClientWidth-panel1.Width-10;
      panel1.Top:=form1.ClientHeight-statusbar1.Height-panel1.Height-10;
      //label1.Caption:=inttostr(form1.Width)+inttostr(form1.Height);
      end;
  //    panel1.Repaint;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
    dlgl.Form10.ShowModal;
    if(isLogined=false) then
    begin
    main.Form1.Close;
    end;
    boolmesscandle:=false;
    if zconnection1.Connected then
    begin
    try
      with zquery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select count(*) from message_online where freciid='''+strUser+''' and fisread=''N'' and fisdel=''N''');
        open;
        intMessage:=fields[0].AsInteger;
        if intMessage>0 then
        begin
        form1.label1.Caption:='您有'+inttostr(intMessage)+'条新的消息';
        panel1.Visible:=true;
        end else
        panel1.Visible:=false;
      end;
    except
      application.MessageBox('查询数据失败！','在线消息提示');
    end;
    end;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  boolmesscandle:=true;
  panel1.Visible:=false;
  form18.Show;
end;

procedure TForm1.Label1MouseLeave(Sender: TObject);
begin
   Label1.Font.Color:=clWindowText;       //恢复Label1的字体颜色
   Label1.Font.Style:=[];                //恢复Label1的字体（去掉下划线）
   Label1.Cursor:=crDefault;
end;

procedure TForm1.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label1.Font.Color:=clBlue;                //设置Label1的字体颜色为蓝色
  Label1.Font.Style:=[fsUnderline];        //设置Label1的字体带下划线
  Label1.Cursor:=crHandpoint;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
    about.AboutBox.ShowModal;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  xgmm.Form15.ShowModal;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if zconnection1.Connected then
begin
try
  with zquery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select count(*) from message_online where freciid='''+strUser+''' and fisread=''N'' and fisdel=''N''');
    open;
    intMessage:=fields[0].AsInteger;
    if intMessage>0 then
    begin
    form1.Label1.Caption:='您有'+inttostr(intMessage)+'条新的消息';
    panel1.Visible:=true;
    end else
    panel1.Visible:=false;
  end;
except
  application.MessageBox('查询数据失败！','在线消息提示');
end;
end;
end;

procedure TForm1.X1Click(Sender: TObject);
begin
  main.Form1.Close;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,7,1)='1') then
    yskcx.Form7.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

end.
