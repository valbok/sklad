unit UnitFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, DBCtrls;

type
  TfrmFind = class(TForm)
    PanelMain: TPanel;
    PanelTop: TPanel;
    gridFind: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    EditZnachenie: TEdit;
    Label2: TLabel;
    CBTableName: TComboBox;
    Label3: TLabel;
    CBFieldName: TComboBox;
    btnFind: TBitBtn;
    TabSheet2: TTabSheet;
    CBtypes_by_comp: TDBLookupComboBox;
    Bevel1: TBevel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    CBElements_by_type: TDBLookupComboBox;
    Label7: TLabel;
    btnClose: TBitBtn;
    CBInfo_By_element: TDBLookupComboBox;
    Label8: TLabel;
    btnOpenConnect: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure CBTableNameChange(Sender: TObject);
    procedure CBtypes_by_compClick(Sender: TObject);
    procedure CBFieldNameChange(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CBElements_by_typeClick(Sender: TObject);
    procedure CBInfo_By_elementClick(Sender: TObject);
    procedure btnOpenConnectClick(Sender: TObject);
    procedure gridFindDblClick(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFind: TfrmFind;

implementation

uses Dmo,unAdd, UnitDMFind;
var tableName:string;
    ReallytableNAme:string;
    fieldName:string;
    Fieldtext:boolean;
    chastnieNastr:boolean=false;
{$R *.dfm}

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
try
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
  end;

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

procedure TfrmFind.btnFindClick(Sender: TObject);
var quot:string;
begin
  if EditZnachenie.Text ='' then
    begin
       messageDlg('������ �������� ������',mtInformation,[mbOk],0);
       exit;
    end;
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

procedure TfrmFind.FormActivate(Sender: TObject);
begin
 if dm.qryConsole.Active then
   dm.qryConsole.Close;
end;

procedure TfrmFind.CBElements_by_typeClick(Sender: TObject);
begin
 with dm do
   begin
     if qryElem_by_type.Active
       then qryElem_by_type.close;
        gridFind.DataSource:=dsQyElem_by_type;
        qryElem_by_type.ParamByName('type_name').AsString:=CBelements_by_type.Text;
//      qryConsole.SQL.Text:='select * from elements_by_type('''+CBelements_by_type.Text+''')';
        qryElem_by_type.Open;
  end;
end;

procedure TfrmFind.CBInfo_By_elementClick(Sender: TObject);
begin
 with dm do
   begin
     if QryInfo_by_elem.Active
       then QryInfo_by_elem.close;
        gridFind.DataSource:=dsQryInfo_by_elem;
        QryInfo_by_elem.ParamByName('elem_name').AsString:=CBinfo_by_element.Text;

        QryInfo_by_elem.Open;

//      qryConsole.SQL.Text:='select * from info_by_element('''+CBinfo_by_element.Text+''')';

  end;
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

try
if gridFind.SelectedField.Text = ''
   then exit;
 if chastnieNastr then exit;   
   gridFind.Cursor:=crHourGlass;

   if ReallytableNAme ='Components' then
   begin
      try
       Cursor:=crHourGlass;
       with frmAdd do
       begin
           btnAllConnect.Click;
           TabSheet1.Show;
           Show;
           LocateComponent(gridFind.SelectedField.Text);
           GridComponent.SetFocus;
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
             with frmAdd do
             begin
                 btnAllConnect.Click;
                 TabSheet2.Show;
                 Show;
                 LocateType(StrToInt(gridFind.SelectedField.Text));
                 Gridtypes.SetFocus;
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
             with frmAdd do
             begin
                 btnAllConnect.Click;
                 TabSheet3.Show;
                 Show;
                 LocateElem(StrToInt(gridFind.SelectedField.Text));
                 DbGridElements.SetFocus;
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
             with frmAdd do
             begin
                 btnAllConnect.Click;
                 TabSheet4.Show;
                 Show;
                 checkBoxElem.Checked:=false;
                 LocateInfo(StrToInt(gridFind.SelectedField.Text));
                 DbGridInfo.SetFocus;
             end;
            finally
               gridFind.Cursor:=crDefault;
               Cursor:=crDefault;
            end;
         end;
  except
    on E:Exception do
     messageDLG(E.Message,mtError,[mbOk],0);
  end;
end;

procedure TfrmFind.TabSheet2Enter(Sender: TObject);
begin
  chastnieNastr:=true;
end;

procedure TfrmFind.TabSheet1Enter(Sender: TObject);
begin
  chastnieNastr:=false;
end;

end.
