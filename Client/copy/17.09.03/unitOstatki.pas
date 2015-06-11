unit unitOstatki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBDatabaseInfo, IBServices, ExtCtrls,IBtable,db,
  OleServer, Excel2000, DBCtrls, Grids, DBGrids, ComCtrls,printers,
  ekbasereport, ekrtf;

type
  TfrmOstatki = class(TForm)
    PanelMain: TPanel;
    PanelBottom: TPanel;
    btnGetOstatki: TBitBtn;
    PanelBotmRight: TPanel;
    btnClose: TBitBtn;
    grid: TDBGrid;
    EkRTF: TEkRTF;
    btnImpWord: TBitBtn;
    procedure btnGetOstatkiClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnImpWordClick(Sender: TObject);
    function ZamenaKomaNaDot(st :string):string;
    procedure GetOstatki(Value:variant;tableNAme:string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private


    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmOstatki: TfrmOstatki;

implementation

{$R *.dfm}
uses dmo;

function TFrmOstatki.ZamenaKomaNaDot(st :string):string;
var i: integer;
begin
    result:='';
     for i:=1 to length(st) do
     begin
      if st[i]=',' then
         result:=result+'.' else
           result:=result+st[i];
     end;
end;
procedure TfrmOstatki.GetOstatki(Value:variant;tableNAme:string);
var
o,nam,unit_izmr:string;
num_p_p:integer;
ostatok:real;
begin
try
  try
   grid.Cursor:=crHourGlass;
    with dm do
    begin
     if TableName ='All_Tables' then
      begin
        btnGetOstatki.Click;
        frmOstatki.Show;
        exit;
      end;
        if not IBDatabase.Connected
               then IBDatabase.Connected:=true;
        if not IBTransaction.Active
               then IBTransaction.Active:=true;
        if ost.Exists then
        begin
               IBTransaction.Commit;
               if not IBTransaction.Active
                     then IBTransaction.Active:=true;
        end;
           try
           Ost.CreateTable;
           except
             if ost.Exists then
               begin
                  if not ost.Active
                       then ost.Open;
                  try
                    Ost.Delete;
                   except
                     qryWork.SQL.Text:='drop table ostatki';
                     qryWork.ExecSQL;
                   end;

    //               IBTransaction.Commit;
                  try
                    if ost.Active then   ost.close;
                  finally
                     if not IBTransaction.Active
                        then IBTransaction.Active:=true;
                    Ost.CreateTable;
                 end;
             end;
           end;
           IBTransaction.Commit;
       if not qryComponents.active then qryComponents.Close;
  if TableName ='Components' then
   begin
     qryComponents.SQL.Text:='select * from components where name = '''+value+''' order by name';
// showmessage(qryComponents.SQL.Text);
     qryComponents.open;
     qryConsole.SQL.Text:='';
     qryConsole.Close;
     qryOstatki.SQL.Text:='';
     qryOstatki.close;
     qryComponents.First;
      while not qryComponents.Eof do
       begin
          qryWork.SQL.Text:='insert into Ostatki (name) values('''+qryComponents.fieldByName('name').AsString+'/'+''')';
          qryWork.open;
          qryWork.close;
           qryOstatki.SQL.Text:='select name,type_id from types where component_id ='+intToStr(qryComponents.fieldByName('Component_id').AsInteger)+' order by name';
           qryOstatki.Open;
             while not qryOstatki.Eof do
                begin
                  qryWork.SQL.Text:='insert into ostatki (name) values('''+'          '+qryOstatki.fieldByName('name').AsString+'/'+''')';
                  qryWork.execSql;
                  qryWork.close;
                  qryConsole.SQL.Text:='select * from ostatki_by_type('+intToStr(qryOstatki.fieldByName('type_id').asInteger)+') order by name';
                  qryConsole.Open;
                  while not qryConsole.Eof do
                    begin
                         num_p_p:=(qryConsole.fieldByName('id').asinteger);
                         nam:='                 '+qryConsole.fieldByName('name').asString;
                         ostatok:=qryConsole.fieldByName('ostatok').AsFloat;
                       if (ostatok) < 1 then
                        str(ostatok:2:2,o) else o:=floatToStr(ostatok);
                         unit_izmr:=qryConsole.fieldByName('unit_izmerenie').asString;
                         o:=ZamenaKomaNaDot(o);
      qryWork.SQL.Text:='insert into ostatki (num_p_p,name,ostatok,unit_izmerenie,nowdate) '+
     ' values('+intToStr(num_p_p)+','''+nam+ ''','+o+','''+unit_izmr+''','''+datetostr(date)+''')';
//                        showmessage(qryWork.sql.text);
                    qryWork.execSql;
                    qryWork.close;
                    qryConsole.Next;
                   end;
               qryConsole.Close;
               qryOstatki.Next;
             end;
          qryOstatki.close;
          qryComponents.Next;
        end;
       end;
     end;
{---------}
  if TableName ='Types' then
   with dm do begin
       begin
              qryOstatki.SQL.Text:='select name,type_id from types where type_id ='+intToStr(value)+' order by name';
                 qryOstatki.Open;
                  while not qryOstatki.Eof do
                  begin
                          qryWork.SQL.Text:='insert into ostatki (name) values('''+'          '+qryOstatki.fieldByName('name').AsString+'/'+''')';
                          qryWork.execSql;
                          qryWork.close;
                          qryConsole.SQL.Text:='select * from ostatki_by_type('+intToStr(qryOstatki.fieldByName('type_id').asInteger)+') order by name';

                                   qryConsole.Open;
                          while not qryConsole.Eof do
                            begin
                                 num_p_p:=(qryConsole.fieldByName('id').asinteger);
                                 nam:='                 '+qryConsole.fieldByName('name').asString;
                                 ostatok:=qryConsole.fieldByName('ostatok').AsFloat;
                               if (ostatok) < 1 then
                                str(ostatok:2:2,o) else o:=floatToStr(ostatok);
                                 unit_izmr:=qryConsole.fieldByName('unit_izmerenie').asString;
                                 o:=ZamenaKomaNaDot(o);
       qryWork.SQL.Text:='insert into ostatki (num_p_p,name,ostatok,unit_izmerenie) '+
       ' values('+intToStr(num_p_p)+','''+nam+ ''','+o+','''+unit_izmr+''')';
//                        showmessage(qryWork.sql.text);
                          qryWork.execSql;
                          qryWork.close;
                          qryConsole.Next;
                            end;
                           qryConsole.Close;
                     qryOstatki.Next;
                  end;
           qryOstatki.close;
        end;
       end;
  if TableName ='Elements' then
   with dm do
       begin
           qryConsole.SQL.Text:='select e.name,e.unit_izmerenie,i.* from elements e inner join  info i on e.element_id=i.element_id where element_id='+intToStr(value)+' and num_p_p =(select max(num_p_p) from info where element_id=e.element_id) order by name';
           qryConsole.Open;
           num_p_p:=(qryConsole.fieldByName('num_p_p').asinteger);
           nam:='                 '+qryConsole.fieldByName('name').asString;
           ostatok:=qryConsole.fieldByName('ostatok').AsFloat;
           if (ostatok) < 1 then
            str(ostatok:2:2,o) else o:=floatToStr(ostatok);
           unit_izmr:=qryConsole.fieldByName('unit_izmerenie').asString;
           o:=ZamenaKomaNaDot(o);
     qryWork.SQL.Text:='insert into ostatki (num_p_p,name,ostatok,unit_izmerenie) '+
    ' values('+intToStr(num_p_p)+','''+nam+ ''','+o+','''+unit_izmr+''')';
//  showmessage(qryWork.sql.text);
                qryWork.execSql;
                qryWork.close;
               qryConsole.Close;
       end;
 frmOstatki.show;
 dm.Ost.Open;
 finally
      grid.Cursor:=crDefault;
  end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
  end;
 
end;
////////////////////////////////////
procedure TfrmOstatki.btnGetOstatkiClick(Sender: TObject);
var
o,nam,unit_izmr:string;
num_p_p:integer;
ostatok:real;
begin
 try
  try
    btnGetOstatki.Enabled:=false;
    grid.Cursor:=crHourGlass;
    with dm do
    begin
        if not IBDatabase.Connected then IBDatabase.Connected:=true;
        if not IBTransaction.Active then IBTransaction.Active:=true;
        if ost.Exists then
        begin
               IBTransaction.Commit;
               if not IBTransaction.Active then IBTransaction.Active:=true;
        end;
           try
           Ost.CreateTable;
           except
             if ost.Exists then
               begin
                  if not ost.Active
                       then ost.Open;
                     qryWork.SQL.Text:='drop table ostatki';
                     qryWork.ExecSQL;


    //               IBTransaction.Commit;
                  try
                    if ost.Active then   ost.close;
                  finally
                     if not IBTransaction.Active
                        then IBTransaction.Active:=true;
                    Ost.CreateTable;
                 end;
             end;
           end;

           IBTransaction.Commit;
     if qryComponents.active then qryComponents.close;
     qryComponents.SQL.text:='select * from components order by name';
     qryComponents.Open;
     qryConsole.SQL.Text:='';
     qryConsole.Close;
     qryOstatki.SQL.Text:='';
     qryOstatki.close;
     qryComponents.First;
      while not qryComponents.Eof do
       begin
          qryWork.SQL.Text:='insert into Ostatki (name) values('''+qryComponents.fieldByName('name').AsString+'/'+''')';
          qryWork.open;
          qryWork.close;
          qryOstatki.SQL.Text:='select name,type_id from types where component_id ='+intToStr(qryComponents.fieldByName('Component_id').AsInteger)+' order by name';
          qryOstatki.Open;
                  while not qryOstatki.Eof do
                  begin
                          qryWork.SQL.Text:='insert into ostatki (name) values('''+'          '+qryOstatki.fieldByName('name').AsString+'/'+''')';
                          qryWork.execSql;
                          qryWork.close;
                          qryConsole.SQL.Text:='select * from ostatki_by_type('+intToStr(qryOstatki.fieldByName('type_id').asInteger)+') order by name';
                          qryConsole.Open;
                          while not qryConsole.Eof do
                            begin
                                 num_p_p:=(qryConsole.fieldByName('id').asinteger);
                                 nam:='                 '+qryConsole.fieldByName('name').asString;
                                 ostatok:=qryConsole.fieldByName('ostatok').AsFloat;
                               if (ostatok) < 1 then
                                str(ostatok:2:2,o) else o:=floatToStr(ostatok);
                                 unit_izmr:=qryConsole.fieldByName('unit_izmerenie').asString;
                                 o:=ZamenaKomaNaDot(o);
qryWork.SQL.Text:='insert into ostatki (num_p_p,name,ostatok,unit_izmerenie) '+
     ' values('+intToStr(num_p_p)+','''+nam+ ''','+o+','''+unit_izmr+''')';
//                        showmessage(qryWork.sql.text);
                          qryWork.execSql;
                          qryWork.close;
                                 qryConsole.Next;
                            end;
                           qryConsole.Close;

                     qryOstatki.Next;
                  end;
           qryOstatki.close;
          qryComponents.Next;
       end;
    end;
 dm.Ost.Open;
   finally
       grid.Cursor:=crDefault;
       btnGetOstatki.Enabled:=true;       
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmOstatki.btnCloseClick(Sender: TObject);
begin
  dm.Ost.Close;
  frmOstatki.close;
end;

procedure TfrmOstatki.btnImpWordClick(Sender: TObject);
begin
try
 try
   grid.Cursor:=crHourGlass;
   btnImpWord.Enabled:=false;   
   With EKRTF do Begin
   OutFile:=CreateFileName('','reports/tmp/list');
   ExecuteOpen([dm.Ost],SW_SHOW);
   End;
   finally
       grid.Cursor:=crDefault;
       btnImpWord.Enabled:=true;
   end;
 except
  on E:Exception do
    messageDLG(E.Message,mtError,[mbOk],0);
 end;

end;

procedure TfrmOstatki.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.Ost.Close;
end;

end.
