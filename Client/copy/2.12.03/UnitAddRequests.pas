unit UnitAddRequests;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,ibquery;

type
  TfrmAddRequests = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    eName: TEdit;
    eCol: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    eZakaz_id: TEdit;
    Bevel1: TBevel;
    btnClose: TBitBtn;
    btnAddRequests: TBitBtn;
    btnShowZakaz: TBitBtn;
    EElement_id: TEdit;
    Label4: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnShowZakazClick(Sender: TObject);
    procedure btnAddRequestsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure setZakazInfo(zakaz_id,element_id:integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddRequests: TfrmAddRequests;

implementation

uses unitRequests, UnitFind,main, Dmo, unitSelectZAkaz, unadd;

{$R *.dfm}
procedure TfrmAddrequests.setZakazInfo(zakaz_id,element_id:integer);
begin
  eZakaz_id.Text:=intToStr(zakaz_id);
  EElement_id.Text:=intToStr(Element_id);  
end;
procedure TfrmAddRequests.btnCloseClick(Sender: TObject);
begin
Close;
end;

procedure TfrmAddRequests.btnShowZakazClick(Sender: TObject);
begin
  frmSelectZakaz.show;
end;
function add_request(zakaz_id,element_id:integer;name:string; col:real;user:string;var qry: tibquery): bool;
begin
 result:=false;
  if qry.Active then qry.Close;
  qry.ParamByName('zakaz_id').AsInteger:=zakaz_id;
  qry.ParamByName('element_id').AsInteger:=element_id;
  qry.ParamByName('name').AsString:=name;
  qry.ParamByName('col').AsFloat:=col;
  qry.ParamByName('user').AsString:=user;
//  qry.SQL.Text:='execute procedure ADD_request('+intToStr(zakaz_id)+','+intToStr(element_id)+','''+name+''','+floatToStr(col)+','''+user+''')';
  qry.ExecSQL;
  result:=true;
end;
procedure TfrmAddRequests.btnAddRequestsClick(Sender: TObject);
var col:real;
begin
try
 try
    btnAddRequests.Enabled:=false;
    pnlMain.Cursor:=crHourGlass;
    col:=StrToFloat(frmManeger.ZamenaDotNaKoma(ecol.text));

    if  add_request(StrToInt(ezakaz_id.text),strToInt(eElement_id.Text),ename.text,col,main._login,dm.qryaddrequest) then
        showmessage('Операция выполена успешно');
   finally
     btnAddRequests.Enabled:=true;
     pnlMain.Cursor:=crDefault;
    end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

procedure TfrmAddRequests.FormActivate(Sender: TObject);
begin
  ecol.SetFocus;
end;

end.
