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
    cbElem: TDBLookupComboBox;
    cbType: TDBLookupComboBox;
    cbComp: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnDelLinks: TBitBtn;
    btnClose: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddLinkClick(Sender: TObject);
    procedure btnDelLinksClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddLinks: TfrmAddLinks;

implementation
uses dmo,main, UnitLinks;
{$R *.dfm}

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
    if (cbElem.Text ='') then
      begin
         messageDlg('Необходимо выбрать элемент...',mtError,[MbOk],0);
         exit;
      end;
  try
     try
           gbAddLink.Cursor:=crHourGlass;
           btnAddLink.Enabled:=false;
    if  add_link(cbElem.KeyValue,elink.text,memLinkinfo.text,main._login,qryWork) then
           showmessage('Операция выполнена успешно! Ссылка была добавлена.');
       tblLinks.Refresh;
       cbElem.SetFocus;
{       qryLinkInfo_by_link.Close;
       qryLinkInfo_by_link.Open;}
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
