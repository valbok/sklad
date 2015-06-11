unit UnitZAkazi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus, DBCtrls,
  ekbasereport, ekrtf, ComCtrls;

type
  TfrmZakazi = class(TForm)
    pnlMain: TPanel;
    pnlChildMain: TPanel;
    gridZakazi: TDBGrid;
    pmZakaz: TPopupMenu;
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
    Anim: TAnimate;
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
    procedure gridZakaziKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZakazi: TfrmZakazi;

implementation
uses dmo, unitRequests, unitSelectZAkaz, DB, unadd;
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
   try
    Anim.FileName:=s;
    anim.Active:=true;
   except
   end;

  with dm do
  begin
     cdsZakazi.IndexName:='';
     cdsZakazi.Open;
//     tblZakazi.Open;}

  end;
   finally
    gridZakazi.Cursor:=crDefault;
    miShowZakazi.Enabled:=true;
    Anim.Active:=false;
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

with dm do
if gridZakazi.DataSource=dsCdsZAkazi then
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
   try
    Anim.FileName:=unAdd.s;
    anim.Active:=true;
   except
   end;

 with dm do
 begin
   if gridZakazi.DataSource=dsCdsZAkazi then
   begin
{   if not qryAllElements.Active then
      qryAllElements.open;}
//      qryAllElements.ParamByName('element_id').AsInteger:=qryRequests_by_zakaz.fieldByName('element_id').AsInteger;

   if QryRequests_by_zakaz.Active then QryRequests_by_zakaz.Close;
    gridZakazi.DataSource:=dsQryRequests_by_zakaz;
    qryRequests_by_zakaz.ParamByName('zakaz_id').AsInteger:=cdsZakazi.fieldByName('zakaz_id').AsInteger;
    QryRequests_by_zakaz.Open;

   lblTable.Caption:='Требования';
   end else
   if gridZakazi.DataSource=dsQryRequests_by_zakaz then
   begin
{     if gridZakazi.SelectedField.Text='' then exit;
       frmRequests.setRequestInfo(qryRequests_by_zakaz.fieldByName('name').AsString,
                                  floatToStr(qryRequests_by_zakaz.fieldByName('col').AsFloat),
                                  intToStr(qryRequests_by_zakaz.fieldByName('request_id').Asinteger),
                                  qryRequests_by_zakaz.fieldByName('luElem_name').AsString,
                                  intToStr(qryRequests_by_zakaz.fieldByName('element_id').Asinteger)
                                );
       frmRequests.show;          }
   end;
 end;

  finally
      gridZakazi.Cursor:=crDefault;
      anim.Active:=false;
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
   if messageDlg('Вы уверены, что желаете удалить Заказ?'+#13#10+
        '№: "'+intToStr(cdsZakazi.fieldByName('zakaz_id').asinteger)+'"'+#13#10+
        'От кого: "'+cdsZakazi.fieldByName('from_whom').asstring+'"'+#13#10+
        'Для какой цели: "'+cdsZakazi.fieldByName('for_what').asString+'"'+#13#10+
        'Дата: "'+dateToStr(cdsZakazi.fieldByName('thedate').asdateTime)+'"'+#13#10+
        'При этом удаляться все записи из других таблиц связаные с этим заказом!',mtConfirmation,[mbYes,MbNo],0) = mrno then exit;

    if   frmSelectZakaz.delete_zakaz(cdsZakazi.fieldByName('zakaz_id').AsInteger,qrydeleteZakaz) then
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
    cdsZakazi.IndexName:='';
    CdsZAkazi.close;
    cdsZakazi.Open;
   end else
   if gridZakazi.DataSource=dsQryRequests_by_zakaz then
   begin
     QryRequests_by_zakaz.close;
     QryRequests_by_zakaz.Open
   end;
end;
end;

procedure TfrmZakazi.sbBackClick(Sender: TObject);
begin
try
  try
     sbBack.Enabled:=false;
   try
    Anim.FileName:=s;
    anim.Active:=true;
   except
   end;

    with dm do
    begin
    lblTable.Caption:='Заказы';
    if  gridZakazi.DataSource=dsQryRequests_by_zakaz then begin
      gridZakazi.DataSource:=dscdsZakazi;
     end;
    end;
  finally
       sbBack.Enabled:=true;
       gridZakazi.Cursor:=crDefault;
       anim.Active:=false;
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

  miImportToWord.Enabled:=(gridZakazi.DataSource<>dsQryRequests_by_zakaz) and (gridZakazi.SelectedField.Text<>'');

  miDel.Enabled:=(gridZakazi.DataSource<>dsQryRequests_by_zakaz) and (gridZakazi.SelectedField.Text<>'');
//  miDel.Enabled:=(gridZakazi.SelectedField.Text<>'');

//  miImportToWord.Enabled:=(gridZakazi.SelectedField.Text<>'');

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

procedure TfrmZakazi.gridZakaziKeyPress(Sender: TObject; var Key: Char);
begin
if key =char(#13) then
     gridZakazi.OnDblClick(sender);
if key =char(#8) then
     sbBack.Click;
end;

end.
