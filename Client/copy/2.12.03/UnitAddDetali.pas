unit UnitAddDetali;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,ibQuery,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, Mask;

type
  TfrmAddDetali = class(TForm)
    pnlMain: TPanel;
    gbCharacter: TGroupBox;
    lblEdtType_name: TLabeledEdit;
    lblEdtResistance: TLabeledEdit;
    lbledtDopusk: TLabeledEdit;
    btnAdd: TBitBtn;
    btnClose: TBitBtn;
    Label2: TLabel;
    lbledtTKS: TEdit;
    lbledtElem_name: TLabeledEdit;
    lbl: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure lbledtDopuskExit(Sender: TObject);
    procedure lbledtTKSExit(Sender: TObject);
    procedure SetElem_id(value:integer);
    procedure SetElem_name(value:string);
  private
    { Private declarations }
   _elem_id     :integer;
   _elem_name   :string;
  public

  property elem_id: integer read _elem_id write SetElem_id;
  property elem_name: string read _elem_name write SetElem_name;
  { Public declarations }
  end;

var
  frmAddDetali: TfrmAddDetali;

implementation
uses dmo,unadd,main, unitOstatki;
{$R *.dfm}
procedure TfrmAddDetali.SetElem_id(value:integer);
begin
 _elem_id:=value;
end;
procedure TfrmAddDetali.SetElem_name(value:string);
begin
 _elem_name:=value;
 lbledtElem_name.Text:=_elem_name;
end;

function add_detali(elem_id:integer;type_name:string;Resistance,dopusk:real;TKS:string;user:string;var qry:TibQuery):boolean;
var tmpStr:string;
begin
  try
    try
    result:=false;
//    if type_name='' then exit;
        tmpStr:=qry.SQL.Text;
        qry.ParamByName('elem_id').AsInteger:=elem_id;
        qry.ParamByName('type_name').AsString:=type_name;
        qry.ParamByName('resistance').AsFloat:=resistance;
        qry.ParamByName('dopusk').AsFloat:=dopusk;
        qry.ParamByName('tks').AsString:=tks;
        qry.ParamByName('user').AsString:=user;

//        qry.SQL.Text:='execute procedure add_detali('+intToStr(elem_id)+','''+type_name+''','+(resistance)+','+(dopusk)+','''+tks+''','''+user+''')';
        qry.ExecSQL;
        qry.SQL.Text:=tmpStr;
        result:=true;
      finally
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;



end;
procedure TfrmAddDetali.btnAddClick(Sender: TObject);
var resistance,dopusk:real;
begin
       with dm do
       begin
         if (_Elem_name ='') then
           begin
              messageDlg('Необходимо выбрать элемент..',mtError,[MbOk],0);
              exit;
           end;
if (lbledtDopusk.Text<>'') and(strTofloat((lbledtDopusk.Text))>100) then
begin
 showmessage('Допуск не может быть больше 100 %');
 exit;
end;
    try
     try
     pnlMain.Cursor:=crHourGlass;
     btnAdd.Enabled:=false;
     if lblEdtResistance.Text <> '' then
        resistance:=StrTofloat (lblEdtResistance.Text);

      if lblEdtDopusk.Text <>'' then
        dopusk:=StrTofloat(lblEdtDopusk.Text);
     if  add_detali(_elem_id,lblEdtType_name.Text,resistance,dopusk,lbledtTKS.Text,main._login,qryaddDetali) then
        showmessage('Операция выполнена успешно. Детали добавлены!');
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

procedure TfrmAddDetali.lbledtDopuskExit(Sender: TObject);
{const c: set of  char = ['0'..'9','.',','];
var i:integer;
countKoma: boolean;
s,s2:string;}
begin
{  CountKoma:=true;
  for i:=1 to length(lbledtDopusk.Text) do
  begin
           if (lbledtDopusk.Text[i] in c) then
               begin
               if (lbledtDopusk.Text[i] =',')  then
                 begin  if countKoma then
                    S2:='.' else s2:='';
                    countKoma:=false;
                  end else
                       s2:=lbledtDopusk.Text[i];
                       if s2='.' then countKoma:=false;
                   s:=s+s2;
                end;
    end;
 lbledtDopusk.Text:=s;
 }
end;

procedure TfrmAddDetali.lbledtTKSExit(Sender: TObject);
begin
  lbledtTks.Text:=copy(lbledtTks.Text,1,1);
end;

end.
