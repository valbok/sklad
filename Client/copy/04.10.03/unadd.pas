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
    procedure btnFindComponentClick(Sender: TObject);
    procedure btnFindTypeClick(Sender: TObject);
    procedure btnFindElemClick(Sender: TObject);
    procedure btnFindInfoClick(Sender: TObject);
    procedure GridTypesTitleClick(Column: TColumn);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAllConnectClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    /////////my
    procedure LocateComponent(name:string);
    procedure LocateType(id:integer);
    procedure LocateElem(pole:integer);
    procedure LocateInfo(id:integer);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
        TableNameComp: string ='�������������';
        TableNameType: string ='����';
        TableNameElem: string ='��������';
var
  frmManeger: TfrmManeger;
  currentComp_id:integer;
  currentComp_Name:string;

  currentType_id:integer;
  currentType_name:string;
implementation
uses dmo,unitOstatki,unitFind, UnitLinks, unitComp,
  unitTypes, unitElem, UnitAddComp, unitAddType, unitAddElem,
  UnitCard, Unitdm3;

{$R *.dfm}
function find(var tbl:TIBTable;field:string;pole:variant;typ:tLocateOption;p:string;strOr:byte):string;overload;
begin
if (not tbl.Locate(Field,pole,[typ]))
     then
       begin
        case strOr of
          1:       MessageDlg('������� �� ���������  "'+pole+'" � ���� "'+p+'" �� ������!',mtInformation,[mbOk],0);
          0:       MessageDlg('������� �� ���������  "'+floatToStr(pole)+'" � ���� "'+p+'" �� ������!',mtInformation,[mbOk],0);
          2:       MessageDlg('������� �� ���������  "'+dateToStr(pole)+'" � ���� "'+p+'" �� ������!',mtInformation,[mbOk],0);
          end;
       end;
end;
function find(var tbl:TClientDataSet;field:string;pole:variant;typ:tLocateOption;p:string;strOr:byte):string; overload;
begin
if (not tbl.Locate(Field,pole,[typ]))
     then
       begin
        case strOr of
          1:       MessageDlg('������� �� ���������  "'+pole+'" � ���� "'+p+'" �� ������!',mtInformation,[mbOk],0);
          0:       MessageDlg('������� �� ���������  "'+floatToStr(pole)+'" � ���� "'+p+'" �� ������!',mtInformation,[mbOk],0);
          2:       MessageDlg('������� �� ���������  "'+dateToStr(pole)+'" � ���� "'+p+'" �� ������!',mtInformation,[mbOk],0);
          end;
       end;
end;
function find(var tbl:TIBQuery;field:string;pole:variant;typ:tLocateOption;p:string;strOr:byte):string; overload;
begin
if (not tbl.Locate(Field,pole,[typ]))
     then
       begin
        case strOr of
          1:       MessageDlg('������� �� ���������  "'+pole+'" � ���� "'+p+'" �� ������!',mtInformation,[mbOk],0);
          0:       MessageDlg('������� �� ���������  "'+floatToStr(pole)+'" � ���� "'+p+'" �� ������!',mtInformation,[mbOk],0);
          2:       MessageDlg('������� �� ���������  "'+dateToStr(pole)+'" � ���� "'+p+'" �� ������!',mtInformation,[mbOk],0);
          end;
       end;
end;

procedure TfrmManeger.LocateComponent(name:string);
begin
 try
  try
//   btnFindComponent.Enabled:=false;
    if (dm.IBDatabase.Connected=true) and (not dm.tblComponents.Locate('name',name,[loPartialKey]))
      then
        MessageDlg('��������� "'+name+'" �� ������!',mtInformation,[mbOk],0);
   finally
//      btnFindComponent.Enabled:=true;
   end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;


end;
procedure TfrmManeger.btnFindComponentClick(Sender: TObject);
begin
{ try
  try
   btnFindComponent.Enabled:=false;
    if (dm.IBDatabase.Connected=true) and (not dm.tblComponents.Locate('name',editComponentName.text,[loPartialKey]))
      then
        MessageDlg('��������� "'+editComponentName.text+'" �� ������!',mtInformation,[mbOk],0);
   finally
      btnFindComponent.Enabled:=true;
   end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
}
end;
procedure TfrmManeger.locateType(id:integer);
begin
 try
    try
    cursor:=crHourGlass;
    //    btnFindType.Enabled:=false;
     if (dm.IBDatabase.Connected) and (not dm.tblTypes.Locate('type_id',id,[loPartialKey]))
       then
         MessageDlg('��� ��� ������� "'+intToStr(id)+'" �� ������!',mtInformation,[mbOk],0);
    finally
//       btnFindType.Enabled:=true;
    cursor:=crDefault;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;
procedure TfrmManeger.btnFindTypeClick(Sender: TObject);
begin
{ try
    try
    btnFindType.Enabled:=false;
     if (dm.IBDatabase.Connected) and (not dm.tblTypes.Locate('name',edtTypeName.text,[loPartialKey]))
       then
         MessageDlg('��� � ������ "'+edtTypeName.text+'" �� ������!',mtInformation,[mbOk],0);
    finally
       btnFindType.Enabled:=true;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
}
end;
function TfrmManeger.ZamenaDotNakoma(st :string):string;
var i: integer;
begin
     for i:=1 to length(st) do
     begin
      if st[i]='.' then
         result:=result+',' else
           result:=result+st[i];
     end;
end;
procedure TfrmManeger.LocateElem(pole:integer);
begin
try
  try
   cursor:=crHourGlass;
   find(dm.tblElEments,'element_id',pole,loPartialKey,'id',0);
    finally
  cursor:=crDefault;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;


end;
procedure TfrmManeger.btnFindElemClick(Sender: TObject);
{var pole: string;
Field:string;
//r:real;
i:integer;}
begin
{  if cbFindField.Text = '' then showmessage('�������� �� ������ ���� ������������ �����')
    else
    begin
    try
     try
     i:=cbFindField.ItemIndex;
     btnFindElem.Enabled:=false;
     DBGridElements.Cursor:=crHourGlass;
     case i of
     0:begin
        pole:=EName.Text;
        field:='name';
              if (dm.IBDatabase.Connected)
                 then   find(dm.qryElements,field,pole,loPartialKey,cbFindField.text,1);

       end;
     1:begin
        pole:=Eunit.Text;
        field:='Unit_izmerenie';
               if (dm.IBDatabase.Connected)
                 then   find(dm.qryElements,field,pole,loPartialKey,cbFindField.text,1);
       end;        }
{     2:begin
        pole:=Epresence.Text;
        pole:=zamenaDotNaKoma(pole);
        field:='Presence';
        r:=strToFloat(pole);
               if (dm.IBDatabase.Connected)
                 then   find(dm.clientDSElem,field,r,loCaseInsensitive,cbFindField.text,0);
       end;
     3:begin
        pole:=(ECost.Text);
        pole:=zamenaDotNaKoma(pole);
        field:='cost';
//        r:=strToFloat(pole);
               if (dm.IBDatabase.Connected)
                 then   find(dm.clientDSElem,field,pole,loPartialKey,cbFindField.text,0);
        end;}
{    end;
    finally
     btnFindElem.Enabled:=true;
     DBGridElements.Cursor:=crDefault;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

  end;}
end;

procedure TfrmManeger.LocateInfo(id:integer);
begin
try
  try
   cursor:=crHourGlass;
   find(dm.tblInfo,'info_id',id,loPartialKey,'info_id',0);
    finally
     cursor:=crDefault;
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;
procedure TfrmManeger.btnFindInfoClick(Sender: TObject);
{var pole: string;
Field:string;
i,numdoc:integer;
s:Tdatetime;
r:real;}
begin
{  if cbFindFieldInfo.Text = '' then showmessage('�������� �� ������ ���� ������������ �����')
    else
    begin
  try
      try
{     DBGridInfo.Cursor:=crHourGlass;
     btnFindInfo.Enabled:=false;
     i:=cbFindFieldInfo.ItemIndex;
     case i of
     0:begin
//        pole:=Earrival.Text;
        pole:=zamenaDotNaKoma(pole);
        field:='arrival';
        r:=strToFloat(pole);
                if (dm.IBDatabase.Connected)
                 then   find(dm.qryinfoOrderBy,field,r,loCaseInsensitive,cbFindFieldInfo.text,0);
       end;
     1:begin
        pole:=ECharge.Text;
        pole:=zamenaDotNaKoma(pole);
        field:='Charge';
        r:=strToFloat(pole);
                        if (dm.IBDatabase.Connected)
                 then   find(dm.qryinfoOrderBy,field,r,loCaseInsensitive,cbFindFieldInfo.text,0);
       end;
     2:begin
        pole:=Ecost_for_one.Text;
        pole:=zamenaDotNaKoma(pole);
        field:='Cost_for_one';
        r:=strToFloat(pole);
                        if (dm.IBDatabase.Connected)
                 then   find(dm.qryinfoOrderBy,field,r,loCaseInsensitive,cbFindFieldInfo.text,0);
       end;
     3:begin
        pole:=(EFRom_whom.Text);
        field:='From_whom';
                      if (dm.IBDatabase.Connected)
                 then   find(dm.qryinfoOrderBy,field,pole,loPartialKey,cbFindFieldInfo.text,1);

        end;
     4:begin
        pole:=(EDate.Text);
        field:='theDate';
        s:=strTodate(pole);
                      if (dm.IBDatabase.Connected)
                 then   find(dm.qryinfoOrderBy,field,s,loPartialKey,cbFindFieldInfo.text,2);

        end;
     5:begin
        pole:=(Enum_doc.Text);
        field:='num_doc';
        numDoc:=strToInt(pole);
                      if (dm.IBDatabase.Connected)
                        then   find(dm.qryinfoOrderBy,field,numdoc,loCaseInsensitive,cbFindFieldInfo.text,0);

       end;
     end;
      finally
      DBGridInfo.Cursor:=crDefault;
      btnFindInfo.Enabled:=true;
      cbElem.SetFocus;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;}
end;


procedure TfrmManeger.GridTypesTitleClick(Column: TColumn);
begin
{ with dm do
 begin
       try
          tbltypes.AddIndex(Column.FieldName+'indx',Column.FieldName,[ixCaseInsensitive],'');
          tbltypes.IndexName:=Column.FieldName+'indx';
       finally
          try
              tbltypes.DeleteIndex(Column.FieldName+'indx');
          finally

          end;
       end;
 end;}

end;

procedure TfrmManeger.btnCloseClick(Sender: TObject);
begin
   close;
end;

procedure TfrmManeger.btnAllConnectClick(Sender: TObject);
begin
      with dm,dm3 do
      begin
         try
           Cursor:=crHourGlass;
          try
            if   not tblComponents.Active then   tblComponents.Open;
          finally
            if  not tblTypes.Active then      tblTypes.Open;
            if  not tblLinks.Active then      tblLinks.Open;

tblcomp.Open;
tblTyp.open;
tblElements.open;
tblinfo.open;
tblType2.Open ;
tblDetali.Open ;
//cdsComp.Open;
//cdsTyp.Open;
           try
//              if   not ClientElem.Active then     ClientElem.Open;
             finally

              try
               if not  qryInfoOrderby.Active then     qryInfoOrderBy.open;
               finally
                try
               if not dm.tblElements.Active then       dm.tblElements.Open;
               finally
          qryElements.Open;

                end;
     if not  dm.tblInfo.Active then     dm.tblInfo.open;
          end;
       Cursor:=crDefault;
         end;
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

procedure TfrmManeger.printCard(id_elem:integer);
var
thedate,arrival,charge,ostatok,nam,num_p_p,from_whom,
unit_izmerenie,cost_for_one,num_doc,type_name,numer:string;
id:integer;
begin
    with dm do
    begin
    try
      try
//      DBGridInfo.Cursor:=crHourGlass;
//      btnImportCard.Enabled:=false;
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
        qryCard.ParamByName('pelement_id').Asinteger:=id_elem;
        qryCard.Open;
        qryCard.First;
        while not qryCard.Eof do
           begin
                num_p_p:=intToStr(qryCard.fieldByname('num_p_p').AsInteger);
                qryConsole.SQL.Text:='select srez_id,num_p_p,date_of_srez from srez where element_id='+intToStr(id_elem)+ ' and num_p_p = '+num_p_p;
                   qryConsole.Open;

                thedate:=DateToStr(qryCard.fieldByname('thedate').AsDateTime);
                num_doc:=qryCard.fieldByname('num_doc').Asstring;
                from_whom:=qryCard.fieldByname('from_whom').Asstring;

                numer:=frmostatki.zamenaKomaNaDot(qryCard.fieldByname('numer').Asstring);

                arrival:=frmostatki.zamenaKomaNaDot(floatToStr(qryCard.fieldByname('arrival').AsFloat));
                charge:=frmostatki.zamenaKomaNaDot(floatToStr(qryCard.fieldByname('charge').AsFloat));
                ostatok:=(floatToStr(qryCard.fieldByname('ostatok').AsFloat));
           if StrToFloat(ostatok) < 1 then
                         str(StrToFloat(ostatok):2:2,ostatok);
                ostatok:=frmostatki.zamenaKomaNaDot(ostatok);
                cost_for_one:=frmostatki.zamenaKomaNaDot(floatToStr(qryCard.fieldByname('cost').AsFloat));

                unit_izmerenie:=qryCard.fieldByname('unit_izmerenie').Asstring;
                nam:=qryCard.fieldByname('name').Asstring;
                type_name:=qryCard.fieldByname('type_name').Asstring;
                id:=(qryConsole.FieldByName('srez_id').AsInteger);
//                showmessage(intToStr(0)); exit;
                   if (id = 0) then
                     begin
                        qryWork.SQL.Text:='insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,charge,ostatok,name,type_name,cost_for_one,unit_izmerenie,numer)  values('+num_p_p+','''+thedate+''','''+num_doc+''','''+from_whom+''','+arrival+','+charge+','+ostatok+','''+nam+''','''+type_name+''','+cost_for_one+','''+unit_izmerenie+''','''+numer+''')';
//                        showmessage(qryWork.SQL.Text);
                        qryWork.open;
                     end else
                        begin
                        qryWork.SQL.Text:='insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,charge,ostatok,name,type_name,cost_for_one,unit_izmerenie,numer)  values('+num_p_p+','''+thedate+''','''+num_doc+''','''+from_whom+''','+arrival+','+charge+','+ostatok+','''+nam+''','''+type_name+''','+cost_for_one+','''+unit_izmerenie+''','''+numer+''')';
//    showmessage(qryWork.SQL.Text);
                          qryWork.open;
    qryWork.SQL.Text:='insert into Card (thedate,ostatok,name,type_name,from_whom)  values('''+dateToStr(qryConsole.FieldByName('date_of_srez').asDateTime)+''','+ostatok+','''+nam+''','''+type_name+''',''�������'')';
//    showmessage(qryWork.SQL.Text);
                          qryWork.open;

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
////////////
procedure TfrmManeger.btnShowFindFormClick(Sender: TObject);
begin
   frmFind.Show;
end;

procedure TfrmManeger.gridDblClick(Sender: TObject);
var record_name:string;
begin
try
 try
  pnlMain.Cursor:=crHourGlass;
  Grid.Cursor:=crHourGlass;
   if grid.SelectedField.Text=''
              then exit;
   with dm do
   begin
    record_name:='/'+grid.SelectedField.Text;
    if grid.DataSource = dsComp  then
          begin
           grid.DataSource:=dsTyp;
           edtPath.text:=record_name;
           lblTBLName.Caption:=TableNameType;
           currentComp_id:=StrToInt(frmComp.dbedtID.text);
           currentComp_name:=frmComp.dbEdtName.text;
           end else
        if grid.DataSource = dsTyp then
          begin
             grid.DataSource:=dsElements;
             edtPath.text:=edtPath.text+record_name;
             lblTBLName.Caption:=TableNameElem;
             currentType_id:=StrToInt(frmTypes.dbedtID.text);
             currentType_name:=frmTypes.dbEdtName.text;                          
          end  else
        if grid.DataSource = dsElements then
          begin
                frmElements.Show;
          end ;

   end;
   finally
       Grid.Cursor:=crDefault;
       pnlMain.Cursor:=crDefault;
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
   with dm do
   begin
        if grid.DataSource = dsTyp then
          begin
             grid.DataSource:=dsComp;
             edtPath.text:='/';
{             for i:=length(edtPath.text) downto 1 do
              if edtPath.text[i]='/' then
               begin
                    edtPath.text:=copy(edtPath.text,1,i);
                    break;
               end;                 }
             lblTBLName.Caption:=TableNameComp;
          end else
         if grid.DataSource = dsElements then
           begin
             for i:=length(edtPath.text) downto 1 do
              if edtPath.text[i]='/' then
               begin
                    edtPath.text:=copy(edtPath.text,1,i-1);
                    break;
               end;
             lblTBLName.Caption:=TableNameType;
             grid.DataSource:=dsTyp;
           end;
{         if grid.DataSource = dsInfo then
          grid.DataSource:=dsComp else}
   end;
   finally
       Grid.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmManeger.miEditClick(Sender: TObject);
begin
try
  try
    if grid.DataSource=dm.dsComp
         then frmComp.show;
    if grid.DataSource=dm.dsTyp
         then frmTypes.show;
    if grid.DataSource=dm.dsElements
         then frmElements.show;

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
      if grid.DataSource= dscomp then
         begin
        if  frmAddComp.delete_component(grid.SelectedField.text,qryWork) then
            tblComp.Refresh;
         end else
      if grid.DataSource= dsTyp then
         begin
         if   frmAddType.delete_Type(grid.SelectedField.text,StrToInt(frmtypes.dbedtId.text),qryWork)=true then
            tblTyp.Refresh;
         end;
      if grid.DataSource= dsElements then
         begin
          if  frmAddElem.delete_elem(grid.SelectedField.text,StrToInt(frmElements.dbedtId.text),qryWork) then
            tblelements.Refresh;
         end;


           {

        typ:    begin
                 if messageDlg('�� �������, ��� ������� ������� ���?'+#13#10+'"'+GetREcordName(treeStrDb.Selected.Text)+'"'+#13#10+'��� ���� ��������� ��� ������ �� ������ ������ �������� � ���� �����!',mtConfirmation,[mbYes,MbNo],0) = mrYes then
                 begin
                   qryWork.SQL.text:=sqlText+'delete_type('''+GetREcordName(treeStrDB.Selected.Text)+''')';
 //                     showmessage(qryWork.SQL.text);
                   qryWork.ExecSQL;
                   sbConnect.Click;
                 end;
                end;
        elem:   begin
                 if messageDlg('�� �������, ��� ������� ������� �������?'+#13#10+'"'+GetREcordName(treeStrDb.Selected.Text)+'"'+#13#10+'��� ���� ��������� ��� ������ �� ������ ������ �������� � ���� ���������!',mtConfirmation,[mbYes,MbNo],0) = mrYes then
                 begin
                        qryWork.SQL.text:=sqlText+' delete_element('''+GetREcordName(treeStrDB.Selected.Text)+''')';
                   qryWork.ExecSQL;
                   sbConnect.Click;
                 end;
                end;
        end;}
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
    if grid.DataSource =dsComp then
    begin
{      miEdit.Caption:='������������� "'+grid.SelectedField.Text+'"';
      miDelete.Caption:='������� "'+grid.SelectedField.Text+'"';}
      miEdit.Enabled:=grid.SelectedField.Text<>'';
      miDelete.Enabled:=grid.SelectedField.Text<>'';
      miAdd.Caption:='�������� �������������';
      miCard.Visible:=false;
      miOstatki.Enabled:=grid.SelectedField.Text<>'';
    end else
    if grid.DataSource =dsTyp then
    begin
{      miEdit.Caption:='������������� "'+grid.SelectedField.Text+'"';
      miDelete.Caption:='������� "'+grid.SelectedField.Text+'"';}
      miEdit.Enabled:=grid.SelectedField.Text<>'';
      miDelete.Enabled:=grid.SelectedField.Text<>'';
      miOstatki.Enabled:=grid.SelectedField.Text<>'';
      miAdd.Caption:='�������� ���';
      miCard.Visible:=false;
    end else
        if grid.DataSource =dsElements then
    begin
{      miEdit.Caption:='������������� "'+grid.SelectedField.Text+'"';
      miDelete.Caption:='������� "'+grid.SelectedField.Text+'"';}
      miEdit.Enabled:=grid.SelectedField.Text<>'';
      miDelete.Enabled:=grid.SelectedField.Text<>'';
      miOstatki.Enabled:=grid.SelectedField.Text<>'';
      miAdd.Caption:='�������� �������';
//      miCard.Visible:=true;
      miCard.Visible:=grid.SelectedField.Text<>'';
    end;



  end;
except
end;  
end;

procedure TfrmManeger.miAddClick(Sender: TObject);
begin
  with dm do
  begin
    if grid.DataSource =dsComp then
       begin
         frmAddComp.show;
       end else
        if grid.DataSource =dsTyp then
          begin
            frmAddType.comp_id:=currentComp_id;
            frmAddType.comp_name:=currentComp_Name;
            frmAddType.show;
          end else
          if grid.DataSource =dsElements then
             begin
               frmAddElem.comp_id:=currentComp_id;
               frmAddElem.comp_name:=currentComp_name;
               frmAddElem.type_id:=currentType_id;
               frmAddElem.type_name:=currentType_name;
               frmAddElem.show;
            end;
  end;
end;

procedure TfrmManeger.miCardClick(Sender: TObject);
begin
 if grid.SelectedField.text ='' then exit;
  frmCard.elem_id:=strToInt(frmElements.dbedtId.text);
  frmCard.elem_name:=frmElements.dbedtname.text;
  frmCard.show;
end;

procedure TfrmManeger.miRefreshClick(Sender: TObject);
begin
try
 try
  grid.Cursor:=crHourGlass;
  with dm do
  begin
    if grid.DataSource =dsComp then
       begin
        tblComp.Refresh;
       end else
        if grid.DataSource =dsTyp then
          begin
            tblTyp.Refresh;
          end else
          if grid.DataSource =dsElements then
             begin
                tblElements.Refresh;
             end;

  end;
   finally
       grid.Cursor:=crDefault;
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
begin
if key =char(#13) then
     grid.OnDblClick(sender);
if key =char(#8) then
     sbLeft.Click;

end;

procedure TfrmManeger.miOstatkiClick(Sender: TObject);
begin
with dm do
begin
    if grid.DataSource=dsComp then
       frmOstatki.GetOstatki(grid.SelectedField.Text,'Components') else
    if grid.DataSource=dstyp then
       frmOstatki.GetOstatki(StrToInt(frmtypes.dbedtId.text),'Types') else
    if grid.DataSource=dsElements then
       frmOstatki.GetOstatki(StrToInt(frmElements.dbedtId.text),'Elements');
  btnAllConnect.Click;
end;

end;

end.

