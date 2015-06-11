unit UnitAddZakaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,IbQuery;

type
  TfrmAddZakaz = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    edtfrom_Whom: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnAdd: TBitBtn;
    btnClose: TBitBtn;
    Bevel1: TBevel;
    edtfor_what: TEdit;
    edtTheDate: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    function add_zakaz(from_whom,for_what,thedate,user:string;var qry:TibQuery;var zakaz_id:integer):bool;
    procedure edtTheDateExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddZakaz: TfrmAddZakaz;

implementation
uses dmo,main, UnitFind;
{$R *.dfm}

procedure TfrmAddZakaz.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddZakaz.FormCreate(Sender: TObject);
begin
  edtThedate.Text:=dateToStr(date);
end;
function TfrmAddzakaz.add_zakaz(from_whom,for_what,thedate,user:string;var qry:TibQuery;var zakaz_id:integer):bool;
begin
   result:=false;
   qry.SQL.Text:='execute procedure add_zakaz('''+from_whom+''','''+for_what+''','''+thedate+''','''+user+''')';
   qry.ExecSQL;
   qry.Close;
   qry.SQL.Text:='select max(zakaz_id) from zakazi';
   qry.Open;
   zakaz_id:=qry.fieldByName('max').AsInteger;
   result:=true;
end;
procedure TfrmAddZakaz.btnAddClick(Sender: TObject);
var zakaz_id:integer;
begin
try
  try
   pnlMain.Cursor:=crHourGlass;
   btnAdd.Enabled:=false;
   if messageDlg('Вы уверены, что желаете создать заказ?',mtConfirmation,[mbYes,mbNo],0)=mrno then exit;

  if  add_zakaz(edtFrom_whom.Text,edtFor_what.Text,edtTheDate.Text,main._login,dm.qrywork,zakaz_id) then
    showmessage('Операция успешно завершена!');

//  showmessage('z='+intToStr(Zakaz_id));
//   frmFind.zakaz_id:=zakaz_id;
//   frmFind.zakaz_exists:=true;
//   frmFind.SetInfoZakaz(edtFrom_whom.Text,edtFor_what.Text,strToDate(edtTheDate.text));
  finally
      pnlMain.Cursor:=crDefault;
      btnAdd.Enabled:=true;
  end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;

procedure TfrmAddZakaz.edtTheDateExit(Sender: TObject);
const c: set of  char = ['0'..'9','.',','];
var i:integer;
s,s2:string;
begin
  for i:=1 to length(EdtThedate.Text) do
  begin
           if (EdtThedate.Text[i] in c) then
               begin
               if (EdtThedate.Text[i] =',')  then
                 begin  {if countKoma then}
                    S2:='.';   //else s2:='';

                  end else
                       s2:=EdtThedate.Text[i];

                   s:=s+s2;
                end;
    end;
  edtThedate.Text:=s;
end;

end.
