unit yskcscx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, Grids,
  StdCtrls, ComCtrls, Menus;

type
  TForm43 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form43: TForm43;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

uses main,yskkhmxz;

{$R *.dfm}

procedure TForm43.Button1Click(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  try
    with  zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_yskcs_by_xsybh_lastdate';
      ParamByName('xsybh').Value:=splitstring(combobox1.Text,'|');
      ParamByName('lastdate').Value:=datetimepicker1.Date;
      open;
      i:=1;
      firstresultset;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        stringgrid1.Cells[5,i]:=fields[4].AsString;
        stringgrid1.Cells[6,i]:=fields[5].AsString;
        stringgrid1.Cells[7,i]:=fields[6].AsString;
        stringgrid1.Cells[8,i]:=fields[7].AsString;
        stringgrid1.Cells[9,i]:=fields[8].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
      nextresultset;
      if not eof then
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:='�ϼ�';
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        stringgrid1.Cells[5,i]:=fields[4].AsString;
        stringgrid1.Cells[6,i]:=fields[5].AsString;
        stringgrid1.Cells[7,i]:=fields[6].AsString;
        stringgrid1.Cells[8,i]:=fields[7].AsString;
        stringgrid1.Cells[9,i]:=fields[8].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
      end;
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','Ӧ�տ���ղ�ѯ��ʾ');
  end;
end;

procedure TForm43.ComboBox1DropDown(Sender: TObject);
begin
  combobox1.Items.Clear;
  combobox1.Items.Add('*|ȫ��');
  with zStoredProc1 do
  begin
    close;
    StoredProcName:='proc_cx_xsyinfo_xsyidandxm';
    open;
    while not eof do
    begin
       combobox1.Items.Add(fields[0].asstring);
       next;
    end;
  end;
end;

procedure TForm43.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('�б���û���κ����ݣ�','Ӧ�տʾ������ʾ');
end;

procedure TForm43.FormShow(Sender: TObject);
begin
  datetimepicker1.DateTime:=now();
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='Ӧ�տ���';
  stringgrid1.Cells[2,0]:='��ͬ���';
  stringgrid1.Cells[3,0]:='�ͻ�����';
  stringgrid1.Cells[4,0]:='���ܵ�λ����';
  stringgrid1.Cells[5,0]:='Ӧ�տ��ܶ�';
  stringgrid1.Cells[6,0]:='��ǰ���';
  stringgrid1.Cells[7,0]:='ĩ���տ�����';
  stringgrid1.Cells[8,0]:='����Ա����';
  stringgrid1.Cells[9,0]:='��ע';
end;

procedure TForm43.StringGrid1DblClick(Sender: TObject);
begin
  if strYskbh<>'NULL' then
  yskkhmxz.Form42.ShowModal;
end;

procedure TForm43.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if stringgrid1.RowCount>2 then
  begin
    strYskbh:=stringgrid1.Cells[1,ARow];
    strKhmc:=stringgrid1.Cells[3,ARow];
  end
  else
    strYskbh:='NULL';
end;

end.