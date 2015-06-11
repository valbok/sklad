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
    gbSelect: TGroupBox;
    CBElem_type_name: TDBLookupComboBox;
    lTypeElem: TLabel;
    cbComp: TDBLookupComboBox;
    Label1: TLabel;
    btnAddLinks: TBitBtn;
    BitBtn1: TBitBtn;
    procedure btnAddElemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function delete_elem(elem_name:string;elem_id:integer;qry:TIBQuery):boolean;
    procedure btnAddLinksClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddElem: TfrmAddElem;

implementation
uses dmo,main, unitAddlinks, unitAddType, UnitAddComp;
{$R *.dfm}
function add_element(elem_name,unit_izmr:string;type_id:integer;numer,info,user:string;var qry:TIBQuery):boolean;
var tmpStr:string;
begin
  try
    try
    result:=false;
    if elem_name='' then exit;
        tmpStr:=qry.SQL.Text;
        qry.SQL.Text:='execute procedure add_element('''+elem_name+''','''+Unit_izmr+''','+intToStr(type_id)+','''+numer+''','''+info+''','''+user+''')';
        qry.Open;
        qry.SQL.Text:=tmpStr;
//        showmessage('Операция выполнена успешно');
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
         if (cbElem_Type_name.Text ='') then
           begin
              messageDlg('Необходимо заполнить поле "Тип"...',mtError,[MbOk],0);
              exit;
           end;
    try
    try
     gbElem.Cursor:=crHourGlass;
     btnAddElem.Enabled:=false;
     if  add_element(ename.text,eunit.Text,cbElem_type_name.KeyValue,enumer.Text,memInfo.Text,main._login,qryWork) then
        showmessage('Операция выполнена успешно.Элемент добавлен!');
     tblElements.Refresh;
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
function TfrmAddElem.delete_elem(elem_name:string;elem_id:integer;qry:TIBQuery):boolean;
var sqlText:string;
begin
try
  try
    result:=false;
    if messageDlg('Вы уверены, что желаете удалить элемент?'+#13#10+'"'+elem_name+'"'+#13#10+'При этом удаляться все записи из других таблиц связаные с этим элементом!',mtConfirmation,[mbYes,MbNo],0) = mrYes then
      begin
        sqltext:='execute procedure ';
        qry.SQL.text:=sqlText+' delete_element('+intToStr(elem_id)+')';
        qry.ExecSQL;
        showmessage('Элемент '+elem_name+' удалён!');
       result:=true;
      end;

   finally

   end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;
procedure TfrmAddElem.btnAddLinksClick(Sender: TObject);
begin
   frmAddLinks.show;
end;

procedure TfrmAddElem.BitBtn1Click(Sender: TObject);
var i,type_id:integer;
name,unit_izmr,numer,info:string;
begin
with dm do
begin
  for i:=1 to 5000 do
    begin
       name:='c_'+intToStr(i);
       frmAddComp.Add_comp(name,qrywork,'val');
    end;
    showmessage('Ok components');

  for i:=1 to 1000 do
    begin
       name:='t_'+intToStr(i);
       frmAddType.add_type(name,'Диоды',qrywork,'val');
    end;
    showmessage('Ok types');
  for i:=1 to 20000 do
    begin
       Randomize;
       name:='e_'+intToStr(i);
       unit_izmr:='sht_'+intToStr(i);
       numer:='num_'+intToStr(i);
       info:='info_'+intToStr(i);
       type_id:=random(5);
       if type_id = 0 then
         type_id:=random(5);
       if type_id <> 0 then
       add_element(name,unit_izmr,type_id,numer,info,'val',qryWork) else
         add_element(name,unit_izmr,1,numer,info,'val',qryWork)       
    end;
showmessage('ok elements');
end;
showmessage('ok all;');
end;
end.

