unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, ImgList,
  Buttons,IBQuery, ToolWin, Mask, DBCtrls,shellApi;
  type tfile = file of byte;
type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Connect1: TMenuItem;
    ilApp: TImageList;
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
    pmDir: TPopupMenu;
    mnEdit: TMenuItem;
    mnNew: TMenuItem;
    mnDELETE: TMenuItem;
    N7: TMenuItem;
    mnRecord: TMenuItem;
    N8: TMenuItem;
    mnprintCard: TMenuItem;
    mnOstatki: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    sbZakazi: TSpeedButton;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnNewClick(Sender: TObject);
    procedure pmDirPopup(Sender: TObject);
    procedure mnRecordClick(Sender: TObject);
    procedure mnEditClick(Sender: TObject);
    procedure mnDELETEClick(Sender: TObject);
    procedure treeStrDBKeyPress(Sender: TObject; var Key: Char);
    procedure mnprintCardClick(Sender: TObject);
    procedure mnOstatkiClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure gbElemMainClick(Sender: TObject);
    procedure SetUser(login: string;password:string);
//    function OpenFileINI(const FileName:string;var f1: tfile):boolean;
    function mainOpenFile(const FileName:string;var f1: tfile):boolean;
    function find(var F1:Tfile;Str:string;var pos: integer;CurrentPos:integer):boolean;
    function getPath(var f1:tfile;Ind1:integer):string;
    procedure sbZakaziClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  const
  CLOSED_ICON=0;
  OPEN_ICON=1;
  File_ICON=2;
  RootStr='�������� �������';
  root=0;
  comp=1;
  typ=2;
  elem=3;
  ver='����� �. 0.95.5 IB - ';

var
  loading : boolean;
  frmMain: TfrmMain;
  tableMassive: array [1..3] of string = ('components','types','elements');
  pathToDB:string;
  host: string='127.0.0.1';
  levl:integer=0;
  _login:string='Guest';
  _password:string='';

implementation
uses dmo, DB, unadd, unitConsole, UnitFind, unitOstatki,
  unitPassword,unitDmFind, UnitZAkazi;
var FolderNode : TTreeNode;
{$R *.dfm}
procedure TfrmMain.SetUser(login: string;password:string);
begin
 _login:=login;
 _password:=password;
end;
////////////////////////
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
       showmessage('������ �������������� �� ������ � �����!');
       result:=0;
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
         if glubina >=2 then index:='['+intToStr(qryW.fieldByName(chomp(tablename)+'_id').AsInteger)+']: ';
          TMP:=tree.Items.AddChild (first, index+qryW.fieldByName('Name').AsString);
           if glubina >= 3 then
            begin
                TMP.SelectedIndex:=2;
                TMP.ImageIndex:=2;
            end;
          qryW.Next;
         end;
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
//     treeStrDb.Selected:=Node;
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
       l:integer;
       notEQ_null,Menshe_3:boolean;
begin
{try
  try
  Start:=treeStrDB.Selected;
  treeStrDb.Cursor:=crHourGlass;;
  StatusBar.Panels[0].Text:='���������� ����������...';
  StatusBar.Refresh;
      try
          l:=start.level;
          notEQ_null:=start.level<>0;
          Menshe_3:=start.level<3;
      except
        exit;
      end;
  if notEQ_null and Menshe_3 then
  begin
    TableName:=tableMassive[start.Level+1];
     if l =2 then
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
     begin    if l = 0 then
                        begin
                          sbConnect.click;
                          try
                           start.Expand(false);
                          except
                          end;
                         end else

              if (l =3) then
                with dm do
                 begin
                     if qryEdit.Active then dm.qryEdit.close;
                     if qryInfoForEdit.Active then dm.qryInfoForEdit.close;

                     qryEdit.ParamByName('pelement_id').AsInteger:=getNumber(start.text);
                     qryInfoForEdit.ParamByName('pelement_id').AsInteger:=getNumber(start.text);


                             qryEdit.Open;
                             qryInfoForEdit.Open;
                 end;
        end;
   finally
       treeStrDb.Cursor:=crDefault;
       StatusBar.Panels[0].Text:='���������.';
       StatusBar.Refresh;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;}
end;

procedure TfrmMain.sbFormControlClick(Sender: TObject);
begin
  frmManeger.show;
  with dm do
   begin
     dm.IBDatabase.DatabaseName:=host+':'+pathToDb;
         frmManeger.btnAllConnect.click;
   end;
end;

procedure TfrmMain.sbConnectClick(Sender: TObject);
var tableName:string;
begin
    tableName:='components';
    dm.IBDatabase.Connected:=true;
    {    treeStrDb.Items.Delete(treeStrDb.Items.GetFirstNode);
    treeStrDb.Items.Add(treeStrDb.Items.GetFirstNode,'�������� �������');
    fillTree(TableName,treeStrDb.Items.GetFirstNode,'',dm.QryWork,treeStrDb,0);}
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
  try
   DMFind.qryFind_Elem.UnPrepare;
   close;
  except

   try
   close;
   except
   end;
  end;
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

function {TfrmMain.}OpenFile(const FileName:string;var f1: tfile):boolean;
begin
  result:=false;
try
  if not FileExists(FileName)
     then
       begin
          messageDlg('���� '''+filename+''' �� ������',mtError,[mbOk],0);
          exit;
        end;
  assign(F1,FileName);

  Reset(f1);
except
 messageDlg('���������� ������� ����'''+filename+'''',mtError,[mbOk],0);
 exit;
end;
  result:=true;
end;
//////
function TfrmMain.mainOpenFile(const FileName:string;var f1: tfile):boolean;
begin
  result:=openFile(Filename,f1);
end;

function TfrmMain.find(var F1:Tfile;Str:string;var pos: integer;CurrentPos:integer):boolean;
var i,len,j: integer;
Schar:byte;
begin
 result:=false;
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
function TfrmMain.getPath(var f1:tfile;Ind1:integer):string;
var i: integer;
    st:byte;
begin
       i:=ind1;
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
      find(f,'host="',p,filepos(f));
      host:=getPath(f,p+6);
      CloseFile(f);
    end else
    begin
        CloseFile(f);
            halt;
    end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        with dm do
        begin
        if ost.Active then  ost.Close;
//        if IBDatabase.Connected then
//         halt(0);
//         sleep(100);
         end;
end;

procedure TfrmMain.mnNewClick(Sender: TObject);
begin
  try
    try
//       treeStrDb.Cursor:=crHourGlass;
        case levl of
        comp:   begin
{                  frmAddRecords.show;
                  frmAddRecords.TabCOmponents.Show;
                  frmAddRecords.editComponentName.SetFocus;}
                end;
        typ:    begin
{                  frmAddRecords.show;
                  frmAddRecords.Tabtypes.Show;
                  frmAddRecords.edttypeName.SetFocus;}
                end;
        elem:   begin
{                  frmAddRecords.show;
                  frmAddRecords.TabElements.Show;
                  frmAddRecords.Ename.SetFocus;}

                end;
        end;
   finally
//       treeStrDb.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmMain.pmDirPopup(Sender: TObject);
const   compStr='�������������';
        typStr='���';
        elemStr='�������';
var     Start:  TTreeNode;
begin
{        start:=treeStrDb.Selected;
        try
        mnRecord.Caption:=start.Text;
        levl:=start.level;
        except
          exit;
        end;
//        mnNew.Enabled:=levl<>root;
//        mnNewThis.Enabled:=levl<>root;
        mnEdit.Enabled:=(levl<>root);// and (levl=elem);
        mnDelete.Enabled:=levl<>root;
        mnprintCard.visible:=levl=elem;
        case levl of
            root: begin
                mnNew.Caption:='�&������ '+compStr;
//                levl:=comp;
                end;

            comp: begin
                        mnNew.Caption:='�&������ '+compStr;
//                        mnNewThis.Enabled:=true;
//                        mnNewThis.Caption:='�&������ ������ '+typStr;
                  end;
            typ:  begin
                        mnNew.Caption:='�&������ '+typStr;
//                        mnNewThis.Enabled:=true;
//                        mnNewThis.Caption:='�&������ ������ '+elemStr;
                  end;
            elem: begin
                        mnNew.Caption:='�&������ '+elemStr;
                        mnPrintCard.Visible:=true;
//                        mnNewThis.Caption:=''+elemStr;
//                        mnNewThis.Enabled:=false;
                  end;
        end;            }
end;

procedure TfrmMain.mnRecordClick(Sender: TObject);
begin
try
  try
//     treeStrDb.Cursor:=crHourGlass;
//     treeStrDB.OnDblClick(sender);
   finally
//       treeStrDb.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;
function getREcordName(s: string): string;
var i: integer;
begin
    for i:=1 to length(s) do
     if (s[i] =':') then break;
     result:=copy(s,i+2,length(s))
end;
procedure TfrmMain.mnEditClick(Sender: TObject);
begin
{  try
    try
           treeStrDb.Cursor:=crHourGlass;
        case levl of
        comp:   begin
                  sbFormControl.Click;
                  with frmManeger do
                  begin
//                     TabSheet1.show;
                     dm.tblComponents.Refresh;
                     LocateComponent(treeStrDB.Selected.Text);
{
                        Show;
                        tabComponents.Show;
                        editComponentName.SetFocus;
                        editComponentName:=treeStrDB.Selected.Text;
                      editComponentName.text:=
                      btnFindComponent.Click;
                      editComponentName.text:='';

//                      GridComponent.SetFocus;
                  end;
                end;
        typ:    begin
                  sbFormControl.Click;
                  with frmManeger do
                  begin
//                      TabSheet2.Show;
                      dm.tbltypes.Refresh;
                      LocateType(getNumber(treeStrDB.Selected.Text));
//                      edtTypeName.text:=GetREcordName(treeStrDB.Selected.Text);
//                      btnFindType.Click;
//                      edtTypeName.text:='';
//                      GridTyPEs.SetFocus;
                  end;
                end;
        elem:   begin
                  sbFormControl.Click;
                  with frmManeger do
                  begin
//                      TabSheet3.Show;
                      dm.tblElements.Refresh;
                       LocateElem(getNumber(treeStrDB.Selected.Text));
//                      eName.text:=GetREcordName(treeStrDB.Selected.Text);
//                      cbFindField.ItemIndex:=0;
//                      btnFindElem.Click;
//                    eName.text:='';
//                        DBGridElements.SetFocus;
                  end;
                end;

        end;
   finally
       treeStrDb.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;
 }
end;

procedure TfrmMain.mnDELETEClick(Sender: TObject);
var sqlText: string;
begin
  with dm do
  begin
{  try
   try
{    treeStrDb.Cursor:=crHourGlass;
    sqlText:='execute procedure ';
      case levl of
        comp:   begin
                 if messageDlg('�� �������, ��� ������� ������� �������������?'+#13#10+'"'+treeStrDb.Selected.Text+'"'+#13#10+'��� ���� ��������� ��� ������ �� ������ ������ �������� � ���� �������������!',mtConfirmation,[mbYes,MbNo],0) = mrYes then
                        begin
                        qryWork.SQL.text:=sqlText+'delete_component('''+treeStrDb.Selected.Text+''')';
//                        showmessage(qryWork.SQL.text);
                        qryWork.ExecSQL;
                        sbConnect.Click;
                        end;
                end;
        typ:    begin
        //��� �� ��������� �������� <GetRecordName()>
        {                 if messageDlg('�� �������, ��� ������� ������� ���?'+#13#10+'"'+GetREcordName(treeStrDb.Selected.Text)+'"'+#13#10+'��� ���� ��������� ��� ������ �� ������ ������ �������� � ���� �����!',mtConfirmation,[mbYes,MbNo],0) = mrYes then
                 begin
                   qryWork.SQL.text:=sqlText+'delete_type('''+GetREcordName(treeStrDB.Selected.Text)+''')';
 //                     showmessage(qryWork.SQL.text);
                   qryWork.ExecSQL;
                   sbConnect.Click;
                 end;
                end;
        elem:   begin
{                 if messageDlg('�� �������, ��� ������� ������� �������?'+#13#10+'"'+GetREcordName(treeStrDb.Selected.Text)+'"'+#13#10+'��� ���� ��������� ��� ������ �� ������ ������ �������� � ���� ���������!',mtConfirmation,[mbYes,MbNo],0) = mrYes then
                 begin
                        qryWork.SQL.text:=sqlText+' delete_element('''+GetREcordName(treeStrDB.Selected.Text)+''')';
                   qryWork.ExecSQL;
                   sbConnect.Click;
                 end;


        end;
   finally
       treeStrDb.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;}
end;
end;

procedure TfrmMain.treeStrDBKeyPress(Sender: TObject; var Key: Char);
begin
//if key =#13 then
//  treeStrDB.OnDblClick(sender);
end;

procedure TfrmMain.mnprintCardClick(Sender: TObject);
begin
{ try
   try
   treeStrDb.Cursor:=crHourGlass;
   frmManeger.printCard(getNumber(treeStrDB.Selected.Text));
   finally
       treeStrDb.Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;}
end;

procedure TfrmMain.mnOstatkiClick(Sender: TObject);
begin
{ try
   try
//   treeStrDb.Cursor:=crHourGlass;
       StatusBar.Panels[0].Text:='�������� ������ �� ��������';
       StatusBar.Refresh;
  case levl of
  0: frmOstatki.GetOstatki(0,'All_Tables');
  1: frmOstatki.GetOstatki(treeStrDB.Selected.Text,'Components');
  2: frmOstatki.GetOstatki(getNumber(treeStrDB.Selected.Text),'Types');
  3: frmOstatki.GetOstatki(getNumber(treeStrDB.Selected.Text),'Elements');
  end;
   finally
       treeStrDb.Cursor:=crDefault;
       StatusBar.Panels[0].Text:='���������.';
       StatusBar.Refresh;

   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
   end;                             }
end;

procedure TfrmMain.N12Click(Sender: TObject);
begin
try
 try
    Cursor:=crHourGlass;
    dm.IBTransaction.commit;
    frmManeger.btnAllConnect.click;
   finally
    Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
   end;                             
end;
procedure TfrmMain.N13Click(Sender: TObject);
begin
   dm.IBTransaction.Rollback;
   FrmManeger.btnAllConnect.click;
end;
procedure TfrmMain.gbElemMainClick(Sender: TObject);
begin
//  dm.qryLinkInfo_by_elem.Open;
end;

procedure TfrmMain.sbZakaziClick(Sender: TObject);
begin
frmZakazi.show;
end;

end.
