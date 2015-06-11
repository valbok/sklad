unit UnitLinks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons;

type
  TfrmLink = class(TForm)
    pnlMain: TPanel;
    btnClose: TBitBtn;
    pnlBottom: TPanel;
    DBLinkNavigator: TDBNavigator;
    GroupBox1: TGroupBox;
    dbMemLinkInfo: TDBMemo;
    Label2: TLabel;
    dbEdtLink: TDBEdit;
    Label1: TLabel;
    dbedtUser: TDBEdit;
    Label3: TLabel;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLink: TfrmLink;

implementation
uses dmo;
{$R *.dfm}

procedure TfrmLink.btnCloseClick(Sender: TObject);
begin
  close;
end;

end.
