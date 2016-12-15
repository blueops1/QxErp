unit scjhxg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm102 = class(TForm)
    Edit1: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Bevel2: TBevel;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form102: TForm102;

implementation
  uses main,scjh;

{$R *.dfm}

procedure TForm102.Button1Click(Sender: TObject);
begin
  if (edit4.Text<>'') and (strtofloat(edit1.Text)>strtofloat(edit3.Text)) then
  begin
    try
      with scjh.Form17.ZStoredProc1 do
        begin
          close;
          StoredProcName:='proc_modi_scjhxg';  //IN `jhslxg` double,IN `memo` text,IN `jhdbh` char(20),IN `cpbh` char(20),IN `rwdbh` char(20)
          ParamByName('jhslxg').Value:=strtofloat(edit4.Text)-strtofloat(edit1.Text);
          ParamByName('cpbh').Value:=edit6.Text;
          ParamByName('jhdbh').Value:=edit2.Text;
          ParamByName('rwdbh').Value:=edit5.Text;
          ParamByName('memo').Value:='计划数由原来的'+edit1.Text+'调整为'+edit4.Text+','+main.strUser;
          execproc;
          application.MessageBox('修改计划数量成功！','计划单修改提示');
          scjh.Form17.StringGrid2.Cells[5,scjh.SelARowxg]:=edit4.Text;
          form102.Close;
        end;
      except
        //Show('SQL命令查询操作错误：' + scjh.Form17.ZStoredProc1. + #13#10 + e.Message);
        application.MessageBox('修改计划数量失败！','计划单修改提示');
      end;
  end;

end;

procedure TForm102.Button2Click(Sender: TObject);
begin
  form102.Close;
end;

procedure TForm102.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit4.Text)>0)   then
    key:=#0;
end;

procedure TForm102.FormShow(Sender: TObject);
begin
  edit5.Text:=scjh.Form17.StringGrid1.Cells[4,scjh.SelARow];
  edit2.Text:=scjh.Form17.StringGrid1.Cells[5,scjh.SelARow];
  edit1.Text:=scjh.Form17.StringGrid2.Cells[5,scjh.SelARowxg];
  edit3.Text:=scjh.Form17.StringGrid2.Cells[8,scjh.SelARowxg];
  edit6.Text:=scjh.Form17.StringGrid2.Cells[1,scjh.SelARowxg];
  edit7.Text:=scjh.Form17.StringGrid2.Cells[2,scjh.SelARowxg];
  edit8.Text:=scjh.Form17.StringGrid2.Cells[3,scjh.SelARowxg];
  edit4.Text:='0';
end;

end.
