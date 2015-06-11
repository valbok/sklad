unit unitTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ExtCtrls, StdCtrls, Mask, Buttons;

type
  TfrmTypes = class(TForm)
    pnlMain: TPanel;
    gbType: TGroupBox;
    Label1: TLabel;
    cbComp: TDBLookupComboBox;
    Label2: TLabel;
    lblid: TLabel;
    btnClose: TBitBtn;
    btnDeleteType: TBitBtn;
    Label4: TLabel;
    btnAdd: TBitBtn;
    eid: TEdit;
    eUser: TEdit;
    ECOmp_id: TEdit;
    eType_name: TEdit;
    EComp_name: TEdit;
    sbMoveTo: TSpeedButton;
    btnSave: TBitBtn;
    procedure cbCompClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteTypeClick(Sender: TObject);
    procedure sbMoveToClick(Sender: TObject);
    procedure setTypeInfo(type_name,type_id,comp_name,comp_id,user:string);
    procedure btnSaveClick(Sender: TObject);
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

procedure TfrmTypes.setTypeInfo(type_name,type_id,comp_name,comp_id,user:string);
begin
   eType_name.Text:=type_name;
   eid.Text:=type_id;
   EComp_name.Text:=comp_name;
   ECOmp_id.Text:=comp_id;
   eUser.Text:=user;
end;
procedure TfrmTypes.cbCompClick(Sender: TObject);
begin
 try
  ECOmp_id.Text:=intToStr(cbComp.KeyValue);
 except
 end;
end;

procedure TfrmTypes.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTypes.btnAddClick(Sender: TObject);
begin
  frmAddType.comp_name:=EComp_name.Text;
  frmAddType.comp_id:=strToint(ECOmp_id.text);
  frmAddType.show;
end;

procedure TfrmTypes.btnDeleteTypeClick(Sender: TObject);
begin
try
 try
  gbType.Cursor:=crHourGlass;
  btnDeleteType.Enabled:=false;
  if messageDlg('¬ы уверены, что желаете удалить тип?'+#13#10+'"'+
        eType_name.Text+'"'+#13#10+
        'ѕри этом удал€тьс€ все записи из других таблиц св€заные с этим типом!',
        mtConfirmation,[mbYes,MbNo],0) = mrno
      then exit;
  if  frmAddType.delete_type(eType_name.text, strToInt(eID.Text),dm.qryDelete_Type) then
    showmessage('ќпераци€ выполнена успешно');
   frmTypes.close;
 finally
    gbType.Cursor:=crDefault;
    btnDeleteType.Enabled:=true;
 end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmTypes.sbMoveToClick(Sender: TObject);
begin
try
 try
  sbMoveTo.Enabled:=false;
  gbType.Cursor:=crHourGlass;
  cbComp.ListSource:=DM.dsQryComponents;
  cbComp.ListField:='NAME';
  cbComp.KeyField:='COMPONENT_ID';
  finally
   sbMoveTo.Enabled:=true;
   gbtype.Cursor:=crDefault;

  end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmTypes.btnSaveClick(Sender: TObject);
begin
with dm do
try
 try
    gbType.Cursor:=crHourGlass;
    btnSave.Enabled:=false;
    if qryUpdatetype.Active then qryUpdatetype.close;
    with qryupdateType do
    begin
      ParamByName('type_id').AsInteger:=StrToInt(eid.text);
      ParamByName('name').Asstring:=eType_Name.text;
      ParamByName('component_id').Asinteger:=StrToInt(ECOmp_id.Text);
      ExecSQL;
    end;
    showmessage('ќпераци€ выполнена успешно');
    EComp_name.Text:=cbComp.Text;//????
   finally
    gbType.Cursor:=crDefault;
    btnSave.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

end.
