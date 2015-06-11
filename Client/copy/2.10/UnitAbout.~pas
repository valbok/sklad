unit UnitAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmAbout = class(TForm)
    pnlMain: TPanel;
    pnlMain2: TPanel;
    memInfo: TMemo;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Image1: TImage;
    lblVEr: TLabel;
    eMyEmail: TEdit;
    procedure pnlMain2Click(Sender: TObject);
    procedure memInfoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

uses main;

{$R *.dfm}

procedure TfrmAbout.pnlMain2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbout.memInfoDblClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
   lblVer.caption:=main.ver;
end;

end.
