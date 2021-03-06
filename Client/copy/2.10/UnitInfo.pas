unit UnitInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons;

type
  TfrmInfo = class(TForm)
    pnlMain: TPanel;
    gbCard: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Bevel: TBevel;
    btnClose: TBitBtn;
    btnAddinCard: TBitBtn;
    lblElem: TLabel;
    eElem_name: TEdit;
    eNum_p_p: TEdit;
    eThedate: TEdit;
    eNum_doc: TEdit;
    eFrom_whom: TEdit;
    eCost_for_one: TEdit;
    eArrival: TEdit;
    eCharge: TEdit;
    eOstatok: TEdit;
    btnSave: TBitBtn;
    Label2: TLabel;
    eid: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddinCardClick(Sender: TObject);
    procedure SetElem_name(value:string);
    procedure SetElem_id(value:integer);
    procedure btnSaveClick(Sender: TObject);
    procedure eCost_for_oneExit(Sender: TObject);
    procedure SetInfo(elem_name,num_p_p,thedate,num_doc,from_whom,cost_for_one,arrival,charge,ostatok,id:string);
  private
    { Private declarations }
   _elem_name   :string;
   _elem_id     :integer;
  public
    { Public declarations }
  property elem_id: integer read _elem_id write SetElem_id;
  property elem_name: string read _elem_name write SetElem_name;
  end;

var
  frmInfo: TfrmInfo;

implementation
uses dmo, unitAddinfo, unadd;
{$R *.dfm}
procedure Tfrminfo.SetElem_id(value:integer);
begin
 _elem_id:=value;
end;

procedure TfrmInfo.SetElem_name(value:string);
begin
 _elem_name:=value;
 eElem_name.Text:=_elem_name;
end;
procedure TfrmInfo.SetInfo(elem_name,num_p_p,thedate,num_doc,from_whom,cost_for_one,arrival,charge,ostatok,id:string);
begin
  eElem_name.Text:=elem_name;
  eThedate.Text:=thedate;
  eNum_p_p.Text:=num_p_p;
  eNum_doc.Text:=num_doc;
  eFrom_whom.Text:=from_whom;
  eCost_for_one.Text:=cost_for_one;
  eArrival.Text:=arrival;
  eCharge.Text:=charge;
  eOstatok.Text:=ostatok;
  eid.Text:=id;
end;
procedure TfrmInfo.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmInfo.btnAddinCardClick(Sender: TObject);
begin
  frmAddInfo.elem_id:=_elem_id;
  frmAddInfo.elem_name:=_elem_name;  
  frmAddInfo.show;
end;

procedure TfrmInfo.btnSaveClick(Sender: TObject);
var cost:string;
begin
with dm do
try
 try
    pnlMain.Cursor:=crHourGlass;
    btnSave.Enabled:=false;
    if qryUpdateInfo.Active then qryUpdateInfo.close;
    with qryUpdateinfo do
    begin
      ParamByName('info_id').AsInteger:=StrToInt(eid.text);
      ParamByName('thedate').Asstring:=eThedate.text;
      ParamByName('Num_doc').Asstring:=eNum_doc.text;
      ParamByName('from_whom').Asstring:=efrom_whom.text;
      cost:=eCost_for_one.text;
//      cost:=frmManeger.ZamenaDotNakoma(cost);
      ParamByName('cost_for_one').AsFloat:=strToFloat(cost);
      ExecSQL;
    end;
    showmessage('�������� ��������� �������');
   finally
   pnlMain.Cursor:=crDefault;
   btnSave.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;


end;

procedure TfrmInfo.eCost_for_oneExit(Sender: TObject);
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
