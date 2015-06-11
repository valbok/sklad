unit UnitZAkazi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus, DBCtrls,
  ekbasereport, ekrtf;

type
  TfrmZakazi = class(TForm)
    pnlMain: TPanel;
    pnlChildMain: TPanel;
    gridZakazi: TDBGrid;
    pmZakaz: TPopupMenu;
    DBNavigatorZakaz: TDBNavigator;
    mmZakaz: TMainMenu;
    miShowZakazi: TMenuItem;
    N1: TMenuItem;
    miDel: TMenuItem;
    miRefresh: TMenuItem;
    pnlTop: TPanel;
    sbBack: TSpeedButton;
    Label1: TLabel;
    lblTable: TLabel;
    pnlRight: TPanel;
    btnClose: TBitBtn;
    N2: TMenuItem;
    miImportToWord: TMenuItem;
    EkRTFZakaz: TEkRTF;
    procedure btnCloseClick(Sender: TObject);
    procedure miShowZakaziClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure gridZakaziTitleClick(Column: TColumn);
    procedure gridZakaziDblClick(Sender: TObject);
    procedure miDelClick(Sender: TObject);
    procedure miRefreshClick(Sender: TObject);
    procedure sbBackClick(Sender: TObject);
    procedure pmZakazPopup(Sender: TObject);
    procedure miImportToWordClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZakazi: TfrmZakazi;

implementation
uses dmo, unitRequests, unitSelectZAkaz;
{$R *.dfm}

procedure TfrmZakazi.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmZakazi.miShowZakaziClick(Sender: TObject);
begin
try
try
   gridZakazi.Cursor:=crHourGlass;
   miShowZakazi.Enabled:=false;
  with dm do
  begin
     cdsZakazi.IndexName:='';
     cdsZakazi.Open;
     tblZakazi.Open;

  end;
   finally
    gridZakazi.Cursor:=crDefault;
   miShowZakazi.Enabled:=true;    
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
   end;

end;

procedure TfrmZakazi.miCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmZakazi.gridZakaziTitleClick(Column: TColumn);
begin
//////
with dm do
 try
   try
       cdsZakazi.DeleteIndex(Column.FieldName+'indx');
    except
    end;
    cdsZakazi.AddIndex(Column.FieldName+'indx',Column.FieldName,[],'');
    cdsZakazi.IndexName:=Column.FieldName+'indx';

 except
//    Showmessage('Invalid TypeField');
 end;

end;

procedure TfrmZakazi.gridZakaziDblClick(Sender: TObject);
begin
try
 try
    gridZakazi.Cursor:=crHourGlass;
    if gridZakazi.SelectedField.Text='' then exit;
 with dm do
 begin
   if gridZakazi.DataSource=dsCdsZAkazi then
   begin
    tblRequests.MasterSource:=dsCdsZakazi;
   if not qryAllElements.Active then
      qryAllElements.Open;
    gridZakazi.DataSource:=dsRequests;
    tblRequests.Open;
   lblTable.Caption:='Требование';
   end else
   if gridZakazi.DataSource=dsRequests then
   begin
{     if gridZakazi.SelectedField.Text<>'' then
       frmRequests.show;}
   end;
 end;

  finally
      gridZakazi.Cursor:=crDefault;
  end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

procedure TfrmZakazi.miDelClick(Sender: TObject);
begin
 with dm do
 try
  try
    gridZakazi.Cursor:=crHourGlass;
    if   frmSelectZakaz.delete_zakaz(StrToInt(gridZakazi.SelectedField.text),qrywork) then
    showmessage('Операция выполнена.');
  finally
      gridZakazi.Cursor:=crDefault;
  end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;


end;

procedure TfrmZakazi.miRefreshClick(Sender: TObject);
begin
with dm do
begin
   if gridZakazi.DataSource=dsCdsZAkazi then
   begin
    CdsZAkazi.Refresh;
   end else
   if gridZakazi.DataSource=dsRequests then
     tblRequests.Refresh;
end;
end;

procedure TfrmZakazi.sbBackClick(Sender: TObject);
begin
try
  try
     sbBack.Enabled:=false;
    with dm do
    begin
    lblTable.Caption:='Заказы';
    if  gridZakazi.DataSource=dsRequests then begin
      gridZakazi.DataSource:=dscdsZakazi;
     end else
    end;
  finally
       sbBack.Enabled:=true;
       gridZakazi.Cursor:=crDefault;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

procedure TfrmZakazi.pmZakazPopup(Sender: TObject);
begin
with dm do
try
//  miEdit.Enabled:=gridZakazi.SelectedField.Text<>'';


  miDel.Enabled:=(gridZakazi.SelectedField.Text<>'');
  miDel.Enabled:=(gridZakazi.DataSource<>dsRequests);
  miImportToWord.Enabled:=(gridZakazi.DataSource<>dsRequests);
//   (gridZakazi.DataSource=dm.dscdsZakazi);
//  miDel.enabled:=gridZakazi.DataSource=dm.dscdsZakazi;
except
end;

end;

procedure TfrmZakazi.miImportToWordClick(Sender: TObject);
begin
try
 try
with dm do
 begin
    if gridZakazi.SelectedField.Text='' then exit;
    if qryCardZakaz.Active then qryCardZakaz.Close;
      miShowZakazi.Enabled:=false;
      gridZakazi.Cursor:=crHourGlass;
      qryCardZakaz.ParamByName('zakaz_id').AsInteger:=cdsZakazi.fieldByNAME('zakaz_id').AsInteger;
//      showmessage(intToStr(cdsZakazi.fieldByNAME('zakaz_id').AsInteger));
      qryCardZakaz.Open;
      With EKRTFzakaz do
        Begin
          try
            OutFile:=CreateFileName('','reports\tmp\zakaz');
          except
            showmessage('Ошибка при создании файла: \reports\tmp\zakaz');
          end;
         ExecuteOpen([qryCardZakaz],SW_SHOW);
        End;
 end;
  finally
       miShowZakazi.Enabled:=true;
       gridZakazi.Cursor:=crDefault;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

procedure TfrmZakazi.miDeleteClick(Sender: TObject);
begin
  miDel.Click;
end;

procedure TfrmZakazi.N1Click(Sender: TObject);
var pt: TPoint;
begin
try
  GetCursorPos(pt);
  gridZakazi.PopupMenu.AutoPopup:=true;
  gridZakazi.PopupMenu.Popup(pt.x,pt.y);
  gridZakazi.PopupMenu.AutoPopup:=true;
except
end;

end;

end.
