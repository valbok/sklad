unit UnitCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, Grids, DBGrids;

type
  TfrmCard = class(TForm)
    pnlMain: TPanel;
    gbElem: TGroupBox;
    gridInfo: TDBGrid;
    pnlBottom: TPanel;
    InfoNavigator: TDBNavigator;
    btnClose: TBitBtn;
    btnGetInfo: TBitBtn;
    btnImportCard: TBitBtn;
    edtElem_name: TEdit;
    Label2: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure btnImportCardClick(Sender: TObject);
    procedure gridInfoDblClick(Sender: TObject);
    procedure SetElem_id(value:integer);
    procedure SetElem_name(value:string);
  private
    { Private declarations }
   _elem_id     :integer;
   _elem_name   :string;
  public

  property elem_id: integer read _elem_id write SetElem_id;
  property elem_name: string read _elem_name write SetElem_name;
  { Public declarations }
  end;

var
  frmCard: TfrmCard;

implementation

uses dmo, unitAddinfo, unadd, UnitInfo;
{$R *.dfm}
procedure TfrmCard.SetElem_id(value:integer);
begin
 _elem_id:=value;
end;
procedure TfrmCard.SetElem_name(value:string);
begin
 _elem_name:=value;
 edtElem_name.Text:=_elem_name;
end;

procedure TfrmCard.btnCloseClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCard.btnGetInfoClick(Sender: TObject);
begin
  frmAddinfo.elem_id:=_elem_id;
  frmAddinfo.elem_name:=_elem_name;  
  frmAddInfo.show;
end;

procedure TfrmCard.btnImportCardClick(Sender: TObject);
begin
 try
 try
if _elem_name='' then
  begin
         showmessage('Необходимо выбрать элемент');
         exit;
  end;

    GridInfo.Cursor:=crHourGlass;
    btnImportCard.Enabled:=false;
    frmManeger.printCard(_elem_id);
    frmManeger.btnAllConnect.Click;
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
  if gridInfo.SelectedField.Text ='' then exit;
   frmInfo.elem_name:=_elem_name;
   frmInfo.elem_id:=_elem_id;   
   frmInfo.show;
end;

end.
