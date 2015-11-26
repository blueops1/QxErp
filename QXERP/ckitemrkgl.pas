unit ckitemrkgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  ComCtrls, Grids, ExtCtrls, Menus;

type
  TForm22 = class(TForm)
    ZStoredProc1: TZStoredProc;
    ComboBoxEx1: TComboBoxEx;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Label6: TLabel;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Label7: TLabel;
    Button2: TButton;
    Bevel1: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Edit5: TEdit;
    Label16: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure ComboBoxEx1Select(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N1Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;
  selRowIndex:integer;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';


implementation

{$R *.dfm}

uses main;

procedure DeleteStringGridRow(vRow: Integer; StringGrid: TStringGrid);
var
  i:Integer;
begin
  if StringGrid.RowCount > vRow then
  begin
    for i:= vRow to StringGrid.RowCount - vRow do
    begin
      StringGrid.Rows[i]:= StringGrid.Rows[i+1];
    end;
    StringGrid.RowCount := StringGrid.RowCount - 1;
  end;
end;

procedure TForm22.Button1Click(Sender: TObject);
var
  y:integer;
begin
if application.MessageBox('ȷ��Ҫ����������','��ⵥ������ʾ',1)=1 then
  if stringgrid1.RowCount>1 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_insert_rkdinfo';
        zstoredproc1.ParamByName('rkdh').Value:=edit4.Text;
        zstoredproc1.ParamByName('gysid').Value:=splitstring(ComboBox1.Text,'|');
        zstoredproc1.ParamByName('rkdate').Value:=datetimepicker1.Date;
        zstoredproc1.ParamByName('czry').Value:=main.strUser;
        zstoredproc1.ParamByName('memo').Value:='*'+memo1.Text;
        execProc;
        zstoredproc1.StoredProcName:='proc_insert_rkdmxz';
        for y := 1 to stringgrid1.RowCount - 1 do
        begin
          zstoredproc1.ParamByName('rkdbh').Value:=edit4.Text;
          zstoredproc1.ParamByName('itembh').Value:=splitstring(stringgrid1.Cells[1,y],'|');
          zstoredproc1.ParamByName('rksl').Value:=stringgrid1.Cells[2,y];
          zstoredproc1.ParamByName('itemprice').Value:=stringgrid1.Cells[3,y];
          zstoredproc1.ParamByName('memo').Value:='*'+stringgrid1.Cells[4,y];
          execProc;
        end;
        zstoredproc1.StoredProcName:='proc_update_ckitem_itemljslandljzje';
        for y := 1 to stringgrid1.RowCount - 1 do
        begin
          zstoredproc1.ParamByName('itembh').Value:=splitstring(stringgrid1.Cells[1,y],'|');
          zstoredproc1.ParamByName('rksl').Value:=stringgrid1.Cells[2,y];
          zstoredproc1.ParamByName('itemprice').Value:=stringgrid1.Cells[3,y];
          execProc;
        end;
      end;
      application.MessageBox('�������ݳɹ���','���������������ʾ');
      edit1.Text:='';
      edit2.Text:='';
      edit3.Text:='';
      edit4.Text:='';
      edit5.Text:='';
      combobox1.Text:='';
      memo1.Text:='';
      stringgrid1.RowCount:=1;
  except
    application.MessageBox('��������ʧ�ܣ�','���������������ʾ');
  end else
    application.MessageBox('��������ⵥ�ڵ���ϸ��','���������������ʾ');
end;

procedure TForm22.Button2Click(Sender: TObject);
begin
  if (edit4.Text<>'') and (combobox1.Text<>'') then
    if (edit1.Text<>'') and (edit2.Text<>'') and (edit3.Text<>'') then
    begin
      stringgrid1.RowCount:=stringgrid1.RowCount+1;
      stringgrid1.Cells[0,stringgrid1.RowCount-1]:=inttostr(stringgrid1.RowCount-1);
      stringgrid1.Cells[1,stringgrid1.RowCount-1]:=edit1.Text;
      stringgrid1.Cells[2,stringgrid1.RowCount-1]:=edit2.Text;
      stringgrid1.Cells[3,stringgrid1.RowCount-1]:=edit3.Text;
      stringgrid1.Cells[4,stringgrid1.RowCount-1]:=edit5.Text;
      edit1.Text:='';
      edit2.Text:='';
      edit3.Text:='';
      edit5.Text:='';
      edit1.SetFocus;
    end else
    application.MessageBox('�뽫��ϸ��д��','���������������ʾ')
    else
    application.MessageBox('���Ƚ���ⵥ��Ϣ��д������','���������������ʾ');
end;


procedure TForm22.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_gysmc';
        zstoredproc1.ParamByName('gysname').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','��Ʊ������ʾ');
  end;
 end;
end;

procedure TForm22.ComboBoxEx1Select(Sender: TObject);
begin
  edit1.Text:=comboboxex1.Text;
end;

procedure TForm22.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (edit1.Text<>'') then
    try
      with zstoredproc1 do
      begin
        comboboxex1.Items.Clear;
        close;
        zstoredproc1.StoredProcName:='proc_cx_ckitemmc';
        zstoredproc1.ParamByName('itemname').Value:=edit1.Text;
        open;
        while not eof do
        begin
          comboboxex1.Items.Add(fields[0].asstring);
          next;
        end;
          comboboxex1.DroppedDown:=true;
          comboboxex1.SelStart:= Length(comboboxex1.Text);
      end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','���������������ʾ');
  end;
end;

procedure TForm22.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit3.Text)>0)   then
    key:=#0;
end;

procedure TForm22.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit3.Text)>0)   then
    key:=#0;
end;

procedure TForm22.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    with zstoredproc1 do
    begin
      close;
      zstoredproc1.StoredProcName:='proc_cx_newrkdbh';
      open;
      if fields[0].AsString<>'' then
        edit4.Text:=fields[0].AsString
      else
        edit4.Text:=formatDateTime('yyyy',date)+'0001';
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','���������������ʾ');
  end;
end;

procedure TForm22.FormShow(Sender: TObject);
begin
  datetimepicker1.DateTime:=now();
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='��Ʒ���';
  stringgrid1.Cells[2,0]:='�������';
  stringgrid1.Cells[3,0]:='����';
  stringgrid1.Cells[4,0]:='��ע';
end;

procedure TForm22.N1Click(Sender: TObject);
begin
  if (selRowIndex>0) and (selRowIndex<stringgrid1.RowCount) then
   DeleteStringGridRow(selRowIndex,stringgrid1);
end;

procedure TForm22.StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var
  tmppoint:tpoint;
begin
  tmppoint.X:=x;
  tmppoint.Y:=y;
  if button=tmousebutton.mbRight then
  popupmenu1.Popup(stringgrid1.ClientToScreen(tmppoint).X,stringgrid1.ClientToScreen(tmppoint).y);
end;

procedure TForm22.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selRowIndex:=ARow;
end;

end.