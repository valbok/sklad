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
    pmZakazi: TPopupMenu;
    miCreateZakaz: TMenuItem;
    miAddToZAkaz: TMenuItem;
    btnOptions: TBitBtn;
    Bevel1: TBevel;
    Label7: TLabel;
    lblZakaz: TLabel;
    miSelectZakaz: TMenuItem;
    cbFN: TComboBox;
    N1: TMenuItem;
    miEdit: TMenuItem;
    Anim: TAnimate;
    procedure btnCloseClick(Sender: TObject);
    procedure CBTableNameChange(Sender: TObject);
    procedure CBtypes_by_compClick(Sender: TObject);
    procedure CBFieldNameChange(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnOpenConnectClick(Sender: TObject);
    procedure gridFindDblClick(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure fnd;
    procedure btnPoiskClick(Sender: TObject);
    procedure GetFind;
    procedure for_save(var where:string;comp_id:integer);
    procedure cbFNChange(Sender: TObject);
    procedure findElem(var params,logParams:array of string;
                           LengthParam:integer;
                           paramName:string;
                           var qry:TibQuery;
                           ravno,menshe,bolshe,stOt,StDo:string;
                           fieldText:boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SetPath(compname,typeName:string;root:boolean);
    procedure gridFindTitleClick(Column: TColumn);
    procedure SetWhere(st:string);
    procedure btnGenClick(Sender: TObject);
    procedure SetZakaz_id(value:integer);
    procedure SetZakaz_exists(value:bool);
    procedure miCreateZakazClick(Sender: TObject);
    procedure lblZakazClick(Sender: TObject);
    procedure SetInfoZakaz(from_whom,for_what:string;thedate:TdateTime);
    procedure GetInfoZakaz(var zakaz_id:integer;var from_whom,for_what:string;var thedate:TdateTime);
    procedure miSelectZakazClick(Sender: TObject);
    procedure miAddToZAkazClick(Sender: TObject);
    procedure pmZakaziPopup(Sender: TObject);
    function CheckValueError(st:string;divider:String;Count:integer;Var error:boolean):string;
    procedure miEditClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddToZakaz(elem_id:integer);
  private
    { Private declarations }
    _zakaz_id:integer;
    _zakaz_exists:bool;
    _from_whom,
    _for_what:string;
    _thedate:TdateTime;
    params,LogParams:array of string;
  public
    { Public declarations }
    property zakaz_id: integer read _zakaz_id write SetZakaz_id;
    property zakaz_exists: bool read _zakaz_exists write SetZakaz_exists;
  end;
const
  elem_name='name';
  unit_izmr='unit_izmr';
  numer='numer';
  info='info';
  r='r';
  dopusk='dopusk';
  tks='tks';
  type_name='type_name';
{=========}
  menshe='menshe';
  bolshe='bolshe';
  ravno='ravno';
  stOt='ot';
  stDo='do';
var
  frmFind: TfrmFind;
  compName,typeName:string;
  quot:string='';
  divider:string='+';
implementation

uses Dmo,unAdd, UnitDMFind, unitOstatki, DB, unitSelect, unitConsole,
  UnitCreateWhere, UnitAddZakaz, unitRequests, unitSelectZAkaz,main,
  UnitAddRequests,unitDMFindElem, unitElem, UnitCFG, unitComp, unitTypes;
var tableName:string;
    ReallytableNAme:string;
    fieldName,fn:string;
    Fieldtext:boolean =true;
    chastnieNastr:boolean=false;
{$R *.dfm}
procedure TfrmFind.SetZakaz_exists(value:bool);
begin
   _zakaz_exists:=value;
end;
///////////
procedure TfrmFind.GetInfoZakaz(var zakaz_id:integer;var from_whom,for_what:string;var thedate:TdateTime);
begin
  zakaz_id:=_zakaz_id;
  from_whom:=_from_whom;
  for_what:=_for_what;
  thedate:=_thedate;
end;
//////////////
procedure TfrmFind.SetInfoZakaz(from_whom,for_what:string;thedate:TdateTime);
begin
  _from_whom:=from_whom;
  _for_what:=for_what;
  _thedate:=thedate;
end;
////////////
procedure TfrmFind.SetZakaz_id(value:integer);
begin
  _zakaz_id:=value;
  _zakaz_exists:=true;
  lblZakaz.Caption:='№ = '+intToStr(_zakaz_id);
end;
{procedure TfrmFind.SetZakaz_exists(value:bool);
begin
  _zakaz_exists:=value;
  lblZakaz.Caption:='№ = '+intToStr(_zakaz_id);
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
          cbFieldName.Items.Add('Имя');
       end;
     1:begin
          cbFieldName.Items.Clear;
          tablename:='Types';
          cbFieldName.Items.Add('Имя типа');
          cbFieldName.Items.Add('Имя комплектующего');
       end;
     2:begin
          cbFieldName.Items.Clear;
          tablename:='Elements';
          cbFieldName.Items.Add('Имя');
          cbFieldName.Items.Add('Единица измерения');
          cbFieldName.Items.Add('В наличии');
          cbFieldName.Items.Add('Имя типа');
          cbFieldName.Items.Add('Характеристика');
       end;
     3:begin
          cbFieldName.Items.Clear;
          tablename:='Info';
          cbFieldName.Items.Add('Дата');
          cbFieldName.Items.Add('№ документа');
          cbFieldName.Items.Add('Цена за единицу');
          cbFieldName.Items.Add('От кого получено (кому выдано)');
          cbFieldName.Items.Add('Приход');
          cbFieldName.Items.Add('Расход');
          cbFieldName.Items.Add('Остаток');
          cbFieldName.Items.Add('№ п/п');
          cbFieldName.Items.Add('Имя элемента');
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
                     fieldName:='nameС';
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
//////////////////////
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
try
try
  try
    anim.Active:=true;
   except
   end;
  if EditZnachenie.Text ='' then
    begin
       messageDlg('Пустое значение поиска',mtInformation,[mbOk],0);
       exit;
    end;
      fnd;
    finally
  anim.Active:=false;
    end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;

procedure TfrmFind.btnOpenConnectClick(Sender: TObject);
begin
{  with dm do
   begin
        GridFind.DataSource:=dm.dsQryConsole;
     if  tblComponents.Active = false
       then tblComponents.open;
     if  tblTypes.Active = false
           then tblTypes.Open;
     if  tblelements.Active = false
           then tblelements.Open;

   end;}
end;

procedure TfrmFind.gridFindDblClick(Sender: TObject);
begin

if gridFind.SelectedField.Text = ''
   then exit;
//showmessage(intToStr(DMfind.qryFind_Elem.fieldByName('element_id').asinteger));
 if chastnieNastr then exit;

end;

procedure TfrmFind.TabSheet2Enter(Sender: TObject);
begin
  chastnieNastr:=true;
end;

procedure TfrmFind.TabSheet1Enter(Sender: TObject);
begin  chastnieNastr:=false;
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
procedure TfrmFind.for_save(var where:string;comp_id:integer);
var st:string;
//id:integer;}
begin
{  if not qry.Active then exit;
  if qry.Eof then exit;}

   where:='t.comp_id ='+inttoStr(comp_id);
   st:='( '+where;
{
  while not qry.Eof do
  begin
    id:=qry.fieldByName('type_ID').AsInteger;
    st:=st+' (type_id='+intToStr(id)+') or ';
    qry.Next;
  end;
  delete(st,length(st)-3,3);}

  st:=st+')';
  where:=st;
//  showmessage(where);
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
///////////////
procedure TfrmFind.findElem(var params,logParams:array of string;
                           LengthParam:integer;
                           paramName:string;
                           var qry:TibQuery;
                           ravno,menshe,bolshe,stOt,StDo:string;
                           fieldText:boolean);
var   i:integer;
begin
        for i:=1 to lengthParam do
           if fieldText then
           begin
              qry.ParamByName(paramName+intToStr(i)).AsString:=params[i-1];
//            showmessage('Name= '+ParamName+#13#10+params[i-1]);
            end else
            begin
            if LogParams[i-1] = ravno then
             qry.ParamByName(paramName+'R').AsFloat:=StrToFloat(params[i-1]);
            if LogParams[i-1] = bolshe then
             qry.ParamByName(paramName+'B').AsFloat:=StrToFloat(params[i-1]);
            if LogParams[i-1] = menshe then
             qry.ParamByName(paramName+'M').AsFloat:=StrToFloat(params[i-1]);
//             showmessage('Name= '+ParamName+#13#10+params[i-1]);
            if LogParams[i-1] = Stot then
              begin
               qry.ParamByName(paramName+'Ot').AsFloat:=StrToFloat(params[i-1]);
               qry.ParamByName(paramName+'Do').AsFloat:=StrToFloat(params[i]);
               exit;
              end;

            end;

//вот тут  необходимо выбирать запрос
//   showmessage(qryFind_Elem.SQL.GetText);
//   qryFE_withComp.Prepare;
//   qryFind_Elem.Open;

//   cdsFind_Elem.IndexName:='';
//   cdsFind_Elem.Open;

end;
function   check_Name_error(edt:string;var st:string):boolean;
begin
 result:=false;
  //check root
 if edt[1]<> '/' then
 begin
//   showmessage('Ошибка ввода корневого каталога! Сначало необходимо ввести символ ''/''');
   st:='/'+edt;
   result:=true;
 end;
//check compName
  if edt[length(edt)]<>'/' then
  begin
//   showmessage('Ошибка! Любая папка должна заканчиваться символом ''/''');
   st:=edt+'/';
   result:=true;

  end;
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
/////////////////////
procedure GetFloatParam(var params: array of string;var LogParam: array of string;const LengthParams:integer;ravno,menshe,bolshe:string);
var i,j:integer;
st:string;
begin
  i:=1;
  for j:=0 to lengthParams-1 do
  begin
//    showmessage('do: '+Params[j]);
        while i<=Length(Params[j]) do
        begin
          if Params[j][i]='=' then
          begin
            inc(i);
            logParam[j]:=ravno;
          end;
          if Params[j][i]='>' then
          begin
            inc(i);
            logParam[j]:=bolshe;
          end;
          if Params[j][i]='<' then
          begin
            inc(i);
            logParam[j]:=menshe;
          end;
          st:=St+params[j][i];
          inc(i);
        end;
  Params[j]:=st;
  st:='';
  i:=1;
  end;

end;
procedure GetParams(st:string;quot,divider:string;var params:array of string;cl:integer);
var i,paramindex,dividerIndex: integer;
begin
  paramindex:=1;
  dividerIndex:=0;
  i:=1;
  while (i<=length(st)) do
  begin
   if dividerindex>cl then exit;
     if st[i]=quot then
         inc(i);
    if st[i]=divider then
    begin
     inc(paramIndex);
     inc(i);
     inc(dividerIndex);
    end;
     if st[i]=quot then
         inc(i);
     if dividerindex>cl then exit;
     params[paramindex-1]:=params[paramindex-1]+st[i];
    inc(i);
  end;
end;
////////////////////
procedure clearParamsItems(var qry:tibQuery);
var i:integer;
begin
      for i:=1 to qry.ParamCount do
        qry.Params.Items[i-1].Clear;
        {++++++++clear end++++++++++}
end;
function checkFloatValueError(st:string; params: array of string;paramCount:integer):boolean;
var i,j: integer;
begin
try
      result:=false;
      j:=1;
      for i:=0 to paramCount-1 do
      begin
        if (params[i][j]<>'=') and (params[i][j]<>'<') and (params[i][j]<>'>') then
        begin
{        for  k:=1 to length(params[i]) do
        showmessage(params[i][k]);}
          showmessage('Ошибка! в преобразовании числа. Каждый параметр должен начинаться с "=" или c "<" или c ">"'
                        );
          result:=true;
          break;
        end;
      end;
except

end;
end;
function GetBetweenParam(st,stot,Stdo:string;var params,logparams:array of string;paramCount:integer):boolean;
const c: set of  char = ['0'..'9'];
var i,j:integer;
_Ot,_Do:string;
begin
   result:=false;
   for i:=1 to length(st)do
   begin
      if (st[i]='.') and (st[i+1]='.') and (st[i+2]<>'.')
         and (i<>1)
         then
      begin
          for j:=i+2 to length(st) do
            if (st[j] in c) then
              _do:=_do+st[j];

        result:=true;
        break;
      end else
      begin
          if (st[i] in c) then
          _ot:=_ot+st[i];
      end;

   end;
  if result then
    begin
     params[0]:=_ot;
     params[1]:=_do;
     logParams[0]:=stOt;
     logparams[1]:=stDo;
{       showmessage(_ot);
       Showmessage(_Do);}
   end;
end;
///////////\\\\\\\\\\\\\\\\\\\
procedure Tfrmfind.GetFind;
var
    where_type:string;
    type_id,comp_id:integer;
    st:string;
    err,fe,existBW:boolean;
begin
try
  try
   gridfind.Cursor:=crHourGlass;
  if   check_Name_error(edtWhereFind.text,st) then
      edtWhereFind.text:=st;
   typename:='';
   compName:=getCompName(edtWhereFind.text);
  if  Exists_typename(edtWhereFind.text,err) then
   TypeName:=getTypeName(edtWhereFind.text);
{   showmessage('Comp_name = '+compname);
   showmessage('Type_name = '+typename);}
   if err then
   begin
     showmessage('Ошибка преобразования каталогов (Ошибка в количестве ''/'')');
     exit;
   end;
    with dm, DMFindelem do
    begin
    if qryComponents_by_name.active then qryComponents_by_name.Close;
  if  compName<>'' then
   begin
     qryComponents_by_name.ParamByName('name').AsString:=Compname;
//    qryComponents.SQL.Text:='select * from components where name = '''+CompName+''' ';
    qryComponents_by_name.open;
    if qryComponents_by_name.Eof then
      begin
        showmessage('Такой компонент отсутствует! = "'+CompName+'"');
        exit;
      end;
      comp_id:=  qryComponents_by_name.fieldByName('Component_id').asinteger;
   end;
{------------------Begin find_code---------}
 params:=nil;
 LogParams:=nil;
 edtValue.Text:=CheckValueError(edtValue.Text,divider,2,err);
 if err then
 begin
  showmessage('Ошибка в введённом значении');
  exit;
 end;

 SetLength(params,3);
 SetLength(Logparams,3);
 GetParams(edtValue.Text,quot,divider,params,2);

{ showmessage(params[0]);
 showmessage(params[1]);
 showmessage(params[2]);      }
 
 existBW:=GetBetweenParam(edtValue.Text,stot,stdo,params,logparams,3);
 if not existBW then
  begin
    if (not fieldText) and (CheckFloatValueError(edtValue.Text,params,3)) then
       exit;
    GetFloatParam(params,LogParams,3,ravno,menshe,bolshe);
  end;

{showmessage(params[0]);
 showmessage(params[1]);
 showmessage(params[2]);}

  if cdsFind_Elem.Active then
        cdsFind_Elem.close;
  if cdsFind_elemWD.Active then
        cdsFind_ElemWD.close;

 if (TypeName ='') and (compname<>'') then
    begin
        if fn=elem_name then
        begin
            if qryEwC_name.Active then qryEWC_name.Close;
            clearParamsItems(qryEWC_name);
            qryEWC_name.ParamByName('comp_id').AsInteger:=comp_id;
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWC_name,'','','','','',
                     fieldText
                     );
           dsProvaiderQryFind_elem.DataSet:=qryewc_name;
           fe:=true;
        end else
        if fn=unit_izmr then
        begin
            if qryEWC_unit_izmr.Active then  qryEWC_unit_izmr.Close;
            clearParamsItems(qryEWC_unit_izmr);
            qryEWC_unit_izmr.ParamByName('comp_id').AsInteger:=comp_id;
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWC_unit_izmr,'','','','','',
                     fieldText
                     );
         dsProvaiderQryFind_elem.DataSet:=qryewc_unit_izmr;
         fe:=true;
        end else
        if fn=numer then
        begin
            if qryEWC_numer.Active then  qryEWC_numer.Close;
            clearParamsItems(qryEWC_numer);
            qryEWC_numer.ParamByName('comp_id').AsInteger:=comp_id;
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWC_numer,'','','','','',
                     fieldText
                     );
         dsProvaiderQryFind_elem.DataSet:=qryewc_numer;
         fe:=true;
        end else
        if fn=info then
        begin
            if qryEWC_info.Active then  qryEWC_info.Close;
            clearParamsItems(qryEWC_info);
            qryEWC_info.ParamByName('comp_id').AsInteger:=comp_id;
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWC_info,'','','','','',
                     fieldText
                     );
         dsProvaiderQryFind_elem.DataSet:=qryewc_info;
         fe:=true;
        end else
        if fn=r then
        begin
            if not existBW then
            begin
            if qryEWC_r.Active then  qryEWC_r.Close;             
            clearParamsItems(qryEWC_r);
            qryEWC_r.ParamByName('comp_id').AsInteger:=comp_id;
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWC_r,ravno,menshe,bolshe,stOt,stDo,
                     fieldText
                     );
            dsPoviderFEWD.DataSet:=qryewc_r;
            end else // _rBW
            begin
              if qryEWC_rBW.Active then  qryEWC_rBW.Close;
              clearParamsItems(qryEWC_rBW);
              qryEWC_rBW.ParamByName('comp_id').AsInteger:=comp_id;
              findElem(params,
                       LogParams,
                       3,
                       fn,
                       qryEWC_rBW,ravno,menshe,bolshe,stOt,stDo,
                       fieldText
                       );
              dsPoviderFEWD.DataSet:=qryewc_rBW;
            end;
         fe:=false;
        end else
        if fn=dopusk then
        begin
            if not existBW then
            begin
              if qryEWC_dopusk.Active then  qryEWC_dopusk.Close;
              clearParamsItems(qryEWC_dopusk);
              qryEWC_dopusk.ParamByName('comp_id').AsInteger:=comp_id;
              findElem(params,
                       LogParams,
                       3,
                       fn,
                       qryEWC_dopusk,ravno,menshe,bolshe,stOt,stDo,
                       fieldText
                       );
              dsPoviderFEWD.DataSet:=qryewc_dopusk;
            end else
            begin
              if qryEWC_dopuskBW.Active then  qryEWC_dopuskBW.Close;
              clearParamsItems(qryEWC_dopuskBW);
              qryEWC_dopuskBW.ParamByName('comp_id').AsInteger:=comp_id;
              findElem(params,
                       LogParams,
                       3,
                       fn,
                       qryEWC_dopuskBW,ravno,menshe,bolshe,stOt,stDo,
                       fieldText
                       );
              dsPoviderFEWD.DataSet:=qryewc_dopuskBW;
            end;
            fe:=false;
        end else
        if fn=tks then
        begin
            if qryEWC_tks.Active then  qryEWC_tks.Close;
            clearParamsItems(qryEWC_tks);
            qryEWC_tks.ParamByName('comp_id').AsInteger:=comp_id;
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWC_tks,'','','','','',
                     fieldText
                     );
             dsPoviderFEWD.DataSet:=qryewc_tks;
             fe:=false;
        end else
        if fn=type_name then
        begin
            if qryEWC_type_name.Active then  qryEWC_type_name.Close;
            clearParamsItems(qryEWC_type_name);
            qryEWC_type_name.ParamByName('comp_id').AsInteger:=comp_id;
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWC_type_name,'','','','','',
                     fieldText
                     );
            dsPoviderFEWD.DataSet:=qryewc_type_name;
            fe:=false;
        end;
    end else
{------------------------------------------}
    if (typeName<>'')and (compname<>'') then
      begin
     //проверка существования типа в компоненте etc
        if qryComponents.Active then  qryComponents.Close;
        if qrytypes_by_comp_id_name.Active then
             qrytypes_by_comp_id_name.Close;
         qrytypes_by_comp_id_name.Params.Items[0].Clear;
         qrytypes_by_comp_id_name.Params.Items[1].Clear;
         qryTypes_by_comp_id_name.ParamByName('component_id').AsInteger:=comp_id;
         qryTypes_by_comp_id_name.ParamByName('name').Asstring:=typeName;
         qryTypes_by_comp_id_name.open;

        if qryTypes_by_comp_id_name.Eof then
          begin
           showmessage('Такой тип ('+TypeName+') отсутствует! в комплектующем "'+CompName+'"');
           typename:='';
           exit;
         end else
         type_id:=qryTypes_by_comp_id_name.fieldByName('type_id').AsInteger;
//        showmessage(intToStr(type_id));
        if fn=elem_name then
        begin
                if qryEwT_name.Active then qryEWT_name.Close;
                clearParamsItems(qryEWT_name);
                qryEWT_name.ParamByName('type_id').AsInteger:=type_id;
                findElem(params,
                         LogParams,
                         3,
                         fn,
                         qryEWT_name,'','','','','',
                         fieldText
                         );
               dsProvaiderQryFind_elem.DataSet:=qryEWT_name;
           fe:=true;
        end else
        if fn=unit_izmr then
        begin
            if qryEWt_unit_izmr.Active then  qryEWt_unit_izmr.Close;
            clearParamsItems(qryEWt_unit_izmr);
            qryEWt_unit_izmr.ParamByName('type_id').AsInteger:=type_id;
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWt_unit_izmr,'','','','','',
                     fieldText
                     );
         dsProvaiderQryFind_elem.DataSet:=qryewt_unit_izmr;
         fe:=true;
        end else
        if fn=numer then
        begin
            if qryEWt_numer.Active then  qryEWt_numer.Close;
            clearParamsItems(qryEWt_numer);
            qryEWt_numer.ParamByName('type_id').AsInteger:=type_id;
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWt_numer,'','','','','',
                     fieldText
                     );
         dsProvaiderQryFind_elem.DataSet:=qryewt_numer;
        end else
        if fn=info then
        begin
            if qryEWt_info.Active then  qryEWt_info.Close;
            clearParamsItems(qryEWt_info);
            qryEWt_info.ParamByName('type_id').AsInteger:=type_id;
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWt_info,'','','','','',
                     fieldText
                     );
         dsProvaiderQryFind_elem.DataSet:=qryewt_info;
         fe:=true;
        end else
        if fn=r then
        begin
            if not existBW then
            begin
                if qryEWt_r.Active then  qryEWt_r.Close;
                clearParamsItems(qryEWt_r);
                qryEWt_r.ParamByName('type_id').AsInteger:=type_id;
                findElem(params,
                         LogParams,
                         3,
                         fn,
                         qryEWt_r,ravno,menshe,bolshe,stOt,stDo,
                         fieldText
                         );
                 dsPoviderFEWD.DataSet:=qryewt_r;
            end else //BWW
            begin
                if qryEWt_rBW.Active then  qryEWt_rBW.Close;
                clearParamsItems(qryEWt_rBW);
                qryEWt_rBW.ParamByName('type_id').AsInteger:=type_id;
                findElem(params,
                         LogParams,
                         3,
                         fn,
                         qryEWt_rBW,ravno,menshe,bolshe,stOt,stDo,
                         fieldText
                         );
                 dsPoviderFEWD.DataSet:=qryewt_rBW;
            end;
            fe:=false;

        end else
        if fn=dopusk then
        begin
            if not existBW then
            begin
                if qryEWt_dopusk.Active then  qryEWt_dopusk.Close;
                clearParamsItems(qryEWt_dopusk);
                qryEWt_dopusk.ParamByName('type_id').AsInteger:=type_id;
                findElem(params,
                         LogParams,
                         3,
                         fn,
                         qryEWt_dopusk,ravno,menshe,bolshe,stOt,stDo,
                         fieldText
                         );
                dsPoviderFEWD.DataSet:=qryewt_dopusk;
            end else
            begin
                if qryEWt_dopuskBW.Active then  qryEWt_dopuskBW.Close;
                clearParamsItems(qryEWt_dopuskBW);
                qryEWt_dopuskBW.ParamByName('type_id').AsInteger:=type_id;
                findElem(params,
                         LogParams,
                         3,
                         fn,
                         qryEWt_dopuskBW,ravno,menshe,bolshe,stOt,stDo,
                         fieldText
                         );
                dsPoviderFEWD.DataSet:=qryewt_dopuskBW;
            end;
            fe:=false;
        end else
        if fn=tks then
        begin
            if qryEWt_tks.Active then  qryEWt_tks.Close;
            clearParamsItems(qryEWt_tks);
            qryEWt_tks.ParamByName('type_id').AsInteger:=type_id;
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWt_tks,'','','','','',
                     fieldText
                     );
             dsPoviderFEWD.DataSet:=qryewt_tks;
             fe:=false;

        end else
        if fn=type_name then
        begin
            if qryEWt_type_name.Active then  qryEWt_type_name.Close;
            clearParamsItems(qryEWt_type_name);
            qryEWt_type_name.ParamByName('type_id').AsInteger:=type_id;
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWt_type_name,'','','','','',
                     fieldText
                     );
            dsPoviderFEWD.DataSet:=qryewt_type_name;
            fe:=false;
          end;
      end;
{--------------------------------------------}
   //Если нет ни компонента и ни типа

      if (typename='') and (compname='') then
        begin
        if fn=elem_name then
        begin
            if qryEWoCT_name.Active then qryEWoCT_name.Close;
            clearParamsItems(qryEWoCT_name);
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWoCT_name,'','','','','',
                     fieldText
                     );
            dsProvaiderQryFind_elem.DataSet:=qryEWoCT_name;
            fe:=true;
        end else
        if fn=unit_izmr then
        begin
            if qryEWoCt_unit_izmr.Active then  qryEWoCt_unit_izmr.Close;
            clearParamsItems(qryEWoCt_unit_izmr);
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWoCt_unit_izmr,'','','','','',
                     fieldText
                     );
            dsProvaiderQryFind_elem.DataSet:=qryEWoCt_unit_izmr;
            fe:=true;
        end else
        if fn=numer then
        begin
            if qryEWoCT_numer.Active then  qryEWoCT_numer.Close;
            clearParamsItems(qryEWoCT_numer);
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWoCT_numer,'','','','','',
                     fieldText
                     );
         dsProvaiderQryFind_elem.DataSet:=qryEWoCT_numer;
         fe:=true;
        end else
        if fn=info then
        begin
            if qryEWoCT_info.Active then  qryEWoCT_info.Close;
            clearParamsItems(qryEWoCT_info);
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWoCT_info,'','','','','',
                     fieldText
                     );
         dsProvaiderQryFind_elem.DataSet:=qryEWoCT_info;
         fe:=true;
        end else
        if fn=r then
        begin
            if not existBW then
            begin
            if qryEWoCT_r.Active then  qryEWoCT_r.Close;
            clearParamsItems(qryEWoCT_r);
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWoCT_r,ravno,menshe,bolshe,stOt,stDo,
                     fieldText
                     );
                  dsPoviderFEWD.DataSet:=qryEWoCT_r;
            end else
            begin
              if qryEWoCT_rBW.Active then  qryEWoCT_rBW.Close;
              clearParamsItems(qryEWoCT_rBW);
              findElem(params,
                       LogParams,
                       3,
                       fn,
                       qryEWoCT_rBW,ravno,menshe,bolshe,stOt,stDo,
                       fieldText
                       );
              dsPoviderFEWD.DataSet:=qryEWoCT_rBw;
            end;
         fe:=false;
        end else
        if fn=dopusk then
        begin
            if not existBW then
            begin
            if qryEWoCT_dopusk.Active then  qryEWoCT_dopusk.Close;
            clearParamsItems(qryEWoCT_dopusk);
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWoCT_dopusk,ravno,menshe,bolshe,stOt,stDo,
                     fieldText
                     );
           dsPoviderFEWD.DataSet:=qryEWoCT_dopusk;
           end else
           begin
              if qryEWoCT_dopuskBW.Active then  qryEWoCT_dopuskBW.Close;
              clearParamsItems(qryEWoCT_dopuskBW);
              findElem(params,
                       LogParams,
                       3,
                       fn,
                       qryEWoCT_dopuskBW,ravno,menshe,bolshe,stOt,stDo,
                       fieldText
                       );
               dsPoviderFEWD.DataSet:=qryEWoCT_dopuskBW;
           end;
           fe:=False;
        end else
        if fn=tks then
        begin
            if qryEWoCT_tks.Active then  qryEWoCT_tks.Close;
            clearParamsItems(qryEWoCT_tks);
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWoCT_tks,'','','','','',
                     fieldText
                     );
             dsPoviderFEWD.DataSet:=qryEWoCT_tks;
             fe:=false;
        end else
        if fn=type_name then
        begin
            if qryEWoCT_type_name.Active then  qryEWoCT_type_name.Close;
            clearParamsItems(qryEWoCT_type_name);
            findElem(params,
                     LogParams,
                     3,
                     fn,
                     qryEWoCT_type_name,'','','','','',
                     fieldText
                     );
            dsPoviderFEWD.DataSet:=qryEWoCT_type_name;
            fe:=false;
        end;

     end;
//=================================nachalo poiska
if fe then
  begin
   cdsFind_Elem.IndexName:='';
   cdsFind_Elem.Open;
   gridFind.DataSource:=dsCdsFind_Elem;
   end else
   begin
    cdsFind_elemWD.IndexName:='';
    cdsFind_elemWD.Open;
    gridFind.DataSource:=dsCdsFind_elemWD;
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
     try
       anim.Active:=true;
     except

     end;
  if EdtValue.Text ='' then
    begin
       messageDlg('Пустое значение поиска',mtInformation,[mbOk],0);
       exit;
    end;
  if (FN='') or (edtWhereFind.Text='')
     then exit;
    getFind;

    finally
       gridFind.Cursor:=crDefault;
       btnPoisk.Enabled:=true;
       anim.Active:=false;
    end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

procedure TfrmFind.cbFNChange(Sender: TObject);
var j:integer;
begin
  j:=CBFN.ItemIndex;
  case j of
    0:begin
        fN:=elem_name;
        Fieldtext:=true;
      end;
    1:begin
        fN:=unit_izmr;
        Fieldtext:=true;
      end;
    2:begin
        fN:=numer;
        Fieldtext:=true;
      end;
{    3:begin
        fN:='i.ostatok';
        Fieldtext:=false;
      end;}
    3:begin
        fN:=info;
        Fieldtext:=true;
      end;
    4:begin
        fN:=r;
        Fieldtext:=false;
      end;
    5:begin
        fN:=dopusk;
        Fieldtext:=false;
      end;
    6:begin
        fN:=tks;
        Fieldtext:=true;
      end;
    7:begin
        fN:=type_name;
        Fieldtext:=true;
      end;
    end;
end;

procedure TfrmFind.SpeedButton1Click(Sender: TObject);
begin
  frmSelect.Show;
end;

procedure TfrmFind.gridFindTitleClick(Column: TColumn);
begin
if gridFind.DataSource=DMFindElem.dscdsFind_Elem then
 try
   try
       dmFindElem.cdsFind_Elem.DeleteIndex(Column.FieldName+'indx');
    except
    end;
    dmFindElem.cdsFind_Elem.AddIndex(Column.FieldName+'indx',Column.FieldName,[ixCaseInsensitive],'');
    dmFindElem.cdsFind_Elem.IndexName:=Column.FieldName+'indx';

 except
//    Showmessage('Invalid TypeField');
 end else
if gridFind.DataSource=DMFindElem.dscdsFind_ElemWD then
 try
   try
       dmFindElem.cdsFind_ElemWD.DeleteIndex(Column.FieldName+'indx');
    except
    end;
    dmFindElem.cdsFind_ElemWD.AddIndex(Column.FieldName+'indx',Column.FieldName,[ixCaseInsensitive],'');
    dmFindElem.cdsFind_ElemWD.IndexName:=Column.FieldName+'indx';

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
procedure TfrmFind.AddToZakaz(elem_id:integer);
begin
    if not _zakaz_exists then begin
     showmessage('Выберите нужный заказ, перед добавлением!');
     exit;
    end;
//    with dmFindElem do
//    if  gridFind.DataSource =dsCdsFind_elem then
     frmAddrequests.setZakazInfo(_zakaz_id,elem_id);
     frmAddRequests.Show;
end;
procedure TfrmFind.miAddToZAkazClick(Sender: TObject);
begin
 try
   try
    gridFind.Cursor:=crHourGlass;
    btnPoisk.Enabled:=false;
{    if not _zakaz_exists then begin
     showmessage('Выберите нужный заказ, перед добавлением!');
    exit;
    end;        }
    with dmFindElem do
    if  gridFind.DataSource =dsCdsFind_elem then
        addToZakaz(DMfindElem.CdsFind_Elem.fieldByName('element_id').asinteger)
//     frmAddrequests.setZakazInfo(_zakaz_id,DMfindElem.CdsFind_Elem.fieldByName('element_id').asinteger)
     else
      if   gridFind.DataSource=dsCdsFind_elemWD then
         addToZakaz(DMfindElem.CdsFind_elemWD.fieldByName('element_id').asinteger)
//       frmAddrequests.setZakazInfo(_zakaz_id,DMfindElem.CdsFind_elemWD.fieldByName('element_id').asinteger);
//     frmAddRequests.Show;
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
       miAddToZAkaz.Enabled:=(gridFind.DataSource=dmFindelem.dsCdsFind_Elem)
      or (  gridFind.DataSource=dmFindelem.dsCdsFind_ElemWD);
//     miAddToZAkaz.Enabled:=gridFind.DataSource=dmFindelem.dsCdsFind_ElemWD;
   miAddToZAkaz.Enabled:=_zakaz_exists;
   if not ((gridFind.DataSource=dmFindelem.dsCdsFind_Elem)
            or (gridFind.DataSource=dmFindelem.dsCdsFind_ElemWD)) then
   miAddToZAkaz.Enabled:=false;

   except
     miAddToZAkaz.Enabled:=false;
   end;
try
     miEdit.Enabled:=gridFind.SelectedField.Text<>'';
     miEdit.Enabled:=(gridFind.DataSource=dmFindelem.dsCdsFind_Elem)
     or (gridFind.DataSource=dmFindelem.dsCdsFind_ElemWD);
//     miEdit.Enabled:=gridFind.DataSource=dmFindelem.dsCdsFind_ElemWD;
except
 miEdit.Enabled:=false;
end;
end;
function TfrmFind.CheckValueError(st:string;divider:String;Count:integer;Var error:boolean):string;
var i:integer;
    ind:integer;
begin
  ind:=0;
  error:=false;
  if (st[1] = divider) or (st[length(st)]= divider) then
   begin
     error:=true;
     exit;
   end;
  for i:=1 to length(st) do
  begin
    if st[i] = divider then
    begin
     inc(ind);
     if ind > Count then
     begin
      error:=true;
      break;
     end;
    end;
    result:=result+st[i];
  end;
end;
procedure TfrmFind.miEditClick(Sender: TObject);
begin
with dmfindElem do
  try
   try
         gridFind.Cursor:=crHourGlass;
//   if gridFind.DataSource =
        with dm do
         try
           if qryTypes_by_name.Active then
              qryTypes_by_name.close;
           if qryOstatok_By_elem_id.Active then
              qryOstatok_By_elem_id.close;
           if qryComp_name_by_type_id.Active then
              qryComp_name_by_type_id.close;


           qryOstatok_By_elem_id.ParamByName('element_id').AsInteger:=CdsFind_Elem.fieldByName('element_id').AsInteger;
           qryComp_name_by_type_id.ParamByName('Type_id').AsInteger:=CdsFind_Elem.fieldByName('type_id').AsInteger;
           qryTypes_by_name.ParamByName('type_id').AsInteger:=CdsFind_Elem.fieldByName('type_id').AsInteger;
           try
             qryTypes_by_name.Open;
           except
           end;
           try
             qryOstatok_By_elem_id.Open;
           except
           end;
           try
             qryComp_name_by_type_id.Open;
           except
           end;
         except
         end;
         if  gridFind.DataSource =dsCdsFind_Elem then
              frmElements.SetElem(CdsFind_Elem.fieldByName('name').AsString,
                                  CdsFind_Elem.fieldByName('unit_izmerenie').AsString,
                                  CdsFind_Elem.fieldByName('numer').AsString,
                                  CdsFind_Elem.fieldByName('info').AsString,
                                  CdsFind_Elem.fieldByName('user_name').AsString,
                                  dm.qryTypes_by_name.fieldByName('name').AsString,
                                  CdsFind_Elem.fieldByName('type_id').AsInteger,
                                  CdsFind_Elem.fieldByName('element_id').Asinteger,
                                  dm.qryOstatok_By_elem_id.fieldByName('ostatok').AsFloat,
                                  dm.qryComp_name_by_type_id.fieldByName('name').AsString
                                  );
         if  gridFind.DataSource =dsCdsFind_elemWD then
              frmElements.SetElem(CdsFind_elemWD.fieldByName('name').AsString,
                                  CdsFind_elemWD.fieldByName('unit_izmerenie').AsString,
                                  CdsFind_elemWD.fieldByName('numer').AsString,
                                  CdsFind_elemWD.fieldByName('info').AsString,
                                  CdsFind_elemWD.fieldByName('user_name').AsString,
                                  dm.qryTypes_by_name.fieldByName('name').AsString,
                                  CdsFind_elemWD.fieldByName('type_id').AsInteger,
                                  CdsFind_elemWD.fieldByName('element_id').Asinteger,
                                  dm.qryOstatok_By_elem_id.fieldByName('ostatok').AsFloat                                  ,
                                  dm.qryComp_name_by_type_id.fieldByName('name').AsString
                                  );

              frmElements.show;
       //       frmElements.sbShowLinks.click;

    finally
       gridFind.Cursor:=crDefault;
       btnPoisk.Enabled:=true;
    end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;

end;

procedure TfrmFind.btnOptionsClick(Sender: TObject);
begin
  with dmFindElem,frmCfg do
  begin
     SetUser(main._login);
     GetCFGFromFile(unitCFG.cfg+main._login,
                        cdsFind_elemWDELEMENT_ID,
                        cdsFind_elemWDNAME,
                        cdsFind_elemWDUNIT_IZMERENIE,
                        cdsFind_elemWDNUMER,
                        cdsFind_elemWDTYPE_ID,
                        cdsFind_elemWDINFO,
                        cdsFind_elemWDUSER_NAME,
                        cdsFind_elemWDRESISTANCE,
                        cdsFind_elemWDDOPUSK,
                        cdsFind_elemWDTKS,
                        cdsFind_elemWDTYPE_NAME,'-1');
                       
     GetVisibleField(   cdsFind_elemWDELEMENT_ID,
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
     Show;
    end;
end;

procedure TfrmFind.FormCreate(Sender: TObject);
begin
{with dmfindElem,frmCFg do
     GetCFGFromFile(unitCFG.cfg+main._login,
                        cdsFind_elemWDELEMENT_ID,
                        cdsFind_elemWDNAME,
                        cdsFind_elemWDUNIT_IZMERENIE,
                        cdsFind_elemWDNUMER,
                        cdsFind_elemWDTYPE_ID,
                        cdsFind_elemWDINFO,
                        cdsFind_elemWDUSER_NAME,
                        cdsFind_elemWDRESISTANCE,
                        cdsFind_elemWDDOPUSK,
                        cdsFind_elemWDTKS,
                        cdsFind_elemWDTYPE_NAME,'-1');
}
end;

end.
