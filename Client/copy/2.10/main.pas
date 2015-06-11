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
    miConnect: TMenuItem;
    PanelTop: TPanel;
    sbConnect: TSpeedButton;
    PanelBotmRight: TPanel;
    sbClose: TSpeedButton;
    N1: TMenuItem;
    Exit1: TMenuItem;
    miService: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SQL1: TMenuItem;
    N5: TMenuItem;
    miDisconnect: TMenuItem;
    miAPply: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    sbFormControl: TSpeedButton;
    sbFind: TSpeedButton;
    sbZakazi: TSpeedButton;
    SBOstatki: TSpeedButton;
    Bevel1: TBevel;
    miAbout: TMenuItem;
    N2: TMenuItem;
    miMain: TMenuItem;



    procedure sbFormControlClick(Sender: TObject);
    procedure sbConnectClick(Sender: TObject);
    procedure SBConsoleClick(Sender: TObject);
    procedure sbFindClick(Sender: TObject);
    procedure SBOstatkiClick(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure sbShowOstatkiClick(Sender: TObject);
    procedure miConnectClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SQL1Click(Sender: TObject);
    procedure miDisconnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure SetUser(login: string;password:string);
//    function OpenFileINI(const FileName:string;var f1: tfile):boolean;
    function mainOpenFile(const FileName:string;var f1: tfile):boolean;
    function find(var F1:Tfile;Str:string;var pos: integer;CurrentPos:integer):boolean;
    function getPath(var f1:tfile;Ind1:integer):string;
    procedure sbZakaziClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure SetEnanble(value:boolean);
    procedure miMainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  const
  filename='sklad.ini';
  CLOSED_ICON=0;
  OPEN_ICON=1;
  File_ICON=2;
//  RootStr='Корневой каталог';
  root=0;
  comp=1;
  typ=2;
  elem=3;
  ver='Склад в. 0.98.00.0 BDE ';
  Disconnectfromserver='Разъединиться с сервером';
  ConnectToServer='Соединиться с сервером';
var
  loading : boolean;
  frmMain: TfrmMain;
  pathToDB:string;
  host: string='127.0.0.1';
  _login:string='Guest';
  _password:string='';

implementation
uses dmo, DB, unadd, unitConsole, UnitFind, unitOstatki,
  unitPassword,unitDmFind, UnitZAkazi, unitDMFindElem, UnitAbout;
{$R *.dfm}
procedure TfrmMain.SetEnanble(value:boolean);
begin
 sbFormControl.Enabled:=value;
 sbFind.Enabled:=value;
 sbZakazi.Enabled:=value;
 SBOstatki.Enabled:=value;
 miConnect.Enabled:=not value;
 miDisconnect.Enabled:=value;
 miService.Enabled:=value;
 miApply.Enabled:=value;
 if value then
   sbConnect.Caption:=Disconnectfromserver;

end;
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
       showmessage('Ошибка преобразования из строки в число!');
       result:=0;
    end;
end;
{
procedure fillTree(TableName:string;
                   Parent:TTreeNode;
                   WhereSql: string;
                   var QryW:TIBQuery;
                   var tree:TTreeView;
                   glubina:integer);
{var first,tmp : TTreeNode;
index:string;}
{begin
{    First:=parent;
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

}
////////////////////////////////
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
begin
      if dm.IBDatabase.Connected then
      begin
        miDisconnect.Click;
        exit;
      end;
      frmEnterPass.showmodal;
      with dm do
      if frmEnterPass.cancel then
      begin
         exit;
      end;
    dm.IBDatabase.Connected:=true;
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
   dm.IBDatabase.Connected:=false;
   DMFindElem.qryFE_withComp.UnPrepare;
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

procedure TfrmMain.miConnectClick(Sender: TObject);
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

procedure TfrmMain.miDisconnectClick(Sender: TObject);
begin
 if dm.IBDatabase.Connected then
  if messageDLG('Разорвать соединение с сервером?',mtConfirmation,[MbYes,MbNo],0) = mrYes then
    dm.IBDatabase.Close;
end;

function {TfrmMain.}OpenFile(const FileName:string;var f1: tfile):boolean;
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
frmMain.Caption:=ver;
if    openFile(filename,f) then
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

function getREcordName(s: string): string;
var i: integer;
begin
    for i:=1 to length(s) do
     if (s[i] =':') then break;
     result:=copy(s,i+2,length(s))
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
try
 try

   dm.IBTransaction.Rollback;
   FrmManeger.btnAllConnect.click;
   finally
    Cursor:=crDefault;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
   end;

end;
procedure TfrmMain.sbZakaziClick(Sender: TObject);
begin
  frmZakazi.show;
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
begin
  frmAbout.show;
end;

procedure TfrmMain.miMainClick(Sender: TObject);
begin
  frmMain.show;
end;

end.
