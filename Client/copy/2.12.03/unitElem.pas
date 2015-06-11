unit unitElem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Mask, Menus,shellApi, Buttons;

type
  TfrmElements = class(TForm)
    pnlMain: TPanel;
    gbElem: TGroupBox;
    lblName: TLabel;
    lblUnit: TLabel;
    lblNumer: TLabel;
    Label1: TLabel;
    lblid: TLabel;
    Label2: TLabel;
    pmLinks: TPopupMenu;
    miEditLink: TMenuItem;
    miAddLinks: TMenuItem;
    btnClose: TBitBtn;
    btnDeleteElem: TBitBtn;
    btnGetInfo: TBitBtn;
    btnCard: TBitBtn;
    btnShowDetali: TBitBtn;
    btnAddDetali: TBitBtn;
    eName: TEdit;
    eUnit: TEdit;
    Enumer: TEdit;
    eid: TEdit;
    memInfo: TMemo;
    EUser: TEdit;
    btnSave: TBitBtn;
    eOstatok: TEdit;
    Label4: TLabel;
    sbShowLinks: TSpeedButton;
    lbLinks: TDBLookupListBox;
    gbIn: TGroupBox;
    Label7: TLabel;
    eType_name: TEdit;
    sbMoveTo: TSpeedButton;
    pnlRight: TPanel;
    Label6: TLabel;
    Label3: TLabel;
    cbType_name: TDBLookupComboBox;
    cbCompName: TDBLookupComboBox;
    eType_id: TEdit;
    Label5: TLabel;
    eNewType_id: TEdit;
    Label8: TLabel;
    miRefresh: TMenuItem;
    eComp_name: TEdit;
    Label10: TLabel;
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
    procedure SetElem(name,unit_izmr,numer,info,user,type_name:string;type_id,id:integer;ostatok:real;Comp_name:string);
    procedure btnSaveClick(Sender: TObject);
    procedure sbShowLinksClick(Sender: TObject);
    procedure sbMoveToClick(Sender: TObject);
    procedure miRefreshClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmElements: TfrmElements;

implementation
uses dmo, UnitLinks, unitAddElem,main, unitAddlinks, unitAddinfo, UnitCard,
  unitDetali, UnitAddDetali, DB;
{$R *.dfm}

procedure TfrmElements.SetElem(name,unit_izmr,numer,info,user,type_name:string;type_id,id:integer;ostatok:real;Comp_name:string);
begin
try
try
   eName.Text:=name;
   eUnit.Text:=unit_izmr;
   enumer.Text:=Numer;
   meminfo.Text:=Info;
   eUser.Text:=user;
   eid.Text:=inttOsTR(id);
   eostatok.Text:=floatToStr(ostatok);
   etype_name.text:=type_name;
   eType_id.Text:=intToStr(type_id);
   eNewType_id.Text:=intToStr(type_id);
   eComp_name.text:=Comp_name;
 finally
 end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;
procedure TfrmElements.lbLinksClick(Sender: TObject);
begin
  try
     lbLinks.Hint:=dm.qryLinks_by_elem.fieldByName('info').AsString;
     lbLinks.ShowHint:=true;
  except
  end;
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
with dm do begin
 if lbLinks.SelectedItem = '' then exit;
     frmlink.SetLinkInfo(qryLinks_by_elem.fieldByName('link').AsString,
                         qryLinks_by_elem.fieldByName('info').AsString,
                         qryLinks_by_elem.fieldByName('user_name').AsString,
                         intToStr(qryLinks_by_elem.fieldByName('link_id').AsInteger));
     frmLink.show;
   end;
end;

procedure TfrmElements.miAddLinksClick(Sender: TObject);
begin
  frmAddLinks.elem_id:=StrToInt(eid.Text);
  frmAddLinks.elem_name:=eName.Text;
  frmAddLinks.show;
end;

procedure TfrmElements.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmElements.cbType_nameClick(Sender: TObject);
begin

  try
    eNewType_id.Text:=intToStr(cbType_name.KeyValue);
  except;
  end;
end;

procedure TfrmElements.btnAddElemClick(Sender: TObject);
begin
  frmAddElem.show;
end;

procedure TfrmElements.pmLinksPopup(Sender: TObject);
begin
lbLinks.SetFocus;
lbLinks.Refresh;
  miEditLink.Enabled:=lbLinks.SelectedItem <>'';

end;

procedure TfrmElements.btnDeleteElemClick(Sender: TObject);
begin
try
  try
    gbElem.Cursor:=crHourGlass;
    btnDeleteElem.Enabled:=false;
   if messageDlg('Вы уверены, что желаете удалить элемент?'+#13#10+'"'+Ename.text+'"'+#13#10+'При этом удаляться все записи из других таблиц связаные с этим элементом!',mtConfirmation,[mbYes,MbNo],0) = mrno then exit;
    if frmAddElem.delete_elem(Ename.text,StrToInt(eID.text),dm.qryDelete_Element) then
        showmessage('оперция выполнена успешно');
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
  frmAddinfo.elem_id:=strToInt(eID.Text);
  frmAddinfo.elem_name:=eName.Text;
  frmAddInfo.show;
end;

procedure TfrmElements.btnCardClick(Sender: TObject);
begin
  frmCard.elem_id:=strToInt(eID.Text);
  frmCard.elem_name:=eName.Text;
  if dm.qryInfo_by_elem.Active then dm.qryInfo_by_elem.close;
  dm.qryInfo_by_elem.ParamByName('element_id').AsInteger:=strToInt(eID.Text);
  dm.qryInfo_by_elem.Open;
  frmCard.show;  
end;

procedure TfrmElements.btnShowDetaliClick(Sender: TObject);
begin
   with frmDetali,dm do
   begin
      elem_name:=ename.Text;
      elem_id:=strToInt(eID.Text);
      openDetali_by_elem(qryDetali_by_elem);
      setInfo(qryDetali_by_elem.fieldByName('type_name').AsString,
              floatToStr(qryDetali_by_elem.fieldByName('resistance').AsFloat),
              floatToStr(qryDetali_by_elem.fieldByName('dopusk').Asfloat),
              qryDetali_by_elem.fieldByName('tks').AsString,
              qryDetali_by_elem.fieldByName('user_name').AsString
                );
      show;
   end;
end;

procedure TfrmElements.btnAddDetaliClick(Sender: TObject);
begin
   frmAdddetali.elem_id:=strToInt(eID.text);
   frmAdddetali.elem_name:=eName.text;
   frmAdddetali.show;
end;

procedure TfrmElements.FormActivate(Sender: TObject);
begin
{   btnAddDEtali.Enabled:=frmDetali.EType.Text='';
   btnShowDetali.Enabled:=frmDetali.EType.Text<>'';}
end;

procedure TfrmElements.dbedtIdChange(Sender: TObject);
begin
{   btnAddDEtali.Enabled:=frmDetali.dbEdtType.Text='';
   btnShowDetali.Enabled:=frmDetali.dbEdtType.Text<>'';}
end;

procedure TfrmElements.btnSaveClick(Sender: TObject);
begin
with dm do
try
 try
    gbElem.Cursor:=crHourGlass;
    btnSave.Enabled:=false;
    if qryUpdateElem.Active then qryUpdateElem.close;
    with qryUpdateElem do
    begin
      ParamByName('element_id').AsInteger:=StrToInt(eid.text);
      ParamByName('name').Asstring:=eName.text;
      ParamByName('unit_izmr').Asstring:=eunit.text;
      ParamByName('Numer').Asstring:=eNumer.text;
      ParamByName('info').Asstring:=memInfo.text;
      ParamByName('type_id').AsInteger:=strToInt(eNewType_id.Text);
      ExecSQL;
    end;
    showmessage('Операция выполнена успешно');
    if eType_id.Text<>eNewType_id.Text then
    begin
      eType_name.Text:=cbType_name.Text;
      eType_id.Text:=eNewType_id.Text;
    end;
   finally
    gbElem.Cursor:=crDefault;
    btnSave.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmElements.sbShowLinksClick(Sender: TObject);
begin
with dm do
 try
  try
   sbShowLinks.Enabled:=false;
   if qryLinks_by_elem.Active then qryLinks_by_elem.close;
   qryLinks_by_elem.ParamByName('element_id').AsInteger:=StrToInt(eid.text);
   qryLinks_by_elem.Open;
  finally
   sbShowLinks.Enabled:=true;
  end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmElements.sbMoveToClick(Sender: TObject);
begin
try
 try
  sbMoveTo.Enabled:=false;
  gbin.Cursor:=crHourGlass;
  cbCompName.ListSource:=DM.dsQryComponents;
  cbCompName.ListField:='NAME';
  cbCompName.KeyField:='COMPONENT_ID';
  if not dm.qryTypesMoveTo.Active then
     dm.qryTypesMoveTo.Open;
  if not dm.qryComponents.Active then
     dm.qryComponents.Open;

  pnlRight.Enabled:=true;

  finally
   sbMoveTo.Enabled:=true;
   gbin.Cursor:=crDefault;

  end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmElements.miRefreshClick(Sender: TObject);
begin
    sbShowLinks.Click;
end;

end.
