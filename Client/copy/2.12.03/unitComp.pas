unit unitComp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Mask, Buttons;

type
  TfrmComp = class(TForm)
    pnlMain: TPanel;
    gbComp: TGroupBox;
    Label1: TLabel;
    btnDelete: TBitBtn;
    lblid: TLabel;
    btnClose: TBitBtn;
    Label2: TLabel;
    btnAdd: TBitBtn;
    EName: TEdit;
    eID: TEdit;
    eUser: TEdit;
    btnSave: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure setCompInfo(name,id,user:string);
    procedure btnSaveClick(Sender: TObject);
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
procedure TfrmComp.setCompInfo(name,id,user:string);
begin
   EName.Text:=name;
   eID.Text:=id;
   eUser.Text:=user;
end;
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
   if messageDlg('Вы уверены, что желаете удалить комплектующее?'+#13#10+'"'+eName.text+'"'+#13#10+'При этом удаляться все записи из других таблиц связаные с этим комплектующим!',mtConfirmation,[mbYes,MbNo],0) = mrno then exit;
   if  frmAddComp.DElete_Component(eName.text,dm.qryDelete_comp) then
     showmessage('Комплектующее "'+eName.text+'" удалено!');
  finally
       btnDelete.Enabled:=true;
       gbComp.Cursor:=crDefault;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

procedure TfrmComp.btnSaveClick(Sender: TObject);
begin
with dm do
try
 try
    gbComp.Cursor:=crHourGlass;
    btnSave.Enabled:=false;
    if qryUpdateComp.Active then qryUpdateComp.close;
    with qryupdateComp do
    begin
      ParamByName('name').Asstring:=EName.text;
      ParamByName('component_id').Asinteger:=strToInt(Eid.text);      
      ExecSQL;
    end;
    showmessage('Операция выполнена успешно');
   finally
    gbComp.Cursor:=crDefault;
    btnSave.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;
end;

end.
