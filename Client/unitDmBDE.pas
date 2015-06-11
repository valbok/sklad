unit unitDmBDE;

interface

uses
  SysUtils, Classes, DBTables, DB, IBCustomDataSet, IBTable;

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
    IBTable1: TIBTable;
    tblCardNUM_P_P: TIntegerField;
    tblCardTHEDATE: TIBStringField;
    tblCardNUM_DOC: TIBStringField;
    tblCardFROM_WHOM: TIBStringField;
    tblCardARRIVAL: TFloatField;
    tblCardCHARGE: TFloatField;
    tblCardOSTATOK: TFloatField;
    tblCardNAME: TIBStringField;
    tblCardTYPE_NAME: TIBStringField;
    tblCardCOST_FOR_ONE: TFloatField;
    tblCardUNIT_IZMERENIE: TIBStringField;
    tblCardnumer: TStringField;
    dsCard: TDataSource;
    DataSource1: TDataSource;
    Ost: TIBTable;
    OstID: TIntegerField;
    OstNUM_P_P: TIntegerField;
    OstNAME: TIBStringField;
    OstOSTATOK: TFloatField;
    OstUNIT_IZMERENIE: TIBStringField;
    OstNowDate: TStringField;
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
