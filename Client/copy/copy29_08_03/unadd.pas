unit unadd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,IBTable,IBQuery,
  Mask,db,DBClient, Menus, ekbasereport, ekrtf;

type
  TfrmAdd = class(TForm)
    PanelMain: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PanelType: TPanel;
    GridTypes: TDBGrid;
    TabSheet3: TTabSheet;
    panelElem: TPanel;
    DBGridElements: TDBGrid;
    TabSheet4: TTabSheet;
    panelInfo: TPanel;
    DBGridInfo: TDBGrid;
    PanelComponentBottom: TPanel;
    PanelComponent: TPanel;
    GridComponent: TDBGrid;
    PanelTypesBottom: TPanel;
    btnAddComponent: TBitBtn;
    editComponentName: TEdit;
    lNameComponent: TLabel;
    PanelElemBottom: TPanel;
    PanelInfoBottom: TPanel;
    ENum_doc: TEdit;
    EDate: TEdit;
    lDate: TLabel;
    lNum_doc: TLabel;
    lFrom_Whom: TLabel;
    EFrom_Whom: TEdit;
    btnAddInfo: TBitBtn;
    gbElem: TGroupBox;
    gbArrivalCharge: TGroupBox;
    ECharge: TEdit;
    EArrival: TEdit;
    lArrival: TLabel;
    lCharge: TLabel;
    gbAddType: TGroupBox;
    edtTypeName: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    btnAddType: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GbAddElem: TGroupBox;
    EName: TEdit;
    lNameElem: TLabel;
    lTypeElem: TLabel;
    lUnitElem: TLabel;
    EUnit: TEdit;
    btnAddElem: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    btnFindComponent: TBitBtn;
    btnFindType: TBitBtn;
    GroupBox1: TGroupBox;
    cbFindField: TComboBox;
    btnFindElem: TBitBtn;
    gbFind: TGroupBox;
    cbFindFieldInfo: TComboBox;
    btnFindInfo: TBitBtn;
    Label7: TLabel;
    ECost_For_One: TEdit;
    CBElem_type_name: TDBLookupComboBox;
    CBType_Comp: TDBLookupComboBox;
    cbElem: TDBLookupComboBox;
    NavigatorComponents: TDBNavigator;
    NavigatorTypes: TDBNavigator;
    NavigatorElements: TDBNavigator;
    btnClose: TBitBtn;
    MainMenu: TMainMenu;
    btnAllConnect: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Ajhvf1: TMenuItem;
    N5: TMenuItem;
    sbSrez: TSpeedButton;
    btnImportCard: TBitBtn;
    EkRTFCard: TEkRTF;
    procedure btnAddComponentClick(Sender: TObject);
    procedure btnAddTypeClick(Sender: TObject);
    procedure refresh;
    procedure btnAddElemClick(Sender: TObject);
    procedure btnFindComponentClick(Sender: TObject);
    procedure btnFindTypeClick(Sender: TObject);
    procedure btnFindElemClick(Sender: TObject);
    procedure btnAddInfoClick(Sender: TObject);
    procedure btnFindInfoClick(Sender: TObject);
    procedure EArrivalExit(Sender: TObject);
    procedure EChargeExit(Sender: TObject);
    procedure ECost_For_OneExit(Sender: TObject);
    procedure EDateExit(Sender: TObject);
    procedure GridComponentTitleClick(Column: TColumn);
    procedure GridTypesTitleClick(Column: TColumn);
    procedure DBGridElementsTitleClick(Column: TColumn);
    procedure DBGridInfoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAllConnectClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure sbSrezClick(Sender: TObject);
    procedure btnImportCardClick(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdd: TfrmAdd;

implementation
uses dmo,unitOstatki;
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

procedure TfrmAdd.btnAddComponentClick(Sender: TObject);
var tmpStr:string;
begin
if editComponentName.Text <>'' then
   with dm do
   begin
 try
      try
       GridComponent.Cursor:=crHourGlass;
       btnAddComponent.Enabled:=false;
       tmpStr:=qryWork.SQL.Text;
       qryWork.SQL.clear;
       qryWork.SQL.Text:='execute procedure add_component('''+editComponentName.Text+''')';
//      try
          qryWork.Open;
          NavigatorComponents.BtnClick(nbrefresh);
{       except
          messageDlg('Error exec SQL! �������� ��� ���� ��� ����� ������ ��� ����������!',mtError,[MbOk],0);
       end;}
       qryWork.SQL.Text:= tmpStr;
       editComponentName.SetFocus;
      btnAddComponent.Enabled:=true;
      finally
       GridComponent.Cursor:=crDefault;
       btnAddComponent.Enabled:=true;       
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

   end;

end;

procedure TFrmAdd.refresh;
begin
     with dm do
     begin
         NavigatorComponents.BtnClick(nbrefresh);
         NavigatorTypes.BtnClick(nbrefresh);
         NavigatorElements.BtnClick(nbrefresh);
//         NavigatorInfo.BtnClick(nbrefresh);
     end;

end;
procedure TfrmAdd.btnAddTypeClick(Sender: TObject);
var tmpStr:string;

begin
  if (edtTypeName.text <> '')  then
       with dm do
       begin
         if (cbType_comp.Text ='') then
           begin
              messageDlg('���������� ��������� ���� "�������������"...',mtError,[MbOk],0);
              exit;
           end;
     try
       try
           GridTypes.Cursor:=crHourGlass;
           btnAddType.Enabled:=false;
           tmpStr:=qryWork.SQL.Text;
           qryWork.SQL.Text:='execute procedure add_type('''+edtTypeName.text+''','''+cbType_comp.Text+''')';
           qryWork.Open;
           refresh;
           qryWork.SQL.Text:=tmpStr;
           edtTypeName.SetFocus;
           btnAddType.Enabled:=true;
      finally
       GridTypes.Cursor:=crDefault;
       btnAddType.Enabled:=true;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

       end;
end;

procedure TfrmAdd.btnAddElemClick(Sender: TObject);
var tmpStr:string;
//cost,presence:string;

begin
  if (EName.text <> '') then
       with dm do
       begin
         if (cbElem_Type_name.Text ='') then
           begin
              messageDlg('���������� ��������� ���� "���"...',mtError,[MbOk],0);
              exit;
           end;
  try
        try
        DBGridElements.Cursor:=crHourGlass;
           btnAddElem.Enabled:=false;
           tmpStr:=qryWork.SQL.Text;
{          if EPresence.text<>'' then presence:=EPresence.Text else presence:='null';
          if ECost.text<>'' then cost:=ECost.Text else cost:='null';}
           qryWork.SQL.Text:='execute procedure add_element('''+EName.text+''','''+EUnit.text+''','+intToStr(CbElem_Type_name.KeyValue)+')';

               qryWork.Open;
               refresh;
           qryWork.SQL.Text:=tmpStr;
           ename.SetFocus;
      finally
       DBGridElements.Cursor:=crDefault;
       btnAddElem.Enabled:=true;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

       end;

end;

procedure TfrmAdd.btnFindComponentClick(Sender: TObject);
begin
 try
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

end;

procedure TfrmAdd.btnFindTypeClick(Sender: TObject);
begin
 try
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

end;
function ZamenaDotNakoma(st :string):string;
var i: integer;
begin
     for i:=1 to length(st) do
     begin
      if st[i]='.' then
         result:=result+',' else
           result:=result+st[i];
     end;
end;
procedure TfrmAdd.btnFindElemClick(Sender: TObject);
var pole: string;
Field:string;
//r:real;
i:integer;
begin
  if cbFindField.Text = '' then showmessage('�������� �� ������ ���� ������������ �����')
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
                 then   find(dm.clientDSElem,field,pole,loPartialKey,cbFindField.text,1);

       end;
     1:begin
        pole:=Eunit.Text;
        field:='Unit_izmerenie';
               if (dm.IBDatabase.Connected)
                 then   find(dm.clientDSElem,field,pole,loPartialKey,cbFindField.text,1);
       end;
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
    end;
    finally
     btnFindElem.Enabled:=true;
     DBGridElements.Cursor:=crDefault;     
    end;
 except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

  end;
end;

procedure TfrmAdd.btnAddInfoClick(Sender: TObject);
var tmpstr:string;
arrival,charge,cost:string;
begin
if messageDlg('�� �������, ��� ������� �������� ������ �� ����������: '+#13#10+
                '�������: '+cbelem.Text+#13#10+
                '������: '+earrival.Text+#13#10+
                '������: '+echarge.Text+#13#10+
                '���� �� �������: '+ecost_for_one.Text+#13#10+
                '�� ����: '+efrom_whom.Text+#13#10+
                '����: '+edate.Text+#13#10+
                '� ���������: '+enum_doc.Text,mtconfirmation,[mbyes,mbNo],0)=mrNo then exit;
       with dm do
       begin
         if (cbElem.Text ='') then
           begin
              messageDlg('���������� ��������� ���� "�������"...',mtError,[MbOk],0);
              exit;
           end;
     try
        try
          DBGridInfo.Cursor:=crHourGlass;
          btnAddInfo.Enabled:=false;
           tmpStr:=qryWork.SQL.Text;
           if EArrival.Text <> '' then arrival :=EArrival.Text else arrival:='0';
           if ECharge.Text <> '' then charge :=Echarge.Text else charge:='0';
           if ECost_for_one.Text <> '' then cost :=Ecost_for_one.Text else cost:='0';
           qryWork.SQL.Text:='execute procedure add_info('''+Edate.text+''','''+Enum_doc.text+''','''+(EFrom_Whom.text)+''','+cost+','+Arrival+','+Charge+','+intToStr(cbElem.KeyValue)+')';
           qryWork.Open;
           cbElem.SetFocus;

           qryWork.SQL.Text:=tmpStr;

           DBGridElements.Cursor:=crHourGlass;

      finally
       DBGridInfo.Cursor:=crDefault;
       btnAddInfo.Enabled:=true;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;


end;
procedure TfrmAdd.btnFindInfoClick(Sender: TObject);
var pole: string;
Field:string;
i,numdoc:integer;
s:Tdatetime;
r:real;
begin
  if cbFindFieldInfo.Text = '' then showmessage('�������� �� ������ ���� ������������ �����')
    else
    begin
  try
      try
     DBGridInfo.Cursor:=crHourGlass;
     btnFindInfo.Enabled:=false;
     i:=cbFindFieldInfo.ItemIndex;
     case i of
     0:begin
        pole:=Earrival.Text;
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
end;
end;


procedure TfrmAdd.EArrivalExit(Sender: TObject);
const c: set of  char = ['0'..'9','.',','];
var i:integer;
countKoma: boolean;
s,s2:string;
begin
  CountKoma:=true;
  for i:=1 to length(Earrival.Text) do
  begin
           if (Earrival.Text[i] in c) then
               begin
               if (Earrival.Text[i] =',')  then
                 begin  if countKoma then
                    S2:='.' else s2:='';
                    countKoma:=false;
                  end else
                       s2:=Earrival.Text[i];
                       if s2='.' then countKoma:=false;
                   s:=s+s2;
                end;
    end;
  earrival.Text:=s;
end;

procedure TfrmAdd.EChargeExit(Sender: TObject);
const c: set of  char = ['0'..'9','.',','];
var i:integer;
countKoma: boolean;
s,s2:string;
begin
  CountKoma:=true;
  for i:=1 to length(Echarge.Text) do
  begin
           if (Echarge.Text[i] in c) then
               begin
               if (Echarge.Text[i] =',')  then
                 begin  if countKoma then
                    S2:='.' else s2:='';
                    countKoma:=false;
                  end else
                       s2:=Echarge.Text[i];
                       if s2='.' then countKoma:=false;
                   s:=s+s2;
                end;
    end;
  echarge.Text:=s;
end;

procedure TfrmAdd.ECost_For_OneExit(Sender: TObject);
const c: set of  char = ['0'..'9','.',','];
var i:integer;
countKoma: boolean;
s,s2:string;
begin
  CountKoma:=true;
  for i:=1 to length(Ecost_for_one.Text) do
  begin
           if (Ecost_for_one.Text[i] in c) then
               begin
               if (Ecost_for_one.Text[i] =',')  then
                 begin  if countKoma then
                    S2:='.' else s2:='';
                    countKoma:=false;
                  end else
                       s2:=Ecost_for_one.Text[i];
                       if s2='.' then countKoma:=false;
                   s:=s+s2;
                end;
    end;
  ecost_for_one.Text:=s;




end;

procedure TfrmAdd.EDateExit(Sender: TObject);
const c: set of  char = ['0'..'9','.',','];
var i:integer;
countKoma: boolean;
s,s2:string;
begin
  CountKoma:=true;
  for i:=1 to length(Edate.Text) do
  begin
           if (Edate.Text[i] in c) then
               begin
               if (Edate.Text[i] =',')  then
                 begin  if countKoma then
                    S2:='.' else s2:='';
                    countKoma:=false;
                  end else
                       s2:=Edate.Text[i];
                       if s2='.' then countKoma:=false;
                   s:=s+s2;
                end;
    end;
  edate.Text:=s;
end;
procedure TfrmAdd.GridComponentTitleClick(Column: TColumn);
begin
{ with dm do
 begin
       try
          tblComponents.AddIndex(Column.FieldName+'indx',Column.FieldName,[ixCaseInsensitive],'');
//          tblComponents.IndexName:=Column.FieldName+'indx';
       finally
          try
//              tblComponents.DeleteIndex(Column.FieldName+'indx');
          finally

          end;
       end;
 end;}

end;

procedure TfrmAdd.GridTypesTitleClick(Column: TColumn);
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

procedure TfrmAdd.DBGridElementsTitleClick(Column: TColumn);
begin
 with dm do
 begin
       try
          ClientDSElem.AddIndex(Column.FieldName+'indx',Column.FieldName,[ixCaseInsensitive],'');
          ClientDSElem.IndexName:=Column.FieldName+'indx';
     except
          try
//              ClientDSElem.DeleteIndex(Column.FieldName+'indx');
          finally

          end;
       end;
 end;

end;

procedure TfrmAdd.DBGridInfoTitleClick(Column: TColumn);
begin
{ with dm do
 begin
       try
          tblinfo.AddIndex(Column.FieldName+'indx',Column.FieldName,[ixCaseInsensitive],'');
          tblinfo.IndexName:=Column.FieldName+'indx';
       finally
          try
  //            tblinfo.DeleteIndex(Column.FieldName+'indx');
          finally

          end;
       end;
 end;}

end;

procedure TfrmAdd.FormCreate(Sender: TObject);
begin
    EDate.Text:=dateTostr(date);
end;

procedure TfrmAdd.btnCloseClick(Sender: TObject);
begin
close;
end;

procedure TfrmAdd.btnAllConnectClick(Sender: TObject);
begin
      with dm do
      begin
          if   not tblComponents.Active then   tblComponents.Open;
          if  not tblTypes.Active then      tblTypes.Open;
          if   not ClientDSElem.Active then     ClientDSElem.Open;
        //  if not  dm.tblInfo.Active then     dm.tblInfo.open;
          if not  qryInfoOrderby.Active then     qryInfoOrderBy.open;
          if not dm.tblElements.Active then       dm.tblElements.Open;
          dm.qryElements.Open;
          end;
end;

procedure TfrmAdd.N5Click(Sender: TObject);
begin
close;
end;

procedure TfrmAdd.N3Click(Sender: TObject);
begin
   dm.IBTransaction.Rollback;
   btnAllConnect.click;
end;

procedure TfrmAdd.N4Click(Sender: TObject);
begin
   dm.IBTransaction.commit;
   btnAllConnect.click;
end;

procedure TfrmAdd.sbSrezClick(Sender: TObject);
begin
        if   cbElem.Text = '' then showmessage('��������� ���� "�������"') else
                  with dm do
                    begin
                    if messageDlg('�� �������? ��������� ���� �������� �������� '''+cbElem.text+''' ?',mtConfirmation,[mbYes,MbNo],0)=mrYes then
                    begin

                        qryWork.SQL.Text:='execute procedure add_srez('+intToStr(cbElem.keyValue)+','''+DateToStr(date)+''')';
                        qryWork.Open;
                        showmessage('���� �� '+#13#10+'����: '+dateToStr(date)+#13#10+'�����: '+timeToStr(time)+#13#10+'��������');
                    end;
                    end;
end;

procedure TfrmAdd.btnImportCardClick(Sender: TObject);
var
thedate,arrival,charge,ostatok,nam,num_p_p,from_whom,
unit_izmerenie,cost_for_one,num_doc,type_name:string;
id:integer;
begin
if CBElem.Text='' then
  begin
         showmessage('��������� ���� "�������"');
         exit;
  end;
    with dm do
    begin
    try
      try
      DBGridInfo.Cursor:=crHourGlass;
      btnImportCard.Enabled:=false;
        if not IBDatabase.Connected then IBDatabase.Connected:=true;
        if not IBTransaction.Active then IBTransaction.Active:=true;
        if tblCard.Exists then
        begin
               IBTransaction.Commit;
               if not IBTransaction.Active then IBTransaction.Active:=true;
               tblCard.DeleteTable;
               IBTransaction.Commit;
        end;
           tblCard.CreateTable;
//         dbgridInfo.DataSource:=dsCard;
           IBTransaction.Commit;
      if qryWork.Active then  qryWork.Close;
      if qryConsole.Active then  qryConsole.Close;
        qryCard.ParamByName('pelement_id').Asinteger:=cbElem.KeyValue;
        qryCard.Open;
        qryCard.First;
        while not qryCard.Eof do
           begin
                num_p_p:=intToStr(qryCard.fieldByname('num_p_p').AsInteger);
                qryConsole.SQL.Text:='select srez_id,num_p_p,date_of_srez from srez where element_id='+intToStr(cbElem.KeyValue)+ ' and num_p_p = '+num_p_p;
                   qryConsole.Open;

                thedate:=DateToStr(qryCard.fieldByname('thedate').AsDateTime);
                num_doc:=qryCard.fieldByname('num_doc').Asstring;
                from_whom:=qryCard.fieldByname('from_whom').Asstring;

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
                        qryWork.SQL.Text:='insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,charge,ostatok,name,type_name,cost_for_one,unit_izmerenie)  values('+num_p_p+','''+thedate+''','''+num_doc+''','''+from_whom+''','+arrival+','+charge+','+ostatok+','''+nam+''','''+type_name+''','+cost_for_one+','''+unit_izmerenie+''')';
//                        showmessage(qryWork.SQL.Text);
                        qryWork.open;
                     end else
                        begin
                          qryWork.SQL.Text:='insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,charge,ostatok,name,type_name,cost_for_one,unit_izmerenie)  values('+num_p_p+','''+thedate+''','''+num_doc+''','''+from_whom+''','+arrival+','+charge+','+ostatok+','''+nam+''','''+type_name+''','+cost_for_one+','''+unit_izmerenie+''')';
//    showmessage(qryWork.SQL.Text);
                          qryWork.open;
    qryWork.SQL.Text:='insert into Card (thedate,ostatok,name,type_name,from_whom)  values('''+dateToStr(qryConsole.FieldByName('date_of_srez').asDateTime)+''','+ostatok+','''+nam+''','''+type_name+''',''�������'')';
                          qryWork.open;

                        end;
                qryCard.Next;
           end;
    tblCard.Open;
      With EKRTFCArd do
        Begin
         OutFile:=CreateFileName('','reports\tmp\list');
         ExecuteOpen([tblCard],SW_SHOW);
        End;
               IBTransaction.Commit;
               if not IBTransaction.Active then IBTransaction.Active:=true;
               tblCard.DeleteTable;
               IBTransaction.Commit;
    btnAllConnect.click;
      finally
      DBGridInfo.Cursor:=crDefault;
      btnImportCard.Enabled:=true;
      cbElem.SetFocus;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

    end;
end;

procedure TfrmAdd.TabSheet4Show(Sender: TObject);
begin
 dm.tblElements.Active:=false;
 dm.tblElements.Open;
end;

end.
