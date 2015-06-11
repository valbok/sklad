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
    dbedtElem: TDBEdit;
    lblElem: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddinCardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfo: TfrmInfo;

implementation
uses dmo, unitAddinfo;
{$R *.dfm}

procedure TfrmInfo.btnCloseClick(Sender: TObject);
begin
close;
end;

procedure TfrmInfo.btnAddinCardClick(Sender: TObject);
begin
  frmAddInfo.show;
end;

end.
