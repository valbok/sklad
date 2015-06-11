unit Dmo;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, IBTable,
  DBClient, Provider, IBSQLMonitor, DBTables;

type
  TDM = class(TDataModule)
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    qryWork: TIBQuery;
    dsComponents: TDataSource;
    dsqryWork: TDataSource;
    dsTypes: TDataSource;
    dsInfo: TDataSource;
    dsElements: TDataSource;
    tblComponents: TIBTable;
    tblTypes: TIBTable;
    tblElements: TIBTable;
    tblInfo: TIBTable;
    tblComponentsNAME: TIBStringField;
    tblTypesTYPE_ID: TIntegerField;
    tblTypesNAME: TIBStringField;
    tblComponentsCOMPONENT_ID: TIntegerField;
    tblTypesLUComponent_id: TStringField;
    tblTypesCOMPONENT_ID: TIntegerField;
    dsClientDSElem: TDataSource;
    tblInfoINFO_ID: TIntegerField;
    tblInfoTHEDATE: TDateTimeField;
    tblInfoFROM_WHOM: TIBStringField;
    tblInfoELEMENT_ID: TIntegerField;
    tblInfoCOST_FOR_ONE: TFloatField;
    tblInfoARRIVAL: TFloatField;
    tblInfoCHARGE: TFloatField;
    tblInfoOSTATOK: TFloatField;
    ClientDSElem: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    qryEdit: TIBQuery;
    dsQryEdit: TDataSource;
    qryInfoForEdit: TIBQuery;
    dsQryInfo: TDataSource;
    qryInfoForEditINFO_ID: TIntegerField;
    qryInfoForEditTHEDATE: TDateTimeField;
    qryInfoForEditCOST_FOR_ONE: TFloatField;
    qryInfoForEditFROM_WHOM: TIBStringField;
    qryInfoForEditARRIVAL: TFloatField;
    qryInfoForEditCHARGE: TFloatField;
    qryInfoForEditOSTATOK: TFloatField;
    qryInfoForEditELEMENT_ID: TIntegerField;
    Monitor: TIBSQLMonitor;
    qryOstatki: TIBQuery;
    dsQryOstatki: TDataSource;
    qryConsole: TIBQuery;
    dsQryConsole: TDataSource;
    qryFindComponents: TIBQuery;
    tblInfoNUM_DOC: TIBStringField;
    tblInfoNUM_P_P: TIntegerField;
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
    qryInfoForEditNUM_P_P: TIntegerField;
    qryInfoForEditNUM_DOC: TIBStringField;
    qryElements: TIBQuery;
    dsqryElements: TDataSource;
    tblElementsELEMENT_ID: TIntegerField;
    tblElementsNAME: TIBStringField;
    tblElementsUNIT_IZMERENIE: TIBStringField;
    tblElementsTYPE_ID: TIntegerField;
    ClientDSElemOSTATOK: TFloatField;
    ClientDSElemELEMENT_ID: TIntegerField;
    ClientDSElemNAME: TStringField;
    ClientDSElemUNIT_IZMERENIE: TStringField;
    ClientDSElemTYPE_ID: TIntegerField;
    ClientDSElemLUType_name: TStringField;
    qryAddSrez: TIBQuery;
    dsQryAddSrez: TDataSource;
    ClientDSElemF_1: TFloatField;
    dsQryFindComponents: TDataSource;
    qryFindComponentsCOMPONENT_ID: TIntegerField;
    qryFindComponentsNAME: TIBStringField;
    dsQryFindTypes_by_nameT: TDataSource;
    qryFindTypes_by_nameT: TIBQuery;
    qryComponents: TIBQuery;
    qryFindTypes_by_nameC: TIBQuery;
    dsQryFindTypes_by_nameC: TDataSource;
    qryFindTypes_by_nameTNAME: TIBStringField;
    qryFindTypes_by_nameTCOMPONENT_ID: TIntegerField;
    qryFindTypes_by_nameTLUCName: TStringField;
    qryFindTypes_by_nameCNAME: TIBStringField;
    qryFindTypes_by_nameCCOMPONENT_ID: TIntegerField;
    qryFindTypes_by_nameCLUNameC: TStringField;
    qryFindElem_by_name: TIBQuery;
    dsQryFindElem_by_name: TDataSource;
    qryFindElem_by_nameNAME: TIBStringField;
    qryFindElem_by_nameUNIT_IZMERENIE: TIBStringField;
    qryFindElem_by_nameTYPE_ID: TIntegerField;
    qryFindElem_by_nameLUNT: TStringField;
    qryFindElem_by_nameOSTATOK: TFloatField;
    qryFindElem_by_nameT: TIBQuery;
    dsQryFindElem_by_nameT: TDataSource;
    qryFindElem_by_nameTNAME: TIBStringField;
    qryFindElem_by_nameTUNIT_IZMERENIE: TIBStringField;
    qryFindElem_by_nameTTYPE_ID: TIntegerField;
    qryFindElem_by_nameTLUN: TStringField;
    qryFindInfo_by_date: TIBQuery;
    dsQryFindInfo_by_date: TDataSource;
    qryFindInfo_by_dateNUM_P_P: TIntegerField;
    qryFindInfo_by_dateTHEDATE: TDateTimeField;
    qryFindInfo_by_dateNUM_DOC: TIBStringField;
    qryFindInfo_by_dateCOST_FOR_ONE: TFloatField;
    qryFindInfo_by_dateFROM_WHOM: TIBStringField;
    qryFindInfo_by_dateARRIVAL: TFloatField;
    qryFindInfo_by_dateCHARGE: TFloatField;
    qryFindInfo_by_dateOSTATOK: TFloatField;
    qryFindInfo_by_dateELEMENT_ID: TIntegerField;
    qryFindInfo_by_dateLuEl: TStringField;
    qryFindInfo_by_elem: TIBQuery;
    dsQryFindInfoByElem: TDataSource;
    qryFindInfo_by_elemNUM_P_P: TIntegerField;
    qryFindInfo_by_elemTHEDATE: TDateTimeField;
    qryFindInfo_by_elemNUM_DOC: TIBStringField;
    qryFindInfo_by_elemCOST_FOR_ONE: TFloatField;
    qryFindInfo_by_elemFROM_WHOM: TIBStringField;
    qryFindInfo_by_elemARRIVAL: TFloatField;
    qryFindInfo_by_elemCHARGE: TFloatField;
    qryFindInfo_by_elemOSTATOK: TFloatField;
    qryFindInfo_by_elemELEMENT_ID: TIntegerField;
    qryFindInfo_by_elemluem: TStringField;
    Ost: TIBTable;
    dsOst: TDataSource;
    OstID: TIntegerField;
    OstNUM_P_P: TIntegerField;
    OstNAME: TIBStringField;
    OstOSTATOK: TFloatField;
    OstUNIT_IZMERENIE: TIBStringField;
    qryCard: TIBQuery;
    tblCard: TIBTable;
    dsCard: TDataSource;
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
    qryEditELEMENT_ID: TIntegerField;
    qryEditNAME: TIBStringField;
    qryEditUNIT_IZMERENIE: TIBStringField;
    qryEditTYPE_ID: TIntegerField;
    qryEditOSTATOK: TFloatField;
    qryEditNAME1: TIBStringField;
    qryEditF_1: TFloatField;
    qrytypes_by_comp: TIBQuery;
    dsQryType_by_comp: TDataSource;
    qrytypes_by_compID: TIntegerField;
    qrytypes_by_compTYPE_NAME: TIBStringField;
    qryElem_by_type: TIBQuery;
    dsQyElem_by_type: TDataSource;
    qryElem_by_typeID: TIntegerField;
    qryElem_by_typeELEMENT_NAME: TIBStringField;
    qryElem_by_typeUNIT_IZMERN: TIBStringField;
    qryElem_by_typeCOST: TFloatField;
    dsQryInfo_by_elem: TDataSource;
    qryInfo_by_elem: TIBQuery;
    qryInfo_by_elemTHEDATE: TDateTimeField;
    qryInfo_by_elemNUM_DOC: TIBStringField;
    qryInfo_by_elemCOST: TFloatField;
    qryInfo_by_elemFROM_WHOM: TIBStringField;
    qryInfo_by_elemARRIVAL: TFloatField;
    qryInfo_by_elemCHARGE: TFloatField;
    qryInfo_by_elemOSTATOK: TFloatField;
    qryInfo_by_elemID: TIntegerField;
    procedure MonitorSQL(EventText: String; EventTime: TDateTime);
    procedure IBDatabaseBeforeConnect(Sender: TObject);
    procedure OstAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}

procedure TDM.MonitorSQL(EventText: String; EventTime: TDateTime);
begin
frmMain.StatusBar.panels[1].text:=EventText;
frmMain.StatusBar.Refresh;
end;

procedure TDM.IBDatabaseBeforeConnect(Sender: TObject);
begin
      dm.IBDatabase.DatabaseName:=host+':'+pathToDb;
end;

procedure TDM.OstAfterClose(DataSet: TDataSet);
begin
              if (ost.Exists) and  (IBTransaction.Active) then
              begin
              if ost.Exists then  Ost.DeleteTable;
                IBTransaction.Commit;
              end;
end;

end.
