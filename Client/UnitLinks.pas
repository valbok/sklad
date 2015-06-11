unit UnitLinks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons,ibquery;

type
  TfrmLink = class(TForm)
    pnlMain: TPanel;
    btnClose: TBitBtn;
    gb: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    ELink: TEdit;
    MemLinkInfo: TMemo;
    eUser: TEdit;
    btnSave: TBitBtn;
    Label4: TLabel;
    eid: TEdit;
    btnDelete: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure SetLinkInfo(link,info,user,id:string);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLink: TfrmLink;

implementation
uses dmo,main;
{$R *.dfm}
procedure TfrmLink.SetLinkInfo(link,info,user,id:string);
begin
  eLink.Text:=link;
  MemLinkInfo.Text:=info;
  Euser.Text:=user;
  eid.Text:=id;
end;
procedure TfrmLink.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLink.btnSaveClick(Sender: TObject);
begin
with dm do
try
 try
    btnSave.Enabled:=false;
    if qryUpdateLink.Active then qryUpdateInfo.close;
    qryUpdateLink.ParamByName('link_id').AsInteger:=StrToInt(eid.text);
    qryUpdateLink.ParamByName('link').AsString:=elink.text;
    qryUpdateLink.ParamByName('info').Asstring:=memLinkInfo.text;
    qryUpdateLink.ExecSQL;
    showmessage('Операция выполнена успешно');
   finally
    btnSave.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;
function delete_link(link_id:integer;user:string;var qry:tibQuery): boolean;
begin
    result:=false;
    if qry.Active then qry.close;
    qry.ParamByName('link_id').AsInteger:=link_id;
    qry.ParamByName('user_name').AsString:=user;
    qry.ExecSQL;
    result:=true;
end;
procedure TfrmLink.btnDeleteClick(Sender: TObject);
begin
try
  try
    gb.Cursor:=crHourGlass;
    btnDelete.Enabled:=false;
   if messageDlg('Вы уверены, что желаете удалить ссылку?'+#13#10+'"'+Elink.text+'"',mtConfirmation,[mbYes,MbNo],0) = mrno then exit;
   if (eUser.Text<> main._login) and ((main._login <> 'admin') or (main._login <> 'Admin'))
   then
   begin
     showmessage('Пользователь "'+main._login+'" не может удалить эту ссылку');
     exit;
   end;
    if delete_link(StrToInt(eID.text),main._login,dm.qryDelete_link) then
        showmessage('оперция выполнена успешно');
    frmLink.Close;    
   finally
    gb.Cursor:=crDefault;
    btnDelete.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

end.
