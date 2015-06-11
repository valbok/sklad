unit unitPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmPass = class(TForm)
    pnlMain: TPanel;
    cdLogin: TComboBox;
    lblLogin: TLabel;
    ePassword: TEdit;
    lblPassword: TLabel;
    btnEnter: TBitBtn;
    btnCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPass: TfrmPass;

implementation

{$R *.dfm}

end.
