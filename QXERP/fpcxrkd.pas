unit fpcxrkd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, Menus,
  Grids, StdCtrls;

type
  TForm71 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    StringGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    ZStoredProc1: TZStoredProc;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form71: TForm71;

implementation

uses main,crkdinfomxzcx;

{$R *.dfm}

procedure TForm71.Button1Click(Sender: TObject);
var
  cxdate1,cxdate2:string;
  gyslist:tstringlist;
  i:integer;
  tmpgysid:string;
  cxgysid:string;
  y:integer;
begin
  if edit1.Text<>'' then
  try
    with zStoredProc1 do
    begin
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      close;
      StoredProcName:='proc_cx_rkdinfo_by_fpbh';
      ParamByName('fpbh').Value:=edit1.Text;

      open;
      if not eof then
      begin
        gyslist:=tstringlist.Create;
        tmpgysid:='gysid';
        y:=1;
      while not eof do
      begin
        gyslist.Add(fields[0].asstring);
        next;
      end;
      for i := 0 to gyslist.Count - 1 do     //proc_cx_fpwhzcx_by_rkdbh
        begin
          close;
          StoredProcName:='proc_cx_fpwhzcx_by_rkdbh';
          ParamByName('rkdbh').Value:=gyslist[i];
                  //application.MessageBox(pwidechar(gyslist[i]),'��Ʊδ���ʲ�ѯ��ʾ');
          open;
          zstoredproc1.FirstResultSet;
          cxgysid:=fields[0].AsString;
          if tmpgysid<>cxgysid then
          begin
            stringgrid1.RowCount:=stringgrid1.RowCount+1;
            tmpgysid:=cxgysid;
            stringgrid1.Cells[0,y]:=inttostr(y);
            stringgrid1.Cells[1,y]:=tmpgysid;
            stringgrid1.Cells[2,y]:=fields[1].AsString;
            y:=y+1;
            stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
            stringgrid1.Cells[0,y]:=inttostr(y);
            stringgrid1.RowCount:=stringgrid1.RowCount+1;
            zstoredproc1.NextResultSet;
            stringgrid1.Cells[3,y]:=fields[0].AsString;
            stringgrid1.Cells[4,y]:=fields[1].AsString;
            stringgrid1.Cells[5,y]:=fields[2].AsString;
            y:=y+1;
            stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
            zstoredproc1.LastResultSet;
            while not eof do
            begin
              stringgrid1.RowCount:=stringgrid1.RowCount+1;
              stringgrid1.Cells[0,y]:=inttostr(y);
              stringgrid1.Cells[6,y]:=fields[0].AsString;
              stringgrid1.Cells[7,y]:=fields[1].AsString;
              stringgrid1.Cells[8,y]:=fields[2].AsString;
              y:=y+1;
              stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
              stringgrid1.Rows[y].Clear;
              next;
            end;
          end else
          begin
            stringgrid1.RowCount:=stringgrid1.RowCount+1;
            zstoredproc1.NextResultSet;
            stringgrid1.Cells[0,y]:=inttostr(y);
            stringgrid1.Cells[3,y]:=fields[0].AsString;
            stringgrid1.Cells[4,y]:=fields[1].AsString;
            stringgrid1.Cells[5,y]:=fields[2].AsString;
            y:=y+1;
            stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
            zstoredproc1.LastResultSet;
            while not eof do
            begin
              stringgrid1.RowCount:=stringgrid1.RowCount+1;
              stringgrid1.Cells[0,y]:=inttostr(y);
              stringgrid1.Cells[6,y]:=fields[0].AsString;
              stringgrid1.Cells[7,y]:=fields[1].AsString;
              stringgrid1.Cells[8,y]:=fields[2].AsString;
              y:=y+1;
              stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
              next;
            end;
          end;
        end;
        form71.Invalidate;
        gyslist.Free;
      end else
      begin
        application.MessageBox('�÷�Ʊ���û����ⵥ��','��ⵥ��Ϣ��ѯ��ʾ');
      end;
    end;
  except
    application.MessageBox('��ѯ����ʧ�ܣ�','��ⵥ��Ϣ��ѯ��ʾ');
  end;
end;

procedure TForm71.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('�б���û���κ����ݣ�','��ⵥ��Ϣ��ѯ��ʾ');
end;

procedure TForm71.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='��Ӧ�̱��';
  stringgrid1.Cells[2,0]:='��Ӧ������';
  stringgrid1.Cells[3,0]:='��ⵥ���';
  stringgrid1.Cells[4,0]:='���ʱ��';
  stringgrid1.Cells[5,0]:='�����';
  stringgrid1.Cells[6,0]:='��Ʒ����';
  stringgrid1.Cells[7,0]:='�������';
  stringgrid1.Cells[8,0]:='��Ʒ����';
end;

procedure TForm71.StringGrid1DblClick(Sender: TObject);
begin
  if strCrkdbh<>'NULL' then
    crkdinfomxzcx.Form46.ShowModal;
end;

procedure TForm71.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  with TStringGrid(Sender) do
  begin
    if (ARow>0) and (ARow<TStringGrid(Sender).rowCount-1) then
      if(Cells[1,ARow]<>'') then
        Canvas.Brush.Color:=clSkyBlue
        //Canvas.Font.Color:=clRed
      else if(Cells[3,ARow]<>'') then
        Canvas.Brush.Color:=clMoneyGreen
        else
          Canvas.Brush.Color:=clWindow;
  //      Canvas.Font.Color:=clWindowText;
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left+2,Rect.Top+2,Cells[ACol,ARow]);
  end;
end;

procedure TForm71.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   if (stringgrid1.RowCount>2) and (stringgrid1.Cells[3,ARow]<>'') and (ARow>0) then
  begin
    strCrkdbh:=stringgrid1.Cells[3,ARow];
    strCrkDate:= stringgrid1.Cells[4,ARow];
    strIsCrk:='rk';
  end
  else
    strCrkdbh:='NULL';
end;

end.