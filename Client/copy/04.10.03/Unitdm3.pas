unit Unitdm3;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDm3 = class(TDataModule)
    dsQryOstatki: TDataSource;
    qryOstatki: TIBQuery;
    dsQryInfo: TDataSource;
    qryInfoForEdit: TIBQuery;
    qryInfoForEditINFO_ID: TIntegerField;
    qryInfoForEditNUM_P_P: TIntegerField;
    qryInfoForEditTHEDATE: TDateTimeField;
    qryInfoForEditNUM_DOC: TIBStringField;
    qryInfoForEditCOST_FOR_ONE: TFloatField;
    qryInfoForEditFROM_WHOM: TIBStringField;
    qryInfoForEditARRIVAL: TFloatField;
    qryInfoForEditCHARGE: TFloatField;
    qryInfoForEditOSTATOK: TFloatField;
    qryInfoForEditELEMENT_ID: TIntegerField;
    dsqryLinkInfo_by_elem: TDataSource;
    qryLinkInfo_by_elem: TIBQuery;
    dsQryEdit: TDataSource;
    qryEdit: TIBQuery;
    qryEditELEMENT_ID: TIntegerField;
    qryEditNAME: TIBStringField;
    qryEditUNIT_IZMERENIE: TIBStringField;
    qryEditTYPE_ID: TIntegerField;
    qryEditOSTATOK: TFloatField;
    qryEditNAME1: TIBStringField;
    qryEditF_1: TFloatField;
    qryEditNUMER: TIBStringField;
    qryEditINFO: TIBStringField;
    qryEditUSER_NAME: TIBStringField;
    qryInfoOrderBy: TIBQuery;
    qryInfoOrderByINFO_ID: TIntegerField;
    qryInfoOrderByNUM_P_P: TIntegerField;
    qryInfoOrderByTHEDATE: TDateTimeField;
    qryInfoOrderByNUM_DOC: TIBStringField;
    qryInfoOrderByCOST_FOR_ONE: TFloatField;
    qryInfoOrderByFROM_WHOM: TIBStringField;
    qryInfoOrderByARRIVAL: TFloatField;
    qryInfoOrderByCHARGE: TFloatField;
    qryInfoOrderByOSTATOK: TFloatField;
    qryInfoOrderByELEMENT_ID: TIntegerField;
    dsQryInfoOrder: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm3: TDm3;

implementation
uses dmo;
{$R *.dfm}

end.
