unit unitDetali;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls,ibquery;

type
  TfrmDetali = class(TForm)
    pnlMain: TPanel;
    gbDEtali: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    btnClose: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    EType: TEdit;
    eResistance: TEdit;
    eElem_name: TEdit;
    eDopusk: TEdit;
    eTKS: TEdit;
    eUser: TEdit;
    btnSave: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure SetElem_name(value:string);
    procedure SetElem_id(value:integer);
    procedure setInfo(type_name,r,dopusk,tks,user:string);
    procedure openDetali_by_elem(var qry:tibquery);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
   _elem_name   :string;
   _elem_id     :integer;
  public
    { Public declarations }
  property elem_name: string read _elem_name write SetElem_name;
  property elem_id: integer read _elem_id write SetElem_id;

  end;

var
  frmDetali: TfrmDetali;
  Existdetali:boolean=false;
implementation
uses dmo, UnitAddDetali, DB;
{$R *.dfm}
procedure TfrmDetali.openDetali_by_elem(var qry:tibquery);
begin
with dm do
 try
  try
   Cursor:=crHourGlass;
   Existdetali:=false;
   if qrydetali_by_elem.Active then qryDetali_by_elem.close;
   qryDetali_by_elem.ParamByName('element_id').AsInteger:=_elem_id;
   qryDetali_by_elem.Open;
   if not qryDetali_by_elem.Eof then
        Existdetali:=true;
  finally
   Cursor:=crDefault;
  end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;
end;
procedure TfrmDetali.setInfo(type_name,r,dopusk,tks,user:string);
begin
    EType.Text:=type_name;
    eResistance.Text:=r;
    eDopusk.Text:=dopusk;
    eTKS.Text:=tks;
    eUser.Text:=user;
    if not Existdetali then
    begin
      EType.Enabled:=false;
      eResistance.Enabled:=false;
      eDopusk.Enabled:=false;
      eTKS.Enabled:=false;
      btnSave.Enabled:=false;
    end else
    begin
      EType.Enabled:=true;
      eResistance.Enabled:=true;
      eDopusk.Enabled:=true;
      eTKS.Enabled:=true;
      btnSave.Enabled:=true;
    end;
end;
procedure TfrmDetali.SetElem_id(value:integer);
begin
 _elem_id:=value;
end;

procedure TfrmDetali.SetElem_name(value:string);
begin
 _elem_name:=value;
 eElem_name.Text:=_elem_name;
end;

procedure TfrmDetali.btnCloseClick(Sender: TObject);
begin
Close;
end;

procedure TfrmDetali.btnSaveClick(Sender: TObject);
begin
with dm do
try
 try
    gbDEtali.Cursor:=crHourGlass;
    btnSave.Enabled:=false;
    if qryUpdateDEtali.Active then qryUpdatedetali.close;
    with qryUpdatedetali do
    begin
      ParamByName('detali_id').AsInteger:=qryDetali_by_elem.fieldByName('detali_id').AsInteger;
      ParamByName('type_name').Asstring:=etype.text;
      ParamByName('Resistance').AsFloat:=strToFloat(eResistance.text);
      ParamByName('Dopusk').AsFloat:=strToFloat(edopusk.text);
      ParamByName('tks').Asstring:=eTKS.text;
      ExecSQL;
    end;
    showmessage('Операция выполнена успешно');
   finally
     gbDEtali.Cursor:=crdefault;
     btnSave.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;
end;

end.
