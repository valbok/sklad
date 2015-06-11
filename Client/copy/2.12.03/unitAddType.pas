unit unitAddType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls,IBQuery;

type
  TfrmAddType = class(TForm)
    pnlMain: TPanel;
    gbType: TGroupBox;
    btnAddType: TBitBtn;
    edtTypeName: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtComp_name: TEdit;
    procedure btnAddTypeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function delete_type(type_name:string;type_id:integer;var qry:TIBQuery):boolean;
    function add_type(type_name:string;comp_name:string;var qry:TIBQuery;user:string):boolean;
    procedure SetComp_id(value:integer);
    procedure Setcomp_name(value:string);
  private
    { Private declarations }
  _comp_id:integer;
  _comp_name:string;
  public
    { Public declarations }
  property comp_id: integer read _comp_id write SetComp_id;
  property comp_name: string read _comp_name write SetComp_name;
  end;

var
  frmAddType: TfrmAddType;

implementation
uses dmo,main;
{$R *.dfm}
procedure TfrmAddType.SetComp_id(value:integer);
begin
 _comp_id:=value;
end;
procedure TfrmAddType.SetCOmp_name(value:string);
begin
 _comp_name:=value;
 edtComp_name.Text:=_Comp_name;
end;

function TfrmAddtype.add_type(type_name:string;comp_name:string;var qry:TIBQuery;user:string):boolean;
begin
     try
       try
       if type_name='' then exit;
           result:=false;
           qry.ParamByName('type_name').AsString:=type_name;
           qry.ParamByName('comp_name').AsString:=comp_name;
           qry.ParamByName('user').AsString:=user;
           qry.ExecSQL;
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
         if (_comp_name ='') then
           begin
              messageDlg('Необходимо заполнить поле "комплектующее"...',mtError,[MbOk],0);
              exit;
           end;
       gbType.Cursor:=crHourGlass;
       btnAddType.Enabled:=false;
      if   add_type(edtTypeName.text,_comp_name,qryaddtype,main._login) then
        showmessage('Операция выполнена успешно');      

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
begin
result:=false;
if (type_name='') or(type_id =null) then exit;
       begin
         if qry.Active then qry.Close;
         qry.ParamByName('type_id').AsInteger:=type_id;
         qry.ExecSQL;
         result:=true;
       end;

end;
///////////////////
procedure TfrmAddType.FormActivate(Sender: TObject);
begin
  edtTypeName.SetFocus;
end;

end.
