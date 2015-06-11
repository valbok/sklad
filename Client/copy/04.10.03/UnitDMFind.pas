unit UnitDMFind;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery,dmo, Provider, DBClient;

type
  TDMFind = class(TDataModule)
    qryFindComponents: TIBQuery;
    qryFindComponentsCOMPONENT_ID: TIntegerField;
    qryFindComponentsNAME: TIBStringField;
    dsQryFindComponents: TDataSource;
    qryFindElem_by_name: TIBQuery;
    qryFindElem_by_nameELEMENT_ID: TIntegerField;
    qryFindElem_by_nameNAME: TIBStringField;
    qryFindElem_by_nameUNIT_IZMERENIE: TIBStringField;
    qryFindElem_by_nameTYPE_ID: TIntegerField;
    qryFindElem_by_nameLUNT: TStringField;
    qryFindElem_by_nameOSTATOK: TFloatField;
    qryFindElem_by_nameNUMER: TIBStringField;
    qryFindElem_by_nameINFO: TIBStringField;
    dsQryFindElem_by_name: TDataSource;
    qryFindElem_by_nameT: TIBQuery;
    qryFindElem_by_nameTELEMENT_ID: TIntegerField;
    qryFindElem_by_nameTNAME: TIBStringField;
    qryFindElem_by_nameTUNIT_IZMERENIE: TIBStringField;
    qryFindElem_by_nameTTYPE_ID: TIntegerField;
    qryFindElem_by_nameTLUN: TStringField;
    qryFindElem_by_nameTNUMER: TIBStringField;
    qryFindElem_by_nameTINFO: TIBStringField;
    dsQryFindElem_by_nameT: TDataSource;
    qryFindInfo_by_elem: TIBQuery;
    qryFindInfo_by_elemINFO_ID: TIntegerField;
    qryFindInfo_by_elemluem: TStringField;
    qryFindInfo_by_elemNUM_P_P: TIntegerField;
    qryFindInfo_by_elemTHEDATE: TDateTimeField;
    qryFindInfo_by_elemNUM_DOC: TIBStringField;
    qryFindInfo_by_elemCOST_FOR_ONE: TFloatField;
    qryFindInfo_by_elemFROM_WHOM: TIBStringField;
    qryFindInfo_by_elemARRIVAL: TFloatField;
    qryFindInfo_by_elemCHARGE: TFloatField;
    qryFindInfo_by_elemOSTATOK: TFloatField;
    qryFindInfo_by_elemELEMENT_ID: TIntegerField;
    dsQryFindInfoByElem: TDataSource;
    qryFindInfo_by_date: TIBQuery;
    qryFindInfo_by_dateINFO_ID: TIntegerField;
    qryFindInfo_by_dateLuEl: TStringField;
    qryFindInfo_by_dateNUM_P_P: TIntegerField;
    qryFindInfo_by_dateTHEDATE: TDateTimeField;
    qryFindInfo_by_dateNUM_DOC: TIBStringField;
    qryFindInfo_by_dateCOST_FOR_ONE: TFloatField;
    qryFindInfo_by_dateFROM_WHOM: TIBStringField;
    qryFindInfo_by_dateARRIVAL: TFloatField;
    qryFindInfo_by_dateCHARGE: TFloatField;
    qryFindInfo_by_dateOSTATOK: TFloatField;
    qryFindInfo_by_dateELEMENT_ID: TIntegerField;
    dsQryFindInfo_by_date: TDataSource;
    qryFindTypes_by_nameT: TIBQuery;
    qryFindTypes_by_nameTTYPE_ID: TIntegerField;
    qryFindTypes_by_nameTNAME: TIBStringField;
    qryFindTypes_by_nameTCOMPONENT_ID: TIntegerField;
    qryFindTypes_by_nameTLUCName: TStringField;
    dsQryFindTypes_by_nameT: TDataSource;
    qryFindTypes_by_nameC: TIBQuery;
    qryFindTypes_by_nameCTYPE_ID: TIntegerField;
    qryFindTypes_by_nameCCOMPONENT_ID: TIntegerField;
    qryFindTypes_by_nameCNAME: TIBStringField;
    qryFindTypes_by_nameCLUNameC: TStringField;
    dsQryFindTypes_by_nameC: TDataSource;
    qryFind_Elem: TIBQuery;
    dsQryFind_elem: TDataSource;
    qryFindElem_by_nameUSER_NAME: TIBStringField;
    qryFindElem_by_nameTUSER_NAME: TIBStringField;
    qryFindInfo_by_dateUSER_NAME: TIBStringField;
    qryFindInfo_by_elemUSER_NAME: TIBStringField;
    qryFindComponentsUSER_NAME: TIBStringField;
    qryFindTypes_by_nameTUSER_NAME: TIBStringField;
    qryFindTypes_by_nameCUSER_NAME: TIBStringField;
    qryElems_by_component: TIBQuery;
    dsQryElems_by_component: TDataSource;
    dsQryElems_by_type: TDataSource;
    qryElems_by_type: TIBQuery;
    cdsFind_Elem: TClientDataSet;
    dsProvaiderQryFind_elem: TDataSetProvider;
    dsCdsFind_Elem: TDataSource;
    cdsFind_ElemELEMENT_ID: TIntegerField;
    cdsFind_ElemNAME: TStringField;
    cdsFind_ElemUNIT_IZMERENIE: TStringField;
    cdsFind_ElemNUMER: TStringField;
    cdsFind_ElemTYPE_ID: TIntegerField;
    cdsFind_ElemINFO: TStringField;
    cdsFind_ElemUSER_NAME: TStringField;
    cdsFind_ElemOSTATOK: TFloatField;
    cdsFind_ElemRESISTANCE: TFloatField;
    cdsFind_ElemDOPUSK: TFloatField;
    cdsFind_ElemTKS: TStringField;
    cdsFind_ElemTYPE_NAME: TStringField;
    qryFind_ElemELEMENT_ID: TIntegerField;
    qryFind_ElemNAME: TIBStringField;
    qryFind_ElemUNIT_IZMERENIE: TIBStringField;
    qryFind_ElemNUMER: TIBStringField;
    qryFind_ElemTYPE_ID: TIntegerField;
    qryFind_ElemINFO: TIBStringField;
    qryFind_ElemUSER_NAME: TIBStringField;
    qryFind_ElemOSTATOK: TFloatField;
    qryFind_ElemRESISTANCE: TFloatField;
    qryFind_ElemDOPUSK: TFloatField;
    qryFind_ElemTKS: TIBStringField;
    qryFind_ElemTYPE_NAME: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFind: TDMFind;

implementation

{$R *.dfm}

end.
