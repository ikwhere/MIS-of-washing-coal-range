program xmxt;

uses
  Forms,
  MAIN in 'MAIN.pas' {FrmMain},
  Login1 in 'Login1.pas' {FrmLogin},
  MotherForm in 'MotherForm.pas' {FrmMather},
  jsqx_add in 'jsqx_add.pas' {Frmjsqx_add},
  user in 'user.pas' {FrmUser},
  jsqx in 'jsqx.pas' {Frmjsqx},
  wroomdata in 'ym\wroomdata.pas' {Frmwroomdata},
  kkdata in 'ym\kkdata.pas' {Frmkkdata},
  price in 'ym\price.pas' {Frmprice},
  myjs in 'ym\myjs.pas' {Frmmyjs},
  myjs_add in 'ym\myjs_add.pas' {Frmmyjs_add},
  myjs_select in 'ym\myjs_select.pas' {FRMMyjsSelect},
  Kjqj in 'Kjqj.pas' {FrmKjqj},
  MotherForm_add in 'MotherForm_add.pas' {FrmAdd},
  coal in 'coal.pas' {FrmCoal},
  UserAdd in 'UserAdd.pas' {FrmUserAdd},
  tpunit in 'tpunit.pas' {Frmtpunit},
  wroomdata_add in 'ym\wroomdata_add.pas' {FrmWroomdataAdd},
  dbconn in 'dbconn.pas' {DataModule1: TDataModule},
  priceadd in 'ym\priceadd.pas' {FrmPriceAdd},
  kkdata_add in 'ym\kkdata_add.pas' {FrmkkdataAdd},
  truckinfo in 'ym\truckinfo.pas' {FrmTruckInfo},
  truckinfo_add in 'ym\truckinfo_add.pas' {FrmTruckInfo_Add},
  ymzl in 'sc\ymzl.pas' {Frmymzl},
  ymzl_add in 'sc\ymzl_add.pas' {FrmYmzlAdd},
  scjmzl_add in 'sc\scjmzl_add.pas' {FrmScjmAdd},
  scjmzl in 'sc\scjmzl.pas' {Frmscjm},
  sczmcl in 'sc\sczmcl.pas' {FrmSczmcl},
  sczmcl_add in 'sc\sczmcl_add.pas' {FrmSczmclAdd},
  PducTkwt_add in 'sc\PducTkwt_add.pas' {FrmPducTkwtAdd},
  PducTkwt in 'sc\PducTkwt.pas' {FrmPducTkwt},
  jmsxdata in 'jm\jmsxdata.pas' {Frmjmsxdata},
  jmsxdata_add in 'jm\jmsxdata_add.pas' {FrmjmsxdataAdd},
  customs in 'jm\customs.pas' {FrmCustoms},
  customs_add in 'jm\customs_add.pas' {FrmCustomsAdd},
  jmsxzldata in 'jm\jmsxzldata.pas' {Frmjmsxzldata},
  jmsxzldata_add in 'jm\jmsxzldata_add.pas' {Frmjmsxzldataadd},
  jmprc in 'jm\jmprc.pas' {FrmJmprc},
  jmprc_add in 'jm\jmprc_add.pas' {FrmJmPrcadd},
  Othsxdata in 'jm\Othsxdata.pas' {FrmOthXs},
  Othsxdata_add in 'jm\Othsxdata_add.pas' {FrmOthsxdataAdd},
  sxjs in 'jm\sxjs.pas' {Frmsxjs},
  xskk in 'jm\xskk.pas' {Frmxskk},
  xskk_add in 'jm\xskk_add.pas' {FrmxskkAdd},
  xsjs_select in 'jm\xsjs_select.pas' {FrmXsjsSelect},
  xsjs_add in 'jm\xsjs_add.pas' {FrmXsjsAdd},
  Keydatalog in 'Keydatalog.pas' {FrmLog},
  store in 'sc\store.pas' {FrmMather1},
  ympchzh_rp in 'ym\ympchzh_rp.pas' {Frmympchzhrp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmMather, FrmMather);
  Application.CreateForm(TFrmAdd, FrmAdd);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmMather1, FrmMather1);
  Application.Run;
end.
