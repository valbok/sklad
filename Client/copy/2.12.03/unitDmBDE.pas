unit unitDmBDE;

interface

uses
  SysUtils, Classes, DBTables, DB;

type
  TdmBDE = class(TDataModule)
    Database: TDatabase;
    qryInsertIntoCard: TQuery;
    tblCard: TTable;
    QrydeleteFromCard: TQuery;
    tblOst: TTable;
    dsOst: TDataSource;
    qryInsertIntoOstatki: TQuery;
    qryFullInsertIntoOstatki: TQuery;
    qryDeleteAllOstatki: TQuery;
    tblOstid: TAutoIncField;
    tblOstnum_p_p: TIntegerField;
    tblOstname: TStringField;
    tblOstostatok: TFloatField;
    tblOstunit_izmerenie: TStringField;
    tblOstnowDate: TStringField;
    qryCount: TQuery;
    qrySum: TQuery;
    tblOstElem_id: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBDE: TdmBDE;

implementation

{$R *.dfm}

end.
