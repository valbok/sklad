unit UnitFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, DBCtrls,IBquery,
  Menus;

type
  TfrmFind = class(TForm)
    PanelMain: TPanel;
    PanelTop: TPanel;
    gridFind: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    EditZnachenie: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CBTableName: TComboBox;
    Label3: TLabel;
    CBFieldName: TComboBox;
    btnFind: TBitBtn;
    pnlRight: TPanel;
    btnClose: TBitBtn;
    gbElem: TGroupBox;
    edtWhereFind: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    edtValue: TEdit;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    btnPoisk: TBitBtn;
    btnGen: TBitBtn;
    pmZakazi: TPopupMenu;
    miCreateZakaz: TMenuItem;
    miAddToZAkaz: TMenuItem;
    btnOptions: TBitBtn;
    Bevel1: TBevel;
    Label7: TLabel;
    lblZakaz: TLabel;
    miSelectZakaz: TMenuItem;
    procedure btnCloseClick(Sender: TObject);
    procedure CBTableNameChange(Sender: TObject);
    procedure CBtypes_by_compClick(Sender: TObject);
    procedure CBFieldNameChange(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOpenConnectClick(Sender: TObject);
    procedure gridFindDblClick(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure fnd;
    procedure btnPoiskClick(Sender: TObject);
    procedure GetFind;
    procedure for_save(var qry:Tibquery;var where:string);
    procedure cbFNChange(Sender: TObject);
    procedure findElem(where_type:string;stand:string);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SetPath(compname,typeName:string;root:boolean);
    procedure gridFindTitleClick(Column: TColumn);
    procedure SetWhere(st:string);
    procedure btnGenClick(Sender: TObject);
    procedure SetZakaz_id(value:integer);
//   procedure SetZakaz_exists(value:bool);
    procedure miCreateZakazClick(Sender: TObject);
    procedure lblZakazClick(Sender: TObject);
    procedure SetInfoZakaz(from_whom,for_what:string;thedate:TdateTime);
    procedure GetInfoZakaz(var zakaz_id:integer;var from_whom,for_what:string;var thedate:TdateTime);
    procedure miSelectZakazClick(Sender: TObject);
    procedure miAddToZAkazClick(Sender: TObject);
    procedure pmZakaziPopup(Sender: TObject);
  private
    { Private declarations }
    _zakaz_id:integer;
    _zakaz_exists:bool;
    _from_whom,
    _for_what:string;
    _thedate:TdateTime;

  public
    { Public declarations }
    property zakaz_id: integer read _zakaz_id write SetZakaz_id;
//    property zakaz_exists: bool read _zakaz_exists write SetZakaz_exists;
  end;

var
  frmFind: TfrmFind;
  compName,typeName:string;

implementation

uses Dmo,unAdd, UnitDMFind, unitOstatki, DB, unitSelect, unitConsole,
  UnitCreateWhere, UnitAddZakaz, unitRequests, unitSelectZAkaz,main,
  UnitAddRequests;
var tableName:string;
    ReallytableNAme:string;
    fieldName:string;
    Fieldtext:boolean;
    chastnieNastr:boolean=false;
{$R *.dfm}
procedure TfrmFind.GetInfoZakaz(var zakaz_id:integer;var from_whom,for_what:string;var thedate:TdateTime);
begin
  zakaz_id:=_zakaz_id;
  from_whom:=_from_whom;
  for_what:=_for_what;
  thedate:=_thedate;
end;
procedure TfrmFind.SetInfoZakaz(from_whom,for_what:string;thedate:TdateTime);
begin
  _from_whom:=from_whom;
  _for_what:=for_what;
  _thedate:=thedate;
end;
procedure TfrmFind.SetZakaz_id(value:integer);
begin
  _zakaz_id:=value;
  _zakaz_exists:=true;
  lblZakaz.Caption:='� = '+intToStr(_zakaz_id);
end;
{procedure TfrmFind.SetZakaz_exists(value:bool);
begin
  _zakaz_exists:=value;
  lblZakaz.Caption:='� = '+intToStr(_zakaz_id);
end;}

procedure TfrmFind.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmFind.CBTableNameChange(Sender: TObject);
var i:integer;
begin
    i:=cbTableName.ItemIndex;
    case i of
     0:begin
          cbFieldName.Items.Clear;
          tablename:='Components';
          cbFieldName.Items.Add('���');
       end;
     1:begin
          cbFieldName.Items.Clear;
          tablename:='Types';
          cbFieldName.Items.Add('��� ����');
          cbFieldName.Items.Add('��� ��������������');
       end;
     2:begin
          cbFieldName.Items.Clear;
          tablename:='Elements';
          cbFieldName.Items.Add('���');
          cbFieldName.Items.Add('������� ���������');
          cbFieldName.Items.Add('� �������');
          cbFieldName.Items.Add('��� ����');
          cbFieldName.Items.Add('��������������');
       end;
     3:begin
          cbFieldName.Items.Clear;
          tablename:='Info';
          cbFieldName.Items.Add('����');
          cbFieldName.Items.Add('� ���������');
          cbFieldName.Items.Add('���� �� �������');
          cbFieldName.Items.Add('�� ���� �������� (���� ������)');
          cbFieldName.Items.Add('������');
          cbFieldName.Items.Add('������');
          cbFieldName.Items.Add('�������');
          cbFieldName.Items.Add('� �/�');
          cbFieldName.Items.Add('��� ��������');          
       end;
      else  tablename:='Elements';    end;
end;

procedure TfrmFind.CBtypes_by_compClick(Sender: TObject);
begin
{try
 try
    gridFind.Cursor:=crHourGlass;
 with dm do
   begin
          if qrytypes_by_comp.Active
           then qrytypes_by_comp.close;
            gridFind.DataSource:=dsQryType_by_comp;
            qrytypes_by_comp.ParamByName('comp_name').AsString:=CBtypes_by_comp.Text;
//       qryConsole.SQL.Text:='select * from types_by_component('''+CBtypes_by_comp.Text+''')';
           qrytypes_by_comp.Open;
  end;
      finally
      gridFind.Cursor:=crDefault;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;}

end;

procedure TfrmFind.CBFieldNameChange(Sender: TObject);
var i,j:integer;
begin
    i:=cbTableName.ItemIndex;
    j:=CBFieldName.ItemIndex;
    case i of
     0:begin
            case j of
              0:begin
                  fieldName:='name';
                  fieldText:=true;
                end;
            end;
       end;
     1:begin
             case j of
                0:begin
                     fieldName:='nameT';
                     fieldText:=true;
                  end;
                1:begin
                     fieldName:='name�';
                     fieldText:=true;
                  end;

             end;
       end;
     2:begin
            case j of
              0:begin
                  fieldName:='name';
                  fieldText:=true;
                end;
              1:begin
                  fieldName:='unit_izmerenie';
                  fieldText:=true;
                 end;
              2:begin
                   fieldName:='presence';
                   fieldText:=false;
                end;
              3:begin
                   fieldName:='nameT';
                   fieldText:=true;
                end;
              4:begin
                   fieldName:='info';
                   fieldText:=true;
                end;


            end;
       end;
     3:begin
            case j of
              0:begin
                  fieldName:='TheDate';
                  fieldText:=true;
                end;
              1:begin
                  fieldName:='num_doc';
                  fieldText:=false;
                end;
              2:begin
                  fieldName:='cost_for_one';
                  fieldText:=false;
                end;
              3:begin
                   fieldName:='from_whom';
                   fieldText:=true;
                end;
              4:begin
                   fieldName:='arrival';
                   fieldText:=false;
                 end;
              5:begin
                  fieldName:='charge';

                end;
              6:begin
                 fieldName:='ostatok';

                end;
              7:begin
                 fieldName:='num_p_p';

                end;
              8:begin
                 fieldName:='nameE';

                end;


            end;
       end;
      end;
end;
procedure tfrmFind.fnd;
var quot:string;
begin
  if fieldText
     then quot:=''''
       else quot:='';
  if (tablename='') or (fieldname='')
     then exit;
   with dmFind do
    begin
   try
     try
     btnFind.Enabled:=false;
     gridFind.Cursor:=crHourGlass;
     ReallytableNAme:=tablename;
    if tableName ='Components' then
        begin
                gridFind.DataSource:=dsQryFindComponents;
                qryFindComponents.close;
                qryFindComponents.ParamByName('name').AsString:=EditZnachenie.Text;
//                showmessage(qryFindComponents.SQL.Text);
                qryFindComponents.Open;
                exit;
        end;
   if tableName ='Types' then
        begin
                if Fieldname = 'nameT' then
                begin
                  if qryFindTypes_by_nameT.Active then qryFindTypes_by_nameT.close;;
                   gridFind.DataSource:=dsQryFindTypes_by_nameT;
                   qryFindTypes_by_nameT.ParamByName('name').AsString:=EditZnachenie.Text;
                   qryFindTypes_by_nameT.Open;
                 end
                     else begin
                  if qryFindTypes_by_nameC.Active then qryFindTypes_by_nameC.close;;
                            gridFind.DataSource:=dsQryFindTypes_by_nameC;
                            qryFindTypes_by_nameC.ParamByName('name').AsString:=EditZnachenie.Text;
                            qryFindTypes_by_nameC.Open;
                          end;
                 exit;
        end;
   if tableName ='Elements' then
        begin
         qryFindElem_by_name.ParamByName('name').Clear;
         qryFindElem_by_name.ParamByName('unit_izmerenie').Clear;
         qryFindElem_by_name.ParamByName('presence').Clear;
                         if Fieldname = 'nameT' then
                      begin
                          if qryFindElem_by_nameT.Active then qryFindELem_by_nameT.close;
                           gridFind.DataSource:=dsQryFindElem_by_nameT;
                           qryFindElem_by_nameT.ParamByName('name').AsString:=EditZnachenie.Text;
                           qryFindElem_by_nameT.Open;
                           exit;
                          end;
 //                if Fieldname = 'name' then
                begin
                  if qryFindElem_by_name.Active then qryFindELem_by_name.close;
                   gridFind.DataSource:=dsQryFindElem_by_name;
                   if fieldname='presence' then
                     qryFindElem_by_name.ParamByName(fieldname).AsFloat:=StrToFloat(EditZnachenie.Text)
                      else
                   qryFindElem_by_name.ParamByName(fieldname).AsString:=EditZnachenie.Text;
//                   showmessage(qryFindElem_by_name.SQL.Text);

                   qryFindElem_by_name.Open;
                   exit;
                 end ;
{               if Fieldname = 'presence' then
                      begin
                          if qryFindElem_by_name.Active then qryFindELem_by_name.close;
                           gridFind.DataSource:=dsQryFindElem_by_name;
                           qryFindElem_by_name.ParamByName('presence').AsString:=EditZnachenie.Text;
                           qryFindElem_by_name.Open;
                           exit;
                          end;}
                exit;
        end;
   if tableName ='Info' then
        begin
             qryFindInfo_by_date.ParamByName('thedate').Clear;
             qryFindInfo_by_date.ParamByName('num_doc').clear;
             qryFindInfo_by_date.ParamByName('from_whom').Clear;
             qryFindInfo_by_date.ParamByName('num_p_p').Clear;
             qryFindInfo_by_date.ParamByName('arrival').Clear;
             qryFindInfo_by_date.ParamByName('charge').Clear;
             qryFindInfo_by_date.ParamByName('ostatok').Clear;
             qryFindInfo_by_date.ParamByName('cost_for_one').Clear;
                //if Fieldname = 'TheDate' then
                begin
                  if qryFindinfo_by_date.Active then qryFindinfo_by_date.close;;
                   if fieldName ='nameE' then
                                   begin
                                      if qryFindinfo_by_elem.Active then
                                         qryFindinfo_by_elem.close;;
                                    qryFindInfo_by_elem.ParamByName('nameE').Clear;
                                    gridFind.DataSource:=dsQryFindinfobyelem;

                       qryFindInfo_by_elem.ParamByName('nameE').AsString:=EditZnachenie.Text;
                       qryFindInfo_by_elem.Open;
                       exit;
                                  end;
                   gridFind.DataSource:=dsQryFindinfo_by_date;
                  if (fieldname='arrival')or(fieldname='charge')or (fieldname='ostatok') or (fieldname='cost_for_one')
                  then qryFindInfo_by_date.ParamByName(fieldname).AsFloat:=StrToFloat(EditZnachenie.Text)
                    else
                    if fieldname='TheDate' then
                       qryFindInfo_by_date.ParamByName(fieldname).AsDate:=strToDate(EditZnachenie.Text)
                       else
                        if fieldname='num_p_p' then
                          qryFindInfo_by_date.ParamByName(fieldname).AsInteger:=StrToInt(EditZnachenie.Text)
                            else
                             qryFindInfo_by_date.ParamByName(fieldname).AsString:=EditZnachenie.Text;
                   qryFindInfo_by_date.Open;
                   exit;
                 end;
{        qryConsole.SQL.Text:='select * from '+tablename+' where '+fieldname+'='+quot+EditZnachenie.Text+quot;
//        showmessage(qryWork.SQL.Text);
           try
               qryConsole.Open;
           except
                messagedlg('Error run query for find',mtError,[mbOk],0);
           end;}
    end;
      finally
      gridFind.Cursor:=crDefault;
      btnFind.Enabled:=true;
      end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;

end;
procedure TfrmFind.btnFindClick(Sender: TObject);
begin
  if EditZnachenie.Text ='' then
    begin
       messageDlg('������ �������� ������',mtInformation,[mbOk],0);
       exit;
    end;
    fnd;
end;

procedure TfrmFind.FormActivate(Sender: TObject);
begin
 if dm.qryConsole.Active then
   dm.qryConsole.Close;
end;

procedure TfrmFind.btnOpenConnectClick(Sender: TObject);
begin
  with dm do
   begin
        GridFind.DataSource:=dm.dsQryConsole;
     if  tblComponents.Active = false
       then tblComponents.open;
     if  tblTypes.Active = false
           then tblTypes.Open;
     if  tblelements.Active = false
           then tblelements.Open;

   end;
end;

procedure TfrmFind.gridFindDblClick(Sender: TObject);
begin

if gridFind.SelectedField.Text = ''
   then exit;
 if chastnieNastr then exit;
{   gridFind.Cursor:=crHourGlass;

   if ReallytableNAme ='Components' then
   begin
      try
       Cursor:=crHourGlass;
       with frmManeger do
       begin
//           btnAllConnect.Click;
//           LocateComponent(gridFind.SelectedField.Text);
//           GridComponent.SetFocus;
       end;
      finally
         gridFind.Cursor:=crDefault;
         Cursor:=crDefault;
      end;
   end;
//////////////
      if ReallytableNAme ='Types' then
         begin
            try
             gridFind.Cursor:=crHourGlass;
             Cursor:=crHourGlass;
             with frmManeger do
             begin
//                 btnAllConnect.Click;
//                 LocateType(StrToInt(gridFind.SelectedField.Text));
//                 Gridtypes.SetFocus;
             end;
            finally
               gridFind.Cursor:=crDefault;
               Cursor:=crDefault;
            end;
         end;
      if ReallytableNAme ='Elements' then
         begin
            try
             gridFind.Cursor:=crHourGlass;
             Cursor:=crHourGlass;
             with frmManeger do
             begin
//                 frmManeger.show;
//                 LocateElem(StrToInt(gridFind.SelectedField.Text));

//                 DbGridElements.SetFocus;
             end;
            finally
               gridFind.Cursor:=crDefault;
               Cursor:=crDefault;
            end;
         end;
      if ReallytableNAme ='Info' then
         begin
            try
             gridFind.Cursor:=crHourGlass;
             Cursor:=crHourGlass;
             with frmManeger do
             begin
//                 btnAllConnect.Click;

//                 LocateInfo(StrToInt(gridFind.SelectedField.Text));
//                 DbGridInfo.SetFocus;
             end;
            finally
               gridFind.Cursor:=crDefault;
               Cursor:=crDefault;
            end;
         end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);}

end;

procedure TfrmFind.TabSheet2Enter(Sender: TObject);
begin
  chastnieNastr:=true;
end;

procedure TfrmFind.TabSheet1Enter(Sender: TObject);
begin
  chastnieNastr:=false;
end;
function getCompName(st:string):string;
var i:integer;
begin
  result:='';
  for i:=2 to length(st) do
   if st[i] ='/' then
   begin
     result:=copy(st,2,i-2);
     break;
   end;

end;
function getTypeName(st:string):string;
var i:integer;
begin
result:='';
  for i:=length(st)-1 downto 1 do
  begin
   if st[i]='/' then
         begin
       //    result:=copy(st,i+1,length(st));
           break;
         end;
   result:=st[i]+result;
   end;
end;
///////////////
procedure TfrmFind.for_save(var qry:Tibquery;var where:string);
var st:string;
id:integer;
begin
  if not qry.Active then exit;
  if qry.Eof then exit;

  st:='( ';

  while not qry.Eof do
  begin
    id:=qry.fieldByName('ID').AsInteger;
    st:=st+' (type_id='+intToStr(id)+') or ';
    qry.Next;
  end;
  delete(st,length(st)-3,3);
  st:=st+')';
  where:=st;
end;
//////////////////
procedure AddJe(fn:string;var value:string);
var i: integer;
st:string;
begin
  for i:=1 to length(value) do
  begin
     if (value[i]=' ') and (value[i-1]='r') and (value[i-2]='o') and (value[i-3]=' ')
        then st:=st+' '+fn+' ';
     if (value[i]=' ') and (value[i-1]='d') and (value[i-2]='n') and (value[i-3]='a') and (value[i-4]=' ')
        then st:=st+' '+fn+' ';

       st:=st+value[i];
  end;
value:=st;
end;
procedure TfrmFind.findElem(where_type:string;stand:string);
var value:string;
begin
with dm,dmfind do
begin

   cdsFind_Elem.close;
   qryFind_Elem.Close;
if qryFind_Elem.Active then qryFind_Elem.close;
//  gridFind.DataSource:=dsQryFind_elem;
  gridFind.DataSource:=dsCdsFind_Elem;

        value:=edtValue.Text;
if not Fieldtext then
        begin
//          AddJe(fn,value);
          where_type:='('+Value+' '+stand+' '+where_type+')';
        end else
        begin
//                AddJe(fn,value);
//                showmessage(value);
             where_type:='(('+value+') '+stand+' '+where_type+')';
        end;
//    showmessage(where_type);
//��� ���  ���������� �������� ������
        qryFind_Elem.SQL.Text:='	SELECT '+
		    	'e.element_id, '+
			'e.name, '+
			'e.unit_izmerenie, '+
			'e.numer, '+
			'e.type_id, '+
			'e.info, '+
			'e.user_name, '+
			'i.ostatok, '+
			'd.resistance, '+
			'd.dopusk, '+
			'd.tks, '+
                        'd.type_name '+#13#10+
                   	'FROM 	'+
			'(info i right join '+
				'(elements e left join detali d on e.element_id=d.element_id) '+
					'on i.element_id=e.element_id) '+

                	'where '+
                	    '( '+where_type+' '+
                 		'and '+
                     	   'i.num_p_p = (select max(num_p_p) from info where '+
		                ' element_id=e.element_id) '+
                		') '+
                                'or '+
                		   '('+where_type+' and '+
		        	' i.num_p_p is null) ';

//   showmessage(qryFind_Elem.SQL.GetText);
   qryFind_Elem.Prepare;
{frmSql.memSql.text:=qryFind_Elem.SQL.GetText;
exit;}
//   qryFind_Elem.Open;

   cdsFind_Elem.IndexName:='';
   cdsFind_Elem.Open;
 end;
end;
function   check_Name_error(edt:string;var st:string):boolean;
begin
 result:=false;
  //check root
 if edt[1]<> '/' then
 begin
//   showmessage('������ ����� ��������� ��������! ������� ���������� ������ ������ ''/''');
   st:='/'+edt;
   result:=true;
//   exit;
 end;
//check compName
  if edt[length(edt)]<>'/' then
  begin
//   showmessage('������! ����� ����� ������ ������������� �������� ''/''');
   st:=edt+'/';
   result:=true;
//   exit;
  end;
//  for i:=1 to length(edt) do

//
end;
function Exists_typename(st:string;var error:boolean):boolean;
var i,count:integer;
begin
  result:=false;
  error:=false;
  count:=0;
  for i:=1 to length(st) do
    if st[i]='/' then inc(count);

  if count = 3 then
   result:=true;
   if count > 3 then
   error:=true;
end;
//////////////////
procedure Tfrmfind.SetPath(compname,typeName:string;root:boolean);
begin
edtWhereFind.Text:='/';
if not root
 then
 begin
 if (compName='') and (typeName='') then
   edtWhereFind.Text:='/';
 if (TypeName='')and (compName<>'') then
   edtWhereFind.Text:='/'+compname+'/';
 if (TypeName<>'')and (compName<>'') then
          edtWhereFind.Text:='/'+compname+'/'+typename+'/';
  end else
  begin
    edtWhereFind.Text:='/';
  end;
end;
procedure Tfrmfind.GetFind;
var
where_type:string;
type_id,comp_id:integer;
st:string;
err:boolean;
begin
try
  try
   gridfind.Cursor:=crHourGlass;
  if   check_Name_error(edtWhereFind.text,st) then
      edtWhereFind.text:=st;

   compName:=getCompName(edtWhereFind.text);
  if  Exists_typename(edtWhereFind.text,err) then
   TypeName:=getTypeName(edtWhereFind.text);
   if err then
   begin
     showmessage('������ �������������� ��������� (������ � ���������� ''/'')');
     exit;
   end;
//   showmessage(typename);
    with dm, DMFind do
    begin
    if not qryComponents.active then qryComponents.Close;
  if  compName<>'' then
   begin
    qryComponents.SQL.Text:='select * from components where name = '''+CompName+''' ';
    qryComponents.open;
    if qryComponents.Eof then
      begin
        showmessage('����� ��������� �����������! = "'+CompName+'"');
        exit;
      end;
      comp_id:=  qryComponents.fieldByName('Component_id').asinteger;
   end;
 if (TypeName ='') and (compname<>'') then
    begin
      if qrytypes_by_comp.Active then qrytypes_by_comp.Close;
        qrytypes_by_comp.ParamByName('comp_name').AsString:=CompName;
        qrytypes_by_comp.Open;
        for_save(qryTypes_by_comp,where_type);
        findElem(where_type,'and');
    end else
      if (typeName<>'')and (compname<>'') then
      begin
        if qryComponents.Active then  qryComponents.Close;
         qryComponents.SQL.Text:='select * from types where component_id  = '+intToStr(Comp_id)+' and name='''+typename+'''';
         qryComponents.open;
        if qryComponents.Eof then
          begin
           showmessage('����� ��� ('+TypeName+') �����������! � ���������� "'+CompName+'"');
           exit;
         end else
         type_id:=qryComponents.fieldByName('type_id').AsInteger;

        where_type:='( type_id = '+intTostr(type_id)+')';
        findElem(where_type,'and');
      end;
      if (typename='') and (compname='') then
        begin
          where_type:='';
          findElem(where_type,'');
        end;
  end;
 finally
      gridfind.Cursor:=crDefault;
  end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;
////////////////////////////////////

procedure TfrmFind.btnPoiskClick(Sender: TObject);
begin
try
  try
     gridFind.Cursor:=crHourGlass;
     btnPoisk.Enabled:=false;
  if EdtValue.Text ='' then
    begin
       messageDlg('������ �������� ������',mtInformation,[mbOk],0);
       exit;
    end;
{  if (FN='') or (edtWhereFind.Text='')
     then exit;}

    getFind;

    finally
       gridFind.Cursor:=crDefault;
       btnPoisk.Enabled:=true;
    end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

procedure TfrmFind.cbFNChange(Sender: TObject);
//var j:integer;
begin
{  j:=CBFN.ItemIndex;
  case j of
    0:begin
        fN:='e.name';
        Fieldtext:=true;
      end;
    1:begin
        fN:='e.unit_izmerenie';
        Fieldtext:=true;
      end;
    2:begin
        fN:='e.numer';
        Fieldtext:=true;
      end;
    3:begin
        fN:='i.ostatok';
        Fieldtext:=false;
      end;
    4:begin
        fN:='e.info';
        Fieldtext:=true;
      end;
    5:begin
        fN:='d.resistance';
        Fieldtext:=false;
      end;
    6:begin
        fN:='d.dopusk';
        Fieldtext:=false;
      end;
    7:begin
        fN:='d.tks';
        Fieldtext:=true;
      end;
    8:begin
        fN:='d.type_name';
        Fieldtext:=true;
      end;
    end; }
end;

procedure TfrmFind.SpeedButton1Click(Sender: TObject);
begin
  frmSelect.Show;
end;

procedure TfrmFind.gridFindTitleClick(Column: TColumn);
begin
if gridFind.DataSource=DMFind.dscdsFind_Elem then
 try
   try
       dmFind.cdsFind_Elem.DeleteIndex(Column.FieldName+'indx');
    except
    end;
    dmFind.cdsFind_Elem.AddIndex(Column.FieldName+'indx',Column.FieldName,[ixCaseInsensitive],'');
    dmFind.cdsFind_Elem.IndexName:=Column.FieldName+'indx';

 except
//    Showmessage('Invalid TypeField');
 end;

end;
procedure TfrmFind.SetWhere(st:string);
begin
   edtValue.text:=st;
end;
procedure TfrmFind.btnGenClick(Sender: TObject);
begin
  frmCreateWhere.show;
end;

procedure TfrmFind.miCreateZakazClick(Sender: TObject);
begin
 frmAddzakaz.show;
end;

procedure TfrmFind.lblZakazClick(Sender: TObject);
begin
  if _zakaz_exists then
    frmSelectZakaz.show;
end;

procedure TfrmFind.miSelectZakazClick(Sender: TObject);
begin
 if not dm.IBDatabase.Connected then
   dm.IBDatabase.Open;

  frmSelectZakaz.user_name:=main._login;
  frmSelectZakaz.show;
  frmSelectZakaz.btnShowZakazi.Click;
end;

procedure TfrmFind.miAddToZAkazClick(Sender: TObject);
begin
 try
   try
    gridFind.Cursor:=crHourGlass;
    btnPoisk.Enabled:=false;
    if not _zakaz_exists then begin
     showmessage('�������� ��� �������� ������ �����, ����� �����������!');
    exit;
    end;
     frmAddrequests.setZakazInfo(_zakaz_id,StrToint(gridFind.SelectedField.text));
     frmAddRequests.Show;
    finally
       gridFind.Cursor:=crDefault;
       btnPoisk.Enabled:=true;
    end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;

procedure TfrmFind.pmZakaziPopup(Sender: TObject);
begin
  try
     miAddToZAkaz.Enabled:=gridFind.SelectedField.Text<>'';
     miAddToZAkaz.Enabled:=_zakaz_exists;
   except
     miAddToZAkaz.Enabled:=false;
   end;
end;

end.
