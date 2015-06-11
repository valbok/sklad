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
    lFrom_Whom: TLabel;
    EFrom_Whom: TEdit;
    EDate: TEdit;
    lDate: TLabel;
    lNum_doc: TLabel;
    ENum_doc: TEdit;
    btnAddInfo: TBitBtn;
    sbSrez: TSpeedButton;
    btnClose: TBitBtn;
    btnCard: TBitBtn;
    edtElem_name: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EDateExit(Sender: TObject);
    procedure btnAddInfoClick(Sender: TObject);
    procedure sbSrezClick(Sender: TObject);
    procedure btnCardClick(Sender: TObject);
    procedure ECost_For_OneExit(Sender: TObject);
    procedure SetElem_id(value:integer);
    procedure SetElem_name(value:string);

  private
    { Private declarations }
   _elem_id     :integer;
   _elem_name   :string;
  public

  property elem_id: integer read _elem_id write SetElem_id;
  property elem_name: string read _elem_name write SetElem_name;
  { Public declarations }
  end;
var
  frmAddinfo: TfrmAddinfo;

implementation

uses Dmo,main, UnitCard;

{$R *.dfm}
procedure TfrmAddInfo.SetElem_id(value:integer);
begin
 _elem_id:=value;
end;
procedure TfrmAddInfo.SetElem_name(value:string);
begin
 _elem_name:=value;
 edtElem_name.Text:=_elem_name;
end;

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

function add_info(elem_id:integer;elem_name,earrival,echarge,ecost_for_one,efrom_whom,edate,enum_doc,user:string;var qry:TibQuery):boolean;
var tmpstr:string;
arrival,charge,cost:string;
begin
if messageDlg('�� �������, ��� ������� �������� ������ �� ����������: '+#13#10+
                '�������: '+elem_name+#13#10+
                '������: '+earrival+#13#10+
                '������: '+echarge+#13#10+
                '���� �� �������: '+ecost_for_one+#13#10+
                '�� ����: '+efrom_whom+#13#10+
                '����: '+edate+#13#10+
                '� ���������: '+enum_doc,mtconfirmation,[mbyes,mbNo],0)=mrNo then exit;
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
     if (_Elem_name ='') then
       begin
          messageDlg('���������� ������� "�������"...',mtInformation,[MbOk],0);
          exit;
         end;
    with dm do
    begin
     try
        try
          gbMain.Cursor:=crHourGlass;
          btnAddInfo.Enabled:=false;
         if  add_info(_elem_id,_elem_name,earrival.Text,echarge.Text,ecost_for_one.Text,efrom_whom.Text,edate.Text,enum_doc.Text,main._login,qryWork) then
            showmessage('�������� ��������� �������.');
          tblInfo.Refresh;
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
      if messageDlg('�� �������? ��������� ���� �������� �������� '''+Elem_name+''' ?',mtConfirmation,[mbYes,MbNo],0)=mrYes then
        begin
           qry.SQL.Text:='execute procedure add_srez('+intToStr(elem_id)+','''+DateToStr(date)+''','''+user+''')';
           qry.Open;
           showmessage('���� �� '+#13#10+'����: '+dateToStr(date)+#13#10+'�����: '+timeToStr(time)+#13#10+'��������');
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
        if   _elem_name = '' then showmessage('�������� "�������"') else
         with dm do
          begin
                add_srez(_elem_id,_elem_name,main._login,qryWork);
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
 frmCard.elem_id:=_elem_id;
 frmCard.elem_name:=_elem_name; 
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
