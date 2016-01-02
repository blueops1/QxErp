unit monthreports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm69 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form69: TForm69;

implementation
uses ckwzybb;

{$R *.dfm}

procedure TForm69.Button1Click(Sender: TObject);
begin
  if datetimetostr(datetimepicker1.Date)<>'' then
  begin
    datetimetostring(strcxdate,'yyyymm',datetimepicker1.Date);
    ckwzybb.Form68.ShowModal;
  end;
end;

procedure TForm69.FormShow(Sender: TObject);
begin
  datetimepicker1.DateTime:=now();
end;

end.
