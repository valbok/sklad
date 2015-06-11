unit UnitEditZakaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmEditZakaz = class(TForm)
    pnlMain: TPanel;
    pnlunderMain: TPanel;
    pnlBottom: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    RequestsNavigator: TDBNavigator;
    dbedtFor_what: TDBEdit;
    dbedtFrom_whom: TDBEdit;
    dbedtTheDate: TDBEdit;
    btnClose: TBitBtn;
    Label2: TLabel;
    dbedtId: TDBEdit;
    Label4: TLabel;
    dbedtuser: TDBEdit;
    Label5: TLabel;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditZakaz: TfrmEditZakaz;

implementation
uses dmo;
{$R *.dfm}

procedure TfrmEditZakaz.btnCloseClick(Sender: TObject);
begin
close;
end;

end.
