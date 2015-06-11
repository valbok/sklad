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
    btnClose: TBitBtn;
    dbedtUser: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    pnlBottom: TPanel;
    ElemNavigator: TDBNavigator;
    edtElem_name: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure SetElem_name(value:string);
    procedure SetElem_id(value:integer);
  private
    { Private declarations }
   _elem_name   :string;
   _elem_id     :integer;
  public
    { Public declarations }
  property elem_name: string read _elem_name write SetElem_name;
  property elem_id: integer read _elem_id write SetElem_id;
  end;

var
  frmDetali: TfrmDetali;

implementation
uses dmo, UnitAddDetali;
{$R *.dfm}
procedure TfrmDetali.SetElem_id(value:integer);
begin
 _elem_id:=value;
end;

procedure TfrmDetali.SetElem_name(value:string);
begin
 _elem_name:=value;
 edtElem_name.Text:=_elem_name;
end;

procedure TfrmDetali.btnCloseClick(Sender: TObject);
begin
Close;
end;

end.
