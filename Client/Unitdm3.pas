unit Unitdm3;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, Provider, DBClient,
  IBTable;

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
    tblComponents: TIBTable;
    tblComponentsCOMPONENT_ID: TIntegerField;
    tblComponentsNAME: TIBStringField;
    tblComponentsUSER_NAME: TIBStringField;
    dsComponents: TDataSource;
    tblTypes: TIBTable;
    tblTypesTYPE_ID: TIntegerField;
    tblTypesNAME: TIBStringField;
    tblTypesLUComponent_id: TStringField;
    tblTypesCOMPONENT_ID: TIntegerField;
    tblTypesUSER_NAME: TIBStringField;
    dsTypes: TDataSource;
    tblElements: TIBTable;
    tblElementsELEMENT_ID: TIntegerField;
    tblElementsNAME: TIBStringField;
    tblElementsUNIT_IZMERENIE: TIBStringField;
    tblElementsLuTypeName: TStringField;
    tblElementsTYPE_ID: TIntegerField;
    tblElementsNUMER: TIBStringField;
    tblElementsINFO: TIBStringField;
    tblElementsUSER_NAME: TIBStringField;
    dsElements: TDataSource;
    tblInfo: TIBTable;
    tblInfoINFO_ID: TIntegerField;
    tblInfoNUM_P_P: TIntegerField;
    tblInfoTHEDATE: TDateTimeField;
    tblInfoNUM_DOC: TIBStringField;
    tblInfoFROM_WHOM: TIBStringField;
    tblInfoCOST_FOR_ONE: TFloatField;
    tblInfoELEMENT_ID: TIntegerField;
    tblInfoARRIVAL: TFloatField;
    tblInfoCHARGE: TFloatField;
    tblInfoOSTATOK: TFloatField;
    dsInfo: TDataSource;
    tblZakazi: TIBTable;
    dsZakazi: TDataSource;
    tblLinks: TIBTable;
    tblLinksLINK_ID: TIntegerField;
    tblLinksLINK: TIBStringField;
    tblLinksINFO: TIBStringField;
    tblLinksELEMENT_ID: TIntegerField;
    tblLinksUSER_NAME: TIBStringField;
    dsLinks: TDataSource;
    dsDetali: TDataSource;
    tblDetali: TIBTable;
    tblType2: TIBTable;
    dsType2: TDataSource;
    dsTyp: TDataSource;
    tblTyp: TIBTable;
    tblTypTYPE_ID: TIntegerField;
    tblTypNAME: TIBStringField;
    tblTypCOMPONENT_ID: TIntegerField;
    tblTypUSER_NAME: TIBStringField;
    tblTypLuCompName: TStringField;
    tblComp: TIBTable;
    tblCompCOMPONENT_ID: TIntegerField;
    tblCompNAME: TIBStringField;
    tblCompUSER_NAME: TIBStringField;
    dsComp: TDataSource;
    cdsTyp: TClientDataSet;
    dsProviderTyp: TDataSetProvider;
    dsCdsTyp: TDataSource;
    cdsComp: TClientDataSet;
    dsProviderComp: TDataSetProvider;
    dsCdsComp: TDataSource;
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
