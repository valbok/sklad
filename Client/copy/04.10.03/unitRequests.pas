unit unitRequests;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, Mask;

type
  TfrmRequests = class(TForm)
    pnlMain: TPanel;
    pnlunderMain: TPanel;
    pnlBottom: TPanel;
    Panel1: TPanel;
    RequestsNavigator: TDBNavigator;
    dbedtName: TDBEdit;
    dbedtCol: TDBEdit;
    dbedtId: TDBEdit;
    dbedtElem_name: TDBEdit;
    btnClose: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbedtElem_id: TDBEdit;
    Label5: TLabel;
    procedure btnCloseClick(Sender: TObject);
//    procedure SetInfoZakaz(zakaz_id:integer;from_whom,for_what,thedate:string);
    procedure btnSelectZakazClick(Sender: TObject);
    procedure btnOpenZakazClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRequests: TfrmRequests;

implementation
uses dmo, unitSelectZAkaz;
{$R *.dfm}
{procedure TfrmRequests.SetInfoZakaz(zakaz_id:integer;from_whom,for_what,thedate:string);
begin
//  eZakaz_id.Text:=intToStr(zakaz_id);
{  eFrom_whom.Text:=from_whom;
  eFor_what.Text:=for_what;
  ethedate.Text:=thedate;
end;}
procedure TfrmRequests.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRequests.btnSelectZakazClick(Sender: TObject);
begin
  FrmSelectZakaz.show;
end;

procedure TfrmRequests.btnOpenZakazClick(Sender: TObject);
begin
 {try
   try
       gridRequests.Cursor:=crHourGlass;
       btnOpenZakaz.Enabled:=false;
       with dm do
       begin
         if not tblRequests.Active then
            tblRequests.Open;
       end;

   finally
       gridRequests.Cursor:=crDefault;
       btnOpenZAkaz.Enabled:=true;
    end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
}
end;

end.
