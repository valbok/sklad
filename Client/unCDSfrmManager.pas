unit unCDSfrmManager;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider;

type
  TDataModule1 = class(TDataModule)
    dsPComponents: TDataSetProvider;
    cdsComponents: TClientDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    CDSqrytypes_by_comp: TClientDataSet;
    dsPqrytypes_by_comp: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation
uses dmo;
{$R *.dfm}

end.
