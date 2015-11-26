program Qxerp;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  xsygl in 'xsygl.pas' {Form2},
  dbconnecter in 'dbconnecter.pas' {Form3},
  khgl in 'khgl.pas' {Form5},
  zgdwgl in 'zgdwgl.pas' {Form4},
  htgl in 'htgl.pas' {Form6},
  cpxxgl in 'cpxxgl.pas' {Form8},
  ckgl in 'ckgl.pas' {from9},
  ABOUT in 'ABOUT.pas' {AboutBox},
  yskjz in 'yskjz.pas' {Form9},
  dlgl in 'dlgl.pas' {Form10},
  bcpxxgl in 'bcpxxgl.pas' {Form11},
  bcpgl in 'bcpgl.pas' {Form12},
  yskcx in 'yskcx.pas' {Form7},
  zggl in 'zggl.pas' {Form13},
  zhqxgl in 'zhqxgl.pas' {Form14},
  xgmm in 'xgmm.pas' {Form15},
  sctjcx in 'sctjcx.pas' {Form16},
  scjh in 'scjh.pas' {Form17},
  message_online in 'message_online.pas' {Form18},
  fhdgl in 'fhdgl.pas' {Form19},
  fhdcx in 'fhdcx.pas' {Form20},
  fhdxxzl in 'fhdxxzl.pas' {Form21},
  ckitemrkgl in 'ckitemrkgl.pas' {Form22},
  fapiaohezhang in 'fapiaohezhang.pas' {Form23},
  gysgl in 'gysgl.pas' {Form24},
  ccxxgl in 'ccxxgl.pas' {Form25},
  fpwhzcx in 'fpwhzcx.pas' {Form26},
  fcpckgl in 'fcpckgl.pas' {Form27},
  xzht in 'xzht.pas' {Form28},
  cprk in 'cprk.pas' {Form29},
  cpck in 'cpck.pas' {Form30};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '秦山橡胶工程公司ERP管理系统';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(Tfrom9, from9);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TForm21, Form21);
  Application.CreateForm(TForm22, Form22);
  Application.CreateForm(TForm23, Form23);
  Application.CreateForm(TForm24, Form24);
  Application.CreateForm(TForm25, Form25);
  Application.CreateForm(TForm26, Form26);
  Application.CreateForm(TForm27, Form27);
  Application.CreateForm(TForm28, Form28);
  Application.CreateForm(TForm29, Form29);
  Application.CreateForm(TForm30, Form30);
  Application.Run;
end.
