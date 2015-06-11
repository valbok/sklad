unit unitComp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Mask, Buttons;

type
  TfrmComp = class(TForm)
    pnlMain: TPanel;
    pnlBottom: TPanel;
    CompNavigator: TDBNavigator;
    gbComp: TGroupBox;
    Label1: TLabel;
    dbEdtName: TDBEdit;
    btnDelete: TBitBtn;
    dbedtID: TDBEdit;
    lblid: TLabel;
    btnClose: TBitBtn;
    dbedtUser: TDBEdit;
    Label2: TLabel;
    btnAdd: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComp: TfrmComp;

implementation
uses dmo,main, UnitAddComp;
{$R *.dfm}

procedure TfrmComp.btnCloseClick(Sender: TObject);
begin
Close;
end;


procedure TfrmComp.btnAddClick(Sender: TObject);
begin
  frmAddComp.show;
end;

procedure TfrmComp.btnDeleteClick(Sender: TObject);
begin
try
  try
    btnDelete.Enabled:=false;
    gbComp.Cursor:=crHourGlass;
   if  frmAddComp.DElete_Component(dbedtName.text,dm.qryWork) then
      dm.tblComp.Refresh;
  finally
       btnDelete.Enabled:=true;
       gbComp.Cursor:=crDefault;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

end.
