unit unadd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,shellApi,
  Dialogs, ExtCtrls, ComCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,IBTable,IBQuery,
  Mask,db,DBClient, Menus, ekbasereport, ekrtf;

type
  TfrmManeger = class(TForm)
    PanelMain: TPanel;
    PageControl1: TPageControl;
    btnClose: TBitBtn;
    MainMenu: TMainMenu;
    btnAllConnect: TMenuItem;
    Ajhvf1: TMenuItem;
    N5: TMenuItem;
    EkRTFCard: TEkRTF;
    N1: TMenuItem;
    btnShowFindForm: TMenuItem;
    TabManeger: TTabSheet;
    pnlMain: TPanel;
    grid: TDBGrid;
    pmManeger: TPopupMenu;
    miEdit: TMenuItem;
    miDelete: TMenuItem;
    miAdd: TMenuItem;
    pnlTop: TPanel;
    sbLeft: TSpeedButton;
    lblTBLName: TLabel;
    llPut6: TLabel;
    Label9: TLabel;
    edtPath: TEdit;
    miCard: TMenuItem;
    miRefresh: TMenuItem;
    Actions: TMenuItem;
    miOstatki: TMenuItem;
    PnlRight: TPanel;
    Anim: TAnimate;
    N2: TMenuItem;
    miAddToZakaz: TMenuItem;
    miCreate: TMenuItem;
    N3: TMenuItem;
    miDEl: TMenuItem;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAllConnectClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    /////////my
    procedure LocateComponent(name:string);
    procedure LocateNextComponent(name:string);    
    procedure LocateElem(nam:string);
    procedure LocateNextElem(nam:string);    
    procedure LocateType(nam:String);
    procedure LocateNextType(nam:string);
    procedure btnShowFindFormClick(Sender: TObject);
    procedure printCard(id_elem:integer);
    procedure gridDblClick(Sender: TObject);
    procedure sbLeftClick(Sender: TObject);
    procedure miEditClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
    procedure pmManegerPopup(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure miCardClick(Sender: TObject);
    function ZamenaDotNakoma(st :string):string;
    procedure miRefreshClick(Sender: TObject);
    procedure ActionsClick(Sender: TObject);
    procedure gridKeyPress(Sender: TObject; var Key: Char);
    procedure miOstatkiClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure miAddToZakazClick(Sender: TObject);
    procedure miCreateClick(Sender: TObject);
    procedure miDElClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
        TableNameComp: string ='Комплектующие';
        TableNameType: string ='Типы';
        TableNameElem: string ='Элементы';
        s: string ='reports/s.avi';
var
  frmManeger: TfrmManeger;
{  currentComp_id:integer;
  currentComp_Name:string;}

{  currentType_id:integer;
  currentType_name:string;}
implementation
uses dmo,unitOstatki,unitFind, UnitLinks, unitComp,
  unitTypes, unitElem, UnitAddComp, unitAddType, unitAddElem,
  UnitCard, Unitdm3, unitFindToManeger,unitdmBDE;

{$R *.dfm}

function find(var tbl:TIBTable;field:string;pole:variant;typ:tLocateOption;p:string;strOr:byte):string;overload;
begin
if (not tbl.Locate(Field,pole,[typ]))
     then
       begin
        case strOr of
          1:       MessageDlg('Элемент со значением  "'+pole+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          0:       MessageDlg('Элемент со значением  "'+floatToStr(pole)+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          2:       MessageDlg('Элемент со значением  "'+dateToStr(pole)+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          end;
       end;
end;
function find(var tbl:TClientDataSet;field:string;pole:variant;typ:tLocateOption;p:string;strOr:byte):string; overload;
begin
if (not tbl.Locate(Field,pole,[typ]))
     then
       begin
        case strOr of
          1:       MessageDlg('Элемент со значением  "'+pole+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          0:       MessageDlg('Элемент со значением  "'+floatToStr(pole)+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          2:       MessageDlg('Элемент со значением  "'+dateToStr(pole)+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          end;
       end;
end;
function find(var tbl:TIBQuery;field:string;pole:variant;typ:tLocateOption;p:string;strOr:byte):string; overload;
begin
if (not tbl.Locate(Field,pole,[typ]))
     then
       begin
        case strOr of
          1:       MessageDlg('Элемент со значением  "'+pole+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          0:       MessageDlg('Элемент со значением  "'+floatToStr(pole)+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          2:       MessageDlg('Элемент со значением  "'+dateToStr(pole)+'" в поле "'+p+'" не найден!',mtInformation,[mbOk],0);
          end;
       end;
end;

procedure TfrmManeger.LocateComponent(name:string);
begin
 try
  try
   try
    Anim.FileName:=s;
    anim.Active:=true;
   except
   end;

    if (dm.IBDatabase.Connected=true) and
    (not dm.qryComponents.Locate('name',name,[loPartialKey]))
      then
//        MessageDlg('Компонент "'+name+'" не найден!',mtInformation,[mbOk],0);
   finally
    anim.Active:=false;
   end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;
////////
procedure TfrmManeger.LocateNextComponent(name:string);
begin
 try
  try
   try
    Anim.FileName:=s;
    anim.Active:=true;
   except
   end;

    if (dm.IBDatabase.Connected=true) and
    (not dm.qryComponents.Locate('name',name,[loPartialKey]))
      then
//        MessageDlg('Компонент "'+name+'" не найден!',mtInformation,[mbOk],0);
   finally
    anim.Active:=false;
   end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;
/////////
function TfrmManeger.ZamenaDotNakoma(st :string):string;
var i: integer;
const  arr: set of char =['0'..'9','.'];
begin
     result:='';
     for i:=1 to length(st) do
     begin
      if not (st[i] in arr) then
        continue;


      if st[i]='.' then
         result:=result+',' else
           result:=result+st[i];
     end;
end;
procedure TfrmManeger.LocateElem(nam:string);
begin
with dm do
try
  try
   try
     Anim.FileName:=s;
     anim.Active:=true;
   except
   end;
     cursor:=crHourGlass;
     qryElems_by_type.Locate('name',nam,[loPartialKey]);
   finally
     cursor:=crDefault;
     anim.Active:=false;
   end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;


end;
///////
procedure TfrmManeger.LocateNextElem(nam:string);
begin
with dm do
try
  try
   try
     Anim.FileName:=s;
     anim.Active:=true;
   except
   end;
     cursor:=crHourGlass;
     qryElems_by_type.LocateNext('name',nam,[loPartialKey]);
   finally
     cursor:=crDefault;
     anim.Active:=false;
   end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;
//////
procedure TfrmManeger.LocateType(nam:string);
begin
with dm do
try
  try
    try
      Anim.FileName:=s;
      anim.Active:=true;
    except
    end;
    cursor:=crHourGlass;
    qrytypes_by_comp.Locate('name',nam,[loPartialKey]);
  finally
    cursor:=crDefault;
    anim.Active:=false;
  end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;


end;
///////////
procedure TfrmManeger.LocateNextType(nam:string);
begin
with dm do
try
  try
   try
     Anim.FileName:=s;
     anim.Active:=true;
   except
   end;
    cursor:=crHourGlass;
    qrytypes_by_comp.LocateNext('name',nam,[loPartialKey]);
   finally
    cursor:=crDefault;
    anim.Active:=false;
   end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;


end;
////////
procedure TfrmManeger.btnCloseClick(Sender: TObject);
begin
   close;
end;

procedure TfrmManeger.btnAllConnectClick(Sender: TObject);
begin
  with dm,dm3 do
  begin
   try
     try
     grid.Cursor:=crHourGlass;
//   anim.Active:=true;
     qryComponents.Open;
    finally
     grid.Cursor:=crDefault;
//      anim.Active:=false;
     end;
    except
     on E:EXCEPTION do
      messageDlg(e.Message,mtError,[mbOk],0);
    end;
   end;
end;

procedure TfrmManeger.N5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmManeger.N4Click(Sender: TObject);
begin
   dm.IBTransaction.commit;
   btnAllConnect.click;
end;
{
procedure TfrmManeger.printCard(id_elem:integer);
var
thedate,arrival,charge,ostatok,nam,num_p_p,from_whom,
unit_izmerenie,cost_for_one,num_doc,type_name,numer:string;
id:integer;
ar,ch,o,cost:real;
begin
    with dm do
    begin
    try
      try
        if not IBDatabase.Connected
            then IBDatabase.Connected:=true;
        if not IBTransaction.Active
            then IBTransaction.Active:=true;
        if tblCard.Exists then
        begin
               IBTransaction.Commit;
               if not IBTransaction.Active
                    then IBTransaction.Active:=true;
               tblCard.DeleteTable;
               IBTransaction.Commit;
        end;
            if not IBTransaction.Active
                then IBTransaction.Active:=true;
           tblCard.CreateTable;
//         dbgridInfo.DataSource:=dsCard;
           IBTransaction.Commit;
      if qryWork.Active then  qryWork.Close;
      if qryConsole.Active then  qryConsole.Close;
      if   qrySrez_by_elem_id.Active then qrySrez_by_elem_id.Close;
        qryCard.ParamByName('pelement_id').Asinteger:=id_elem;
        qryCard.Open;
        qryCard.First;
        while not qryCard.Eof do
           begin
                num_p_p:=intToStr(qryCard.fieldByname('num_p_p').AsInteger);

                qrySrez_by_elem_id.ParamByName('id_elem').AsInteger:=id_elem;
                qrySrez_by_elem_id.ParamByName('num_p_p').AsInteger:=StrToInt(num_p_p);
//                qryConsole.SQL.Text:='select srez_id,num_p_p,date_of_srez from srez where element_id='+intToStr(id_elem)+ ' and num_p_p = '+num_p_p;
                qrySrez_by_elem_id.Open;
//                   qryConsole.Open;

                thedate:=DateToStr(qryCard.fieldByname('thedate').AsDateTime);
                num_doc:=qryCard.fieldByname('num_doc').Asstring;
                from_whom:=qryCard.fieldByname('from_whom').Asstring;

                numer:=frmostatki.zamenaKomaNaDot(qryCard.fieldByname('numer').Asstring);
                ar:=qryCard.fieldByname('arrival').AsFloat;
                ch:= qryCard.fieldByname('charge').AsFloat;
                o:=qryCard.fieldByname('ostatok').AsFloat;
                arrival:=frmostatki.zamenaKomaNaDot(floatToStr(qryCard.fieldByname('arrival').AsFloat));
                charge:=frmostatki.zamenaKomaNaDot(floatToStr(qryCard.fieldByname('charge').AsFloat));
                ostatok:=(floatToStr(qryCard.fieldByname('ostatok').AsFloat));
           if StrToFloat(ostatok) < 1 then
                         str(StrToFloat(ostatok):2:2,ostatok);
//                ostatok:=frmostatki.zamenaKomaNaDot(ostatok);
                cost_for_one:=frmostatki.zamenaKomaNaDot(floatToStr(qryCard.fieldByname('cost').AsFloat));
                  cost:=(qryCard.fieldByname('cost').AsFloat);
                unit_izmerenie:=qryCard.fieldByname('unit_izmerenie').Asstring;
                nam:=qryCard.fieldByname('name').Asstring;
                type_name:=qryCard.fieldByname('type_name').Asstring;
                id:=(qrySrez_by_elem_id.FieldByName('srez_id').AsInteger);
//                showmessage(intToStr(0)); exit;
                   if (id = 0) then
                     begin
//                     fuck;
                     qryInsertIntoCard.ParamByName('num_p_p').AsInteger:=strToInt(num_p_p);
                     qryInsertIntoCard.ParamByName('thedate').AsDateTime:=strTodate(thedate);
                     qryInsertIntoCard.ParamByName('num_doc').Asstring:=num_doc;
                     qryInsertIntoCard.ParamByName('from_whom').Asstring:=from_whom;
                     qryInsertIntoCard.ParamByName('arrival').AsFloat:=ar;
                     qryInsertIntoCard.ParamByName('charge').AsFloat:=ch;
                     qryInsertIntoCard.ParamByName('ostatok').AsFloat:=strToFloat(ostatok);
                     qryInsertIntoCard.ParamByName('nam').Asstring:=nam;
                     qryInsertIntoCard.ParamByName('type_name').Asstring:=type_name;
                     qryInsertIntoCard.ParamByName('cost_for_one').AsFloat:=cost;
                     qryInsertIntoCard.ParamByName('unit_izmerenie').Asstring:=unit_izmerenie;
                     qryInsertIntoCard.ParamByName('numer').Asstring:=numer;

// qryWork.SQL.Text:='insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,charge,ostatok,name,type_name,cost_for_one,unit_izmerenie,numer)  values('+num_p_p+','''+thedate+''','''+num_doc+''','''+from_whom+''','+arrival+','+charge+','+ostatok+','''+nam+''','''+type_name+''','+cost_for_one+','''+unit_izmerenie+''','''+numer+''')';
//                        showmessage(qryWork.SQL.Text);
//                        qryWork.open;
                      qryInsertIntoCard.ExecSQL;
                     end else
                        begin
                     qryInsertIntoCard.ParamByName('num_p_p').AsInteger:=strToInt(num_p_p);
                     qryInsertIntoCard.ParamByName('thedate').AsDateTime:=strTodate(thedate);
                     qryInsertIntoCard.ParamByName('num_doc').Asstring:=num_doc;
                     qryInsertIntoCard.ParamByName('from_whom').Asstring:=from_whom;
                     qryInsertIntoCard.ParamByName('arrival').AsFloat:=ar;
                     qryInsertIntoCard.ParamByName('charge').AsFloat:=ch;
                     qryInsertIntoCard.ParamByName('ostatok').AsFloat:=strToFloat(ostatok);
                     qryInsertIntoCard.ParamByName('nam').Asstring:=nam;
                     qryInsertIntoCard.ParamByName('type_name').Asstring:=type_name;
                     qryInsertIntoCard.ParamByName('cost_for_one').AsFloat:=cost;
                     qryInsertIntoCard.ParamByName('unit_izmerenie').Asstring:=unit_izmerenie;
                     qryInsertIntoCard.ParamByName('numer').Asstring:=numer;
                     qryInsertIntoCard.ExecSQL;
//   qryWork.SQL.Text:='insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,charge,ostatok,name,type_name,cost_for_one,unit_izmerenie,numer)  values('+num_p_p+','''+thedate+''','''+num_doc+''','''+from_whom+''','+arrival+','+charge+','+ostatok+','''+nam+''','''+type_name+''','+cost_for_one+','''+unit_izmerenie+''','''+numer+''')';
//    showmessage(qryWork.SQL.Text);
//                          qryWork.open;
    qryWork.SQL.Text:='insert into Card (thedate,ostatok,name,type_name,from_whom)  values('''+dateToStr(qryConsole.FieldByName('date_of_srez').asDateTime)+''','+ostatok+','''+nam+''','''+type_name+''',''Остаток'')';
//    showmessage(qryWork.SQL.Text);
                          qryWork.ExecSQL;
                        end;
                qryCard.Next;
           end;
    tblCard.Open;
      With EKRTFCArd do
        Begin
         OutFile:=CreateFileName('','reports\tmp\card');
         ExecuteOpen([tblCard],SW_SHOW);
        End;
               IBTransaction.Commit;
               if not IBTransaction.Active then IBTransaction.Active:=true;
               tblCard.DeleteTable;
               IBTransaction.Commit;
    btnAllConnect.click;
      finally
//      DBGridInfo.Cursor:=crDefault;
//      btnImportCard.Enabled:=true;
//      cbElem.SetFocus;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

    end;

end;
////////////                                                }
procedure TfrmManeger.printCard(id_elem:integer);
var
   thedate,arrival,charge,ostatok,nam,num_p_p,from_whom,
   unit_izmerenie,cost_for_one,num_doc,type_name,numer:string;
   id:integer;
   ar,ch,o,cost,ostatokf:real;
begin
    with dmBDE do
    begin
    try
      try
//      if qryWork.Active then  qryWork.Close;
      if  tblCard.Active then
           tblCard.close;
      try
        qrydeleteFromCard.ExecSQL;
      except
        qrydeleteFromCard.ExecSQL;
      end;
//      if qryConsole.Active then  qryConsole.Close;
//      if   qrySrez_by_elem_id.Active then qrySrez_by_elem_id.Close;
        if dm.qryCard.Active then dm.qryCard.Close;
        dm.qryCard.ParamByName('pelement_id').Asinteger:=id_elem;

        dm.qryCard.Open;
        dm.qryCard.First;
        while not dm.qryCard.Eof do
           begin
                num_p_p:=intToStr(dm.qryCard.fieldByname('num_p_p').AsInteger);
                dm.qrySrez_by_elem_id.ParamByName('id_elem').AsInteger:=id_elem;
                dm.qrySrez_by_elem_id.ParamByName('num_p_p').AsInteger:=StrToInt(num_p_p);
//                qryConsole.SQL.Text:='select srez_id,num_p_p,date_of_srez from srez where element_id='+intToStr(id_elem)+ ' and num_p_p = '+num_p_p;
                dm.qrySrez_by_elem_id.Open;
//                   qryConsole.Open;

                thedate:=DateToStr(dm.qryCard.fieldByname('thedate').AsDateTime);
                num_doc:=dm.qryCard.fieldByname('num_doc').Asstring;
                from_whom:=dm.qryCard.fieldByname('from_whom').Asstring;

                numer:=frmostatki.zamenaKomaNaDot(dm.qryCard.fieldByname('numer').Asstring);
                ar:=dm.qryCard.fieldByname('arrival').AsFloat;
                ch:= dm.qryCard.fieldByname('charge').AsFloat;
                o:=dm.qryCard.fieldByname('ostatok').AsFloat;
                arrival:=frmostatki.zamenaKomaNaDot(floatToStr(dm.qryCard.fieldByname('arrival').AsFloat));
                charge:=frmostatki.zamenaKomaNaDot(floatToStr(dm.qryCard.fieldByname('charge').AsFloat));
//                ostatok:=(floatToStr(dm.qryCard.fieldByname('ostatok').AsFloat));
                ostatokf:=(dm.qryCard.fieldByname('ostatok').AsFloat);
//           if StrToFloat(ostatok) < 1 then
//                         str(StrToFloat(ostatok):2:2,ostatok);
           if ostatokf < 1 then
           begin
                         str(ostatokf:2:2,ostatok);
                try
                    ostatokf:=StrToFloat(ostatok);
                except;
                    ostatokf:=StrToFloat(frmManeger.ZamenaDotNakoma(ostatok));
                end;
           end;
                cost_for_one:=frmostatki.zamenaKomaNaDot(floatToStr(dm.qryCard.fieldByname('cost').AsFloat));
                cost:=(dm.qryCard.fieldByname('cost').AsFloat);
                unit_izmerenie:=dm.qryCard.fieldByname('unit_izmerenie').Asstring;
                nam:=dm.qryCard.fieldByname('name').Asstring;
                type_name:=dm.qryCard.fieldByname('type_name').Asstring;
                id:=(dm.qrySrez_by_elem_id.FieldByName('srez_id').AsInteger);
//                showmessage(intToStr(0)); exit;
                   if (id = 0) then
                     begin
//                     fuck;
                     qryInsertIntoCard.ParamByName('num_p_p').AsInteger:=strToInt(num_p_p);
                     qryInsertIntoCard.ParamByName('thedate').AsDateTime:=strTodate(thedate);
                     qryInsertIntoCard.ParamByName('num_doc').Asstring:=num_doc;
                     qryInsertIntoCard.ParamByName('from_whom').Asstring:=from_whom;
                     qryInsertIntoCard.ParamByName('arrival').AsFloat:=ar;
                     qryInsertIntoCard.ParamByName('charge').AsFloat:=ch;
                     qryInsertIntoCard.ParamByName('ostatok').AsFloat:=(ostatokf);
                     qryInsertIntoCard.ParamByName('nam').Asstring:=nam;
                     qryInsertIntoCard.ParamByName('type_name').Asstring:=type_name;
                     qryInsertIntoCard.ParamByName('cost_for_one').AsFloat:=cost;
                     qryInsertIntoCard.ParamByName('unit_izmerenie').Asstring:=unit_izmerenie;
                     qryInsertIntoCard.ParamByName('numer').Asstring:=numer;

// qryWork.SQL.Text:='insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,charge,ostatok,name,type_name,cost_for_one,unit_izmerenie,numer)  values('+num_p_p+','''+thedate+''','''+num_doc+''','''+from_whom+''','+arrival+','+charge+','+ostatok+','''+nam+''','''+type_name+''','+cost_for_one+','''+unit_izmerenie+''','''+numer+''')';
//                        showmessage(qryWork.SQL.Text);
//                        qryWork.open;
                      qryInsertIntoCard.ExecSQL;
                     end else
                        begin
                     qryInsertIntoCard.ParamByName('num_p_p').AsInteger:=strToInt(num_p_p);
                     qryInsertIntoCard.ParamByName('thedate').AsDateTime:=strTodate(thedate);
                     qryInsertIntoCard.ParamByName('num_doc').Asstring:=num_doc;
                     qryInsertIntoCard.ParamByName('from_whom').Asstring:=from_whom;
                     qryInsertIntoCard.ParamByName('arrival').AsFloat:=ar;
                     qryInsertIntoCard.ParamByName('charge').AsFloat:=ch;
                     qryInsertIntoCard.ParamByName('ostatok').AsFloat:=(ostatokf);
                     qryInsertIntoCard.ParamByName('nam').Asstring:=nam;
                     qryInsertIntoCard.ParamByName('type_name').Asstring:=type_name;
                     qryInsertIntoCard.ParamByName('cost_for_one').AsFloat:=cost;
                     qryInsertIntoCard.ParamByName('unit_izmerenie').Asstring:=unit_izmerenie;
                     qryInsertIntoCard.ParamByName('numer').Asstring:=numer;
                     qryInsertIntoCard.ExecSQL;
//   qryWork.SQL.Text:='insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,charge,ostatok,name,type_name,cost_for_one,unit_izmerenie,numer)  values('+num_p_p+','''+thedate+''','''+num_doc+''','''+from_whom+''','+arrival+','+charge+','+ostatok+','''+nam+''','''+type_name+''','+cost_for_one+','''+unit_izmerenie+''','''+numer+''')';
//    showmessage(qryWork.SQL.Text);
//                          qryWork.open;
//    qryWork.SQL.Text:='insert into Card (thedate,ostatok,name,type_name,from_whom)  values('''+dateToStr(qryConsole.FieldByName('date_of_srez').asDateTime)+''','+ostatok+','''+nam+''','''+type_name+''',''Остаток'')';
//    showmessage(qryWork.SQL.Text);
//                          qryWork.ExecSQL;
                        end;
                dm.qryCard.Next;
           end;
     tblCard.Open;
      With EKRTFCArd do
        Begin
         OutFile:=CreateFileName('','reports\tmp\card');
         ExecuteOpen([tblCard],SW_SHOW);
        End;
//    btnAllConnect.click;
      finally
//      DBGridInfo.Cursor:=crDefault;
//      btnImportCard.Enabled:=true;
//      cbElem.SetFocus;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
 end;
end;
////////////
procedure TfrmManeger.btnShowFindFormClick(Sender: TObject);
begin
with dm do
try
  try
  Grid.Cursor:=crHourGlass;
//   anim.Active:=true;
  frmFindToManeger.Top:=frmManeger.Top+frmManeger.Height-39;
  frmFindToManeger.Left:=FrmManeger.Left+13;
  frmFindToManeger.showmodal;

  if grid.DataSource=dsQryComponents then
  begin
    if frmFindToManeger.existValue then
      LocateComponent(frmFindToManeger.value);
  end else
  if grid.DataSource=dsQryType_by_comp then
  begin
    if frmFindToManeger.existValue then
      LocateType(frmFindToManeger.value);
  end;
  if grid.DataSource=dsQryElem_by_type then
  begin
     if frmFindToManeger.existValue then
       LocateElem(frmFindToManeger.value);
  end;
  finally
     Grid.Cursor:=crDefault;
//       Anim.Active:=false;
   end;
//   fuck
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmManeger.gridDblClick(Sender: TObject);
var record_name:string;
begin
try
 try
   pnlMain.Cursor:=crHourGlass;
   Grid.Cursor:=crHourGlass;
   try
    Anim.FileName:=s;
    anim.Active:=true;
   except
   end;
   if grid.SelectedField.Text=''
              then exit;
   with dm do
   begin
//    record_name:='/'+grid.SelectedField.Text;
    if grid.DataSource = dsQryComponents then
          begin
           if  qrytypes_by_comp.Active then
               qrytypes_by_comp.close;
           qrytypes_by_comp.ParamByName('comp_id').AsInteger:=qryComponents.FieldByName('component_id').AsInteger;
           record_name:='/'+qryComponents.FieldByName('name').AsString;
           edtPath.text:=record_name;
           qrytypes_by_comp.Open;
           grid.DataSource:=dsQryType_by_comp;
           lblTBLName.Caption:=TableNameType;
           end else
       if grid.DataSource = dsQryType_by_comp then
          begin
           if  qryElems_by_type.Active then
               qryElems_by_type.close;
           qryElems_by_type.ParamByName('type_id').Asinteger:=qrytypes_by_comp.FieldByName('type_id').AsInteger;
           record_name:='/'+qryTypes_by_comp.FieldByName('name').AsString;
           edtPath.text:=edtPath.text+record_name;
           qryElems_by_type.Open;
           grid.DataSource:=dsQryElem_by_type;
           lblTBLName.Caption:=TableNameElem;
          end  else
        if grid.DataSource = dsQryElem_by_type then
          begin
              frmElements.SetElem(qryElems_by_type.fieldByName('name').AsString,
                                  qryElems_by_type.fieldByName('unit_izmerenie').AsString,
                                  qryElems_by_type.fieldByName('numer').AsString,
                                  qryElems_by_type.fieldByName('info').AsString,
                                  qryElems_by_type.fieldByName('user_name').AsString,
                                  qrytypes_by_comp.fieldByName('name').AsString,
                                  qrytypes_by_comp.fieldByName('type_id').AsInteger,
                                  qryElems_by_type.fieldByName('element_id').Asinteger,
                                  qryElems_by_type.fieldByName('Ostatok').AsFloat,
                                  qryComponents.fieldBYname('name').AsString
                                  );
              frmElements.show;
//              frmElements.sbShowLinks.click;
          end ;

   end;
   finally
       Grid.Cursor:=crDefault;
       pnlMain.Cursor:=crDefault;
   anim.Active:=false;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;


end;


procedure TfrmManeger.sbLeftClick(Sender: TObject);
var i:integer;
begin
try
 try
  Grid.Cursor:=crHourGlass;
   try
    Anim.FileName:=s;
    anim.Active:=true;
   except
   end;
  
   with dm do
   begin
        if grid.DataSource = dsQryType_by_comp then
          begin
             grid.DataSource:=dsQryComponents;
             edtPath.text:='/';
             lblTBLName.Caption:=TableNameComp;
          end else
         if grid.DataSource = dsQryElem_by_type then
           begin
             for i:=length(edtPath.text) downto 1 do
              if edtPath.text[i]='/' then
               begin
                    edtPath.text:=copy(edtPath.text,1,i-1);
                    break;
               end;
             lblTBLName.Caption:=TableNameType;
             grid.DataSource:=dsQryType_by_comp;
           end;
   end;
   finally
       Grid.Cursor:=crDefault;
       anim.Active:=false;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmManeger.miEditClick(Sender: TObject);
begin
with dm do
try
  try
    if grid.DataSource=dm.dsQryComponents
         then
         begin
          frmComp.setCompInfo(qryComponents.fieldByName('name').AsString,
                              intToStr(qryComponents.fieldByName('component_id').Asinteger),
                              qryComponents.fieldByName('user_name').AsString
                              );
          frmComp.show;
         end;
    if grid.DataSource=dm.dsQryType_by_comp
         then
         begin
           frmTypes.setTypeInfo(qrytypes_by_comp.fieldByName('name').AsString,
                                intToStr(qrytypes_by_comp.fieldByName('type_id').AsInteger),
                                qrycomponents.fieldByName('name').AsString,
                                intToStr(qrytypes_by_comp.fieldByName('component_id').AsInteger),
                                qrytypes_by_comp.fieldByName('user_name').Asstring
                                );
           frmTypes.show;

         end;
    if grid.DataSource=dm.dsQryElem_by_type
         then grid.OnDblClick(sender);

   finally
       Grid.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmManeger.miDeleteClick(Sender: TObject);
var sqlText:string;
begin
  with dm do
  begin
  try
   try
    grid.Cursor:=crHourGlass;
    sqlText:='execute procedure ';
      if grid.DataSource= dsQryComponents then
         begin
            if messageDlg('Вы уверены, что желаете удалить комплектующее?'+#13#10+'"'+
            qryComponents.fieldByName('name').asstring+'"'+#13#10+'При этом удаляться все записи из других таблиц связаные с этим комплектующим!',mtConfirmation,[mbYes,MbNo],0) = mrno then exit;
            if  frmAddComp.DElete_Component(qryComponents.fieldByName('name').asstring,dm.qryDelete_comp) then
               showmessage('Комплектующее "'+qryComponents.fieldByName('name').asstring+'" удалено!');
         end else
      if grid.DataSource= dsQryType_by_comp then
         begin
          if messageDlg('Вы уверены, что желаете удалить тип?'+#13#10+'"'+
                qrytypes_by_comp.fieldByName('name').AsString+'"'+#13#10+
                'При этом удаляться все записи из других таблиц связаные с этим типом!',
                mtConfirmation,[mbYes,MbNo],0) = mrno
              then exit;
             if  frmAddType.delete_type(qrytypes_by_comp.fieldByName('name').AsString,
                 qrytypes_by_comp.fieldByName('type_id').Asinteger,dm.qryDelete_Type) then
              showmessage('Операция выполнена успешно');
         end;
      if grid.DataSource= dsQryElem_by_type then
         begin
          if messageDlg('Вы уверены, что желаете удалить элемент?'+#13#10+'"'+qryElems_by_type.fieldByName('name').AsString+'"'+#13#10+'При этом удаляться все записи из других таблиц связаные с этим элементом!',mtConfirmation,[mbYes,MbNo],0) = mrno then exit;
          if  frmAddElem.delete_elem(qryElems_by_type.fieldByName('name').AsString,
                                     qryElems_by_type.fieldByName('element_id').Asinteger,
                                     qryDelete_Element) then
                     showmessage('Оперция прошла успешно');
         end;
   finally
       grid.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;
end;

end;

procedure TfrmManeger.pmManegerPopup(Sender: TObject);
begin
try
  with dm do
  begin
    if grid.DataSource =dsQryComponents then
    begin
      miEdit.Enabled:=grid.SelectedField.Text<>'';
      miDelete.Enabled:=grid.SelectedField.Text<>'';
      miAdd.Caption:='Добавить комплектующее';
      miCard.Visible:=false;
      miAddToZAkaz.visible:=false;      
      miOstatki.Enabled:=grid.SelectedField.Text<>'';
    end else
    if grid.DataSource =dsQryType_by_comp then
    begin
      miEdit.Enabled:=grid.SelectedField.Text<>'';
      miDelete.Enabled:=grid.SelectedField.Text<>'';
      miOstatki.Enabled:=grid.SelectedField.Text<>'';
      miAdd.Caption:='Добавить тип';
      miCard.Visible:=false;
      miAddToZAkaz.visible:=false;
    end else
        if grid.DataSource =dsQryElem_by_type then
    begin
      miEdit.Enabled:=grid.SelectedField.Text<>'';
      miDelete.Enabled:=grid.SelectedField.Text<>'';
      miOstatki.Enabled:=grid.SelectedField.Text<>'';
      miAdd.Caption:='Добавить элемент';
      miCard.Visible:=grid.SelectedField.Text<>'';
//      miAddToZAkaz.Enabled:=true;
      miAddToZAkaz.visible:=grid.SelectedField.Text<>'';
    end;
  end;
except
end;
end;

procedure TfrmManeger.miAddClick(Sender: TObject);
begin
  with dm do
  begin
    if grid.DataSource =dsQryComponents then
       begin
         frmAddComp.show;
       end else
        if grid.DataSource =dsQryType_by_comp then
          begin
            frmAddType.comp_id:=qryComponents.fieldByName('component_id').AsInteger;
            frmAddType.comp_name:=qryCOmponents.fieldByName('name').Asstring;//currentComp_Name;
            frmAddType.show;
          end else
          if grid.DataSource =dsQryElem_by_type then
             begin
               frmAddElem.comp_id:=qryCOmponents.fieldByName('component_id').AsInteger;
               frmAddElem.comp_name:=qryCOmponents.fieldByName('name').Asstring;//currentComp_Name;
               frmAddElem.type_id:=qrytypes_by_comp.fieldByName('type_id').AsInteger;
               frmAddElem.type_name:=qrytypes_by_comp.fieldByName('name').Asstring;
               frmAddElem.show;
            end;
  end;
end;

procedure TfrmManeger.miCardClick(Sender: TObject);
begin
with dm do
begin
 if grid.SelectedField.text ='' then exit;
  frmCard.elem_id:=qryElems_by_type.fieldByName('element_id').AsInteger;
  frmCard.elem_name:=qryElems_by_type.fieldByName('name').AsString;
 if qryInfo_by_elem.Active then qryInfo_by_elem.close;
  qryInfo_by_elem.ParamByName('element_id').AsInteger:=qryElems_by_type.fieldByName('element_id').AsInteger;
  qryInfo_by_elem.Open;
end;
  frmCard.show;
end;

procedure TfrmManeger.miRefreshClick(Sender: TObject);
begin
try
 try
  grid.Cursor:=crHourGlass;
  Anim.FileName:=s;
  anim.Active:=true;
//  dmm.cdsComponents.Open;
  with dm do
  begin
    if grid.DataSource =dsQryComponents then
       begin
        qryComponents.close;
        qryComponents.open;
       end else
        if grid.DataSource =dsQryType_by_comp then
          begin
            qrytypes_by_comp.close;
            qrytypes_by_comp.Open;
          end else
          if grid.DataSource =dsQryElem_by_type then
             begin
              qryElems_by_type.close;
              qryElems_by_type.open;
             end;
  end;
   finally
       grid.Cursor:=crDefault;
       anim.Active:=false;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
end;
end;

procedure TfrmManeger.ActionsClick(Sender: TObject);
var pt: TPoint;
begin
try
  GetCursorPos(pt);
  grid.PopupMenu.AutoPopup:=true;
  grid.PopupMenu.Popup(pt.x,pt.y);
  grid.PopupMenu.AutoPopup:=true;
except
end;
end;

procedure TfrmManeger.gridKeyPress(Sender: TObject; var Key: Char);
const c: set of  char = ['A'..'Z','a'..'z','0'..'9','А'..'Я','а'..'я'];
begin
if key =char(#13) then
     grid.OnDblClick(sender) else
if key =char(#8) then
     sbLeft.Click else
     if key in c then
     begin
       frmFindToManeger.eValue.Text:=key;
       btnShowFindForm.Click;
     end;

end;

procedure TfrmManeger.miOstatkiClick(Sender: TObject);
begin
with dm do
begin
    if grid.DataSource=dsQryComponents then
       frmOstatki.GetOstatki(qryComponents.fieldByName('name').AsString,'Components') else
    if grid.DataSource=dsQryType_by_comp then
       frmOstatki.GetOstatki(qrytypes_by_comp.fieldByName('type_id').AsInteger ,'Types') else
    if grid.DataSource=dsQryElem_by_type then
       frmOstatki.GetOstatki(qryElems_by_type.fieldByName('element_id').AsInteger,'Elements');
  btnAllConnect.Click;
end;

end;

procedure TfrmManeger.N2Click(Sender: TObject);
var tmp:string;
tmpERR:bool;
begin
  tmpERR:=false;
  try
   tmp:=grid.SelectedField.Text;
  except
   tmpERR:=true;
  end;
   miRefresh.Click;
 if not tmpERR then
with dm do
  if grid.DataSource=dsQryComponents then
  begin
      LocateComponent(tmp);
  end else
  if grid.DataSource=dsQryType_by_comp then
  begin
      LocateType(tmp);
  end else
  if grid.DataSource=dsQryElem_by_type then
  begin
       LocateElem(tmp);
  end;
end;

procedure TfrmManeger.miAddToZakazClick(Sender: TObject);
begin
      with dm do
    if grid.DataSource=dsQryElem_by_type then
      frmFind.AddToZakaz(qryElems_by_type.FieldByName('element_id').asinteger);
end;

procedure TfrmManeger.miCreateClick(Sender: TObject);
begin
  miAdd.Click;
end;

procedure TfrmManeger.miDElClick(Sender: TObject);
begin
  miDelete.Click;
end;

end.

