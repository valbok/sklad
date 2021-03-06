unit UnitInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons;

type
  TfrmInfo = class(TForm)
    Panel1: TPanel;
    gbCard: TGroupBox;
    pnlBottom: TPanel;
    DBLinkNavigator: TDBNavigator;
    dbedtArrival: TDBEdit;
    dbedtCharge: TDBEdit;
    dbedtNum_doc: TDBEdit;
    dbedtFrom_whom: TDBEdit;
    dbedtCost_for_one: TDBEdit;
    dbedtNum_p_p: TDBEdit;
    dbedtOstatok: TDBEdit;
    dbedtThedate: TDBEdit;
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
    edtElem_name: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddinCardClick(Sender: TObject);
    procedure SetElem_name(value:string);
    procedure SetElem_id(value:integer);
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
uses dmo, unitAddinfo;
{$R *.dfm}
procedure Tfrminfo.SetElem_id(value:integer);
begin
 _elem_id:=value;
end;

procedure TfrmInfo.SetElem_name(value:string);
begin
 _elem_name:=value;
 edtElem_name.Text:=_elem_name;
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

end.
