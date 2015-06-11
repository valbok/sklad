unit unitAddinfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, IBQuery,
  Dialogs, ExtCtrls, Buttons, StdCtrls, DBCtrls;

type
  TfrmAddinfo = class(TForm)
    pnlmain: TPanel;
    gbMain: TGroupBox;
    gbArrivalCharge: TGroupBox;
    lArrival: TLabel;
    lCharge: TLabel;
    Label7: TLabel;
    ECharge: TEdit;
    EArrival: TEdit;
    ECost_For_One: TEdit;
    gbElem: TGroupBox;
    cbElem: TDBLookupComboBox;
    rbName: TRadioButton;
    rbNUMER: TRadioButton;
    lFrom_Whom: TLabel;
    EFrom_Whom: TEdit;
    EDate: TEdit;
    lDate: TLabel;
    lNum_doc: TLabel;
    ENum_doc: TEdit;
    btnAddInfo: TBitBtn;
    sbSrez: TSpeedButton;
    Label1: TLabel;
    CBElem_type_name: TDBLookupComboBox;
    lTypeElem: TLabel;
    cbComp: TDBLookupComboBox;
    Label4: TLabel;
    btnClose: TBitBtn;
    btnCard: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EDateExit(Sender: TObject);
    procedure rbNameClick(Sender: TObject);
    procedure rbNUMERClick(Sender: TObject);
    procedure btnAddInfoClick(Sender: TObject);
    procedure sbSrezClick(Sender: TObject);
    procedure btnCardClick(Sender: TObject);
    procedure ECost_For_OneExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddinfo: TfrmAddinfo;

implementation

uses Dmo,main, UnitCard;

{$R *.dfm}

procedure TfrmAddinfo.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddinfo.FormCreate(Sender: TObject);
begin
    EDate.Text:=dateTostr(date);
end;

procedure TfrmAddinfo.EDateExit(Sender: TObject);
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

procedure TfrmAddinfo.rbNameClick(Sender: TObject);
begin
   if rbName.Checked then
     cbElem.ListField:='NAME';

end;

procedure TfrmAddinfo.rbNUMERClick(Sender: TObject);
begin
   if rbNumer.Checked then
     cbElem.ListField:='NUMER';
end;

function add_info(elem_id:integer;elem_name,earrival,echarge,ecost_for_one,efrom_whom,edate,enum_doc,user:string;var qry:TibQuery):boolean;
var tmpstr:string;
arrival,charge,cost:string;
begin
if messageDlg('Вы уверены, что желаете добавить запись со значениями: '+#13#10+
                'Элемент: '+elem_name+#13#10+
                'Приход: '+earrival+#13#10+
                'Расход: '+echarge+#13#10+
                'Цена за единицу: '+ecost_for_one+#13#10+
                'От кого: '+efrom_whom+#13#10+
                'Дата: '+edate+#13#10+
                '№ документа: '+enum_doc,mtconfirmation,[mbyes,mbNo],0)=mrNo then exit;
      try
        try
           tmpStr:=qry.SQL.Text;
           result:=false;
           if EArrival <> '' then arrival :=EArrival else arrival:='0';
           if ECharge <> '' then charge :=Echarge else charge:='0';
           if ECost_for_one <> '' then cost :=Ecost_for_one else cost:='0';
           qry.SQL.Text:='execute procedure add_info('''+Edate+''','''+Enum_doc+''','''+(EFrom_Whom)+''','+cost+','+Arrival+','+Charge+','+intToStr(elem_id)+','''+user+''')';
           qry.Open;
           qry.SQL.Text:=tmpStr;
                result:=true;
      finally
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;
procedure TfrmAddinfo.btnAddInfoClick(Sender: TObject);

var tmpstr:string;
arrival,charge,cost:string;
begin
     if (cbElem.Text ='') then
       begin
          messageDlg('Необходимо заполнить поле "Элемент"...',mtInformation,[MbOk],0);
          exit;
         end;
    with dm do
    begin
     try
        try
          gbMain.Cursor:=crHourGlass;
          btnAddInfo.Enabled:=false;
         if  add_info(cbElem.KeyValue,cbElem.Text,earrival.Text,echarge.Text,ecost_for_one.Text,efrom_whom.Text,edate.Text,enum_doc.Text,main._login,qryWork) then
            showmessage('Операция выполнена успешно.');
          tblInfo.Refresh;
          cbElem.SetFocus;          
      finally
       gbMain.Cursor:=crDefault;
       btnAddInfo.Enabled:=true;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;

end;
procedure add_srez(elem_id:integer;elem_name:string;user:string;var qry:TIbQuery);
begin
   try
     try
      if messageDlg('Вы уверены? Выполнить срез остатков елемента '''+Elem_name+''' ?',mtConfirmation,[mbYes,MbNo],0)=mrYes then
        begin
           qry.SQL.Text:='execute procedure add_srez('+intToStr(elem_id)+','''+DateToStr(date)+''','''+user+''')';
           qry.Open;
           showmessage('Срез на '+#13#10+'Дата: '+dateToStr(date)+#13#10+'Время: '+timeToStr(time)+#13#10+'Выполнен');
        end;
        finally
        end;
        except
          on E:Exception do
          showmessage(e.Message);
        end;
end;
procedure TfrmAddinfo.sbSrezClick(Sender: TObject);
begin
   try
      try
        if   cbElem.Text = '' then showmessage('Заполните поле "Элемент"') else
         with dm do
          begin
                add_srez(Cbelem.KeyValue,cbElem.Text,main._login,qryWork);
          end;
        finally
        end;
        except
          on E:Exception do
          showmessage(e.Message);
        end;
end;

procedure TfrmAddinfo.btnCardClick(Sender: TObject);
begin
 frmCard.show;
end;

procedure TfrmAddinfo.ECost_For_OneExit(Sender: TObject);
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

end.
