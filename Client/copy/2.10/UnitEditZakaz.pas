unit UnitEditZakaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmEditZakaz = class(TForm)
    pnlMain: TPanel;
    pnlunderMain: TPanel;
    pnlBottom: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    btnClose: TBitBtn;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnSave: TBitBtn;
    eFrom_whom: TEdit;
    eFor_what: TEdit;
    eTheDate: TEdit;
    eId: TEdit;
    euser: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure setZakazInfo(from_whom,for_what,thedate,id,user:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditZakaz: TfrmEditZakaz;

implementation
uses dmo;
{$R *.dfm}
procedure TfrmeditZakaz.setZakazInfo(from_whom,for_what,thedate,id,user:string);
begin
        eFrom_whom.Text:=from_whom;
        eFor_what.Text:=for_what;
        eTheDate.Text:=thedate;
        eid.Text:=id;
        euser.Text:=user;
end;
procedure TfrmEditZakaz.btnCloseClick(Sender: TObject);
begin
close;
end;

procedure TfrmEditZakaz.btnSaveClick(Sender: TObject);
begin
with dm do
try
 try
    pnlBottom.Cursor:=crHourGlass;
    btnSave.Enabled:=false;
    if qryUpdateZakaz.Active then qryUpdateZakaz.close;
    with qryUpdatezakaz do
    begin
      ParamByName('from_whom').Asstring:=eFrom_whom.Text;
      ParamByName('for_what').Asstring:=eFor_what.text;
      ParamByName('thedate').Asstring:=eTheDate.text;
      ParamByName('zakaz_id').AsInteger:=strToInt(eid.Text);
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
