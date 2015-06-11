unit UnitCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, Menus,IBquery;

type
  TfrmCard = class(TForm)
    pnlMain: TPanel;
    gbElem: TGroupBox;
    gridInfo: TDBGrid;
    btnGetInfo: TBitBtn;
    btnImportCard: TBitBtn;
    edtElem_name: TEdit;
    Label2: TLabel;
    pmInfo: TPopupMenu;
    miRefresh: TMenuItem;
    N2: TMenuItem;
    miDel: TMenuItem;
    pnlRight: TPanel;
    btnClose: TBitBtn;
    miEdit: TMenuItem;
    procedure btnCloseClick(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure btnImportCardClick(Sender: TObject);
    procedure gridInfoDblClick(Sender: TObject);
    procedure SetElem_id(value:integer);
    procedure SetElem_name(value:string);
    procedure miRefreshClick(Sender: TObject);
    procedure miDelClick(Sender: TObject);
    function delete_Info(info_id:integer;var qry:TibQuery):boolean;
    procedure pmInfoPopup(Sender: TObject);
    procedure miEditClick(Sender: TObject);
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
  frmCard: TfrmCard;

implementation

uses dmo, unitAddinfo, unadd, UnitInfo, DB, unitAddElem;
{$R *.dfm}
procedure TfrmCard.SetElem_id(value:integer);
begin
 _elem_id:=value;
end;
procedure TfrmCard.SetElem_name(value:string);
begin
 _elem_name:=value;
 edtElem_name.Text:=_elem_name;
end;

procedure TfrmCard.btnCloseClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCard.btnGetInfoClick(Sender: TObject);
begin
  frmAddinfo.elem_id:=_elem_id;
  frmAddinfo.elem_name:=_elem_name;
  frmAddInfo.show;
end;

procedure TfrmCard.btnImportCardClick(Sender: TObject);
begin
 try
 try
  if _elem_name='' then
  begin
         showmessage('Необходимо выбрать элемент');
         exit;
  end;

    GridInfo.Cursor:=crHourGlass;
    btnImportCard.Enabled:=false;
    frmManeger.printCard(_elem_id);
//    frmManeger.btnAllConnect.Click;
   finally
       GridInfo.Cursor:=crDefault;
       btnImportCard.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmCard.gridInfoDblClick(Sender: TObject);
var
      elem_name,
      num_p_p,
      thedate,
      num_doc,
      from_whom,
      cost_for_one,
      arrival,
      charge,
      ostatok,
      id:string;
begin
  if gridInfo.SelectedField.Text ='' then exit;
with dm do
begin
   frmInfo.elem_name:=_elem_name;
   frmInfo.elem_id:=_elem_id;
   elem_name:=_elem_name;
   num_p_p:=qryInfo_by_elem.fieldByName('num_p_p').AsString;
   thedate:=DateToStr(qryInfo_by_elem.fieldByName('thedate').AsDateTime);
   num_doc:=qryInfo_by_elem.fieldByName('num_doc').AsString;
   from_whom:=qryInfo_by_elem.fieldByName('from_whom').AsString;
   cost_for_one:=floatToStr(qryInfo_by_elem.fieldByName('cost_for_one').AsFloat);
   arrival:=floatToStr(qryInfo_by_elem.fieldByName('arrival').AsFloat);
   charge:=floatToStr(qryInfo_by_elem.fieldByName('charge').AsFloat);
   ostatok:=floatToStr(qryInfo_by_elem.fieldByName('ostatok').AsFloat);
   id:=intToStr(qryInfo_by_elem.fieldByName('info_id').AsInteger);
   frmInfo.SetInfo(elem_name,num_p_p,thedate,num_doc,from_whom,cost_for_one,arrival,charge,ostatok,id);
   frmInfo.show;
end;
end;

procedure TfrmCard.miRefreshClick(Sender: TObject);
begin
with dm do
try
try
   GridInfo.Cursor:=crHourGlass;
   qryInfo_by_elem.Close;
   qryInfo_by_elem.Open;
   finally
       GridInfo.Cursor:=crDefault;
       btnImportCard.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;


end;
function TfrmCard.delete_Info(info_id:integer;var qry:TibQuery):boolean;
begin
   result:=false;
   if qry.Active then qry.Close;
   qry.ParamByName('info_id').AsInteger:=info_id;
   qry.ExecSQL;
   result:=true;
end;
procedure TfrmCard.miDelClick(Sender: TObject);
begin
with dm do
try
  try
  if gridInfo.SelectedField.Text ='' then exit;
    gridInfo.Cursor:=crHourGlass;
    btnGetInfo.Enabled:=false;
   if messageDlg('Вы уверены, что желаете удалить "информацию"?'+#13#10+'№ п/п = '+
      intToStr(qryInfo_by_elem.fieldByName('num_p_p').asInteger)
      ,mtConfirmation,[mbYes,MbNo],0) = mrno then exit;
    if delete_info(qryInfo_by_elem.fieldByName('info_id').asInteger,qryDelete_info) then
        showmessage('оперция выполнена успешно');
   finally
    gridInfo.Cursor:=crDefault;
    btnGetInfo.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;
end;

procedure TfrmCard.pmInfoPopup(Sender: TObject);
begin
  try
       miDel.Enabled:=gridInfo.SelectedField.Text<>'';
  except
  end;
end;

procedure TfrmCard.miEditClick(Sender: TObject);
begin
 gridInfo.OnDblClick(sender);
end;

end.
