unit unitRequests;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, Mask;

type
  TfrmRequests = class(TForm)
    pnlMain: TPanel;
    pnlunderMain: TPanel;
    pnlBottom: TPanel;
    btnClose: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnSave: TBitBtn;
    eName: TEdit;
    eCol: TEdit;
    EElem_name: TEdit;
    eId: TEdit;
    eElem_id: TEdit;
    procedure btnCloseClick(Sender: TObject);
//    procedure SetInfoZakaz(zakaz_id:integer;from_whom,for_what,thedate:string);
    procedure btnSelectZakazClick(Sender: TObject);
    procedure btnOpenZakazClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure setRequestInfo(name,col,id,elem_name,elem_id:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRequests: TfrmRequests;

implementation
uses dmo, unitSelectZAkaz;
{$R *.dfm}
procedure TfrmRequests.setRequestInfo(name,col,id,elem_name,elem_id:string);
begin
  ename.Text:=name;
  ecol.Text:=col;
  eid.Text:=id;
  EElem_name.Text:=elem_name;
  eElem_id.Text:=elem_id;
end;
procedure TfrmRequests.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRequests.btnSelectZakazClick(Sender: TObject);
begin
  FrmSelectZakaz.show;
end;

procedure TfrmRequests.btnOpenZakazClick(Sender: TObject);
begin
 {try
   try
       gridRequests.Cursor:=crHourGlass;
       btnOpenZakaz.Enabled:=false;
       with dm do
       begin
         if not tblRequests.Active then
            tblRequests.Open;
       end;

   finally
       gridRequests.Cursor:=crDefault;
       btnOpenZAkaz.Enabled:=true;
    end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
}
end;

procedure TfrmRequests.btnSaveClick(Sender: TObject);
begin
with dm do
try
 try
    pnlBottom.Cursor:=crHourGlass;
    btnSave.Enabled:=false;
    if qryUpdateRequest.Active then qryUpdateRequest.close;
    with qryUpdateRequest do
    begin
      ParamByName('name').Asstring:=ename.Text;
      ParamByName('col').Asfloat:=StrToFloat(eCol.text);
      ParamByName('element_id').Asinteger:=StrToInt(eElem_id.Text);
      ParamByName('request_id').AsInteger:=strToInt(eid.Text);
      ExecSQL;
    end;
    showmessage('Операция выполнена успешно');
   finally
    pnlBottom.Cursor:=crDefault;
    btnSave.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

end.
