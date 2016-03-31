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
  cpck in 'cpck.pas' {Form30},
  bcprk in 'bcprk.pas' {Form31},
  kczgxxgl in 'kczgxxgl.pas' {Form32},
  cgkcgz in 'cgkcgz.pas' {Form33},
  ckcx in 'ckcx.pas' {Form34},
  ckitemgz in 'ckitemgz.pas' {Form35},
  xzscjh in 'xzscjh.pas' {Form36},
  qjgl in 'qjgl.pas' {Form37},
  qjcx in 'qjcx.pas' {Form38},
  rwdjs in 'rwdjs.pas' {Form39},
  jhdxzfhd in 'jhdxzfhd.pas' {Form40},
  yskjs in 'yskjs.pas' {Form41},
  yskkhmxz in 'yskkhmxz.pas' {Form42},
  yskcscx in 'yskcscx.pas' {Form43},
  bcptsck in 'bcptsck.pas' {Form44},
  kcmxzcx in 'kcmxzcx.pas' {Form45},
  crkdinfomxzcx in 'crkdinfomxzcx.pas' {Form46},
  bcpsctjcx in 'bcpsctjcx.pas' {Form47},
  blzjjldj in 'blzjjldj.pas' {Form48},
  zjbljlcx in 'zjbljlcx.pas' {Form49},
  zxjgd in 'zxjgd.pas' {Form50},
  jgsgl in 'jgsgl.pas' {Form51},
  wxdwcprk in 'wxdwcprk.pas' {Form52},
  rkddelgl in 'rkddelgl.pas' {Form53},
  jgdcx in 'jgdcx.pas' {Form54},
  bcpjgdcx in 'bcpjgdcx.pas' {Form55},
  bcpjgrk in 'bcpjgrk.pas' {Form56},
  jgdjs in 'jgdjs.pas' {Form57},
  wjgjggl in 'wjgjggl.pas' {Form58},
  lhttjcpmx in 'lhttjcpmx.pas' {Form59},
  htmxtz in 'htmxtz.pas' {Form60},
  tjfhfjxx in 'tjfhfjxx.pas' {Form61},
  fhck in 'fhck.pas' {Form62},
  fhckinfo in 'fhckinfo.pas' {Form63},
  csckgl in 'csckgl.pas' {Form64},
  cscprkgl in 'cscprkgl.pas' {Form65},
  csckdgl in 'csckdgl.pas' {Form66},
  csckddy in 'csckddy.pas' {Form67},
  ckwzybb in 'ckwzybb.pas' {Form68},
  monthreports in 'monthreports.pas' {Form69},
  rkdinfocx in 'rkdinfocx.pas' {Form70},
  fpcxrkd in 'fpcxrkd.pas' {Form71},
  cyrxxgl in 'cyrxxgl.pas' {Form72},
  thcl in 'thcl.pas' {Form73},
  bthcscktzd in 'bthcscktzd.pas' {Form74},
  bthcstzddy in 'bthcstzddy.pas' {Form75},
  bthcsckgl in 'bthcsckgl.pas' {Form76},
  kptzs in 'kptzs.pas' {Form77},
  kptzsdycx in 'kptzsdycx.pas' {Form78},
  kptzsdy in 'kptzsdy.pas' {Form79},
  jgdrkmxz in 'jgdrkmxz.pas' {Form80},
  jiagongfeijs in 'jiagongfeijs.pas' {Form81},
  jgjsddycx in 'jgjsddycx.pas' {Form82},
  jiagongjiesuandandy in 'jiagongjiesuandandy.pas' {Form83},
  jgjsdqrpay in 'jgjsdqrpay.pas' {Form84},
  kptzskpqr in 'kptzskpqr.pas' {Form85},
  bcpkczzgl in 'bcpkczzgl.pas' {Form86},
  bcpkcgz in 'bcpkcgz.pas' {Form87},
  scjhzggl in 'scjhzggl.pas' {Form88},
  scjhjdgz in 'scjhjdgz.pas' {Form89},
  scjhdmxzcx in 'scjhdmxzcx.pas' {Form90},
  cpbcpmxzcx in 'cpbcpmxzcx.pas' {Form91},
  sjscjhmxz in 'sjscjhmxz.pas' {Form92},
  wxjgdtz in 'wxjgdtz.pas' {Form93},
  scjhkcgz in 'scjhkcgz.pas' {Form94},
  jhdjs in 'jhdjs.pas' {Form95},
  wwcrwslcx in 'wwcrwslcx.pas' {Form96},
  rwslcxbyrwdbh in 'rwslcxbyrwdbh.pas' {Form97},
  yjsjhdcx in 'yjsjhdcx.pas' {Form98},
  delhtinfo in 'delhtinfo.pas' {Form99},
  fhdcxyfh in 'fhdcxyfh.pas' {Form100};

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
  Application.CreateForm(TForm31, Form31);
  Application.CreateForm(TForm32, Form32);
  Application.CreateForm(TForm33, Form33);
  Application.CreateForm(TForm34, Form34);
  Application.CreateForm(TForm35, Form35);
  Application.CreateForm(TForm36, Form36);
  Application.CreateForm(TForm37, Form37);
  Application.CreateForm(TForm38, Form38);
  Application.CreateForm(TForm39, Form39);
  Application.CreateForm(TForm40, Form40);
  Application.CreateForm(TForm41, Form41);
  Application.CreateForm(TForm42, Form42);
  Application.CreateForm(TForm43, Form43);
  Application.CreateForm(TForm44, Form44);
  Application.CreateForm(TForm45, Form45);
  Application.CreateForm(TForm46, Form46);
  Application.CreateForm(TForm47, Form47);
  Application.CreateForm(TForm48, Form48);
  Application.CreateForm(TForm49, Form49);
  Application.CreateForm(TForm50, Form50);
  Application.CreateForm(TForm51, Form51);
  Application.CreateForm(TForm52, Form52);
  Application.CreateForm(TForm53, Form53);
  Application.CreateForm(TForm54, Form54);
  Application.CreateForm(TForm55, Form55);
  Application.CreateForm(TForm56, Form56);
  Application.CreateForm(TForm57, Form57);
  Application.CreateForm(TForm58, Form58);
  Application.CreateForm(TForm59, Form59);
  Application.CreateForm(TForm60, Form60);
  Application.CreateForm(TForm61, Form61);
  Application.CreateForm(TForm62, Form62);
  Application.CreateForm(TForm63, Form63);
  Application.CreateForm(TForm64, Form64);
  Application.CreateForm(TForm65, Form65);
  Application.CreateForm(TForm66, Form66);
  Application.CreateForm(TForm67, Form67);
  Application.CreateForm(TForm68, Form68);
  Application.CreateForm(TForm69, Form69);
  Application.CreateForm(TForm70, Form70);
  Application.CreateForm(TForm71, Form71);
  Application.CreateForm(TForm72, Form72);
  Application.CreateForm(TForm73, Form73);
  Application.CreateForm(TForm74, Form74);
  Application.CreateForm(TForm75, Form75);
  Application.CreateForm(TForm76, Form76);
  Application.CreateForm(TForm77, Form77);
  Application.CreateForm(TForm78, Form78);
  Application.CreateForm(TForm79, Form79);
  Application.CreateForm(TForm80, Form80);
  Application.CreateForm(TForm81, Form81);
  Application.CreateForm(TForm82, Form82);
  Application.CreateForm(TForm83, Form83);
  Application.CreateForm(TForm84, Form84);
  Application.CreateForm(TForm85, Form85);
  Application.CreateForm(TForm86, Form86);
  Application.CreateForm(TForm87, Form87);
  Application.CreateForm(TForm88, Form88);
  Application.CreateForm(TForm89, Form89);
  Application.CreateForm(TForm90, Form90);
  Application.CreateForm(TForm91, Form91);
  Application.CreateForm(TForm92, Form92);
  Application.CreateForm(TForm93, Form93);
  Application.CreateForm(TForm94, Form94);
  Application.CreateForm(TForm95, Form95);
  Application.CreateForm(TForm96, Form96);
  Application.CreateForm(TForm97, Form97);
  Application.CreateForm(TForm98, Form98);
  Application.CreateForm(TForm99, Form99);
  Application.CreateForm(TForm100, Form100);
  Application.Run;
end.
