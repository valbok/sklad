unit unitElem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Mask, Menus,shellApi, Buttons;

type
  TfrmElements = class(TForm)
    pnlMain: TPanel;
    gbElem: TGroupBox;
    pnlBottom: TPanel;
    ElemNavigator: TDBNavigator;
    dbedtName: TDBEdit;
    lblName: TLabel;
    lblUnit: TLabel;
    lblNumer: TLabel;
    dbedtUnit: TDBEdit;
    dbedtNumer: TDBEdit;
    dbedtId: TDBEdit;
    dbmemInfo: TDBMemo;
    Label1: TLabel;
    lblid: TLabel;
    dbedtUser: TDBEdit;
    Label2: TLabel;
    lbLinks: TDBLookupListBox;
    memLinkInfo: TDBMemo;
    Label3: TLabel;
    pmLinks: TPopupMenu;
    miEditLink: TMenuItem;
    miAddLinks: TMenuItem;
    btnClose: TBitBtn;
    btnDeleteElem: TBitBtn;
    dbedtType_id: TDBEdit;
    gbIn: TGroupBox;
    dbedtType_name: TDBEdit;
    Label5: TLabel;
    cbCompName: TDBLookupComboBox;
    cbType_name: TDBLookupComboBox;
    bvl: TBevel;
    Label6: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    btnGetInfo: TBitBtn;
    btnCard: TBitBtn;
    btnShowDetali: TBitBtn;
    btnAddDetali: TBitBtn;
    procedure lbLinksClick(Sender: TObject);
    procedure lbLinksDblClick(Sender: TObject);
    procedure miEditLinkClick(Sender: TObject);
    procedure miAddLinksClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cbType_nameClick(Sender: TObject);
    procedure btnAddElemClick(Sender: TObject);
    procedure pmLinksPopup(Sender: TObject);
    procedure btnDeleteElemClick(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure btnCardClick(Sender: TObject);
    procedure btnShowDetaliClick(Sender: TObject);
    procedure btnAddDetaliClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbedtIdChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmElements: TfrmElements;

implementation
uses dmo, UnitLinks, unitAddElem,main, unitAddlinks, unitAddinfo, UnitCard,
  unitDetali, UnitAddDetali;
{$R *.dfm}

procedure TfrmElements.lbLinksClick(Sender: TObject);
begin
     lbLinks.Hint:=memLinkInfo.text;
     lbLinks.ShowHint:=true;
end;

procedure TfrmElements.lbLinksDblClick(Sender: TObject);
var s:pchar;
begin
   if lbLinks.SelectedItem <> '' then
   begin
           lbLinks.Refresh;
           s:=pchar(lbLinks.SelectedItem);
           ShellExecute (0, 'open', s, '', 'c:\', 1);
//           s:=nil;

   end;
end;

procedure TfrmElements.miEditLinkClick(Sender: TObject);
begin
 if lbLinks.SelectedItem <> '' then
   frmLink.show;
end;

procedure TfrmElements.miAddLinksClick(Sender: TObject);
begin
  frmAddLinks.elem_id:=StrToInt(dbedtid.Text);
  frmAddLinks.elem_name:=dbedtName.Text;  
  frmAddLinks.show;
end;

procedure TfrmElements.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmElements.cbType_nameClick(Sender: TObject);
begin
  ElemNavigator.BtnClick(nbEdit);
  try
    dbEdttype_id.Text:=intToStr(cbType_name.KeyValue);
  except;
  end;
end;

procedure TfrmElements.btnAddElemClick(Sender: TObject);
begin
  frmAddElem.show;
end;

procedure TfrmElements.pmLinksPopup(Sender: TObject);
begin
//lbLinks.SetFocus;
lbLinks.Refresh;
  miEditLink.Enabled:=lbLinks.SelectedItem <>'';

end;

procedure TfrmElements.btnDeleteElemClick(Sender: TObject);
begin
try
  try
    gbElem.Cursor:=crHourGlass;
    btnDeleteElem.Enabled:=false;
    if frmAddElem.delete_elem(dbEdtname.text,StrToInt(dbedtID.text),dm.qryWork) then
//      dm.tblElements.Refresh;
    frmElements.Close;
   finally
    gbElem.Cursor:=crDefault;
    btnDeleteElem.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmElements.btnGetInfoClick(Sender: TObject);
begin
  frmAddinfo.elem_id:=strToInt(dbedtID.Text);
  frmAddinfo.elem_name:=dbedtName.Text;
  frmAddInfo.show;
end;

procedure TfrmElements.btnCardClick(Sender: TObject);
begin
  frmCard.elem_id:=strToInt(dbedtID.Text);
  frmCard.elem_name:=dbedtName.Text;
  frmCard.show;
end;

procedure TfrmElements.btnShowDetaliClick(Sender: TObject);
begin
   frmDetali.elem_name:=dbedtname.Text;
   frmDetali.elem_id:=strToInt(dbedtID.Text);
   frmDetali.show;
end;

procedure TfrmElements.btnAddDetaliClick(Sender: TObject);
begin
   frmAdddetali.elem_id:=strToInt(dbedtID.text);
   frmAdddetali.elem_name:=dbedtName.text;   
   frmAdddetali.show;
end;

procedure TfrmElements.FormActivate(Sender: TObject);
begin
   btnAddDEtali.Enabled:=frmDetali.dbEdtType.Text='';
   btnShowDetali.Enabled:=frmDetali.dbEdtType.Text<>'';   
end;

procedure TfrmElements.dbedtIdChange(Sender: TObject);
begin
   btnAddDEtali.Enabled:=frmDetali.dbEdtType.Text='';
   btnShowDetali.Enabled:=frmDetali.dbEdtType.Text<>'';
end;

end.
