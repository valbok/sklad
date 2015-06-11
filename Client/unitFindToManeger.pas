unit unitFindToManeger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmFindToManeger = class(TForm)
    pnlMain: TPanel;
    eValue: TEdit;
    Label1: TLabel;
    procedure eValueKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    existValue:boolean;
    value:string;
  end;

var
  frmFindToManeger: TfrmFindToManeger;

implementation

uses unadd;

{$R *.dfm}

procedure TfrmFindToManeger.eValueKeyPress(Sender: TObject; var Key: Char);
begin
if key =#27 then
 begin
  existvalue:=false;
  close;
 end else
if key =#13 then
begin
  value:=eValue.text;
  existValue:=true;
  close;
end;
end;

end.
