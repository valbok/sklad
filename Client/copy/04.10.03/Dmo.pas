unit Dmo;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, IBTable,
  DBClient, Provider, IBSQLMonitor, DBTables,dialogs;

type
  TDM = class(TDataModule)
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    dsComponents: TDataSource;
    dsTypes: TDataSource;
    dsInfo: TDataSource;
    dsElements: TDataSource;
    tblComponents: TIBTable;
    tblTypes: TIBTable;
    tblElements: TIBTable;
    tblComponentsNAME: TIBStringField;
    tblTypesTYPE_ID: TIntegerField;
    tblTypesNAME: TIBStringField;
    tblComponentsCOMPONENT_ID: TIntegerField;
    tblTypesLUComponent_id: TStringField;
    tblTypesCOMPONENT_ID: TIntegerField;
    qryConsole: TIBQuery;
    dsQryConsole: TDataSource;
    tblElementsELEMENT_ID: TIntegerField;
    tblElementsNAME: TIBStringField;
    tblElementsUNIT_IZMERENIE: TIBStringField;
    tblElementsTYPE_ID: TIntegerField;
    qryAddSrez: TIBQuery;
    dsQryAddSrez: TDataSource;
    qryComponents: TIBQuery;
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
    tblElementsNUMER: TIBStringField;
    tblElementsINFO: TIBStringField;
    tblElementsLuTypeName: TStringField;
    tblCardnumer: TStringField;
    OstNowDate: TStringField;
    tblElementsUSER_NAME: TIBStringField;
    tblLinks: TIBTable;
    dsLinks: TDataSource;
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
    tblComponentsUSER_NAME: TIBStringField;
    tblTypesUSER_NAME: TIBStringField;
    tblComp: TIBTable;
    tblTyp: TIBTable;
    dsComp: TDataSource;
    dsTyp: TDataSource;
    tblCompCOMPONENT_ID: TIntegerField;
    tblCompNAME: TIBStringField;
    tblCompUSER_NAME: TIBStringField;
    tblTypTYPE_ID: TIntegerField;
    tblTypNAME: TIBStringField;
    tblTypCOMPONENT_ID: TIntegerField;
    tblTypUSER_NAME: TIBStringField;
    tblTypLuCompName: TStringField;
    tblType2: TIBTable;
    dsType2: TDataSource;
    tblLinksLINK_ID: TIntegerField;
    tblLinksLINK: TIBStringField;
    tblLinksINFO: TIBStringField;
    tblLinksELEMENT_ID: TIntegerField;
    tblLinksUSER_NAME: TIBStringField;
    tblDetali: TIBTable;
    dsDetali: TDataSource;
    cdsComp: TClientDataSet;
    dsProviderComp: TDataSetProvider;
    dsCdsComp: TDataSource;
    cdsTyp: TClientDataSet;
    dsProviderTyp: TDataSetProvider;
    dsCdsTyp: TDataSource;
    tblZakazi: TIBTable;
    dsZakazi: TDataSource;
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
    procedure IBDatabaseBeforeConnect(Sender: TObject);
    procedure OstAfterClose(DataSet: TDataSet);
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

uses main, unitPassword,unadd;

{$R *.dfm}

procedure TDM.IBDatabaseBeforeConnect(Sender: TObject);
begin
      dm.IBDatabase.DatabaseName:=host+':'+pathToDb;
      frmEnterPass.showmodal;
      IBDatabase.Params.Clear;
      IBDatabase.Params.Add('user_name='+Main._login);
      IBDatabase.Params.Add('password='+Main._password);
end;

procedure TDM.OstAfterClose(DataSet: TDataSet);
begin
              if (ost.Exists) and  (IBTransaction.Active) then
              begin
              if ost.Exists then
                 try
                   try
                    Ost.DeleteTable;
                   except

                   end;
                 finally
                  IBTransaction.Commit;
                end;
              end;
end;

procedure TDM.IBDatabaseAfterDisconnect(Sender: TObject);
begin
  showmessage('Отключено');
 with  frmMain do
   begin
       frmMain.Caption:=main.ver+'Соединение прекращено';
       frmManeger.lblTBLName.Caption:='';
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
  end;

end;

procedure TDM.tblCompCalcFields(DataSet: TDataSet);
begin
  //tblComp.FieldByName('sortBy').AsInteger:=-1*tblComp.fieldByName('component_ID').AsInteger
end;

end.
