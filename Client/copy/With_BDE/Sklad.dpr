program Sklad;

uses
  Forms,
  main in 'main.pas' {frmMain},
  Dmo in 'Dmo.pas' {DM: TDataModule},
  unadd in 'unadd.pas' {frmAdd},
  unitConsole in 'unitConsole.pas' {frmSQL},
  UnitFind in 'UnitFind.pas' {frmFind},
  unitOstatki in 'unitOstatki.pas' {frmOstatki};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmAdd, frmAdd);
  Application.CreateForm(TfrmSQL, frmSQL);
  Application.CreateForm(TfrmFind, frmFind);
  Application.CreateForm(TfrmOstatki, frmOstatki);
  Application.Run;
end.
