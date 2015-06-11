unit unitTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ExtCtrls, StdCtrls, Mask, Buttons;

type
  TfrmTypes = class(TForm)
    pnlMain: TPanel;
    pnlBottom: TPanel;
    TypesNavigator: TDBNavigator;
    gbType: TGroupBox;
    dbEdtName: TDBEdit;
    Label1: TLabel;
    dbEdtCOmp_id: TDBEdit;
    cbComp: TDBLookupComboBox;
    dbEdtComp_name: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbedtId: TDBEdit;
    lblid: TLabel;
    btnClose: TBitBtn;
    btnDeleteType: TBitBtn;
    Label4: TLabel;
    dbedtUser: TDBEdit;
    btnAdd: TBitBtn;
    procedure cbCompClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTypes: TfrmTypes;

implementation
uses dmo, unitAddType;
{$R *.dfm}

procedure TfrmTypes.cbCompClick(Sender: TObject);
begin
  TypesNavigator.BtnClick(nbEdit);
  dbEdtCOmp_id.Text:=intToStr(cbComp.KeyValue);
end;

procedure TfrmTypes.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTypes.btnAddClick(Sender: TObject);
begin
  frmAddType.show;
end;

procedure TfrmTypes.btnDeleteTypeClick(Sender: TObject);
begin
try
 try
  gbType.Cursor:=crHourGlass;
  btnDeleteType.Enabled:=false;
if  frmAddType.delete_type(dbEdtName.text, strToInt(dbedtID.Text),dm.qryWork) then
   dm.tblTyp.Refresh;
   finally
    gbType.Cursor:=crDefault;
    btnDeleteType.Enabled:=true;
   end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

end.
