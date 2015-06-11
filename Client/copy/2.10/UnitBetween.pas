unit UnitBetween;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmBetween = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    edtOt: TEdit;
    Label2: TLabel;
    edtDo: TEdit;
    rbText: TRadioButton;
    rbNumber: TRadioButton;
    btnClose: TBitBtn;
    btnSelect: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBetween: TfrmBetween;

implementation

uses UnitCreateWhere;

{$R *.dfm}

procedure TfrmBetween.btnCloseClick(Sender: TObject);
begin
Close;
end;

procedure TfrmBetween.btnSelectClick(Sender: TObject);
var q:string;
begin
if rbText.Checked then
   q:='''' else
       if rbNumber.Checked then
            q:='';
            
    frmCreateWhere.setValue('between '+q+edtot.Text+q+' and '+q+edtDo.Text+q);
close;
end;

procedure TfrmBetween.FormActivate(Sender: TObject);
begin
  edtOt.SelectAll;
  edtOt.SetFocus
end;

end.
