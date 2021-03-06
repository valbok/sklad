program Sklad;

uses
  Forms,
  main in 'main.pas' {frmMain},
  Dmo in 'Dmo.pas' {DM: TDataModule},
  unadd in 'unadd.pas' {frmAdd},
  unitConsole in 'unitConsole.pas' {frmSQL},
  UnitFind in 'UnitFind.pas' {frmFind},
  unitOstatki in 'unitOstatki.pas' {frmOstatki},
  unitAddRecords in 'unitAddRecords.pas' {frmAddRecords},
  unitPassword in 'unitPassword.pas' {frmEnterPass},
  UnitDMFind in 'UnitDMFind.pas' {DMFind: TDataModule},
  UnitLinks in 'UnitLinks.pas' {frmLink};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmAdd, frmAdd);
  Application.CreateForm(TfrmSQL, frmSQL);
  Application.CreateForm(TfrmFind, frmFind);
  Application.CreateForm(TfrmOstatki, frmOstatki);
  Application.CreateForm(TfrmAddRecords, frmAddRecords);
  Application.CreateForm(TfrmEnterPass, frmEnterPass);
  Application.CreateForm(TDMFind, DMFind);
  Application.CreateForm(TfrmLink, frmLink);
  Application.Run;
end.
