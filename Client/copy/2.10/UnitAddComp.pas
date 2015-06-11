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
begin
 try
    try
      result:=false;
      if comp_name ='' then exit;
      if qry.Active then qry.Close;
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

procedure TfrmAddComp.btnAddComponentClick(Sender: TObject);
begin
try
 try
 if editComponentName.Text='' then exit;
     gbComp.Cursor:=crHourGlass;
     btnAddComponent.Enabled:=false;
    if  Add_comp(editComponentName.Text,dm.qryAddComp,main._login) then
        showmessage('Операция выполнена успешно');
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
begin
   result:=false;
   if comp_name ='' then exit;
     if qry.Active then qry.Close;
      qry.ParamByName('comp_name').AsString:=comp_name;
      qry.ExecSQL;
      result:=true;
end;


procedure TfrmAddComp.FormActivate(Sender: TObject);
begin
  editComponentName.SetFocus;
end;

end.
