unit unitDMFindElem;

interface

uses
  SysUtils, Classes, IBCustomDataSet, IBQuery, Provider, DB, DBClient;

type
  TdmFindElem = class(TDataModule)
    cdsFind_Elem: TClientDataSet;
    dsCdsFind_Elem: TDataSource;
    dsProvaiderQryFind_elem: TDataSetProvider;
    dsQryFind_elem: TDataSource;
    qryFE_withComp: TIBQuery;
    qryFE_withCompELEMENT_ID: TIntegerField;
    qryFE_withCompNAME: TIBStringField;
    qryFE_withCompUNIT_IZMERENIE: TIBStringField;
    qryFE_withCompNUMER: TIBStringField;
    qryFE_withCompTYPE_ID: TIntegerField;
    qryFE_withCompINFO: TIBStringField;
    qryFE_withCompUSER_NAME: TIBStringField;
    qryFE_withCompRESISTANCE: TFloatField;
    qryFE_withCompDOPUSK: TFloatField;
    qryFE_withCompTKS: TIBStringField;
    qryFE_withCompTYPE_NAME: TIBStringField;
    qryFE_withoutComp: TIBQuery;
    dsQryFE_withoutComp: TDataSource;
    dsQryFe_withType_id: TDataSource;
    qryFE_withType_id: TIBQuery;
    qryEWoCT_name: TIBQuery;
    qryEWoCT_numer: TIBQuery;
    qryEWOCT_info: TIBQuery;
    qryEWoCT_unit_izmr: TIBQuery;
    qryEWT_name: TIBQuery;
    qryEWT_info: TIBQuery;
    qryEWT_numer: TIBQuery;
    qryEWT_unit_izmr: TIBQuery;
    qryEWC_name: TIBQuery;
    qryEWC_info: TIBQuery;
    qryEWC_numer: TIBQuery;
    qryEWC_unit_izmr: TIBQuery;
    qryEWoCT_dopusk: TIBQuery;
    qryEWoCT_type_name: TIBQuery;
    qryEWoCT_TKS: TIBQuery;
    qryEWoCT_R: TIBQuery;
    qryEWT_dopusk: TIBQuery;
    qryEWT_type_name: TIBQuery;
    qryEWT_TKS: TIBQuery;
    qryEWT_R: TIBQuery;
    qryEWC_dopusk: TIBQuery;
    qryEWC_type_name: TIBQuery;
    qryEWC_TKS: TIBQuery;
    qryEWC_R: TIBQuery;
    dsPoviderFEWD: TDataSetProvider;
/////////////////////////
    cdsFind_elemWD: TClientDataSet;
    dsCdsFind_elemWD: TDataSource;

    cdsFind_ElemELEMENT_ID: TIntegerField;
    cdsFind_ElemNAME: TStringField;
    cdsFind_ElemUNIT_IZMERENIE: TStringField;
    cdsFind_ElemNUMER: TStringField;
    cdsFind_ElemTYPE_ID: TIntegerField;
    cdsFind_ElemINFO: TStringField;
    cdsFind_ElemUSER_NAME: TStringField;

    cdsFind_elemWDELEMENT_ID: TIntegerField;
    cdsFind_elemWDNAME: TStringField;
    cdsFind_elemWDUNIT_IZMERENIE: TStringField;
    cdsFind_elemWDNUMER: TStringField;
    cdsFind_elemWDTYPE_ID: TIntegerField;
    cdsFind_elemWDINFO: TStringField;
    cdsFind_elemWDUSER_NAME: TStringField;
    cdsFind_elemWDRESISTANCE: TFloatField;
    cdsFind_elemWDDOPUSK: TFloatField;
    cdsFind_elemWDTKS: TStringField;
    cdsFind_elemWDTYPE_NAME: TStringField;

    qryEWoCT_dopuskBW: TIBQuery;
    qryEWoCT_RBW: TIBQuery;
    qryEWT_dopuskBW: TIBQuery;
    qryEWC_dopuskBW: TIBQuery;
    qryEWT_RBW: TIBQuery;
    qryEWC_RBW: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFindElem: TdmFindElem;

implementation
uses dmo;
{$R *.dfm}

end.
