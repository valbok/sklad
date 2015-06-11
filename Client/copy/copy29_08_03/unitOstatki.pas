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

procedure TfrmOstatki.btnGetOstatkiClick(Sender: TObject);
var
o,nam,unit_izmr:string;
num_p_p:integer;
ostatok:real;
begin
    with dm do
    begin
        if not IBDatabase.Connected then IBDatabase.Connected:=true;
        if not IBTransaction.Active then IBTransaction.Active:=true;
        if ost.Exists then
        begin
               IBTransaction.Commit;
               if not IBTransaction.Active then IBTransaction.Active:=true;


        end;
           Ost.CreateTable;
           IBTransaction.Commit;
     try
       if not qryComponents.active then qryComponents.open;
     except
        showmessage('Error open tables');
        btnGetOstatki.Enabled:=true;
        exit;
     end;
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
                try
                     qryOstatki.Open;
                except
                     showmessage('Error open qryOstatki');
                end;

                  while not qryOstatki.Eof do
                  begin
                          qryWork.SQL.Text:='insert into ostatki (name) values('''+'          '+qryOstatki.fieldByName('name').AsString+'/'+''')';
                          qryWork.execSql;
                          qryWork.close;
                          qryConsole.SQL.Text:='select * from ostatki_by_type('+intToStr(qryOstatki.fieldByName('type_id').asInteger)+') order by name';
                              try
                                   qryConsole.Open;
                              except
                                   showmessage('Error open qryConsole');
                              end;
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

 end;

procedure TfrmOstatki.btnCloseClick(Sender: TObject);
begin

  dm.Ost.Close;
  frmOstatki.close;

end;

procedure TfrmOstatki.btnImpWordClick(Sender: TObject);
begin
   With EKRTF do Begin
   OutFile:=CreateFileName('','list');
   ExecuteOpen([dm.Ost],SW_SHOW);
   End;

end;

procedure TfrmOstatki.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.Ost.Close;
end;

end.
