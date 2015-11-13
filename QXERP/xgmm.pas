unit xgmm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TForm15 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

uses main;

{$R *.dfm}

procedure TForm15.Button1Click(Sender: TObject);
begin
  if edit2.Text <>'' then
  begin
    try
      with adoquery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select fpwd from user_info where fuser = ''' + edit1.Text + ''' and fpwd = ''' +edit2.Text + '''');
        open;
        if not eof then
        begin
          if (edit3.Text <> '') and (edit3.Text = edit4.Text)  then
          begin
            sql.Clear;
            sql.Add('update user_info set fpwd = ''' + edit3.Text + '''');
            execSql;
            application.MessageBox('�����޸ĳɹ���','�����޸�');

          end else
            application.MessageBox('�����벻��Ϊ�ջ�������¼�벻һ�£�','�����޸�');
        end else
          application.MessageBox('ԭ���벻��ȷ��','�����޸�');
      end;
    Except
      Application.MessageBox('�����޸�ʧ�ܣ�','�����޸�');
    end;
  end;
end;

procedure TForm15.Button2Click(Sender: TObject);
begin
  form15.Close;
end;

procedure TForm15.FormShow(Sender: TObject);
begin
  edit1.Text := main.strUser;
end;

end.
