unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, ImgList,
  Buttons,IBQuery, ToolWin, Mask, DBCtrls;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Connect1: TMenuItem;
    ilApp: TImageList;
    MainPanel: TPanel;
    ilist: TImageList;
    PanelStrDb: TPanel;
    gbStrDB: TGroupBox;
    treeStrDB: TTreeView;
    StatusBar: TStatusBar;
    PanelElem: TPanel;
    gbElemMain: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Ename: TDBEdit;
    EUnit: TDBEdit;
    ECost: TDBEdit;
    Epresence: TDBEdit;
    Etype: TDBEdit;
    Bevel1: TBevel;
    GridQryInfo: TDBGrid;
    Label6: TLabel;
    PanelTop: TPanel;
    sbConnect: TSpeedButton;
    sbFormControl: TSpeedButton;
    sbFind: TSpeedButton;
    SBOstatki: TSpeedButton;
    PanelBotmRight: TPanel;
    sbClose: TSpeedButton;
    N1: TMenuItem;
    Exit1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SQL1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Splitter1: TSplitter;
    procedure treeStrDBCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);

    procedure treeStrDBExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure treeStrDBDblClick(Sender: TObject);
    procedure sbFormControlClick(Sender: TObject);
    procedure sbConnectClick(Sender: TObject);
    procedure SBConsoleClick(Sender: TObject);
    procedure sbFindClick(Sender: TObject);
    procedure SBOstatkiClick(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure sbShowOstatkiClick(Sender: TObject);
    procedure Connect1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SQL1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure GridQryInfoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
  type tfile = file of byte;
  const
  CLOSED_ICON=0;
  OPEN_ICON=1;
  File_ICON=2;
  RootStr='Корневой каталог';
var
loading : boolean;
  frmMain: TfrmMain;
  tableMassive: array [1..3] of string = ('components','types','elements');
  pathToDB:string;
implementation
uses dmo, DB, unadd, unitConsole, UnitFind, unitOstatki;
var FolderNode : TTreeNode;
{$R *.dfm}
function chomp(tableName:string):string;
begin
    result:=copy(TableName,1,length(TableName)-1);
end;
////////////////////////////////
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
    end;
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
//  try
    First:=parent;
      //tree.Items.GetFirstNode;
    tmp:=first;
        qryW.SQL.Clear;
        qryW.SQL.Text:='Select '+chomp(tablename)+'_id,name from '+tableName+' '+WhereSql;
//        showmessage(qryW.SQL.Text);

//        try
          if qryW.Active then qryW.Close;
          qryW.Open;
{        except
          showmessage('Error run sql: filling');
          exit;
        end;}
        while not qryW.Eof do
        begin
         if glubina >=2 then index:='['+intToStr(qryW.fieldByName(chomp(tablename)+'_id').AsInteger)+']: ';
          TMP:=tree.Items.AddChild (first, index+qryW.fieldByName('Name').AsString);
           if glubina >= 3 then
            begin
                TMP.SelectedIndex:=2;
                TMP.ImageIndex:=2;
            end;
          qryW.Next;
         end;
{   except
        showmessage('Error fill tree');
   end;}
end;

{=============================}
procedure TfrmMain.treeStrDBCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
 if Node.ImageIndex=OPEN_ICON then
  begin
     Node.ImageIndex:=CLOSED_ICON;
     Node.SelectedIndex:=CLOSED_ICON;
  end;


end;


procedure TfrmMain.treeStrDBExpanding(Sender: TObject; Node: TTreeNode;
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
////////////////////////////////
procedure TfrmMain.treeStrDBDblClick(Sender: TObject);
 var Start,first,tmp : TTreeNode;
       Path,TableName,whereSql,w : string;
begin
  Start:=treeStrDB.Selected;
  StatusBar.Panels[0].Text:='Выполнение инструкции...Ожидание';
  StatusBar.Refresh;

  if (start.level <> 0) and (start.Level <3) then
  begin
    TableName:=tableMassive[start.Level+1];
     if start.Level =2 then
        begin
         w:=intToStr(getNumber(start.text));
         whereSql:='where '+chomp(tableMassive[start.Level])+'_id = '+w;
        end
         else
    whereSql:='where '+chomp(tableMassive[start.Level])+'_id = (select '+chomp(tableMassive[start.Level])+'_id '+
                                               'from '+(tableMassive[start.Level])+' '+
                                               'where name = '''+start.text +''') order by name';
    treeStrDb.Selected.DeleteChildren;
    fillTree(TableName,start,whereSql,dm.qryWork,treeStrDB,start.level+1);
    start.Expand(false);
  end else
     begin    if start.Level = 0 then
                        begin
                          sbConnect.click;
                          start.Expand(false);
                         end else

              if (start.Level =3) then
                with dm do
                 begin
                     if qryEdit.Active then dm.qryEdit.close;
                     if qryInfoForEdit.Active then dm.qryInfoForEdit.close;

                     qryEdit.ParamByName('pelement_id').AsInteger:=getNumber(start.text);
                     qryInfoForEdit.ParamByName('pelement_id').AsInteger:=getNumber(start.text);


                             qryEdit.Open;
                             qryInfoForEdit.Open;
            {             except
                              showmessage('Error opened Query for Edit');
                         end;}
                 end;
        end;
   StatusBar.Panels[0].Text:='Выполнено. Ожидание дальнейших инструкций';
   StatusBar.Refresh;
end;

procedure TfrmMain.sbFormControlClick(Sender: TObject);
begin
  frmAdd.show;
  with dm do
   begin
     dm.IBDatabase.DatabaseName:=pathToDb;

         frmAdd.btnAllConnect.click;
  {        frmAdd.btnOpenComponent.Click;
        frmAdd.btnOpenType.click;
        frmAdd.btnOpenElem.Click;
        frmAdd.btnOpenInfo.click;}
   end;
end;

procedure TfrmMain.sbConnectClick(Sender: TObject);
var tableName:string;
begin
    tableName:='components';
    treeStrDb.Items.Delete(treeStrDb.Items.GetFirstNode);
    treeStrDb.Items.Add(treeStrDb.Items.GetFirstNode,'Корневой каталог');
    fillTree(TableName,treeStrDb.Items.GetFirstNode,'',dm.QryWork,treeStrDb,0);
end;

procedure TfrmMain.SBConsoleClick(Sender: TObject);
begin
     frmSQL.show;
end;

procedure TfrmMain.sbFindClick(Sender: TObject);
begin
   frmFind.Show;
end;

procedure TfrmMain.SBOstatkiClick(Sender: TObject);
begin
 frmOstatki.show;
end;

procedure TfrmMain.sbCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.sbShowOstatkiClick(Sender: TObject);
begin
    SBOstatki.Click;
end;

procedure TfrmMain.Connect1Click(Sender: TObject);
begin
   sbConnect.Click;
end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
 SBOstatki.Click;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
   sbFormControl.Click;
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
   sbFind.Click;
end;

procedure TfrmMain.SQL1Click(Sender: TObject);
begin
 frmSQL.Show;
end;

procedure TfrmMain.N6Click(Sender: TObject);
begin
  dm.IBDatabase.Close;
end;

procedure TfrmMain.GridQryInfoTitleClick(Column: TColumn);
begin
{ with dm do
 begin
       try
          qryInfoForEdit.AddIndex(Column.FieldName+'indx',Column.FieldName,[ixCaseInsensitive],'');
          qryInfoForEdit.IndexName:=Column.FieldName+'indx';
       except
          try
             // tblComponents.DeleteIndex(Column.FieldName+'indx');
          finally

          end;
       end;
 end;}

end;
 function OpenFile(const FileName:string;var f1: tfile):boolean;
begin
  result:=false;
try
  if not FileExists(FileName)
     then
       begin
          messageDlg('Файл '''+filename+''' не найден',mtError,[mbOk],0);
          exit;
        end;
  assign(F1,FileName);
  Reset(f1);
except
 messageDlg('Невозможно открыть файл'''+filename+'''',mtError,[mbOk],0);
 exit;
end;
  result:=true;
end;

function find(var F1:Tfile;Str:string;var pos: integer;CurrentPos:integer):boolean;
var i,len,j: integer;
Schar:byte;
begin
 result:=false;
// if not openFile(f1) then exit;
   len:=Length(Str);
   i:=CurrentPos;
   j:=1;
   while not eof(f1) do
   begin
     Seek(f1,i);
     read(f1,sChar);
      if str[j]= chr(sChar) then
       begin
        inc(j);
       end else j:=1;
     inc(i);
     if j=len then
        begin
         result:=true;
         pos:=FilePos(f1)-Len+1;
         exit;
        end;

   end;
end;
function getPath(var f1:tfile;Ind1:integer):string;
var i: integer;
    st:byte;
begin
       i:=ind1;
{          seek(f1,i);
          read(f1,st);}

       repeat
           seek(f1,i);
           read(f1,st);
           result:=result+chr(st);
           inc(i);
      until chr(st) = '"' ;
 delete(result,length(result),1);
end;
function CopyBlock(var f1:tfile;Ind1:integer;Count:integer):string;
var i:integer;
    st:byte;
begin
 result:='';
// if openFile(f1) then
   for i:=ind1 to ind1+Count do
     begin
        {$I-}
       seek(f1,i);
       read(f1,st);
         {$I+}
//         if IOResult<>0 then exit;
       if st <> 0 then
        result:=result+chr(st);
     end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var f:Tfile;
p:integer;
begin

if    openFile('sklad.ini',f) then
   begin
      find(f,'path="',p,filepos(f));
      pathToDb:=getPath(f,p+6);
    end else halt;
//showmessage( getPath(f,p+6));
//read(


end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        with dm do
        begin
        if ost.Active then  ost.Close;
         end;
end;

end.
