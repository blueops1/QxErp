program Mdiapp;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  ChildWin in 'ChildWin.pas' {MDIChild},
  about in 'about.pas' {AboutBox},
  Unit1 in 'Unit1.pas' {MDIChild1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TMDIChild1, MDIChild1);
  Application.Run;
end.
