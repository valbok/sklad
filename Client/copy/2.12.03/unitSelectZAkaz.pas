unit unitSelectZAkaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,Ibquery, Menus,
  ComCtrls;

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
    Anim: TAnimate;
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
    function delete_request(request_id:integer;var qry:TibQuery):boolean;
    procedure gridZakaziKeyPress(Sender: TObject; var Key: Char);
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
uses dmo, unitRequests, UnitFind, UnitAddZakaz, UnitEditZakaz, DB, unadd;
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
   try
    Anim.FileName:=s;
    anim.Active:=true;
   except
   end;

    with dm do
    begin
    lblTable.Caption:='������';
    if  gridZakazi.DataSource=dsQryRequests_by_zakaz then
     begin
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
       anim.Active:=false;
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
   try
    Anim.FileName:=unAdd.s;
    anim.Active:=true;
   except
   end;

    if gridZakazi.SelectedField.text='' then exit;
 with dm do
 begin
   if gridZakazi.DataSource=dsQryZakazi_by_user then
   begin
{   if not qryAllElements.Active then
      qryAllElements.open;}
//      qryAllElements.ParamByName('element_id').AsInteger:=qryRequests_by_zakaz.fieldByName('element_id').AsInteger;

   if QryRequests_by_zakaz.Active then QryRequests_by_zakaz.Close;
    gridZakazi.DataSource:=dsQryRequests_by_zakaz;
    qryRequests_by_zakaz.ParamByName('zakaz_id').AsInteger:=qryZakazi_by_user.fieldByName('zakaz_id').AsInteger;
    QryRequests_by_zakaz.Open;

   lblTable.Caption:='����������';
   end else
   if gridZakazi.DataSource=dsQryRequests_by_zakaz then
   begin
     if gridZakazi.SelectedField.Text='' then exit;
       frmRequests.setRequestInfo(qryRequests_by_zakaz.fieldByName('name').AsString,
                                  floatToStr(qryRequests_by_zakaz.fieldByName('col').AsFloat),
                                  intToStr(qryRequests_by_zakaz.fieldByName('request_id').Asinteger),
                                  qryRequests_by_zakaz.fieldByName('luElem_name').AsString,
                                  intToStr(qryRequests_by_zakaz.fieldByName('element_id').Asinteger)
                                );
       frmRequests.show;
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
      frmEditZakaz.setZakazInfo(qryZakazi_by_user.fieldByName('from_whom').AsString,
                                qryZakazi_by_user.fieldByName('for_what').AsString,
                                dateToStr(qryZakazi_by_user.fieldByName('thedate').AsdateTime),
                                intToStr(qryZakazi_by_user.fieldByName('zakaz_id').Asinteger),
                                qryZakazi_by_user.fieldByName('user_name').AsString
                                );
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
     qryZakazi_by_user.Close;
  //     qryZakazi_by_user.ParamByName('user').AsString:=_user_name;
     qryZakazi_by_user.open;

   end else
   if gridZakazi.DataSource=dsQryRequests_by_zakaz then
   begin
     QryRequests_by_zakaz.Close;
     QryRequests_by_zakaz.Open;
   end;
end;
end;

procedure TfrmSelectZakaz.pmZakaziPopup(Sender: TObject);
begin
try
  miEdit.Enabled:=gridZakazi.SelectedField.Text<>'';
  miCurrent.Enabled:=gridZakazi.SelectedField.Text<>'';
  miCurrent.visible:=gridZakazi.DataSource=dm.dsQryZakazi_by_user;
//  miDelete.Visible:=gridZakazi.DataSource=dm.dsQryZakazi_by_user;
  miDelete.Enabled:=gridZakazi.SelectedField.Text<>'';
except
end;
end;

procedure TfrmSelectZakaz.miCurrentClick(Sender: TObject);
begin
   if gridZakazi.DataSource<>dm.dsQryZakazi_by_user then exit;
   frmFind.zakaz_id:=dm.QryZakazi_by_user.fieldByName('zakaz_id').AsInteger;
   showmessage('���������� �������.');
end;
function TfrmSelectZakaz.delete_zakaz(zakaz_id:integer;var qry:TibQuery):bool;
begin
  result:=false;
  qry.ParamByName('zakaz_id').AsInteger:=zakaz_id;
//  qry.SQL.Text:='execute procedure delete_zakaz('+intToStr(zakaz_id)+')';
  qry.ExecSQL;
  result:=true;
end;
function TfrmSelectZakaz.delete_request(request_id:integer;var qry:TibQuery):boolean;
begin
  result:=false;
  qry.ParamByName('request_id').AsInteger:=request_id;
//  qry.SQL.Text:='execute procedure delete_zakaz('+intToStr(zakaz_id)+')';
  qry.ExecSQL;
  result:=true;
end;

procedure TfrmSelectZakaz.miDeleteClick(Sender: TObject);
begin
 with dm do
 try
  try
    gridZakazi.Cursor:=crHourGlass;
if gridZakazi.DataSource=dsqryZakazi_by_user then
  begin
   if messageDlg('�� �������, ��� ������� ������� �����?'+#13#10+
        '�: "'+intToStr(QryZakazi_by_user.fieldByName('zakaz_id').asinteger)+'"'+#13#10+
        '�� ����: "'+QryZakazi_by_user.fieldByName('from_whom').asstring+'"'+#13#10+
        '��� ����� ����: "'+QryZakazi_by_user.fieldByName('for_what').asString+'"'+#13#10+
        '����: "'+dateToStr(QryZakazi_by_user.fieldByName('thedate').asdateTime)+'"'+#13#10+
        '��� ���� ��������� ��� ������ �� ������ ������ �������� � ���� �������!',mtConfirmation,[mbYes,MbNo],0) = mrno then exit;
   if   delete_zakaz(QryZakazi_by_user.fieldByName('zakaz_id').asinteger,qrydeleteZakaz) then
    showmessage('������� �����');
  end else
  if gridZakazi.DataSource=dsQryRequests_by_zakaz then
  begin
   if messageDlg('�� �������, ��� ������� ������� ����������?'+#13#10+
        '�: "'+intToStr(QryRequests_by_zakaz.fieldByName('request_id').asinteger)+'"'+#13#10+
        '������������, ����, ������: "'+QryRequests_by_zakaz.fieldByName('name').asstring+'"'+#13#10+
        '����������: "'+floatToStr(QryRequests_by_zakaz.fieldByName('col').asfloat)+'"',
         mtConfirmation,[mbYes,MbNo],0) = mrno then exit;
   if   delete_request(QryRequests_by_zakaz.fieldByName('request_id').asinteger,qrydeleteRequest) then
    showmessage('������� �����');

  end;
  finally
      gridZakazi.Cursor:=crDefault;
  end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

procedure TfrmSelectZakaz.gridZakaziKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =char(#13) then
     gridZakazi.OnDblClick(sender);
if key =char(#8) then
     btnshowZakazi.Click;

end;

end.
