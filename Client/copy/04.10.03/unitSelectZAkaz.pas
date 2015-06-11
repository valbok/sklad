unit unitSelectZAkaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,Ibquery, Menus;

type
  TfrmSelectZakaz = class(TForm)
    pnlMain: TPanel;
    gridZakazi: TDBGrid;
    pnlTop: TPanel;
    Label1: TLabel;
    lblUser: TLabel;
    pnlRight: TPanel;
    btnClose: TBitBtn;
    btnShowZakazi: TBitBtn;
    Label2: TLabel;
    lblTable: TLabel;
    pmZakazi: TPopupMenu;
    miAddZakaz: TMenuItem;
    miEdit: TMenuItem;
    miRefresh: TMenuItem;
    miCurrent: TMenuItem;
    N1: TMenuItem;
    miDelete: TMenuItem;
    procedure btnShowZakaziClick(Sender: TObject);
    procedure setUser_name(value:string);
    procedure btnCloseClick(Sender: TObject);
    procedure gridZakaziDblClick(Sender: TObject);
    procedure miAddZakazClick(Sender: TObject);
    procedure miEditClick(Sender: TObject);
    procedure miRefreshClick(Sender: TObject);
    procedure pmZakaziPopup(Sender: TObject);
    procedure miCurrentClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
    function delete_zakaz(zakaz_id:integer;var qry:TibQuery):bool;    
  private
    { Private declarations }
    _user_name:string;
  public
    { Public declarations }
    property user_name: string read _user_name write SetUser_Name;

  end;

var
  frmSelectZakaz: TfrmSelectZakaz;

implementation
uses dmo, unitRequests, UnitFind, UnitAddZakaz, UnitEditZakaz, DB;
{$R *.dfm}
procedure TfrmSelectZakaz.setUser_name(value:string);
begin
  _user_name:=value;
  lblUser.Caption:=_user_name;
end;
procedure TfrmSelectZakaz.btnShowZakaziClick(Sender: TObject);
begin
try
  try
     btnShowZakazi.Enabled:=false;
    with dm do
    begin
    lblTable.Caption:='Заказы';
    if  gridZakazi.DataSource=dsRequests then begin
      gridZakazi.DataSource:=dsQryZakazi_by_user;

     end else
    begin
     if qryZakazi_by_user.Active then
        qryZakazi_by_user.Close;
     qryZakazi_by_user.ParamByName('user').AsString:=_user_name;
     gridZakazi.DataSource:=dsQryZakazi_by_user;
     qryZakazi_by_user.Open;

    end;
    end;
  finally
       btnShowZakazi.Enabled:=true;
       gridZakazi.Cursor:=crDefault;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

procedure TfrmSelectZakaz.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSelectZakaz.gridZakaziDblClick(Sender: TObject);
begin
try
 try
    gridZakazi.Cursor:=crHourGlass;
    if gridZakazi.SelectedField.text='' then exit;
 with dm do
 begin
   if gridZakazi.DataSource=dsQryZakazi_by_user then
   begin
    tblRequests.MasterSource:=dsQryZakazi_by_user;
   if not qryAllElements.Active then
      qryAllElements.Open;
    gridZakazi.DataSource:=dsRequests;
    tblRequests.Open;
   lblTable.Caption:='Требование';
   end else
   if gridZakazi.DataSource=dsRequests then
   begin
     if gridZakazi.SelectedField.Text<>'' then
       frmRequests.show;
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

procedure TfrmSelectZakaz.miAddZakazClick(Sender: TObject);
begin
  frmAddZakaz.show;
end;

procedure TfrmSelectZakaz.miEditClick(Sender: TObject);
begin
  with dm do
  begin
    if gridZakazi.DataSource=dsQryZakazi_by_user then
    begin
     if not tblZakazi.Active then
           tblZakazi.open;
      tblZakazi.Locate('zakaz_id',gridZakazi.SelectedField.Text,[]);
      frmEditZakaz.show;
     end else
     gridZakazi.OnDblClick(sender);
  end;
end;

procedure TfrmSelectZakaz.miRefreshClick(Sender: TObject);
begin
with dm do
begin
   if gridZakazi.DataSource=dsQryZakazi_by_user then
   begin
     qryZakazi_by_user.ParamByName('user').AsString:=_user_name;
     qryZakazi_by_user.Close;
     qryZakazi_by_user.open;

   end;
   if gridZakazi.DataSource=dsRequests then
     tblRequests.Refresh;
end;
end;

procedure TfrmSelectZakaz.pmZakaziPopup(Sender: TObject);
begin
try
  miEdit.Enabled:=gridZakazi.SelectedField.Text<>'';
  miCurrent.Enabled:=gridZakazi.SelectedField.Text<>'';
  miCurrent.visible:=gridZakazi.DataSource=dm.dsQryZakazi_by_user;
  miDelete.Visible:=gridZakazi.DataSource=dm.dsQryZakazi_by_user;
  miDelete.Enabled:=gridZakazi.SelectedField.Text<>'';
except
end;
end;

procedure TfrmSelectZakaz.miCurrentClick(Sender: TObject);
begin
   frmFind.zakaz_id:=strToInt(gridZakazi.SelectedField.text);
   showmessage('Установлен текущим.');
end;
function TfrmSelectZakaz.delete_zakaz(zakaz_id:integer;var qry:TibQuery):bool;
begin
  if messageDlg('Вы уверены, что желаете удалить Заказ?'+#13#10+'№ = "'+intToStr(zakaz_id)+'"'+#13#10+'При этом удаляться все записи из других таблиц связаные с этим элементом!',mtConfirmation,[mbYes,MbNo],0) = mrno then exit;
  result:=false;
  qry.SQL.Text:='execute procedure delete_zakaz('+intToStr(zakaz_id)+')';
  qry.ExecSQL;
  result:=true;
end;
procedure TfrmSelectZakaz.miDeleteClick(Sender: TObject);
begin
 with dm do
 try
  try
    gridZakazi.Cursor:=crHourGlass;
 if   delete_zakaz(StrToInt(gridZakazi.SelectedField.text),qrywork) then
    showmessage('Успешно удалён');

  finally
      gridZakazi.Cursor:=crDefault;
  end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

end.
