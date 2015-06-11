unit UnitInputValue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmInputValue = class(TForm)
    pnlMain: TPanel;
    btnEnter: TBitBtn;
    rbText: TRadioButton;
    rbNumber: TRadioButton;
    edtValue: TEdit;
    Label1: TLabel;
    procedure btnEnterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputValue: TfrmInputValue;

implementation

uses UnitCreateWhere;

{$R *.dfm}

procedure TfrmInputValue.btnEnterClick(Sender: TObject);
var q:string;
begin
if rbText.Checked then
   q:='''' else
       if rbNumber.Checked then
            q:='';
    frmCreateWhere.setValue(q+edtValue.Text+q);
close;
end;

procedure TfrmInputValue.FormActivate(Sender: TObject);
begin
edtValue.SelectAll;
edtValue.SetFocus;
end;

procedure TfrmInputValue.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
if key =#27 then close;
end;

end.
