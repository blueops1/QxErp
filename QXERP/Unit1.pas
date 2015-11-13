unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildWin, StdCtrls;

type
  TMDIChild1 = class(TMDIChild)
    Edit1: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MDIChild1: TMDIChild1;

implementation

{$R *.dfm}

end.
