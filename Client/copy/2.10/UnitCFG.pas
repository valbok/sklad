unit UnitCFG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,DBClient,db;

type
  TfrmCFG = class(TForm)
    pnlMain: TPanel;
    pnlMain2: TPanel;
    gbElem: TGroupBox;
    cboxElem_id: TCheckBox;
    cboxUser_name: TCheckBox;
    cboxType_id: TCheckBox;
    cboxNumer: TCheckBox;
    cboxInfo: TCheckBox;
    cboxUnit_izmr: TCheckBox;
    cboxName: TCheckBox;
    gbDetali: TGroupBox;
    cboxType_name: TCheckBox;
    cboxTKS: TCheckBox;
    cboxDopusk: TCheckBox;
    cboxR: TCheckBox;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    lblCurrentUser: TLabel;
    lblUser: TLabel;
    Mem: TMemo;
    btnApply: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure setUser(user:string);
    procedure GetCFGFromFile(filename:string;
                        var cdsFind_elemWDELEMENT_ID: TIntegerField;
                    var cdsFind_elemWDNAME: TStringField;
                    var cdsFind_elemWDUNIT_IZMERENIE: TStringField;
                    var cdsFind_elemWDNUMER: TStringField;
                    var cdsFind_elemWDTYPE_ID: TIntegerField;
                    var cdsFind_elemWDINFO: TStringField;
                    var cdsFind_elemWDUSER_NAME: TStringField;
                    var cdsFind_elemWDRESISTANCE: TFloatField;
                    var cdsFind_elemWDDOPUSK: TFloatField;
                    var cdsFind_elemWDTKS: TStringField;
                    var cdsFind_elemWDTYPE_NAME: TStringField;
                    tr:string
                    );
    procedure SaveCFGToFile(filename:string;
                           var     elem_id,
                                name,
                                unit_izmr,
                                info,
                                numer,
                                type_id,
                                r,
                                dopusk,
                                tks,
                                type_name,
                                user_name:TcheckBox;var mem:Tmemo);

    procedure GetVisibleField(
                    var cdsFind_elemWDELEMENT_ID: TIntegerField;
                    var cdsFind_elemWDNAME: TStringField;
                    var cdsFind_elemWDUNIT_IZMERENIE: TStringField;
                    var cdsFind_elemWDNUMER: TStringField;
                    var cdsFind_elemWDTYPE_ID: TIntegerField;
                    var cdsFind_elemWDINFO: TStringField;
                    var cdsFind_elemWDUSER_NAME: TStringField;
                    var cdsFind_elemWDRESISTANCE: TFloatField;
                    var cdsFind_elemWDDOPUSK: TFloatField;
                    var cdsFind_elemWDTKS: TStringField;
                    var cdsFind_elemWDTYPE_NAME: TStringField;
                              var  elem_id,
                                name,
                                unit_izmr,
                                info,
                                numer,
                                type_id,
                                r,
                                dopusk,
                                tks,
                                type_name,
                                user_name:TcheckBox);
    procedure setVisibleField(
                    var cdsFind_elemWDELEMENT_ID: TIntegerField;
                    var cdsFind_elemWDNAME: TStringField;
                    var cdsFind_elemWDUNIT_IZMERENIE: TStringField;
                    var cdsFind_elemWDNUMER: TStringField;
                    var cdsFind_elemWDTYPE_ID: TIntegerField;
                    var cdsFind_elemWDINFO: TStringField;
                    var cdsFind_elemWDUSER_NAME: TStringField;
                    var cdsFind_elemWDRESISTANCE: TFloatField;
                    var cdsFind_elemWDDOPUSK: TFloatField;
                    var cdsFind_elemWDTKS: TStringField;
                    var cdsFind_elemWDTYPE_NAME: TStringField;
                              var  elem_id,
                                name,
                                unit_izmr,
                                info,
                                numer,
                                type_id,
                                r,
                                dopusk,
                                tks,
                                type_name,
                                user_name:TcheckBox);

    procedure btnSaveClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
   cfg='cfg\';
var
  frmCFG: TfrmCFG;

implementation
uses unitDMFindElem, UnitDMFind,main;
{$R *.dfm}
procedure TfrmCFG.GetCFGFromFile(
                    filename:string;
                    var cdsFind_elemWDELEMENT_ID: TIntegerField;
                    var cdsFind_elemWDNAME: TStringField;
                    var cdsFind_elemWDUNIT_IZMERENIE: TStringField;
                    var cdsFind_elemWDNUMER: TStringField;
                    var cdsFind_elemWDTYPE_ID: TIntegerField;
                    var cdsFind_elemWDINFO: TStringField;
                    var cdsFind_elemWDUSER_NAME: TStringField;
                    var cdsFind_elemWDRESISTANCE: TFloatField;
                    var cdsFind_elemWDDOPUSK: TFloatField;
                    var cdsFind_elemWDTKS: TStringField;
                    var cdsFind_elemWDTYPE_NAME: TStringField;
                    tr:string
                    );
var f:Tfile;
        p:integer;
        elem_id,
        unit_izmr,
        nam,
        info,
        numer,
        type_id,
        r,
        dopusk,
        tks,
        type_name,user_name :string;
begin
//showmessage(filename);
if not fileExists(filename) then
          exit;
  with frmMain do
   begin
     mainOpenFile(filename,f);
     find(f,'elem_id="',p,filepos(f));
     elem_id:=GetPath(f,p+9);
     find(f,'name="',p,filepos(f));
     nam:=GetPath(f,p+6);
     find(f,'unit_izmr="',p,filepos(f));
     unit_izmr:=GetPath(f,p+11);
     find(f,'info="',p,filepos(f));
     info:=GetPath(f,p+6);
     find(f,'numer="',p,filepos(f));
     numer:=GetPath(f,p+7);
     find(f,'type_id="',p,filepos(f));
     type_id:=GetPath(f,p+9);
     find(f,'r="',p,filepos(f));
     r:=GetPath(f,p+3);
     find(f,'dopusk="',p,filepos(f));
     dopusk:=GetPath(f,p+8);
     find(f,'tks="',p,filepos(f));
     tks:=GetPath(f,p+5);
     find(f,'type_name="',p,filepos(f));
     type_name:=GetPath(f,p+11);
     find(f,'user_name="',p,filepos(f));
     user_name:=GetPath(f,p+11);
{showmessage(
        elem_id+' '+
        unit_izmr+' '+
        nam+' '+
        info+' '+
        numer+' '+
        type_id+' '+
        r+' '+
        dopusk+' '+
        tks+' '+
        type_name+' '+user_name);}

     //установка
     cdsFind_elemWDELEMENT_ID.Visible     :=elem_id=tr;
     cdsFind_elemWDNAME.Visible           :=nam=tr;
     cdsFind_elemWDUNIT_IZMERENIE.Visible :=unit_izmr=tr;
     cdsFind_elemWDNUMER.Visible          :=numer=tr;
     cdsFind_elemWDTYPE_ID.Visible        :=type_id=tr;
     cdsFind_elemWDINFO.Visible           :=info=tr;
     cdsFind_elemWDUSER_NAME.Visible      :=user_name=tr;
     cdsFind_elemWDRESISTANCE.Visible     :=r=tr;
     cdsFind_elemWDDOPUSK.Visible         :=dopusk=tr;
     cdsFind_elemWDTKS.Visible            :=tks=tr;
     cdsFind_elemWDTYPE_NAME.Visible      :=type_name=tr;
    closeFile(f);
   end;
end;
procedure TfrmCFG.SaveCFGToFile(filename:string;
                               var elem_id,
                                name,
                                unit_izmr,
                                info,
                                numer,
                                type_id,
                                r,
                                dopusk,
                                tks,
                                type_name,
                                user_name:TcheckBox;var mem:Tmemo);
begin
      mem.Lines.Clear;
      mem.Lines.add('elem_id="'+boolToStr(elem_id.Checked)+'"');
      mem.Lines.add('name="'+BoolToStr(name.Checked)+'"');
      mem.Lines.add('unit_izmr="'+BoolToStr(unit_izmr.Checked)+'"');
      mem.Lines.add('info="'+BoolToStr(info.Checked)+'"');
      mem.Lines.add('numer="'+BoolToStr(numer.Checked)+'"');
      mem.Lines.add('type_id="'+BoolToStr(type_id.Checked)+'"');
      mem.Lines.add('r="'+BoolToStr(r.Checked)+'"');
      mem.Lines.add('dopusk="'+BoolToStr(dopusk.Checked)+'"');
      mem.Lines.add('tks="'+BoolToStr(tks.Checked)+'"');
      mem.Lines.add('type_name="'+BoolToStr(type_name.Checked)+'"');
      mem.Lines.add('user_name="'+BoolToStr(user_name.Checked)+'"');
      mem.Lines.SaveToFile(filename);
end;
//////////////////
procedure TfrmCFG.GetVisibleField(
                    var cdsFind_elemWDELEMENT_ID: TIntegerField;
                    var cdsFind_elemWDNAME: TStringField;
                    var cdsFind_elemWDUNIT_IZMERENIE: TStringField;
                    var cdsFind_elemWDNUMER: TStringField;
                    var cdsFind_elemWDTYPE_ID: TIntegerField;
                    var cdsFind_elemWDINFO: TStringField;
                    var cdsFind_elemWDUSER_NAME: TStringField;
                    var cdsFind_elemWDRESISTANCE: TFloatField;
                    var cdsFind_elemWDDOPUSK: TFloatField;
                    var cdsFind_elemWDTKS: TStringField;
                    var cdsFind_elemWDTYPE_NAME: TStringField;

                          var   elem_id,
                                name,
                                unit_izmr,
                                info,
                                numer,
                                type_id,
                                r,
                                dopusk,
                                tks,
                                type_name,
                                user_name:TcheckBox);
begin
   elem_id.Checked      := cdsFind_elemWDELEMENT_ID.Visible;
   name.Checked         := cdsFind_elemWDNAME.Visible;
   unit_izmr.Checked    := cdsFind_elemWDUNIT_IZMERENIE.Visible;
   numer.Checked        := cdsFind_elemWDNUMER.Visible;
   type_id.Checked      := cdsFind_elemWDTYPE_ID.Visible;
   info.Checked         := cdsFind_elemWDINFO.Visible;
   user_name.Checked    := cdsFind_elemWDUSER_NAME.Visible;
   r.Checked            := cdsFind_elemWDRESISTANCE.Visible;
   dopusk.Checked       := cdsFind_elemWDDOPUSK.Visible;
   tks.Checked          := cdsFind_elemWDTKS.Visible;
   type_name.Checked    := cdsFind_elemWDTYPE_NAME.Visible;
end;
////////////////////
procedure TfrmCFG.setVisibleField(
                    var cdsFind_elemWDELEMENT_ID: TIntegerField;
                    var cdsFind_elemWDNAME: TStringField;
                    var cdsFind_elemWDUNIT_IZMERENIE: TStringField;
                    var cdsFind_elemWDNUMER: TStringField;
                    var cdsFind_elemWDTYPE_ID: TIntegerField;
                    var cdsFind_elemWDINFO: TStringField;
                    var cdsFind_elemWDUSER_NAME: TStringField;
                    var cdsFind_elemWDRESISTANCE: TFloatField;
                    var cdsFind_elemWDDOPUSK: TFloatField;
                    var cdsFind_elemWDTKS: TStringField;
                    var cdsFind_elemWDTYPE_NAME: TStringField;
                              var  elem_id,
                                name,
                                unit_izmr,
                                info,
                                numer,
                                type_id,
                                r,
                                dopusk,
                                tks,
                                type_name,
                                user_name:TcheckBox);
begin
   cdsFind_elemWDELEMENT_ID.Visible     :=   elem_id.Checked;
   cdsFind_elemWDNAME.Visible           :=   name.Checked;
   cdsFind_elemWDUNIT_IZMERENIE.Visible :=   unit_izmr.Checked;
   cdsFind_elemWDNUMER.Visible          :=   numer.Checked;
   cdsFind_elemWDTYPE_ID.Visible        :=   type_id.Checked;
   cdsFind_elemWDINFO.Visible           :=   info.Checked;
   cdsFind_elemWDUSER_NAME.Visible      :=   user_name.Checked;
   cdsFind_elemWDRESISTANCE.Visible     :=   r.Checked;
   cdsFind_elemWDDOPUSK.Visible         :=   dopusk.Checked;
   cdsFind_elemWDTKS.Visible            :=   tks.Checked;
   cdsFind_elemWDTYPE_NAME.Visible      :=   type_name.Checked; 
end;
////////////
procedure TfrmCFG.setUser(user:string);
begin
        lblUser.Caption:=user;
end;
/////////
procedure TfrmCFG.btnCloseClick(Sender: TObject);
begin
  Close;
end;
/////////
procedure TfrmCFG.btnSaveClick(Sender: TObject);
begin
try
  try
       gbElem.Cursor:=crHourGlass;
       btnSave.Enabled:=false;
    if messageDLG('Сохранить изменения?',mtConfirmation,[mbYes,mbNo],0) =mrNo then exit;
      with dmfindElem do
      begin
       SetVisibleField(   cdsFind_elemWDELEMENT_ID,
                          cdsFind_elemWDNAME,
                          cdsFind_elemWDUNIT_IZMERENIE,
                          cdsFind_elemWDNUMER,
                          cdsFind_elemWDTYPE_ID,
                          cdsFind_elemWDINFO,
                          cdsFind_elemWDUSER_NAME,
                          cdsFind_elemWDRESISTANCE,
                          cdsFind_elemWDDOPUSK,
                          cdsFind_elemWDTKS,
                          cdsFind_elemWDTYPE_NAME,
                          cboxelem_id,
                          cboxname,
                          cboxunit_izmr,
                          cboxInfo,
                          cboxNumer,
                          cboxType_id,
                          cboxR,
                          cboxDopusk,
                          cboxTKS,
                          cboxType_name,
                          cboxUser_name
                    );
        // ещё раз вызываем, для того чтобы 2 кдс были втупили в силу
       SetVisibleField(   cdsFind_elemELEMENT_ID,
                          cdsFind_elemNAME,
                          cdsFind_elemUNIT_IZMERENIE,
                          cdsFind_elemNUMER,
                          cdsFind_elemTYPE_ID,
                          cdsFind_elemINFO,
                          cdsFind_elemUSER_NAME,
                          cdsFind_elemWDRESISTANCE,
                          cdsFind_elemWDDOPUSK,
                          cdsFind_elemWDTKS,
                          cdsFind_elemWDTYPE_NAME,
                          cboxelem_id,
                          cboxname,
                          cboxunit_izmr,
                          cboxInfo,
                          cboxNumer,
                          cboxType_id,
                          cboxR,
                          cboxDopusk,
                          cboxTKS,
                          cboxType_name,
                          cboxUser_name
                    );
    SaveCFGToFile(cfg+lbluser.Caption,
                          cboxelem_id,
                          cboxname,
                          cboxunit_izmr,
                          cboxInfo,
                          cboxNumer,
                          cboxType_id,
                          cboxR,
                          cboxDopusk,
                          cboxTKS,
                          cboxType_name,
                          cboxUser_name,
                          mem
                          );
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

procedure TfrmCFG.btnApplyClick(Sender: TObject);
begin
try
  try
       gbElem.Cursor:=crHourGlass;
       btnSave.Enabled:=false;
    if messageDLG('Применить изменения?',mtConfirmation,[mbYes,mbNo],0) =mrNo then exit;
      with dmfindElem do
      begin
       SetVisibleField(   cdsFind_elemWDELEMENT_ID,
                          cdsFind_elemWDNAME,
                          cdsFind_elemWDUNIT_IZMERENIE,
                          cdsFind_elemWDNUMER,
                          cdsFind_elemWDTYPE_ID,
                          cdsFind_elemWDINFO,
                          cdsFind_elemWDUSER_NAME,
                          cdsFind_elemWDRESISTANCE,
                          cdsFind_elemWDDOPUSK,
                          cdsFind_elemWDTKS,
                          cdsFind_elemWDTYPE_NAME,
                          cboxelem_id,
                          cboxname,
                          cboxunit_izmr,
                          cboxInfo,
                          cboxNumer,
                          cboxType_id,
                          cboxR,
                          cboxDopusk,
                          cboxTKS,
                          cboxType_name,
                          cboxUser_name
                    );
        // ещё раз вызываем, для того чтобы 2 кдс были втупили в силу
       SetVisibleField(   cdsFind_elemELEMENT_ID,
                          cdsFind_elemNAME,
                          cdsFind_elemUNIT_IZMERENIE,
                          cdsFind_elemNUMER,
                          cdsFind_elemTYPE_ID,
                          cdsFind_elemINFO,
                          cdsFind_elemUSER_NAME,
                          cdsFind_elemWDRESISTANCE,
                          cdsFind_elemWDDOPUSK,
                          cdsFind_elemWDTKS,
                          cdsFind_elemWDTYPE_NAME,
                          cboxelem_id,
                          cboxname,
                          cboxunit_izmr,
                          cboxInfo,
                          cboxNumer,
                          cboxType_id,
                          cboxR,
                          cboxDopusk,
                          cboxTKS,
                          cboxType_name,
                          cboxUser_name
                    );
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

end.
