unit unitDetali;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmDetali = class(TForm)
    pnlMain: TPanel;
    gbCharakter: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbEdtType: TDBEdit;
    dbedtResistance: TDBEdit;
    dbedtDopusk: TDBEdit;
    dbedtTKS: TDBEdit;
    btnAddCharacter: TBitBtn;
    btnClose: TBitBtn;
    dbedtUser: TDBEdit;
    dbedtElem_Name: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddCharacterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetali: TfrmDetali;

implementation
uses dmo, UnitAddDetali;
{$R *.dfm}

procedure TfrmDetali.btnCloseClick(Sender: TObject);
begin
Close;
end;

procedure TfrmDetali.btnAddCharacterClick(Sender: TObject);
begin
frmAddDetali.show;
end;

end.
