unit Dmo;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, IBTable,
  DBClient, Provider, IBSQLMonitor, DBTables,dialogs;

type
  TDM = class(TDataModule)
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    qryConsole: TIBQuery;
    dsQryConsole: TDataSource;
    qryAddSrez: TIBQuery;
    dsQryAddSrez: TDataSource;
    qryComponents: TIBQuery;
    qryCard: TIBQuery;
    qrytypes_by_comp: TIBQuery;
    dsQryType_by_comp: TDataSource;
    qryElems_by_type: TIBQuery;
    dsQryElem_by_type: TDataSource;
    dsQryInfo_by_elem: TDataSource;
    qryInfo_by_elem: TIBQuery;
    cdsZakazi: TClientDataSet;
    dsProviderZakazi: TDataSetProvider;
    dsCdsZAkazi: TDataSource;
    tblRequests: TIBTable;
    dsRequests: TDataSource;
    qryZakazi_by_user: TIBQuery;
    dsQryZakazi_by_user: TDataSource;
    qryZakazi_by_userZAKAZ_ID: TIntegerField;
    qryZakazi_by_userFROM_WHOM: TIBStringField;
    qryZakazi_by_userFOR_WHAT: TIBStringField;
    qryZakazi_by_userTHEDATE: TDateTimeField;
    qryZakazi_by_userUSER_NAME: TIBStringField;
    tblRequestsREQUEST_ID: TIntegerField;
    tblRequestsZAKAZ_ID: TIntegerField;
    tblRequestsELEMENT_ID: TIntegerField;
    tblRequestsNAME: TIBStringField;
    tblRequestsCOL: TFloatField;
    tblRequestsUSER_NAME: TIBStringField;
    qryWork: TIBQuery;
    dsqryWork: TDataSource;
    qryAllElements: TIBQuery;
    tblRequestsluElemName: TStringField;
    qryElements: TIBQuery;
    qryElementsELEMENT_ID: TIntegerField;
    qryElementsNUMER: TIBStringField;
    qryElementsNAME: TIBStringField;
    qryElementsUNIT_IZMERENIE: TIBStringField;
    qryElementsOSTATOK: TFloatField;
    qryElementsF_1: TFloatField;
    qryElementsTYPE_ID: TIntegerField;
    qryElementsluTypeName: TStringField;
    qryElementsINFO: TIBStringField;
    qryElementsUSER_NAME: TIBStringField;
    dsqryElements: TDataSource;
    cdsZakaziZAKAZ_ID: TIntegerField;
    cdsZakaziFROM_WHOM: TStringField;
    cdsZakaziFOR_WHAT: TStringField;
    cdsZakaziTHEDATE: TDateTimeField;
    cdsZakaziUSER_NAME: TStringField;
    dsQryCardZakaz: TDataSource;
    qryCardZakaz: TIBQuery;
    dsQryComponents: TDataSource;
    qryUpdateElem: TIBQuery;
    qryDelete_Element: TIBQuery;
    qryAddElem: TIBQuery;
    qryElems_by_typeOSTATOK: TFloatField;
    qryElems_by_typeELEMENT_ID: TIntegerField;
    qryElems_by_typeNAME: TIBStringField;
    qryElems_by_typeUNIT_IZMERENIE: TIBStringField;
    qryElems_by_typeNUMER: TIBStringField;
    qryElems_by_typeTYPE_ID: TIntegerField;
    qryElems_by_typeINFO: TIBStringField;
    qryElems_by_typeUSER_NAME: TIBStringField;
    qryAddInfo: TIBQuery;
    qryUpdateInfo: TIBQuery;
    qryAddLink: TIBQuery;
    qryDELete_info: TIBQuery;
    qryLinks_by_elem: TIBQuery;
    dsQryLinks_by_elem: TDataSource;
    qryUpdateLink: TIBQuery;
    qryAddDetali: TIBQuery;
    qryDetali_by_elem: TIBQuery;
    dsQryDetali_by_elem: TDataSource;
    qryUpdateDetali: TIBQuery;
    qryTypesMoveTo: TIBQuery;
    dsQryTypeMoveTo: TDataSource;
    qryDElete_Type: TIBQuery;
    qryDelete_Link: TIBQuery;
    qryUpdateType: TIBQuery;
    qryAddType: TIBQuery;
    qryDelete_comp: TIBQuery;
    qryAddComp: TIBQuery;
    qryUpdateComp: TIBQuery;
    qryComponentsCOMPONENT_ID: TIntegerField;
    qryComponentsNAME: TIBStringField;
    qryComponentsUSER_NAME: TIBStringField;
    qrytypes_by_compTYPE_ID: TIntegerField;
    qrytypes_by_compNAME: TIBStringField;
    qrytypes_by_compCOMPONENT_ID: TIntegerField;
    qrytypes_by_compUSER_NAME: TIBStringField;
    qryInfo_by_elemNUM_P_P: TIntegerField;
    qryInfo_by_elemTHEDATE: TDateTimeField;
    qryInfo_by_elemNUM_DOC: TIBStringField;
    qryInfo_by_elemCOST_FOR_ONE: TFloatField;
    qryInfo_by_elemFROM_WHOM: TIBStringField;
    qryInfo_by_elemARRIVAL: TFloatField;
    qryInfo_by_elemCHARGE: TFloatField;
    qryInfo_by_elemOSTATOK: TFloatField;
    qryInfo_by_elemINFO_ID: TIntegerField;
    qryAddRequest: TIBQuery;
    qryAddZakaz: TIBQuery;
    qryMaxZakaz_id: TIBQuery;
    qryUpdateZakaz: TIBQuery;
    qryComponents_by_name: TIBQuery;
    qryInsertIntoOstatki: TIBQuery;
    qryTypes_by_comp_id: TIBQuery;
    qryOstatki_by_type: TIBQuery;
    qryFuLLinsertIntoOstatki: TIBQuery;
    qryTypes_by_name: TIBQuery;
    qryElemMax_num_p_p: TIBQuery;
    qryComponentsOstatki: TIBQuery;
    qryRequests_by_zakaz: TIBQuery;
    dsQryRequests_by_zakaz: TDataSource;
    qryUpdateRequest: TIBQuery;
    qryRequests_by_zakazREQUEST_ID: TIntegerField;
    qryRequests_by_zakazZAKAZ_ID: TIntegerField;
    qryRequests_by_zakazELEMENT_ID: TIntegerField;
    qryRequests_by_zakazNAME: TIBStringField;
    qryRequests_by_zakazCOL: TFloatField;
    qryRequests_by_zakazUSER_NAME: TIBStringField;
    qryRequests_by_zakazluElem_name: TStringField;
    qryDeleteZakaz: TIBQuery;
    qryDeleteRequest: TIBQuery;
    qryAllZakazi: TIBQuery;
    qryTypes_by_comp_id_name: TIBQuery;
    qrySrez_by_elem_id: TIBQuery;
    qryInsertIntoCard: TIBQuery;
    qryCardINFO_ID: TIntegerField;
    qryCardNUM_P_P: TIntegerField;
    qryCardTHEDATE: TDateTimeField;
    qryCardNUM_DOC: TIBStringField;
    qryCardCOST_FOR_ONE: TFloatField;
    qryCardFROM_WHOM: TIBStringField;
    qryCardARRIVAL: TFloatField;
    qryCardCHARGE: TFloatField;
    qryCardOSTATOK: TFloatField;
    qryCardELEMENT_ID: TIntegerField;
    qryCardUSER_NAME: TIBStringField;
    qryCardNAME: TIBStringField;
    qryCardUNIT_IZMERENIE: TIBStringField;
    qryCardNUMER: TIBStringField;
    qryCardTYPE_NAME: TIBStringField;
    qryCardCOST: TFloatField;
    qryOstatok_By_elem_id: TIBQuery;
    qryComp_name_by_type_id: TIBQuery;
    procedure IBDatabaseBeforeConnect(Sender: TObject);
    procedure IBDatabaseAfterDisconnect(Sender: TObject);
    procedure IBDatabaseAfterConnect(Sender: TObject);
    procedure tblCompCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main, unitPassword,unadd, UnitCFG, unitDMFindElem, UnitFind;

{$R *.dfm}

procedure TDM.IBDatabaseBeforeConnect(Sender: TObject);
begin
      dm.IBDatabase.DatabaseName:=host+':'+pathToDb;
      IBDatabase.Params.Clear;
      IBDatabase.Params.Add('user_name='+Main._login);
      IBDatabase.Params.Add('password='+Main._password);
end;

procedure TDM.IBDatabaseAfterDisconnect(Sender: TObject);
begin
 showmessage('Отключено');
 with  frmMain do
   begin
       Caption:=main.ver+'Соединение прекращено';
       sbConnect.Caption:=connectToServer;       
       frmManeger.lblTBLName.Caption:='';
       frmFind.zakaz_exists:=false;
       SetEnanble(false);
  end;

end;

procedure TDM.IBDatabaseAfterConnect(Sender: TObject);
var i:integer;
delLoginName: boolean;
begin
 with  frmMain do
   begin
      frmMain.Caption:=main.ver+'Соединение установлено';
      delLoginName:=false;
      frmMain.SetEnanble(true);
      for i:=1 to frmEnterPass.cbLogin.Items.count do
         if frmEnterPass.cbLogin.Items.Strings[i] = _login then
          begin
            delLoginName:=true;
            break;
          end;
      if (i = frmEnterPass.cbLogin.Items.count+1) and (frmEnterPass.cbLogin.Items.Strings[i] <>_login)
          then
           begin
            frmEnterPass.addLoginToCB(_login,frmEnterPass.cbLogin);
           end else
            if  delLoginName then
               begin
                  frmEnterPass.cbLogin.Items.Delete(i);
                  frmEnterPass.addLoginToCB(_login,frmEnterPass.cbLogin);
               end;

{        for i:=1 to frmEnterPass.cbLogin.Items.count do
          if frmEnterPass.cbLogin.Items.Strings[i] = _login}
//      treeStrDb.OnDblClick(sender);
        frmManeger.lblTBLName.Caption:=TableNameComp;
with frmCFG,dmfindElem do
begin
     SetUser(main._login);
     GetCFGFromFile(unitCFG.cfg+main._login,
                        cdsFind_elemWDELEMENT_ID,
                        cdsFind_elemWDNAME,
                        cdsFind_elemWDUNIT_IZMERENIE,
                        cdsFind_elemWDNUMER,
                        cdsFind_elemWDTYPE_ID,
                        cdsFind_elemWDINFO,
                        cdsFind_elemWDUSER_NAME,
                        cdsFind_elemWDRESISTANCE,
                        cdsFind_elemWDDOPUSK,
                        cdsFind_elemWDTKS,
                        cdsFind_elemWDTYPE_NAME,'-1');

     GetVisibleField(   cdsFind_elemWDELEMENT_ID,
                        cdsFind_elemWDNAME,
                        cdsFind_elemWDUNIT_IZMERENIE,
                        cdsFind_elemWDNUMER,
                        cdsFind_elemWDTYPE_ID,
                        cdsFind_elemWDINFO,
                        cdsFind_elemWDUSER_NAME,
                        cdsFind_elemWDRESISTANCE,
                        cdsFind_elemWDDOPUSK,
                        cdsFind_elemWDTKS,
                        cdsFind_elemWDTYPE_NAME,
                        cboxelem_id,
                        cboxname,
                        cboxunit_izmr,
                        cboxInfo,
                        cboxNumer,
                        cboxType_id,
                        cboxR,
                        cboxDopusk,
                        cboxTKS,
                        cboxType_name,
                        cboxUser_name
                  );
       SetVisibleField(   cdsFind_elemWDELEMENT_ID,
                          cdsFind_elemWDNAME,
                          cdsFind_elemWDUNIT_IZMERENIE,
                          cdsFind_elemWDNUMER,
                          cdsFind_elemWDTYPE_ID,
                          cdsFind_elemWDINFO,
                          cdsFind_elemWDUSER_NAME,
                          cdsFind_elemWDRESISTANCE,
                          cdsFind_elemWDDOPUSK,
                          cdsFind_elemWDTKS,
                          cdsFind_elemWDTYPE_NAME,
                          cboxelem_id,
                          cboxname,
                          cboxunit_izmr,
                          cboxInfo,
                          cboxNumer,
                          cboxType_id,
                          cboxR,
                          cboxDopusk,
                          cboxTKS,
                          cboxType_name,
                          cboxUser_name
                    );
        // ещё раз вызываем, для того чтобы 2 кдс были втупили в силу
       SetVisibleField(   cdsFind_elemELEMENT_ID,
                          cdsFind_elemNAME,
                          cdsFind_elemUNIT_IZMERENIE,
                          cdsFind_elemNUMER,
                          cdsFind_elemTYPE_ID,
                          cdsFind_elemINFO,
                          cdsFind_elemUSER_NAME,
                          cdsFind_elemWDRESISTANCE,
                          cdsFind_elemWDDOPUSK,
                          cdsFind_elemWDTKS,
                          cdsFind_elemWDTYPE_NAME,
                          cboxelem_id,
                          cboxname,
                          cboxunit_izmr,
                          cboxInfo,
                          cboxNumer,
                          cboxType_id,
                          cboxR,
                          cboxDopusk,
                          cboxTKS,
                          cboxType_name,
                          cboxUser_name
                    );
//     frmCFG.ShowModal;
   end;

  end;

end;

procedure TDM.tblCompCalcFields(DataSet: TDataSet);
begin
  //tblComp.FieldByName('sortBy').AsInteger:=-1*tblComp.fieldByName('component_ID').AsInteger
end;

end.
