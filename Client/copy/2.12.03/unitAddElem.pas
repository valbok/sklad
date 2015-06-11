unit unitAddElem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons,ibQuery;

type
  TfrmAddElem = class(TForm)
    pnlMain: TPanel;
    gbElem: TGroupBox;
    btnAddElem: TBitBtn;
    gbElemNew: TGroupBox;
    lNameElem: TLabel;
    lUnitElem: TLabel;
    lNumer: TLabel;
    EName: TEdit;
    EUnit: TEdit;
    Enumer: TEdit;
    MemInfo: TMemo;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    edtCOmp_name: TEdit;
    edtType_name: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    btnClose: TBitBtn;
    procedure btnAddElemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function delete_elem(elem_name:string;elem_id:integer;var qry:TIBQuery):boolean;
    procedure BitBtn1Click(Sender: TObject);

    procedure SetComp_id(value:integer);
    procedure SetComp_name(value:string);
    procedure SetType_id(value:integer);
    procedure SetType_name(value:string);
    procedure btnCloseClick(Sender: TObject);

  private

    { Private declarations }
   _comp_id     :integer;
   _comp_name   :string;
   _type_id     :integer;
   _type_name   :string;
  public

  property comp_id: integer read _comp_id write Setcomp_id;
  property comp_name: string read _COmp_name write SetComp_name;
  property type_id: integer read _type_id write SetType_id;
  property Type_name: string read _Type_name write SetType_name;

  { Public declarations }
  end;

var
  frmAddElem: TfrmAddElem;

implementation
uses dmo,main, unitAddlinks, unitAddType, UnitAddComp;
{$R *.dfm}

procedure TfrmAddElem.SetComp_id(value:integer);
begin
 _Comp_id:=value;
end;
procedure TfrmAddElem.SetComp_name(value:string);
begin
 _comp_name:=value;
 edtComp_name.Text:=_Comp_name;
end;
procedure TfrmAddElem.SetType_id(value:integer);
begin
 _type_id:=value;
end;
procedure TfrmAddElem.SetType_name(value:string);
begin
 _type_name:=value;
 edtType_name.Text:=_Type_name;
end;

function add_element(elem_name,unit_izmr:string;type_id:integer;numer,info,user:string;var qry:TIBQuery):boolean;
var tmpStr:string;
begin
  try
    try
    result:=false;
    if elem_name='' then exit;
        tmpStr:=qry.SQL.Text;
        qry.ParamByName('elem_name').AsString:=elem_name;
        qry.ParamByName('unit_izmr').AsString:=unit_izmr;
        qry.ParamByName('type_id').AsInteger:=type_id;
        qry.ParamByName('numer').AsString:=numer;
        qry.ParamByName('info').AsString:=info;
        qry.ParamByName('user').AsString:=user;
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
procedure TfrmAddElem.btnAddElemClick(Sender: TObject);
begin
    if (EName.text <> '') then
       with dm do
       begin
         if (_Type_name ='') then
           begin
              messageDlg('Ќеобходимо выбрать  "“ип"...',mtError,[MbOk],0);
              exit;
           end;
    try
    try
     gbElem.Cursor:=crHourGlass;
     btnAddElem.Enabled:=false;
     if  add_element(ename.text,eunit.Text,_Type_id,enumer.Text,memInfo.Text,main._login,qryaddElem) then
        showmessage('ќпераци€ выполнена успешно.Ёлемент добавлен!');
    finally
     gbElem.Cursor:=crDefault;
     btnAddElem.Enabled:=true;
    end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;
end;

procedure TfrmAddElem.FormActivate(Sender: TObject);
begin
  ename.SetFocus;
end;
function TfrmAddElem.delete_elem(elem_name:string;elem_id:integer;var qry:TIBQuery):boolean;
begin
try
  try
   result:=false;

       qry.ParamByName('element_id').AsInteger:=elem_id;
       qry.ExecSQL;
//       showmessage('Ёлемент '+elem_name+' удалЄн!');
       result:=true;

   finally

   end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;
procedure TfrmAddElem.BitBtn1Click(Sender: TObject);
var i,type_id:integer;
name,unit_izmr,numer,info:string;
begin
if messageDlg('Ok?',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
with dm do
begin
  for i:=1 to 1000 do
    begin
       name:='c_'+intToStr(i);
       frmAddComp.Add_comp(name,qryaddcomp,'val');
    end;
    showmessage('Ok components');

  for i:=1 to 5000 do
    begin
       name:='t_'+intToStr(i);
       frmAddType.add_type(name,'ƒиоды',qryaddtype,'val');
    end;
    showmessage('Ok types');
  for i:=1 to 20000 do
    begin
       Randomize;
       name:='e_'+intToStr(i);
       unit_izmr:='sht_'+intToStr(i);
       numer:='num_'+intToStr(i);
       info:='info_'+intToStr(i);
       type_id:=random(5000);
       if type_id = 0 then
         type_id:=random(5000);
       if type_id <> 0 then
       add_element(name,unit_izmr,type_id,numer,info,'val',qryaddelem) else
         add_element(name,unit_izmr,1,numer,info,'val',qryaddElem)
    end;
showmessage('ok elements');
end;
showmessage('ok all;');
end;
procedure TfrmAddElem.btnCloseClick(Sender: TObject);
begin
Close;
end;

end.

