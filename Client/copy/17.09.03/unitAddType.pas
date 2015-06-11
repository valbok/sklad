unit unitAddType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls,IBQuery;

type
  TfrmAddType = class(TForm)
    pnlMain: TPanel;
    gbType: TGroupBox;
    CBType_Comp: TDBLookupComboBox;
    btnAddType: TBitBtn;
    edtTypeName: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    procedure btnAddTypeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function delete_type(type_name:string;type_id:integer;var qry:TIBQuery):boolean;
    function add_type(type_name:string;comp_name:string;var qry:TIBQuery;user:string):boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddType: TfrmAddType;

implementation
uses dmo,main;
{$R *.dfm}
function TfrmAddtype.add_type(type_name:string;comp_name:string;var qry:TIBQuery;user:string):boolean;
var tmpstr:string;
begin
     try
       try
       if type_name='' then exit;
           tmpStr:=qry.SQL.Text;
           result:=false;
           qry.SQL.Text:='execute procedure add_type('''+type_name+''','''+comp_name+''','''+user+''')';
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
procedure TfrmAddType.btnAddTypeClick(Sender: TObject);
begin
try
 try
   if (edtTypeName.text <> '')  then
       with dm do
       begin
         if (cbType_comp.Text ='') then
           begin
              messageDlg('Необходимо заполнить поле "комплектующее"...',mtError,[MbOk],0);
              exit;
           end;
       gbType.Cursor:=crHourGlass;
       btnAddType.Enabled:=false;
      if   add_type(edtTypeName.text,cbType_comp.Text,qryWork,main._login) then
        showmessage('Операция выполнена успешно');      
       tblTyp.Refresh;
       end;
      finally
        gbType.Cursor:=crDefault;
        btnAddType.Enabled:=true;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;


end;
function TfrmAddType.delete_type(type_name:string;type_id:integer;var qry:TIBQuery):boolean;
var sqltext:string;
begin
result:=false;
if (type_name='') or(type_id =null) then exit;
  if messageDlg('Вы уверены, что желаете удалить тип?'+#13#10+'"'+type_name+'"'+#13#10+'При этом удаляться все записи из других таблиц связаные с этим типом!',mtConfirmation,[mbYes,MbNo],0) = mrYes then
       begin
         sqlText:='execute procedure ';
         qry.SQL.text:=sqlText+'delete_type('+intToStr(type_id)+')';
         qry.ExecSQL;
         showmessage('Тип "'+type_name+'" удалён!');
       result:=true;
       end;

end;
///////////////////
procedure TfrmAddType.FormActivate(Sender: TObject);
begin
  edtTypeName.SetFocus;
end;

end.
