unit unitConsole;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DBCtrls, Grids, DBGrids;

type
  TfrmSQL = class(TForm)
    PanelMain: TPanel;
    PanelTop: TPanel;
    MemSql: TMemo;
    PanelClient: TPanel;
    PanelTop2: TPanel;
    PanelTop2Left: TPanel;
    btnRunSql: TBitBtn;
    PanelTop2Right: TPanel;
    btnCloseForm: TBitBtn;
    GridQryWork: TDBGrid;
    btnClearMemo: TBitBtn;
    Splitter1: TSplitter;
    procedure btnCloseFormClick(Sender: TObject);
    procedure btnRunSqlClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnClearMemoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSQL: TfrmSQL;

implementation
uses dmo;
{$R *.dfm}

procedure TfrmSQL.btnCloseFormClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSQL.btnRunSqlClick(Sender: TObject);
begin
  with dm do
  begin
    qryConsole.close;
    qryConsole.SQL.Clear;
    qryConsole.SQL.Assign(memSQL.lines);
    qryConsole.Open;
  end
end;

procedure TfrmSQL.FormActivate(Sender: TObject);
begin
 if dm.qryConsole.Active then
   dm.qryConsole.Close;

end;

procedure TfrmSQL.btnClearMemoClick(Sender: TObject);
begin
   memSql.Clear;
   memSql.SetFocus;
end;

end.
