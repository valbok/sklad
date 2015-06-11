unit UnitCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, Grids, DBGrids;

type
  TfrmCard = class(TForm)
    pnlMain: TPanel;
    gbElem: TGroupBox;
    Label1: TLabel;
    lTypeElem: TLabel;
    Label4: TLabel;
    cbElem: TDBLookupComboBox;
    rbName: TRadioButton;
    rbNUMER: TRadioButton;
    CBElem_type_name: TDBLookupComboBox;
    cbComp: TDBLookupComboBox;
    gridInfo: TDBGrid;
    pnlBottom: TPanel;
    InfoNavigator: TDBNavigator;
    btnClose: TBitBtn;
    btnGetInfo: TBitBtn;
    btnImportCard: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure rbNameClick(Sender: TObject);
    procedure rbNUMERClick(Sender: TObject);
    procedure btnImportCardClick(Sender: TObject);
    procedure gridInfoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCard: TfrmCard;

implementation

uses dmo, unitAddinfo, unadd, UnitInfo;
{$R *.dfm}

procedure TfrmCard.btnCloseClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCard.btnGetInfoClick(Sender: TObject);
begin
  frmAddInfo.show;
end;

procedure TfrmCard.rbNameClick(Sender: TObject);
begin
   if rbName.Checked then
     cbElem.ListField:='NAME';

end;

procedure TfrmCard.rbNUMERClick(Sender: TObject);
begin
   if rbNumer.Checked then
     cbElem.ListField:='NUMER';

end;

procedure TfrmCard.btnImportCardClick(Sender: TObject);
begin
   try
   try
if CBElem.Text='' then
  begin
         showmessage('Заполните поле "Элемент"');
         exit;
  end;

    GridInfo.Cursor:=crHourGlass;
    btnImportCard.Enabled:=false;
    frmManeger.printCard(cbElem.KeyValue);
   finally
       GridInfo.Cursor:=crDefault;
       btnImportCard.Enabled:=true;       
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmCard.gridInfoDblClick(Sender: TObject);
begin
   frmInfo.show;
end;

end.
