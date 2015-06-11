unit unitAddlinks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls,IBquery;

type
  TfrmAddLinks = class(TForm)
    pnlMain: TPanel;
    gbAddLink: TGroupBox;
    Label1: TLabel;
    btnAddLink: TBitBtn;
    ELink: TEdit;
    memLinkInfo: TMemo;
    gbElem: TGroupBox;
    btnDelLinks: TBitBtn;
    btnClose: TBitBtn;
    edtElem_name: TEdit;
    Label2: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddLinkClick(Sender: TObject);
    procedure btnDelLinksClick(Sender: TObject);
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
  frmAddLinks: TfrmAddLinks;

implementation
uses dmo,main, UnitLinks;
{$R *.dfm}
procedure TfrmAddlinks.SetElem_id(value:integer);
begin
 _elem_id:=value;
end;
procedure TfrmAddlinks.SetElem_name(value:string);
begin
 _elem_name:=value;
 edtElem_name.Text:=_elem_name;
end;

procedure TfrmAddLinks.btnCloseClick(Sender: TObject);
begin
close;
end;
///////////////////\\\\\\\\\\\\\\\\
function add_link(elem_id:integer;link,linkinfo,user:string;var qry:TIBquery):boolean;
begin
  try
     try
       result:=false;
       qry.SQL.Text:='execute procedure add_link('+intToStr(elem_id)+','''+link+''','''+LinkInfo+''','''+user+''')';
       qry.Open;
       result:=true;
      finally
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
//result:=true;
end;
procedure TfrmAddLinks.btnAddLinkClick(Sender: TObject);
begin
with dm do
   begin
    if (_Elem_name ='') then
      begin
         messageDlg('Необходимо выбрать элемент...',mtError,[MbOk],0);
         exit;
      end;
  try
     try
           gbAddLink.Cursor:=crHourGlass;
           btnAddLink.Enabled:=false;
       if  add_link(_Elem_id,elink.text,memLinkinfo.text,main._login,qryWork) then
           showmessage('Операция выполнена успешно! Ссылка была добавлена.');
       tblLinks.Refresh;
      finally
       gbAddLink.Cursor:=crDefault;
       btnAddLink.Enabled:=true;
       Elink.SetFocus;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;
end;

procedure TfrmAddLinks.btnDelLinksClick(Sender: TObject);
begin
   frmLink.SHOW;
end;

end.
