unit unitSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, StdCtrls, ExtCtrls,IBQuery, Buttons, Menus;

type
  TfrmSelect = class(TForm)
    PanelStrDb: TPanel;
    gbStrDB: TGroupBox;
    treeStrDB: TTreeView;
    ilApp: TImageList;
    Splitter1: TSplitter;
    Panel1: TPanel;
    btnSelect: TBitBtn;
    btnClose: TBitBtn;
    pmSelect: TPopupMenu;
    miSelect: TMenuItem;
    procedure treeStrDBCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure treeStrDBDblClick(Sender: TObject);
    procedure treeStrDBExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure btnCloseClick(Sender: TObject);
   procedure fucktreeStr;
    procedure btnSelectClick(Sender: TObject);
    procedure miSelectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  CLOSED_ICON=0;
  OPEN_ICON=1;
  File_ICON=2;
  RootStr='Корневой каталог';
  root=0;
  comp=1;
  typ=2;
  elem=3;

var
  frmSelect: TfrmSelect;
  compName,typeName:string;
  tableMassive: array [1..3] of string = ('components','types','elements');
implementation
uses dmo, main, UnitFind;
{$R *.dfm}
function getNumber(st: string):integer;
var i: integer;
s:string;
begin
     for i:=1 to length(st) do
     begin
       if st[i]<>']' then
            s:=s+st[i] else break;
     end;
    delete(s,1,1);
    try
         result:=strToInt(s);
    except
       showmessage('Ошибка преобразования из строки в число!');
       result:=0;
    end;
end;

function chomp(tableName:string):string;
begin
    result:=copy(TableName,1,length(TableName)-1);
end;

procedure fillTree(TableName:string;
                   Parent:TTreeNode;
                   WhereSql: string;
                   var QryW:TIBQuery;
                   var tree:TTreeView;
                   glubina:integer);
var first,tmp : TTreeNode;
index:string;
begin
    First:=parent;
      //tree.Items.GetFirstNode;
    tmp:=first;
        qryW.SQL.Clear;
        qryW.SQL.Text:='Select '+chomp(tablename)+'_id,name from '+tableName+' '+WhereSql;
//        showmessage(qryW.SQL.Text);
          if qryW.Active then qryW.Close;
          qryW.Open;
        while not qryW.Eof do
        begin
//         if glubina =2 then index:='['+intToStr(qryW.fieldByName(chomp(tablename)+'_id').AsInteger)+']: ';
  //      if glubina <=2 then 
          TMP:=tree.Items.AddChild (first, index+qryW.fieldByName('Name').AsString);
{           if glubina >= 3 then
            begin
                TMP.SelectedIndex:=2;
                TMP.ImageIndex:=2;
            end;}
          qryW.Next;
         end;
end;

procedure TfrmSelect.treeStrDBCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
 if Node.ImageIndex=OPEN_ICON then
  begin
     Node.ImageIndex:=CLOSED_ICON;
     Node.SelectedIndex:=CLOSED_ICON;
  end;

end;
procedure TfrmSelect.fucktreeStr;
var tableName:string;
begin
    tableName:='components';
    treeStrDb.Items.Delete(treeStrDb.Items.GetFirstNode);
    treeStrDb.Items.Add(treeStrDb.Items.GetFirstNode,'Корневой каталог');
    fillTree(TableName,treeStrDb.Items.GetFirstNode,'',dm.QryWork,treeStrDb,0);

end;

procedure TfrmSelect.treeStrDBDblClick(Sender: TObject);
 var Start,first,tmp : TTreeNode;
       Path,TableName,whereSql,w : string;
       l:integer;
       notEQ,notMenshe:boolean;
begin
try
  try
  Start:=treeStrDB.Selected;
  treeStrDb.Cursor:=crHourGlass;;
{  StatusBar.Panels[0].Text:='Выполнение инструкции...Ожидание';
  StatusBar.Refresh;}

  if (start.level<>0) and (start.level<3) then
  begin
    TableName:=tableMassive[start.Level+1];
     if start.Level =2 then
        begin
//         w:=intToStr(getNumber(start.text));
//         whereSql:='where '+chomp(tableMassive[start.Level])+'_id = '+w;
         exit;
        end
         else
    whereSql:='where '+chomp(tableMassive[start.Level])+'_id = (select '+chomp(tableMassive[start.Level])+'_id '+
                                               'from '+(tableMassive[start.Level])+' '+
                                               'where name = '''+start.text +''') order by name';
    if start.Level=1 then compName:=treeStrDb.Selected.Text;
    if start.Level=2 then TypeName:=treeStrDb.Selected.Text;    
    treeStrDb.Selected.DeleteChildren;
    fillTree(TableName,start,whereSql,dm.qryWork,treeStrDB,start.level+1);
    start.Expand(false);
  end else
     begin    if start.level = 0 then
                        begin
//                          frmMain.sbConnect.click;
                        fucktreeStr;
                          try
                           start.Expand(false);
                          except
                          end;
                         end else

{              if (start.Level =3) then
                with dm do
                 begin
                     if qryEdit.Active then dm.qryEdit.close;
                     if qryInfoForEdit.Active then dm.qryInfoForEdit.close;

                     qryEdit.ParamByName('pelement_id').AsInteger:=getNumber(start.text);
                     qryInfoForEdit.ParamByName('pelement_id').AsInteger:=getNumber(start.text);


                             qryEdit.Open;
                             qryInfoForEdit.Open;
                 end;}
        end;
   finally
       treeStrDb.Cursor:=crDefault;
{       StatusBar.Panels[0].Text:='Выполнено. Ожидание дальнейших инструкций';
       StatusBar.Refresh;                                                    }
   end;   
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;


end;

procedure TfrmSelect.treeStrDBExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  AllowExpansion:=(Node.getFirstChild.ImageIndex<>-1);
   if not(AllowExpansion) then
    begin
     treeStrDb.Selected:=Node;
     treeStrDBDBLClick (Sender);
    end
    else
     if Node.ImageIndex=CLOSED_ICON then
      begin
       Node.ImageIndex:=OPEN_ICON;
       Node.SelectedIndex:=OPEN_ICON;
      end;


end;

procedure TfrmSelect.btnCloseClick(Sender: TObject);
begin
close;
end;

procedure TfrmSelect.btnSelectClick(Sender: TObject);
var root:bool;
begin
root:=false;
case treeStrDb.Selected.Level of
0:
 begin
    compName:='';
    typeName:='';
    root:=true;
 end;
1: begin
    compName:=treeStrDB.Selected.Text;
    typeName:='';
   end;
2: begin
    compName:=treeStrDB.Selected.Parent.Text;
    typeName:=treeStrDb.Selected.Text;
   end;
 else begin
   compName:=treeStrDB.Selected.Parent.Text;
   typeName:='';   
   end;
 end;
frmFind.SetPath(compName,typeName,root);
close;
end;

procedure TfrmSelect.miSelectClick(Sender: TObject);
begin
btnSelect.Click;
end;

end.
