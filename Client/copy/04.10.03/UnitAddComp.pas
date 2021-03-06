unit UnitAddComp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,IBQuery;

type
  TfrmAddComp = class(TForm)
    pnlMain: TPanel;
    gbComp: TGroupBox;
    editComponentName: TEdit;
    lNameComponent: TLabel;
    btnAddComponent: TBitBtn;
    procedure btnAddComponentClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function delete_component(comp_name:string;var qry:TibQuery):boolean;
    function Add_comp(comp_name:string;var qry:TIBQuery;user:string):boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddComp: TfrmAddComp;

implementation
uses dmo,main;
{$R *.dfm}

function TfrmAddComp.Add_comp(comp_name:string;var qry:TIBQuery;user:string):boolean;
var tmpStr:string;
begin
//if editComponentName.Text <>'' then
   with dm do
   begin
 try
      try
      if comp_name ='' then exit;
//       pnlComponents.Cursor:=crHourGlass;
//       btnAddComponent.Enabled:=false;
        result:=false;
       tmpStr:=qry.SQL.Text;
       qry.SQL.clear;
       qry.SQL.Text:='execute procedure add_component('''+comp_name+''','''+user+''')';

       qry.Open;
       qry.SQL.Text:= tmpStr;
       result:=true;
//      showmessage('�������� ��������� �������');
      finally

      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

   end;
end;

procedure TfrmAddComp.btnAddComponentClick(Sender: TObject);
begin
try
 try
 if editComponentName.Text='' then exit;
     gbComp.Cursor:=crHourGlass;
     btnAddComponent.Enabled:=false;
    if  Add_comp(editComponentName.Text,dm.qryWork,main._login) then
        showmessage('�������� ��������� �������');

//     dm.tblComp.Refresh;
   finally
    btnAddComponent.Enabled:=true;
    gbComp.Cursor:=crDefault;
    editComponentName.SetFocus;
   end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;
function TfrmAddComp.delete_component(comp_name:string;var qry:TibQuery):boolean;
var sqlText:string;
begin
   result:=false;
   if comp_name ='' then exit;
   sqlText:='execute procedure ';
   if messageDlg('�� �������, ��� ������� ������� �������������?'+#13#10+'"'+comp_name+'"'+#13#10+'��� ���� ��������� ��� ������ �� ������ ������ �������� � ���� �������������!',mtConfirmation,[mbYes,MbNo],0) = mrYes then
          begin
            qry.SQL.text:=sqlText+'delete_component('''+comp_name+''')';
            qry.ExecSQL;
            showmessage('������������� "'+Comp_name+'" �������!');
            result:=true;
          end;

end;


procedure TfrmAddComp.FormActivate(Sender: TObject);
begin
  editComponentName.SetFocus;
end;

end.
