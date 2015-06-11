program Sklad;

uses
  Forms,
  main in 'main.pas' {frmMain},
  Dmo in 'Dmo.pas' {DM: TDataModule},
  unadd in 'unadd.pas' {frmManeger},
  unitConsole in 'unitConsole.pas' {frmSQL},
  UnitFind in 'UnitFind.pas' {frmFind},
  unitOstatki in 'unitOstatki.pas' {frmOstatki},
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
  unitDetali in 'unitDetali.pas' {frmDetali},
  unitSelect in 'unitSelect.pas' {frmSelect},
  UnitZAkazi in 'UnitZAkazi.pas' {frmZakazi},
  UnitAddZakaz in 'UnitAddZakaz.pas' {frmAddZakaz},
  unitRequests in 'unitRequests.pas' {frmRequests},
  UnitAddRequests in 'UnitAddRequests.pas' {frmAddRequests},
  unitSelectZAkaz in 'unitSelectZAkaz.pas' {frmSelectZakaz},
  Unitdm3 in 'Unitdm3.pas' {Dm3: TDataModule},
  UnitEditZakaz in 'UnitEditZakaz.pas' {frmEditZakaz},
  unitDMFindElem in 'unitDMFindElem.pas' {dmFindElem: TDataModule},
  unitFindToManeger in 'unitFindToManeger.pas' {frmFindToManeger},
  UnitCFG in 'UnitCFG.pas' {frmCFG},
  unitDmBDE in 'unitDmBDE.pas' {dmBDE: TDataModule},
  UnitAbout in 'UnitAbout.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmManeger, frmManeger);
  Application.CreateForm(TfrmSQL, frmSQL);
  Application.CreateForm(TfrmFind, frmFind);
  Application.CreateForm(TfrmOstatki, frmOstatki);
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
  Application.CreateForm(TfrmSelect, frmSelect);
  Application.CreateForm(TfrmZakazi, frmZakazi);
  Application.CreateForm(TfrmAddZakaz, frmAddZakaz);
  Application.CreateForm(TfrmRequests, frmRequests);
  Application.CreateForm(TfrmAddRequests, frmAddRequests);
  Application.CreateForm(TfrmSelectZakaz, frmSelectZakaz);
  Application.CreateForm(TDm3, Dm3);
  Application.CreateForm(TfrmEditZakaz, frmEditZakaz);
  Application.CreateForm(TdmFindElem, dmFindElem);
  Application.CreateForm(TfrmFindToManeger, frmFindToManeger);
  Application.CreateForm(TfrmCFG, frmCFG);
  Application.CreateForm(TdmBDE, dmBDE);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
