unit UnitAddCharacrter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,ibQuery,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons;

type
  TfrmAddDetali = class(TForm)
    pnlMain: TPanel;
    gbElem: TGroupBox;
    Label1: TLabel;
    lTypeElem: TLabel;
    Label4: TLabel;
    cbElem: TDBLookupComboBox;
    rbName: TRadioButton;
    rbNUMER: TRadioButton;
    CBElem_type_name: TDBLookupComboBox;
    cbComp: TDBLookupComboBox;
    gbCharacter: TGroupBox;
    lblEdtType_name: TLabeledEdit;
    lblEdtResistance: TLabeledEdit;
    lbledtDopusk: TLabeledEdit;
    lbledtTKS: TLabeledEdit;
    btnAdd: TBitBtn;
    btnClose: TBitBtn;
    procedure rbNameClick(Sender: TObject);
    procedure rbNUMERClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddDetali: TfrmAddDetali;

implementation
uses dmo,unadd,main;
{$R *.dfm}

procedure TfrmAddDetali.rbNameClick(Sender: TObject);
begin
   if rbName.Checked then
     cbElem.ListField:='NAME';

end;
function add_detali(elem_id:integer;type_name:string;Resistance,dopusk:real;TKS:string;user:string;var qry:TibQuery):boolean;
var tmpStr:string;
begin
  try
    try
    result:=false;
    if type_name='' then exit;
        tmpStr:=qry.SQL.Text;
        qry.SQL.Text:='execute procedure add_detali('+intToStr(elem_id)+','''+type_name+''','+floatToStr(resistance)+','+floatToStr(dopusk)+','''+tks+''','''+user+''')';
        qry.Open;
        qry.SQL.Text:=tmpStr;
        result:=true;
      finally
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;



end;
procedure TfrmAddDetali.rbNUMERClick(Sender: TObject);
begin
   if rbNumer.Checked then
     cbElem.ListField:='NUMER';
end;

procedure TfrmAddDetali.btnAddClick(Sender: TObject);
var resistance,dopusk:real;
begin
    if (lblEdtType_name.text <> '') then
       with dm do
       begin
         if (cbElem.Text ='') then
           begin
              messageDlg('Необходимо выбрать элемент..',mtError,[MbOk],0);
              exit;
           end;
    try
     try
     pnlMain.Cursor:=crHourGlass;
     btnAdd.Enabled:=false;
     resistance:=strToFloat(frmManeger.ZamenaDotNakoma(lblEdtResistance.Text));
     dopusk:=strToFloat(frmManeger.ZamenaDotNakoma(lblEdtDopusk.Text));
     if  add_detali(cbElem.KeyValue,lblEdtType_name.Text,resistance,dopusk,lbledtTKS.Text,main._login,qryWork) then
        showmessage('Операция выполнена успешно.Детали добавлены!');
     tblElements.Refresh;
    finally
     pnlmain.Cursor:=crDefault;
     btnAdd.Enabled:=true;
    end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
 end;
end;
procedure TfrmAddDetali.btnCloseClick(Sender: TObject);
begin
close;
end;

end.
