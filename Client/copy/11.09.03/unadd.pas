unit unadd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,shellApi,
  Dialogs, ExtCtrls, ComCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,IBTable,IBQuery,
  Mask,db,DBClient, Menus, ekbasereport, ekrtf;

type
  TfrmAdd = class(TForm)
    PanelMain: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PanelType: TPanel;
    GridTypes: TDBGrid;
    TabSheet3: TTabSheet;
    panelElem: TPanel;
    DBGridElements: TDBGrid;
    TabSheet4: TTabSheet;
    panelInfo: TPanel;
    DBGridInfo: TDBGrid;
    PanelComponentBottom: TPanel;
    PanelComponent: TPanel;
    GridComponent: TDBGrid;
    PanelTypesBottom: TPanel;
    PanelElemBottom: TPanel;
    PanelInfoBottom: TPanel;
    gbElem: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GbAddElem: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    cbElem: TDBLookupComboBox;
    NavigatorComponents: TDBNavigator;
    NavigatorTypes: TDBNavigator;
    NavigatorElements: TDBNavigator;
    btnClose: TBitBtn;
    MainMenu: TMainMenu;
    btnAllConnect: TMenuItem;
    Ajhvf1: TMenuItem;
    N5: TMenuItem;
    btnImportCard: TBitBtn;
    EkRTFCard: TEkRTF;
    rbName: TRadioButton;
    rbNUMER: TRadioButton;
    checkBoxElem: TCheckBox;
    N1: TMenuItem;
    btnShowaddForm: TMenuItem;
    btnShowFindForm: TMenuItem;
    dbmemInfo: TDBMemo;
    Label4: TLabel;
    Label7: TLabel;
    lbLinks: TDBLookupListBox;
    memLinkInfo: TDBMemo;
    pmLinks: TPopupMenu;
    Open1: TMenuItem;
    procedure btnAddComponentClick(Sender: TObject);
    procedure btnAddTypeClick(Sender: TObject);
    procedure refresh;
    procedure btnFindComponentClick(Sender: TObject);
    procedure btnFindTypeClick(Sender: TObject);
    procedure btnFindElemClick(Sender: TObject);
    procedure btnAddInfoClick(Sender: TObject);
    procedure btnFindInfoClick(Sender: TObject);
    procedure EArrivalExit(Sender: TObject);
    procedure EChargeExit(Sender: TObject);
    procedure ECost_For_OneExit(Sender: TObject);
    procedure EDateExit(Sender: TObject);
    procedure GridComponentTitleClick(Column: TColumn);
    procedure GridTypesTitleClick(Column: TColumn);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAllConnectClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure btnImportCardClick(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure rbNameClick(Sender: TObject);
    procedure rbNUMERClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure checkBoxElemClick(Sender: TObject);
    /////////my
    procedure LocateComponent(name:string);
    procedure LocateType(id:integer);
    procedure LocateElem(pole:integer);
    procedure LocateInfo(id:integer);
    procedure btnShowaddFormClick(Sender: TObject);
    procedure btnShowFindFormClick(Sender: TObject);
    procedure printCard(id_elem:integer);
    procedure lbLinksClick(Sender: TObject);
    procedure lbLinksDblClick(Sender: TObject);
    procedure Open1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdd: TfrmAdd;

implementation
uses dmo,unitOstatki, unitAddRecords,unitFind, UnitLinks;
{$R *.dfm}
function find(var tbl:TIBTable;field:string;pole:variant;typ:tLocateOption;p:string;strOr:byte):string;overload;
begin
if (not tbl.Locate(Field,pole,[typ]))
     then
       begin
        case strOr of
          1:       MessageDlg('Ёлемент со значением  "'+pole+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          0:       MessageDlg('Ёлемент со значением  "'+floatToStr(pole)+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          2:       MessageDlg('Ёлемент со значением  "'+dateToStr(pole)+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          end;
       end;
end;
function find(var tbl:TClientDataSet;field:string;pole:variant;typ:tLocateOption;p:string;strOr:byte):string; overload;
begin
if (not tbl.Locate(Field,pole,[typ]))
     then
       begin
        case strOr of
          1:       MessageDlg('Ёлемент со значением  "'+pole+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          0:       MessageDlg('Ёлемент со значением  "'+floatToStr(pole)+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          2:       MessageDlg('Ёлемент со значением  "'+dateToStr(pole)+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          end;
       end;
end;
function find(var tbl:TIBQuery;field:string;pole:variant;typ:tLocateOption;p:string;strOr:byte):string; overload;
begin
if (not tbl.Locate(Field,pole,[typ]))
     then
       begin
        case strOr of
          1:       MessageDlg('Ёлемент со значением  "'+pole+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          0:       MessageDlg('Ёлемент со значением  "'+floatToStr(pole)+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          2:       MessageDlg('Ёлемент со значением  "'+dateToStr(pole)+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          end;
       end;
end;

procedure TfrmAdd.btnAddComponentClick(Sender: TObject);
begin
   with frmAddRecords do
   begin
      Show;
      tabComponents.Show;
      editComponentName.SetFocus;
  end;
end;

procedure TFrmAdd.refresh;
begin
     with dm do
     begin
         NavigatorComponents.BtnClick(nbrefresh);
         NavigatorTypes.BtnClick(nbrefresh);
         NavigatorElements.BtnClick(nbrefresh);
//         NavigatorInfo.BtnClick(nbrefresh);
     end;

end;
procedure TfrmAdd.btnAddTypeClick(Sender: TObject);
begin
   with frmAddRecords do
   begin
      Show;
      tabtypes.Show;
      edtTypeName.SetFocus;
  end;


end;

procedure TfrmAdd.LocateComponent(name:string);
begin
 try
  try
//   btnFindComponent.Enabled:=false;
    if (dm.IBDatabase.Connected=true) and (not dm.tblComponents.Locate('name',name,[loPartialKey]))
      then
        MessageDlg(' омпонент "'+name+'" не найден!',mtInformation,[mbOk],0);
   finally
//      btnFindComponent.Enabled:=true;
   end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;


end;
procedure TfrmAdd.btnFindComponentClick(Sender: TObject);
begin
{ try
  try
   btnFindComponent.Enabled:=false;
    if (dm.IBDatabase.Connected=true) and (not dm.tblComponents.Locate('name',editComponentName.text,[loPartialKey]))
      then
        MessageDlg(' омпонент "'+editComponentName.text+'" не найден!',mtInformation,[mbOk],0);
   finally
      btnFindComponent.Enabled:=true;
   end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
}
end;
procedure TfrmAdd.locateType(id:integer);
begin
 try
    try
    cursor:=crHourGlass;
    //    btnFindType.Enabled:=false;
     if (dm.IBDatabase.Connected) and (not dm.tblTypes.Locate('type_id',id,[loPartialKey]))
       then
         MessageDlg('“ип под номером "'+intToStr(id)+'" не найден!',mtInformation,[mbOk],0);
    finally
//       btnFindType.Enabled:=true;
    cursor:=crDefault;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;
procedure TfrmAdd.btnFindTypeClick(Sender: TObject);
begin
{ try
    try
    btnFindType.Enabled:=false;
     if (dm.IBDatabase.Connected) and (not dm.tblTypes.Locate('name',edtTypeName.text,[loPartialKey]))
       then
         MessageDlg('“ип с именем "'+edtTypeName.text+'" не найден!',mtInformation,[mbOk],0);
    finally
       btnFindType.Enabled:=true;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
}
end;
function ZamenaDotNakoma(st :string):string;
var i: integer;
begin
     for i:=1 to length(st) do
     begin
      if st[i]='.' then
         result:=result+',' else
           result:=result+st[i];
     end;
end;
procedure TfrmAdd.LocateElem(pole:integer);
begin
try
  try
   cursor:=crHourGlass;
   find(dm.tblElEments,'element_id',pole,loPartialKey,'id',0);
    finally
  cursor:=crDefault;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;


end;
procedure TfrmAdd.btnFindElemClick(Sender: TObject);
{var pole: string;
Field:string;
//r:real;
i:integer;}
begin
{  if cbFindField.Text = '' then showmessage('¬ыберите по какому полю производитс€ поиск')
    else
    begin
    try
     try
     i:=cbFindField.ItemIndex;
     btnFindElem.Enabled:=false;
     DBGridElements.Cursor:=crHourGlass;
     case i of
     0:begin
        pole:=EName.Text;
        field:='name';
              if (dm.IBDatabase.Connected)
                 then   find(dm.qryElements,field,pole,loPartialKey,cbFindField.text,1);

       end;
     1:begin
        pole:=Eunit.Text;
        field:='Unit_izmerenie';
               if (dm.IBDatabase.Connected)
                 then   find(dm.qryElements,field,pole,loPartialKey,cbFindField.text,1);
       end;        }
{     2:begin
        pole:=Epresence.Text;
        pole:=zamenaDotNaKoma(pole);
        field:='Presence';
        r:=strToFloat(pole);
               if (dm.IBDatabase.Connected)
                 then   find(dm.clientDSElem,field,r,loCaseInsensitive,cbFindField.text,0);
       end;
     3:begin
        pole:=(ECost.Text);
        pole:=zamenaDotNaKoma(pole);
        field:='cost';
//        r:=strToFloat(pole);
               if (dm.IBDatabase.Connected)
                 then   find(dm.clientDSElem,field,pole,loPartialKey,cbFindField.text,0);
        end;}
{    end;
    finally
     btnFindElem.Enabled:=true;
     DBGridElements.Cursor:=crDefault;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

  end;}
end;

procedure TfrmAdd.btnAddInfoClick(Sender: TObject);
begin
{    with frmAddRecords do
   begin
      Show;
      tabInfo.Show;
      cbElem.SetFocus;
  end;}
end;
procedure TfrmAdd.LocateInfo(id:integer);
begin
try
  try
   cursor:=crHourGlass;
   find(dm.tblInfo,'info_id',id,loPartialKey,'info_id',0);
    finally
     cursor:=crDefault;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;
procedure TfrmAdd.btnFindInfoClick(Sender: TObject);
{var pole: string;
Field:string;
i,numdoc:integer;
s:Tdatetime;
r:real;}
begin
{  if cbFindFieldInfo.Text = '' then showmessage('¬ыберите по какому полю производитс€ поиск')
    else
    begin
  try
      try
{     DBGridInfo.Cursor:=crHourGlass;
     btnFindInfo.Enabled:=false;
     i:=cbFindFieldInfo.ItemIndex;
     case i of
     0:begin
//        pole:=Earrival.Text;
        pole:=zamenaDotNaKoma(pole);
        field:='arrival';
        r:=strToFloat(pole);
                if (dm.IBDatabase.Connected)
                 then   find(dm.qryinfoOrderBy,field,r,loCaseInsensitive,cbFindFieldInfo.text,0);
       end;
     1:begin
        pole:=ECharge.Text;
        pole:=zamenaDotNaKoma(pole);
        field:='Charge';
        r:=strToFloat(pole);
                        if (dm.IBDatabase.Connected)
                 then   find(dm.qryinfoOrderBy,field,r,loCaseInsensitive,cbFindFieldInfo.text,0);
       end;
     2:begin
        pole:=Ecost_for_one.Text;
        pole:=zamenaDotNaKoma(pole);
        field:='Cost_for_one';
        r:=strToFloat(pole);
                        if (dm.IBDatabase.Connected)
                 then   find(dm.qryinfoOrderBy,field,r,loCaseInsensitive,cbFindFieldInfo.text,0);
       end;
     3:begin
        pole:=(EFRom_whom.Text);
        field:='From_whom';
                      if (dm.IBDatabase.Connected)
                 then   find(dm.qryinfoOrderBy,field,pole,loPartialKey,cbFindFieldInfo.text,1);

        end;
     4:begin
        pole:=(EDate.Text);
        field:='theDate';
        s:=strTodate(pole);
                      if (dm.IBDatabase.Connected)
                 then   find(dm.qryinfoOrderBy,field,s,loPartialKey,cbFindFieldInfo.text,2);

        end;
     5:begin
        pole:=(Enum_doc.Text);
        field:='num_doc';
        numDoc:=strToInt(pole);
                      if (dm.IBDatabase.Connected)
                        then   find(dm.qryinfoOrderBy,field,numdoc,loCaseInsensitive,cbFindFieldInfo.text,0);

       end;
     end;
      finally
      DBGridInfo.Cursor:=crDefault;
      btnFindInfo.Enabled:=true;
      cbElem.SetFocus;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;}
end;


procedure TfrmAdd.EArrivalExit(Sender: TObject);
{const c: set of  char = ['0'..'9','.',','];
var i:integer;
countKoma: boolean;
s,s2:string;}
begin
{  CountKoma:=true;
  for i:=1 to length(Earrival.Text) do
  begin
           if (Earrival.Text[i] in c) then
               begin
               if (Earrival.Text[i] =',')  then
                 begin  if countKoma then
                    S2:='.' else s2:='';
                    countKoma:=false;
                  end else
                       s2:=Earrival.Text[i];
                       if s2='.' then countKoma:=false;
                   s:=s+s2;
                end;
    end;
  earrival.Text:=s;}
end;

procedure TfrmAdd.EChargeExit(Sender: TObject);
{const c: set of  char = ['0'..'9','.',','];
var i:integer;
countKoma: boolean;
s,s2:string;}
begin
{  CountKoma:=true;
  for i:=1 to length(Echarge.Text) do
  begin
           if (Echarge.Text[i] in c) then
               begin
               if (Echarge.Text[i] =',')  then
                 begin  if countKoma then
                    S2:='.' else s2:='';
                    countKoma:=false;
                  end else
                       s2:=Echarge.Text[i];
                       if s2='.' then countKoma:=false;
                   s:=s+s2;
                end;
    end;
  echarge.Text:=s;}
end;

procedure TfrmAdd.ECost_For_OneExit(Sender: TObject);
{const c: set of  char = ['0'..'9','.',','];
var i:integer;
countKoma: boolean;
s,s2:string;}
begin
  {CountKoma:=true;
  for i:=1 to length(Ecost_for_one.Text) do
  begin
           if (Ecost_for_one.Text[i] in c) then
               begin
               if (Ecost_for_one.Text[i] =',')  then
                 begin  if countKoma then
                    S2:='.' else s2:='';
                    countKoma:=false;
                  end else
                       s2:=Ecost_for_one.Text[i];
                       if s2='.' then countKoma:=false;
                   s:=s+s2;
                end;
    end;
  ecost_for_one.Text:=s;


 }

end;

procedure TfrmAdd.EDateExit(Sender: TObject);
{const c: set of  char = ['0'..'9','.',','];
var i:integer;
countKoma: boolean;
s,s2:string;              }
begin
{  CountKoma:=true;
  for i:=1 to length(Edate.Text) do
  begin
           if (Edate.Text[i] in c) then
               begin
               if (Edate.Text[i] =',')  then
                 begin  if countKoma then
                    S2:='.' else s2:='';
                    countKoma:=false;
                  end else
                       s2:=Edate.Text[i];
                       if s2='.' then countKoma:=false;
                   s:=s+s2;
                end;
    end;
  edate.Text:=s;}
end;
procedure TfrmAdd.GridComponentTitleClick(Column: TColumn);
begin
{ with dm do
 begin
       try
          tblComponents.AddIndex(Column.FieldName+'indx',Column.FieldName,[ixCaseInsensitive],'');
//          tblComponents.IndexName:=Column.FieldName+'indx';
       finally
          try
//              tblComponents.DeleteIndex(Column.FieldName+'indx');
          finally

          end;
       end;
 end;}

end;

procedure TfrmAdd.GridTypesTitleClick(Column: TColumn);
begin
{ with dm do
 begin
       try
          tbltypes.AddIndex(Column.FieldName+'indx',Column.FieldName,[ixCaseInsensitive],'');
          tbltypes.IndexName:=Column.FieldName+'indx';
       finally
          try
              tbltypes.DeleteIndex(Column.FieldName+'indx');
          finally

          end;
       end;
 end;}

end;

procedure TfrmAdd.btnCloseClick(Sender: TObject);
begin
close;
end;

procedure TfrmAdd.btnAllConnectClick(Sender: TObject);
begin
      with dm do
      begin
         try
           Cursor:=crHourGlass;
          try
            if   not tblComponents.Active then   tblComponents.Open;
          finally
            if  not tblTypes.Active then      tblTypes.Open;
            if  not tblLinks.Active then      tblLinks.Open;
            if  not  qryLinkInfo_by_link.active then qryLinkInfo_by_link.open;            
           try
//              if   not ClientElem.Active then     ClientElem.Open;
             finally

              try
               if not  qryInfoOrderby.Active then     qryInfoOrderBy.open;
               finally
                try
               if not dm.tblElements.Active then       dm.tblElements.Open;
               finally
          dm.qryElements.Open;

                end;
     if not  dm.tblInfo.Active then     dm.tblInfo.open;
          end;
       Cursor:=crDefault;
         end;
        end;
        except
        on E:EXCEPTION do
              messageDlg(e.Message,mtError,[mbOk],0);
        end;

          end;
end;

procedure TfrmAdd.N5Click(Sender: TObject);
begin
close;
end;

procedure TfrmAdd.N4Click(Sender: TObject);
begin
   dm.IBTransaction.commit;
   btnAllConnect.click;
end;

procedure TFRmAdd.printCard(id_elem:integer);
var
thedate,arrival,charge,ostatok,nam,num_p_p,from_whom,
unit_izmerenie,cost_for_one,num_doc,type_name,numer:string;
id:integer;
begin
    with dm do
    begin
    try
      try
      DBGridInfo.Cursor:=crHourGlass;
      btnImportCard.Enabled:=false;
        if not IBDatabase.Connected
            then IBDatabase.Connected:=true;
        if not IBTransaction.Active
            then IBTransaction.Active:=true;
        if tblCard.Exists then
        begin
               IBTransaction.Commit;
               if not IBTransaction.Active
                    then IBTransaction.Active:=true;
               tblCard.DeleteTable;
               IBTransaction.Commit;
        end;
            if not IBTransaction.Active
                then IBTransaction.Active:=true;
           tblCard.CreateTable;
//         dbgridInfo.DataSource:=dsCard;
           IBTransaction.Commit;
      if qryWork.Active then  qryWork.Close;
      if qryConsole.Active then  qryConsole.Close;
        qryCard.ParamByName('pelement_id').Asinteger:=id_elem;
        qryCard.Open;
        qryCard.First;
        while not qryCard.Eof do
           begin
                num_p_p:=intToStr(qryCard.fieldByname('num_p_p').AsInteger);
                qryConsole.SQL.Text:='select srez_id,num_p_p,date_of_srez from srez where element_id='+intToStr(id_elem)+ ' and num_p_p = '+num_p_p;
                   qryConsole.Open;

                thedate:=DateToStr(qryCard.fieldByname('thedate').AsDateTime);
                num_doc:=qryCard.fieldByname('num_doc').Asstring;
                from_whom:=qryCard.fieldByname('from_whom').Asstring;

                numer:=frmostatki.zamenaKomaNaDot(qryCard.fieldByname('numer').Asstring);

                arrival:=frmostatki.zamenaKomaNaDot(floatToStr(qryCard.fieldByname('arrival').AsFloat));
                charge:=frmostatki.zamenaKomaNaDot(floatToStr(qryCard.fieldByname('charge').AsFloat));
                ostatok:=(floatToStr(qryCard.fieldByname('ostatok').AsFloat));
           if StrToFloat(ostatok) < 1 then
                         str(StrToFloat(ostatok):2:2,ostatok);
                ostatok:=frmostatki.zamenaKomaNaDot(ostatok);
                cost_for_one:=frmostatki.zamenaKomaNaDot(floatToStr(qryCard.fieldByname('cost').AsFloat));

                unit_izmerenie:=qryCard.fieldByname('unit_izmerenie').Asstring;
                nam:=qryCard.fieldByname('name').Asstring;
                type_name:=qryCard.fieldByname('type_name').Asstring;
                id:=(qryConsole.FieldByName('srez_id').AsInteger);
//                showmessage(intToStr(0)); exit;
                   if (id = 0) then
                     begin
                        qryWork.SQL.Text:='insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,charge,ostatok,name,type_name,cost_for_one,unit_izmerenie,numer)  values('+num_p_p+','''+thedate+''','''+num_doc+''','''+from_whom+''','+arrival+','+charge+','+ostatok+','''+nam+''','''+type_name+''','+cost_for_one+','''+unit_izmerenie+''','''+numer+''')';
//                        showmessage(qryWork.SQL.Text);
                        qryWork.open;
                     end else
                        begin
                        qryWork.SQL.Text:='insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,charge,ostatok,name,type_name,cost_for_one,unit_izmerenie,numer)  values('+num_p_p+','''+thedate+''','''+num_doc+''','''+from_whom+''','+arrival+','+charge+','+ostatok+','''+nam+''','''+type_name+''','+cost_for_one+','''+unit_izmerenie+''','''+numer+''')';
//    showmessage(qryWork.SQL.Text);
                          qryWork.open;
    qryWork.SQL.Text:='insert into Card (thedate,ostatok,name,type_name,from_whom)  values('''+dateToStr(qryConsole.FieldByName('date_of_srez').asDateTime)+''','+ostatok+','''+nam+''','''+type_name+''',''ќстаток'')';
//    showmessage(qryWork.SQL.Text);
                          qryWork.open;

                        end;
                qryCard.Next;
           end;
    tblCard.Open;
      With EKRTFCArd do
        Begin
         OutFile:=CreateFileName('','reports\tmp\list');
         ExecuteOpen([tblCard],SW_SHOW);
        End;
               IBTransaction.Commit;
               if not IBTransaction.Active then IBTransaction.Active:=true;
               tblCard.DeleteTable;
               IBTransaction.Commit;
    btnAllConnect.click;
      finally
      DBGridInfo.Cursor:=crDefault;
      btnImportCard.Enabled:=true;
//      cbElem.SetFocus;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

    end;

end;
////////////
procedure TfrmAdd.btnImportCardClick(Sender: TObject);
{var
thedate,arrival,charge,ostatok,nam,num_p_p,from_whom,
unit_izmerenie,cost_for_one,num_doc,type_name,numer:string;
id:integer;}
begin
if CBElem.Text='' then
  begin
         showmessage('«аполните поле "Ёлемент"');
         exit;
  end;
{    with dm do
    begin
    try
      try
      DBGridInfo.Cursor:=crHourGlass;
      btnImportCard.Enabled:=false;
        if not IBDatabase.Connected
            then IBDatabase.Connected:=true;
        if not IBTransaction.Active
            then IBTransaction.Active:=true;
        if tblCard.Exists then
        begin
               IBTransaction.Commit;
               if not IBTransaction.Active
                    then IBTransaction.Active:=true;
               tblCard.DeleteTable;
               IBTransaction.Commit;
        end;
            if not IBTransaction.Active
                then IBTransaction.Active:=true;
           tblCard.CreateTable;
//         dbgridInfo.DataSource:=dsCard;
           IBTransaction.Commit;
      if qryWork.Active then  qryWork.Close;
      if qryConsole.Active then  qryConsole.Close;
        qryCard.ParamByName('pelement_id').Asinteger:=cbElem.KeyValue;
        qryCard.Open;
        qryCard.First;
        while not qryCard.Eof do
           begin
                num_p_p:=intToStr(qryCard.fieldByname('num_p_p').AsInteger);
                qryConsole.SQL.Text:='select srez_id,num_p_p,date_of_srez from srez where element_id='+intToStr(cbElem.KeyValue)+ ' and num_p_p = '+num_p_p;
                   qryConsole.Open;

                thedate:=DateToStr(qryCard.fieldByname('thedate').AsDateTime);
                num_doc:=qryCard.fieldByname('num_doc').Asstring;
                from_whom:=qryCard.fieldByname('from_whom').Asstring;

                numer:=frmostatki.zamenaKomaNaDot(qryCard.fieldByname('numer').Asstring);

                arrival:=frmostatki.zamenaKomaNaDot(floatToStr(qryCard.fieldByname('arrival').AsFloat));
                charge:=frmostatki.zamenaKomaNaDot(floatToStr(qryCard.fieldByname('charge').AsFloat));
                ostatok:=(floatToStr(qryCard.fieldByname('ostatok').AsFloat));
           if StrToFloat(ostatok) < 1 then
                         str(StrToFloat(ostatok):2:2,ostatok);
                ostatok:=frmostatki.zamenaKomaNaDot(ostatok);
                cost_for_one:=frmostatki.zamenaKomaNaDot(floatToStr(qryCard.fieldByname('cost').AsFloat));

                unit_izmerenie:=qryCard.fieldByname('unit_izmerenie').Asstring;
                nam:=qryCard.fieldByname('name').Asstring;
                type_name:=qryCard.fieldByname('type_name').Asstring;
                id:=(qryConsole.FieldByName('srez_id').AsInteger);
//                showmessage(intToStr(0)); exit;
                   if (id = 0) then
                     begin
                        qryWork.SQL.Text:='insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,charge,ostatok,name,type_name,cost_for_one,unit_izmerenie,numer)  values('+num_p_p+','''+thedate+''','''+num_doc+''','''+from_whom+''','+arrival+','+charge+','+ostatok+','''+nam+''','''+type_name+''','+cost_for_one+','''+unit_izmerenie+''','''+numer+''')';
//                        showmessage(qryWork.SQL.Text);
                        qryWork.open;
                     end else
                        begin
                        qryWork.SQL.Text:='insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,charge,ostatok,name,type_name,cost_for_one,unit_izmerenie,numer)  values('+num_p_p+','''+thedate+''','''+num_doc+''','''+from_whom+''','+arrival+','+charge+','+ostatok+','''+nam+''','''+type_name+''','+cost_for_one+','''+unit_izmerenie+''','''+numer+''')';
//    showmessage(qryWork.SQL.Text);
                          qryWork.open;
    qryWork.SQL.Text:='insert into Card (thedate,ostatok,name,type_name,from_whom)  values('''+dateToStr(qryConsole.FieldByName('date_of_srez').asDateTime)+''','+ostatok+','''+nam+''','''+type_name+''',''ќстаток'')';
//    showmessage(qryWork.SQL.Text);
                          qryWork.open;

                        end;
                qryCard.Next;
           end;
    tblCard.Open;
      With EKRTFCArd do
        Begin
         OutFile:=CreateFileName('','reports\tmp\list');
         ExecuteOpen([tblCard],SW_SHOW);
        End;
               IBTransaction.Commit;
               if not IBTransaction.Active then IBTransaction.Active:=true;
               tblCard.DeleteTable;
               IBTransaction.Commit;
    btnAllConnect.click;
      finally
      DBGridInfo.Cursor:=crDefault;
      btnImportCard.Enabled:=true;
//      cbElem.SetFocus;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

    end;}
    printCard(cbElem.KeyValue);
end;

procedure TfrmAdd.TabSheet4Show(Sender: TObject);
begin
  try
   try
     DbGridInfo.Cursor:=crHourGlass;
     if dm.tblElements.Active then
       dm.tblElements.Refresh;
//       cbElem.Refresh;
     DBGridInfo.Refresh;
   finally
       DbGridInfo.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;
end;

procedure TfrmAdd.rbNameClick(Sender: TObject);
begin
   if rbName.Checked then
     cbElem.ListField:='NAME';

end;

procedure TfrmAdd.rbNUMERClick(Sender: TObject);
begin
   if rbNumer.Checked then
     cbElem.ListField:='NUMER';

end;

procedure TfrmAdd.TabSheet1Show(Sender: TObject);
begin
  try
   try
     GridComponent.Cursor:=crHourGlass;
//     NavigatorComponents.BtnClick(nbRefresh);
     if dm.tblCOmponents.Active then
       dm.tblComponents.Refresh;
//       GridComponent.Refresh;
   finally
       GridComponent.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmAdd.TabSheet2Show(Sender: TObject);
begin
  try
   try
     GridTypes.Cursor:=crHourGlass;
//     GridTypes.Refresh;
     //     NavigatorComponents.BtnClick(nbRefresh);
     if dm.tblTypes.Active then
        dm.tblTypes.Refresh;
   finally
       GridTypes.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;
end;

procedure TfrmAdd.TabSheet3Show(Sender: TObject);
begin
  try
   try
     DbGridElements.Cursor:=crHourGlass;
     if dm.tblElements.Active then
       dm.tblElements.Refresh;
       DBGridElements.Refresh;
   finally
       DbGridElements.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmAdd.checkBoxElemClick(Sender: TObject);
begin
        if not checkBoxElem.Checked then
        begin
                DBGridInfo.DataSource:=dm.dsInfo;
              if not dm.tblInfo.Active  then dm.tblInfo.Open;
        end else
        begin
                DBGridInfo.DataSource:=DM.dsQryInfoOrder;
//                dm.qryin;
        end;
end;

procedure TfrmAdd.btnShowaddFormClick(Sender: TObject);
begin
   with frmAddRecords do
   begin
      Show;
      if TabSheet1.Showing then
      begin
        tabComponents.Show;
        editComponentName.SetFocus;
      end;
      if TabSheet2.Showing then
      begin
        tabtypes.Show;
        edtTypeName.SetFocus;
      end;
      if TabSheet3.Showing then
      begin
        tabElements.Show;
        Ename.SetFocus;
      end;
      if TabSheet4.Showing then
      begin
        tabInfo.Show;
        cbElem.SetFocus;
      end;
  end;

end;

procedure TfrmAdd.btnShowFindFormClick(Sender: TObject);
begin
   frmFind.Show;
end;

procedure TfrmAdd.lbLinksClick(Sender: TObject);
begin
     lbLinks.Hint:=memLinkInfo.text;
     lbLinks.ShowHint:=true;     
end;

procedure TfrmAdd.lbLinksDblClick(Sender: TObject);
var s:pchar;
begin
   if lbLinks.SelectedItem <> '' then
   begin
           s:=pchar(lbLinks.SelectedItem);
           ShellExecute (0, 'open', s, '', 'c:\', 1);
   end;

end;

procedure TfrmAdd.Open1Click(Sender: TObject);
begin
   frmLink.show;
end;

end.
