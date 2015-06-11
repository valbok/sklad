unit unitAddRecords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DBCtrls;

type
  TfrmAddRecords = class(TForm)
    pnlMain: TPanel;
    PageControlMain: TPageControl;
    tabComponents: TTabSheet;
    TabTypes: TTabSheet;
    TabElements: TTabSheet;
    TabInfo: TTabSheet;
    pnlComponents: TPanel;
    lNameComponent: TLabel;
    editComponentName: TEdit;
    btnAddComponent: TBitBtn;
    pnlTypes: TPanel;
    Label12: TLabel;
    Label11: TLabel;
    edtTypeName: TEdit;
    CBType_Comp: TDBLookupComboBox;
    btnAddType: TBitBtn;
    pnlElements: TPanel;
    btnAddElem: TBitBtn;
    pnlInfo: TPanel;
    gbArrivalCharge: TGroupBox;
    lArrival: TLabel;
    lCharge: TLabel;
    Label7: TLabel;
    ECharge: TEdit;
    EArrival: TEdit;
    ECost_For_One: TEdit;
    lFrom_Whom: TLabel;
    EFrom_Whom: TEdit;
    lDate: TLabel;
    EDate: TEdit;
    lNum_doc: TLabel;
    ENum_doc: TEdit;
    btnAddInfo: TBitBtn;
    MemInfo: TMemo;
    Label2: TLabel;
    gbElem: TGroupBox;
    cbElem: TDBLookupComboBox;
    rbName: TRadioButton;
    rbNUMER: TRadioButton;
    btnClose: TBitBtn;
    sbSrez: TSpeedButton;
    gbElemNew: TGroupBox;
    EName: TEdit;
    lNameElem: TLabel;
    lUnitElem: TLabel;
    EUnit: TEdit;
    Enumer: TEdit;
    lNumer: TLabel;
    lTypeElem: TLabel;
    CBElem_type_name: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    btnAddLink: TBitBtn;
    ELink: TEdit;
    memLinkInfo: TMemo;
    procedure btnAddComponentClick(Sender: TObject);
    procedure btnAddTypeClick(Sender: TObject);
    procedure btnAddElemClick(Sender: TObject);
    procedure btnAddInfoClick(Sender: TObject);
    procedure EArrivalExit(Sender: TObject);
    procedure EChargeExit(Sender: TObject);
    procedure ECost_For_OneExit(Sender: TObject);
    procedure EDateExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbNUMERClick(Sender: TObject);
    procedure rbNameClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure sbSrezClick(Sender: TObject);
    procedure CBType_CompClick(Sender: TObject);
    procedure CBElem_type_nameClick(Sender: TObject);
    procedure cbElemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabInfoShow(Sender: TObject);
    procedure TabTypesShow(Sender: TObject);
    procedure TabElementsShow(Sender: TObject);
    procedure pnlInfoClick(Sender: TObject);
    procedure pnlTypesClick(Sender: TObject);
    procedure btnAddLinkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddRecords: TfrmAddRecords;

implementation
uses dmo,unAdd, main;
{$R *.dfm}

procedure TfrmAddRecords.btnAddComponentClick(Sender: TObject);
var tmpStr:string;
begin
if editComponentName.Text <>'' then
   with dm do
   begin
 try
      try
       pnlComponents.Cursor:=crHourGlass;
       btnAddComponent.Enabled:=false;
       tmpStr:=qryWork.SQL.Text;
       qryWork.SQL.clear;
       qryWork.SQL.Text:='execute procedure add_component('''+editComponentName.Text+''','''+main._login+''')';

          qryWork.Open;
       qryWork.SQL.Text:= tmpStr;
       editComponentName.SetFocus;
      showmessage('Операция выполнена успешно');
      finally
       pnlCOmponents.Cursor:=crDefault;
       btnAddComponent.Enabled:=true;       
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

   end;

end;

procedure TfrmAddRecords.btnAddTypeClick(Sender: TObject);
var tmpStr:string;

begin
  if (edtTypeName.text <> '')  then
       with dm do
       begin
         if (cbType_comp.Text ='') then
           begin
              messageDlg('Необходимо заполнить поле "комплектующее"...',mtError,[MbOk],0);
              exit;
           end;
     try
       try
           pnlTypes.Cursor:=crHourGlass;
           btnAddType.Enabled:=false;
           tmpStr:=qryWork.SQL.Text;
           qryWork.SQL.Text:='execute procedure add_type('''+edtTypeName.text+''','''+cbType_comp.Text+''','''+main._login+''')';
           qryWork.Open;
           refresh;
           qryWork.SQL.Text:=tmpStr;
           edtTypeName.SetFocus;
           showmessage('Операция выполнена успешно');
      finally
       pnlTypes.Cursor:=crDefault;
       btnAddType.Enabled:=true;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

       end;


end;

procedure TfrmAddRecords.btnAddElemClick(Sender: TObject);
var tmpStr:string;
//cost,presence:string;
begin
  if (EName.text <> '') then
       with dm do
       begin
         if (cbElem_Type_name.Text ='') then
           begin
              messageDlg('Необходимо заполнить поле "Тип"...',mtError,[MbOk],0);
              exit;
           end;
  try
        try
        pnlElements.Cursor:=crHourGlass;
           btnAddElem.Enabled:=false;
           tmpStr:=qryWork.SQL.Text;
{          if EPresence.text<>'' then presence:=EPresence.Text else presence:='null';
          if ECost.text<>'' then cost:=ECost.Text else cost:='null';}
           qryWork.SQL.Text:='execute procedure add_element('''+EName.text+''','''+EUnit.text+''','+intToStr(CbElem_Type_name.KeyValue)+','''+eNumer.Text+''','''+memInfo.Text+''','''+main._login+''')';

               qryWork.Open;
               refresh;
           qryWork.SQL.Text:=tmpStr;
           ename.SetFocus;
      showmessage('Операция выполнена успешно');           
      finally
       pnlElements.Cursor:=crDefault;

       btnAddElem.Enabled:=true;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

       end;


end;

procedure TfrmAddRecords.btnAddInfoClick(Sender: TObject);
var tmpstr:string;
arrival,charge,cost:string;
begin
     if (cbElem.Text ='') then
       begin
          messageDlg('Необходимо заполнить поле "Элемент"...',mtInformation,[MbOk],0);
          exit;
         end;

if messageDlg('Вы уверены, что желаете добавить запись со значениями: '+#13#10+
                'Элемент: '+cbelem.Text+#13#10+
                'Приход: '+earrival.Text+#13#10+
                'Расход: '+echarge.Text+#13#10+
                'Цена за единицу: '+ecost_for_one.Text+#13#10+
                'От кого: '+efrom_whom.Text+#13#10+
                'Дата: '+edate.Text+#13#10+
                '№ документа: '+enum_doc.Text,mtconfirmation,[mbyes,mbNo],0)=mrNo then exit;
       with dm do
       begin
     try
        try
          pnlInfo.Cursor:=crHourGlass;
          btnAddInfo.Enabled:=false;
           tmpStr:=qryWork.SQL.Text;
           if EArrival.Text <> '' then arrival :=EArrival.Text else arrival:='0';
           if ECharge.Text <> '' then charge :=Echarge.Text else charge:='0';
           if ECost_for_one.Text <> '' then cost :=Ecost_for_one.Text else cost:='0';
           qryWork.SQL.Text:='execute procedure add_info('''+Edate.text+''','''+Enum_doc.text+''','''+(EFrom_Whom.text)+''','+cost+','+Arrival+','+Charge+','+intToStr(cbElem.KeyValue)+','''+main._login+''')';
           qryWork.Open;
           cbElem.SetFocus;
           qryWork.SQL.Text:=tmpStr;
      showmessage('Операция выполнена успешно');
      finally
       pnlInfo.Cursor:=crDefault;
       btnAddInfo.Enabled:=true;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;
end;
procedure TfrmAddRecords.EArrivalExit(Sender: TObject);
const c: set of  char = ['0'..'9','.',','];
var i:integer;
countKoma: boolean;
s,s2:string;
begin
  CountKoma:=true;
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
  earrival.Text:=s;


end;

procedure TfrmAddRecords.EChargeExit(Sender: TObject);
const c: set of  char = ['0'..'9','.',','];
var i:integer;
countKoma: boolean;
s,s2:string;
begin
  CountKoma:=true;
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
  echarge.Text:=s;


end;

procedure TfrmAddRecords.ECost_For_OneExit(Sender: TObject);
const c: set of  char = ['0'..'9','.',','];
var i:integer;
countKoma: boolean;
s,s2:string;
begin
  CountKoma:=true;
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






end;

procedure TfrmAddRecords.EDateExit(Sender: TObject);
const c: set of  char = ['0'..'9','.',','];
var i:integer;
//countKoma: boolean;
s,s2:string;
begin
//  CountKoma:=true;
  for i:=1 to length(Edate.Text) do
  begin
           if (Edate.Text[i] in c) then
               begin
               if (Edate.Text[i] =',')  then
                 begin  {if countKoma then}
                    S2:='.';   //else s2:='';
//                    countKoma:=false;
                  end else
                       s2:=Edate.Text[i];
//                       if s2='.' then countKoma:=false;
                   s:=s+s2;
                end;
    end;
  edate.Text:=s;


end;

procedure TfrmAddRecords.FormCreate(Sender: TObject);
begin
    EDate.Text:=dateTostr(date);
end;

procedure TfrmAddRecords.rbNUMERClick(Sender: TObject);
begin
   if rbNumer.Checked then
     cbElem.ListField:='NUMER';
end;

procedure TfrmAddRecords.rbNameClick(Sender: TObject);
begin
   if rbName.Checked then
     cbElem.ListField:='NAME';

end;

procedure TfrmAddRecords.btnCloseClick(Sender: TObject);
begin
  frmAddRecords.Close;
end;

procedure TfrmAddRecords.sbSrezClick(Sender: TObject);
begin
       try
       try
        if   cbElem.Text = '' then showmessage('Заполните поле "Элемент"') else
                  with dm do
                    begin
                    if messageDlg('Вы уверены? Выполнить срез остатков елемента '''+cbElem.text+''' ?',mtConfirmation,[mbYes,MbNo],0)=mrYes then
                    begin

                        qryWork.SQL.Text:='execute procedure add_srez('+intToStr(cbElem.keyValue)+','''+DateToStr(date)+''','''+main._login+''')';
                        qryWork.Open;
                        showmessage('Срез на '+#13#10+'Дата: '+dateToStr(date)+#13#10+'Время: '+timeToStr(time)+#13#10+'Выполнен');
                    end;
                    end;
        finally
        end;
        except
          on E:Exception do
          showmessage(e.Message);
        end;

end;

procedure TfrmAddRecords.CBType_CompClick(Sender: TObject);
begin
if not dm.tblComponents.Active then
dm.tblComponents.Active:=true;
end;

procedure TfrmAddRecords.CBElem_type_nameClick(Sender: TObject);
begin
if not dm.tblTypes.Active then
dm.tblTypes.Active:=true;

end;

procedure TfrmAddRecords.cbElemClick(Sender: TObject);
begin
if not dm.tblElements.Active then
dm.tblElements.Active:=true;

end;

procedure TfrmAddRecords.FormActivate(Sender: TObject);
begin
   frmManeger.btnAllConnect.click;
end;

procedure TfrmAddRecords.TabInfoShow(Sender: TObject);
begin
   try
      try
       pnlinfo.Cursor:=crHourGlass;
//   cbelem.Refresh;
if dm.tblComponents.Active then
    dm.tblelements.Refresh;
   finally
       pnlInfo.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmAddRecords.TabTypesShow(Sender: TObject);
begin
//  CBType_Comp.Refresh;
   try
      try
       pnlTypes.Cursor:=crHourGlass;
    dm.tblComponents.Refresh;
   finally
       pnlTypes.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmAddRecords.TabElementsShow(Sender: TObject);
begin
   try
      try
       pnlElements.Cursor:=crHourGlass;
//  CBElem_type_name.Refresh;
 IF dm.tblTypes.Active then 
    dm.tbltypes.Refresh;
   finally
       pnlElements.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;
end;

procedure TfrmAddRecords.pnlInfoClick(Sender: TObject);
begin
{dm.tblElements.Locate('name','loki',[]);
showmessage('s');}
end;

procedure TfrmAddRecords.pnlTypesClick(Sender: TObject);
begin
//  CBType_Comp.Refresh;
end;

procedure TfrmAddRecords.btnAddLinkClick(Sender: TObject);
begin
       with dm do
       begin
         if (cbElem.Text ='') then
           begin
              messageDlg('Необходимо выбрать элемент...',mtError,[MbOk],0);
              exit;
           end;
  try
        try
          pnlInfo.Cursor:=crHourGlass;
           btnAddLink.Enabled:=false;
           qryWork.SQL.Text:='execute procedure add_link('+intToStr(cbElem.KeyValue)+','''+Elink.text+''','''+memLinkInfo.Text+''','''+main._login+''')';
           qryWork.Open;
//               refresh;
           cbElem.SetFocus;
{       qryLinkInfo_by_link.Close;
       qryLinkInfo_by_link.Open;}

      showmessage('Операция выполнена успешно! Ссылка была добавлена.');
      finally
       pnlInfo.Cursor:=crDefault;
       btnAddLink.Enabled:=true;
       Elink.SetFocus;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

       end;


end;

end.
