program Sklad;

uses
  Forms,
  main in 'main.pas' {frmMain},
  Dmo in 'Dmo.pas' {DM: TDataModule},
  unadd in 'unadd.pas' {frmManeger},
  unitConsole in 'unitConsole.pas' {frmSQL},
  UnitFind in 'UnitFind.pas' {frmFind},
  unitOstatki in 'unitOstatki.pas' {frmOstatki},
  unitAddRecords in 'unitAddRecords.pas' {frmAddRecords},
  unitPassword in 'unitPassword.pas' {frmEnterPass},
  UnitDMFind in 'UnitDMFind.pas' {DMFind: TDataModule},
  UnitLinks in 'UnitLinks.pas' {frmLink},
  unitComp in 'unitComp.pas' {frmComp},
  unitTypes in 'unitTypes.pas' {frmTypes},
  unitElem in 'unitElem.pas' {frmElements},
  UnitAddComp in 'UnitAddComp.pas' {frmAddComp},
  unitAddType in 'unitAddType.pas' {frmAddType},
  unitAddElem in 'unitAddElem.pas' {frmAddElem},
  unitAddlinks in 'unitAddlinks.pas' {frmAddLinks},
  unitAddinfo in 'unitAddinfo.pas' {frmAddinfo},
  UnitCard in 'UnitCard.pas' {frmCard},
  UnitInfo in 'UnitInfo.pas' {frmInfo},
  UnitAddDetali in 'UnitAddDetali.pas' {frmAddDetali},
  unitDetali in 'unitDetali.pas' {frmDetali};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmManeger, frmManeger);
  Application.CreateForm(TfrmSQL, frmSQL);
  Application.CreateForm(TfrmFind, frmFind);
  Application.CreateForm(TfrmOstatki, frmOstatki);
  Application.CreateForm(TfrmAddRecords, frmAddRecords);
  Application.CreateForm(TfrmEnterPass, frmEnterPass);
  Application.CreateForm(TDMFind, DMFind);
  Application.CreateForm(TfrmLink, frmLink);
  Application.CreateForm(TfrmComp, frmComp);
  Application.CreateForm(TfrmTypes, frmTypes);
  Application.CreateForm(TfrmElements, frmElements);
  Application.CreateForm(TfrmAddComp, frmAddComp);
  Application.CreateForm(TfrmAddType, frmAddType);
  Application.CreateForm(TfrmAddElem, frmAddElem);
  Application.CreateForm(TfrmAddLinks, frmAddLinks);
  Application.CreateForm(TfrmAddinfo, frmAddinfo);
  Application.CreateForm(TfrmCard, frmCard);
  Application.CreateForm(TfrmInfo, frmInfo);
  Application.CreateForm(TfrmAddDetali, frmAddDetali);
  Application.CreateForm(TfrmDetali, frmDetali);
  Application.Run;
end.
