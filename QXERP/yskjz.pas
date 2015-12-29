unit yskjz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ComCtrls, Grids, ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZStoredProcedure;

type
  TForm9 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label30: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit16: TEdit;
    StringGrid4: TStringGrid;
    DateTimePicker1: TDateTimePicker;
    TabSheet2: TTabSheet;
    RadioGroup1: TRadioGroup;
    ZStoredProc1: TZStoredProc;
    Label7: TLabel;
    Edit3: TEdit;
    RadioGroup2: TRadioGroup;
    StringGrid1: TStringGrid;
    Label8: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit6: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label13: TLabel;
    Edit7: TEdit;
    Button3: TButton;
    Button4: TButton;
    procedure Edit16Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses main;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
  if (edit1.Text <> '') and (edit2.Text <> '')then
  begin
    try
      with zStoredProc1 do          //proc_insert_yskmxz  cxitem,yskbh,jzje,skdate,memo
      begin
        close;
        StoredProcName:='proc_insert_yskmxz';
        ParamByName('cxitem').Value:='xz';
        ParamByName('yskbh').Value:=edit1.Text;
        ParamByName('jzje').Value:=edit2.Text;
        ParamByName('skdate').Value:=datetimepicker1.Date;
        ParamByName('memo').Value:='*'+main.strUser+edit4.Text;
        ExecSQL;
        edit1.Text := '';
        edit2.Text := '';
        Application.MessageBox('新增应收款成功！','应收款管理提示');
        //PageControl1.ActivePageIndex:=1;
      end;
    Except
      Application.MessageBox('新增应收款失败！','应收款管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','应收款管理提示');
end;

procedure TForm9.Button3Click(Sender: TObject);
begin
  if (edit6.Text <> '') and (edit5.Text <> '')then
  begin
    try
      with zStoredProc1 do          //proc_insert_yskmxz  cxitem,yskbh,jzje,skdate,memo
      begin
        close;
        StoredProcName:='proc_insert_yskmxz';
        ParamByName('cxitem').Value:='hs';
        ParamByName('yskbh').Value:=edit5.Text;
        ParamByName('jzje').Value:=edit6.Text;
        ParamByName('skdate').Value:=datetimepicker2.Date;
        ParamByName('memo').Value:=main.strUser+edit7.Text;
        ExecSQL;
        edit5.Text := '';
        edit6.Text := '';
        Application.MessageBox('新增回收款成功！','应收款管理提示');
        //PageControl1.ActivePageIndex:=1;
      end;
    Except
      Application.MessageBox('新增回收款失败！','应收款管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','应收款管理提示');
end;

procedure TForm9.Edit16Change(Sender: TObject);
var y:integer;
begin
    stringgrid4.RowCount:=2;
    stringgrid4.Rows[1].Clear;
    if edit16.Text<>'' then
    begin
      try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_yskxx_yskbhandkhmc_by_cxitem';
        ParamByName('cxnr').Value:=edit16.Text;
        if radiogroup1.ItemIndex=1 then
          ParamByName('cxitem').Value:='xs'
        else
          ParamByName('cxitem').Value:='kh';
        open;
        y:=1;
        while not eof do
        begin
          stringgrid4.RowCount:=RecordCount+1;
          stringgrid4.Cells[0,y]:=fields[0].AsString;
          stringgrid4.Cells[1,y]:=fields[1].AsString;
          y:=y+1;
          stringgrid4.Rows[stringgrid4.RowCount-1];
          next;
        end;
      end;
        Except
            Application.MessageBox('查询失败！','应收款管理提示');
      end;
    end;
end;

procedure TForm9.Edit3Change(Sender: TObject);
var y:integer;
begin
    stringgrid1.RowCount:=2;
    stringgrid1.Rows[1].Clear;
    if edit3.Text<>'' then
    begin
      try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_yskxx_yskbhandkhmc_by_cxitem';
        ParamByName('cxnr').Value:=edit3.Text;
        if radiogroup2.ItemIndex=1 then
          ParamByName('cxitem').Value:='xs'
        else
          ParamByName('cxitem').Value:='kh';
        open;
        y:=1;
        while not eof do
        begin
          stringgrid1.RowCount:=RecordCount+1;
          stringgrid1.Cells[0,y]:=fields[0].AsString;
          stringgrid1.Cells[1,y]:=fields[1].AsString;
          y:=y+1;
          stringgrid1.Rows[stringgrid1.RowCount-1];
          next;
        end;
      end;
        Except
            Application.MessageBox('查询失败！','应收款管理提示');
      end;
    end;
  end;

procedure TForm9.FormShow(Sender: TObject);
begin
  datetimepicker1.DateTime := date();
  datetimepicker2.DateTime := date();
  stringgrid4.Cells[0,0]:='应收款编号';
  stringgrid4.Cells[1,0]:='客户项目名称';
  stringgrid1.Cells[0,0]:='应收款编号';
  stringgrid1.Cells[1,0]:='客户项目名称';
end;

procedure TForm9.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  edit5.Text:=stringgrid1.Cells[0,ARow];
end;

procedure TForm9.StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
edit3.Text:=stringgrid1.Cells[0,ARow];
end;

procedure TForm9.StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  edit1.Text:=stringgrid4.Cells[0,ARow];
end;

end.

