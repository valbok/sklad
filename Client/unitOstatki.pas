{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
unit unitOstatki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBDatabaseInfo, IBServices, ExtCtrls,IBtable,db,
  OleServer, Excel2000, DBCtrls, Grids, DBGrids, ComCtrls,printers,
  ekbasereport, ekrtf, ekfunc;

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
    InvFn: TEkUDFList;
    procedure btnGetOstatkiClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnImpWordClick(Sender: TObject);
    function ZamenaKomaNaDot(st :string):string;
    procedure GetOstatki(Value:variant;tableNAme:string);
    procedure InvFnFunctions0Calculate(Sender: TObject; Args: TEkUDFArgs;
      ArgCount: Integer; UDFResult: TObject);
  private


    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmOstatki: TfrmOstatki;

implementation

{$R *.dfm}
uses dmo, Unitdm3, unadd, unitDmBDE;

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
    o,nam,unit_izmr     :string;
    num_p_p,Elem_id     :integer;
    ostatok             :real;
begin
try
  try
   grid.Cursor:=crHourGlass;
   Elem_id:=1;
    with {dm,dm3,}dmBDE do
    begin
     if TableName ='All_Tables' then
      begin
        btnGetOstatki.Click;
        frmOstatki.Show;
        exit;
      end;

       try
       if qryDeleteAllOstatki.Active
          then qryDeleteAllOstatki.Close;
        qryDeleteAllOstatki.ExecSQL;
//        dmbde.Database.Commit;
       except
{          qryDeleteAllOstatki.SQL.Text:='drop table ostatki';
          qryDeleteAllOstatki.ExecSQL;}
         end;
  if tblOst.active then
        tblOst.close;
  if  dm.qryComponents_by_name.active
     then dm.qryComponents_by_name.Close;
  if TableName ='Components' then
   begin
//   showmessage(value);

     dm.qryComponents_by_name.ParamByName('name').AsString:=value;

   //   'select * from components where name = '''+value+''' order by name';
   // showmessage(qryComponents.SQL.Text);
     dm.qryComponents_by_name.open;

     dm.qryComponents_by_name.First;
      while not dm.qryComponents_by_name.Eof do
       begin
          if qryInsertIntoOstatki.Active then
                qryInsertIntoOstatki.Close;
          qryInsertIntoOstatki.ParamByName('name').AsString:=dm.qryComponents_by_name.fieldByName('name').AsString+'/';
//showmessage(qryInsertIntoOstatki.ParamByName('name').AsString);          
          qryInsertIntoOstatki.ParamByName('nowdate').Asstring :=DateToStr(date);
//          'insert into Ostatki (name) values('''+qryComponents.fieldByName('name').AsString+'/'+''')';

          qryInsertIntoOstatki.ExecSQL;

          if dm.qrytypes_by_comp_id.Active then
                dm.qrytypes_by_comp_id.Close;

           dm.qrytypes_by_comp_id.ParamByName('component_id').AsInteger:=
                   dm.qryComponents_by_name.fieldByName('Component_id').AsInteger;
//         'select name,type_id from types where component_id ='+intToStr(qryComponents.fieldByName('Component_id').AsInteger)+' order by name';
           dm.qrytypes_by_comp_id.Open;
           dm.qrytypes_by_comp_id.first;

//           showmessage(dm.qrytypes_by_comp_id.fieldByName('name').AsString);

             while not dm.qrytypes_by_comp_id.Eof do
                begin
                qryInsertIntoOstatki.ParamByName('name').AsString:='          '+
                     dm.qrytypes_by_comp_id.fieldByName('name').AsString+'/';
                qryInsertIntoOstatki.ParamByName('nowdate').Asstring :=DateToStr(date);
//                  'insert into ostatki (name) values('''+'          '+qryOstatki.fieldByName('name').AsString+'/'+''')';
                  qryInsertIntoOstatki.execSql;
//                  qryWork.close;

                  dm.qryOstatki_by_type.ParamByName('type_id').AsInteger:=dm.qrytypes_by_comp_id.fieldByName('type_id').asInteger;
    //              'select * from ostatki_by_type('+intToStr(qryOstatki.fieldByName('type_id').asInteger)+') order by name';
                  dm.qryOstatki_by_type.Open;
                  dm.qryOstatki_by_type.First;                  
                  while not dm.qryOstatki_by_type.Eof do
                    begin
                         num_p_p:=(dm.qryOstatki_by_type.fieldByName('id').asinteger);
                         nam:='                 '+dm.qryOstatki_by_type.fieldByName('name').asString;
                         ostatok:=dm.qryOstatki_by_type.fieldByName('ostatok').AsFloat;
                       if (ostatok) < 1 then
                       begin
                          str(ostatok:2:2,o);
                         try
                            ostatok:=StrToFloat(o);
                         except;
                           ostatok:=StrToFloat(frmManeger.ZamenaDotNakoma(o));
                          end;
                        end;// else o:=floatToStr(ostatok);
                         unit_izmr:=dm.qryOstatki_by_type.fieldByName('unit_izmerenie').asString;
//                         o:=ZamenaKomaNaDot(o);
      if qryFuLLinsertIntoOstatki.Active then
         qryFuLLinsertIntoOstatki.close;
      qryFuLLinsertIntoOstatki.ParamByName('num_p_p').AsInteger :=num_p_p;
      qryFuLLinsertIntoOstatki.ParamByName('elem_id').AsInteger :=Elem_id;
      qryFuLLinsertIntoOstatki.ParamByName('name').AsString:=nam;
      qryFuLLinsertIntoOstatki.ParamByName('ostatok').AsFloat:=ostatok;
      qryFuLLinsertIntoOstatki.ParamByName('unit_izmr').Asstring :=unit_izmr;
      qryFuLLinsertIntoOstatki.ParamByName('thedate').Asstring :=DateToStr(date);

      qryFuLLinsertIntoOstatki.execSql;
      inc(Elem_id);
      dm.qryOstatki_by_type.Next;
                   end;
               dm.qryOstatki_by_type.Close;
               dm.qrytypes_by_comp_id.Next;
             end;
          dm.qrytypes_by_comp_id.close;
          dm.qryComponents_by_name.Next;
        end;
       end;
     end;
{---------}
  if TableName ='Types' then
   with {dm,dm3}dmBDE do begin
       begin
              dm.qryTypes_by_name.ParamByName('type_id').AsInteger:=value;
//             'select name,type_id from types where type_id ='+intToStr(value)+' order by name';
              dm.qryTypes_by_name.Open;
                  while not dm.qryTypes_by_name.Eof do
                  begin
                     qryInsertIntoOstatki.ParamByName('name').AsString:='          '+
                           dm.qryTypes_by_name.fieldByName('name').AsString+'/';
//    insert into ostatki (name)
//       values('''+'          '+qryOstatki.fieldByName('name').AsString+'/'+''')';
         qryInsertIntoOstatki.ParamByName('nowdate').Asstring :=DateToStr(date);
                      qryInsertIntoOstatki.ExecSQL;
                      dm.qryOstatki_by_type.ParamByName('type_id').AsInteger:=
                           dm.qryTypes_by_name.fieldByName('type_id').asInteger;
    //    select * from ostatki_by_type('+intToStr(qryOstatki.fieldByName('type_id').asInteger)+') order by name';

                        dm.qryOstatki_by_type.Open;
                          while not dm.qryOstatki_by_type.Eof do
                            begin
                                 num_p_p:=(dm.qryOstatki_by_type.fieldByName('id').asinteger);
                                 nam:='                 '+dm.qryOstatki_by_type.fieldByName('name').asString;
                                 ostatok:=dm.qryOstatki_by_type.fieldByName('ostatok').AsFloat;
                             if (ostatok) < 1 then
                             begin
                                str(ostatok:2:2,o);
                               try
                                  ostatok:=StrToFloat(o);
                               except;
                                 ostatok:=StrToFloat(frmManeger.ZamenaDotNakoma(o));
                                end;
                              end;// else o:=floatToStr(ostatok);

                                 unit_izmr:=dm.qryOstatki_by_type.fieldByName('unit_izmerenie').asString;
//                                 o:=ZamenaKomaNaDot(o);
      qryFuLLinsertIntoOstatki.ParamByName('num_p_p').AsInteger :=num_p_p;
      qryFuLLinsertIntoOstatki.ParamByName('elem_id').AsInteger :=Elem_id;
      qryFuLLinsertIntoOstatki.ParamByName('name').AsString:=nam;
      qryFuLLinsertIntoOstatki.ParamByName('ostatok').AsFloat:=ostatok;//tyt bil change
      qryFuLLinsertIntoOstatki.ParamByName('unit_izmr').Asstring :=unit_izmr;
      qryFuLLinsertIntoOstatki.ParamByName('thedate').Asstring :=DateToStr(date);

            qryFuLLinsertIntoOstatki.execSql;
            inc(elem_id);

                          dm.qryOstatki_by_type.Next;
                            end;
                           dm.qryOstatki_by_type.Close;
                     dm.qryTypes_by_name.Next;
                  end;
           dm.qryTypes_by_name.close;
        end;
       end;
  if TableName ='Elements' then
   with dmBDE do
       begin
           dm.qryElemMax_num_p_p.ParamByName('element_id').AsInteger:=value;
//         select e.name,e.unit_izmerenie,i.* from elements e inner join  info i on e.element_id=i.element_id where element_id='+intToStr(value)+' and num_p_p =(select max(num_p_p) from info where element_id=e.element_id) order by name';

           dm.qryElemMax_num_p_p.Open;
           num_p_p:=(dm.qryElemMax_num_p_p.fieldByName('num_p_p').asinteger);
           nam:='                 '+dm.qryElemMax_num_p_p.fieldByName('name').asString;
           ostatok:=dm.qryElemMax_num_p_p.fieldByName('ostatok').AsFloat;
                       if (ostatok) < 1 then
                       begin
                          str(ostatok:2:2,o);
                         try
                            ostatok:=StrToFloat(o);
                         except;
                           ostatok:=StrToFloat(frmManeger.ZamenaDotNakoma(o));
                          end;
                        end;// else o:=floatToStr(ostatok);
           unit_izmr:=dm.qryElemMax_num_p_p.fieldByName('unit_izmerenie').asString;
//           o:=ZamenaKomaNaDot(o);
      qryFuLLinsertIntoOstatki.ParamByName('num_p_p').AsInteger :=num_p_p;
      qryFuLLinsertIntoOstatki.ParamByName('elem_id').AsInteger :=Elem_id;
      qryFuLLinsertIntoOstatki.ParamByName('name').AsString:=nam;
      o:=frmManeger.ZamenaDotNakoma(o);
      qryFuLLinsertIntoOstatki.ParamByName('ostatok').AsFloat:=ostatok;
      qryFuLLinsertIntoOstatki.ParamByName('unit_izmr').Asstring :=unit_izmr;
      qryFuLLinsertIntoOstatki.ParamByName('thedate').Asstring :=DateToStr(date);

       qryFuLLinsertIntoOstatki.ExecSQL;
       inc(elem_id);
       dm.qryElemMax_num_p_p.Close;
       end;
 frmOstatki.show;

 dmBDE.tblOst.Open;
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
num_p_p,elem_id:integer;
ostatok:real;
begin
 try
  try
    btnGetOstatki.Enabled:=false;
    elem_id:=1;
    if messageDLG('¬ы уверены, что желаете вывести все остатки?',mtConfirmation,[MbYes,MbNo],0)=mrNo then exit;
    grid.Cursor:=crHourGlass;
    with {dm,dm3}dmBDE do
    begin
     if dm.qryComponentsOstatki.active then dm.qryComponentsOstatki.close;


     dm.qryComponentsOstatki.Open;
{     qryConsole.SQL.Text:='';
     qryConsole.Close;
     qryOstatki.SQL.Text:='';
     qryOstatki.close;}
     dm.qryComponentsOstatki.First;
      while not dm.qryComponentsOstatki.Eof do
       begin
          qryInsertIntoOstatki.ParamByName('name').AsString:=dm.qryComponentsOstatki.fieldByName('name').AsString+'/';
          qryInsertIntoOstatki.ParamByName('nowdate').Asstring :=DateToStr(date);
//          qryWork.SQL.Text:='insert into Ostatki (name) values('''+qryComponents.fieldByName('name').AsString+'/'+''')';
//          qryWork.open;
          qryInsertIntoOstatki.ExecSQL;
//          qryWork.close;
          dm.qryTypes_by_comp_id.ParamByName('component_id').AsInteger:=dm.qryComponentsOstatki.fieldByName('Component_id').AsInteger;
//          qryOstatki.SQL.Text:='select name,type_id from types where component_id ='+intToStr(qryComponents.fieldByName('Component_id').AsInteger)+' order by name';
//          qryOstatki.Open;
          dm.qrytypes_by_comp_id.Open;
                  while not dm.qrytypes_by_comp_id.Eof do
                  begin
                         qryInsertIntoOstatki.ParamByName('name').AsString:='          '+
                           dm.qrytypes_by_comp_id.fieldByName('name').AsString+'/';
                         qryInsertIntoOstatki.ParamByName('nowdate').Asstring :=DateToStr(date);
//                          qryWork.SQL.Text:='insert into ostatki (name) values('''+'          '+qryOstatki.fieldByName('name').AsString+'/'+''')';
//                          qryWork.execSql;
                         qryInsertIntoOstatki.ExecSQL;
//                          qryWork.close;
                          dm.qryOstatki_by_type.ParamByName('type_id').AsInteger:=dm.qrytypes_by_comp_id.fieldByName('type_id').asInteger;
//                          qryConsole.SQL.Text:='select * from ostatki_by_type('+intToStr(qryOstatki.fieldByName('type_id').asInteger)+') order by name';
//                          qryConsole.Open;
                          dm.qryOstatki_by_type.Open;
                          while not dm.qryOstatki_by_type.Eof do
                            begin
                                 num_p_p:=(dm.qryOstatki_by_type.fieldByName('id').asinteger);
                                 nam:='                 '+dm.qryOstatki_by_type.fieldByName('name').asString;
                                 ostatok:=dm.qryOstatki_by_type.fieldByName('ostatok').AsFloat;
                               if (ostatok) < 1 then
                                str(ostatok:2:2,o) else o:=floatToStr(ostatok);
                                 unit_izmr:=dm.qryOstatki_by_type.fieldByName('unit_izmerenie').asString;
//                                 o:=ZamenaKomaNaDot(o);

      qryFuLLinsertIntoOstatki.ParamByName('num_p_p').AsInteger :=num_p_p;
      qryFuLLinsertIntoOstatki.ParamByName('elem_id').AsInteger :=Elem_id;
      qryFuLLinsertIntoOstatki.ParamByName('name').AsString:=nam;
      qryFuLLinsertIntoOstatki.ParamByName('ostatok').AsFloat:=strToFloat(o);
      qryFuLLinsertIntoOstatki.ParamByName('unit_izmr').Asstring :=unit_izmr;
      qryFuLLinsertIntoOstatki.ParamByName('thedate').Asstring :=DateToStr(date);

       qryFuLLinsertIntoOstatki.ExecSQL;
       inc(elem_id);
//                          qryWork.execSql;
//                          qryWork.close;
                    dm.qryOstatki_by_type.Next;
                   end;
               dm.qryOstatki_by_type.Close;
               dm.qrytypes_by_comp_id.Next;
             end;
          dm.qrytypes_by_comp_id.close;
          dm.qryComponentsOstatki.Next;
        end;
    end;
 dmBDE.tblOst.Open;
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
//  dm.Ost.Close;
  frmOstatki.close;
//  frmManeger.btnAllConnect.Click;
end;

procedure TfrmOstatki.btnImpWordClick(Sender: TObject);
begin
try
 try
   grid.Cursor:=crHourGlass;
   btnImpWord.Enabled:=false;
   With EKRTF do Begin
   OutFile:=CreateFileName('','reports/tmp/list');
   ExecuteOpen([dmBDE.tblOst],SW_SHOW);
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

procedure TfrmOstatki.InvFnFunctions0Calculate(Sender: TObject;
  Args: TEkUDFArgs; ArgCount: Integer; UDFResult: TObject);
begin
  //InvRTF - MyTotal code **************************

 With UDFResult As TEkReportVariable do begin
  AsFloat:=TEkReportVariable(Args[0]).AsFloat+
           TEkReportVariable(Args[1]).AsFloat;
 end;//with

end;

end.
