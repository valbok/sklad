unit UnitCreateWhere;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmCreateWhere = class(TForm)
    pnlMain: TPanel;
    gbSelect: TGroupBox;
    lbFieldname: TListBox;
    gbGen: TGroupBox;
    memGen: TMemo;
    lbLogic: TListBox;
    btnInputValue: TBitBtn;
    btnClose: TBitBtn;
    btnGoFind: TBitBtn;
    btnClear: TBitBtn;
    Label1: TLabel;
    procedure btnInputValueClick(Sender: TObject);
    procedure lbFieldnameDblClick(Sender: TObject);
    procedure lbLogicDblClick(Sender: TObject);
    procedure SetValue(st:string);
    procedure btnCloseClick(Sender: TObject);
    procedure btnGoFindClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreateWhere: TfrmCreateWhere;

implementation

uses UnitInputValue, UnitFind, UnitBetween;

{$R *.dfm}

procedure TfrmCreateWhere.btnInputValueClick(Sender: TObject);
begin
   frminputValue.show;
end;
procedure TfrmCreateWhere.SetValue(st:string);
begin
       memGen.Text:=memGen.Text+st+' ';
end;
procedure TfrmCreateWhere.lbFieldnameDblClick(Sender: TObject);
var j:integer;
begin
  j:=lbFieldname.ItemIndex;
  case j of
    0:begin
        memGen.Text:=memGen.Text+'e.name'+' ';
      end;
    1:begin
        memGen.Text:=memGen.Text+'e.unit_izmerenie'+' ';
      end;
    2:begin
        memGen.Text:=memGen.Text+'e.numer'+' '
      end;
    3:begin
        memGen.Text:=memGen.Text+'i.ostatok'+' '
      end;
    4:begin
        memGen.Text:=memGen.Text+'e.info'+' '
      end;
    5:begin
{        fN:='d.resistance';
        Fieldtext:=false;}
        memGen.Text:=memGen.Text+'d.resistance'+' '
      end;
    6:begin
{        fN:='d.dopusk';
        Fieldtext:=false;}
        memGen.Text:=memGen.Text+'d.dopusk'+' '

      end;
    7:begin
{        fN:='d.tks';
        Fieldtext:=true;}
        memGen.Text:=memGen.Text+'d.tks'+' '
      end;
    8:begin
{        fN:='d.type_name';
        Fieldtext:=true;}
        memGen.Text:=memGen.Text+'d.type_name'+' '
      end;
    end;



end;

procedure TfrmCreateWhere.lbLogicDblClick(Sender: TObject);
var j:integer;
begin
  j:=lbLogic.ItemIndex;
  case j of
    0:begin
        memGen.Text:=memGen.Text+'='+' ';
        frminputValue.show;
      end;
    1:begin
        memGen.Text:=memGen.Text+'<>'+' ';
        frminputValue.show;
      end;
    2:begin
        memGen.Text:=memGen.Text+'<='+' ' ;
        frminputValue.show;
      end;
    3:begin
        memGen.Text:=memGen.Text+'>='+' '      ;
        frminputValue.show;
      end;
    4:begin
        memGen.Text:=memGen.Text+'<'+' '     ;
        frminputValue.show;
      end;
    5:begin
        memGen.Text:=memGen.Text+'>'+' '    ;
        frminputValue.show;
      end;
    6:begin
        memGen.Text:=memGen.Text+'and'+' ' ;
      end;
    7:begin
        memGen.Text:=memGen.Text+'or'+' ';
      end;
    8:begin
        memGen.Text:=memGen.Text+'like '+' ';
        frminputValue.show;
      end;
    9:begin
         frmBetween.show;
      end;
    10:begin
        memGen.Text:=memGen.Text+'is null'+' ';
      end;
    11:begin
        memGen.Text:=memGen.Text+'not'+' ';
      end;


    end;


end;

procedure TfrmCreateWhere.btnCloseClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCreateWhere.btnGoFindClick(Sender: TObject);
begin
  frmFind.SetWhere(memGen.Text);
  close;
end;

procedure TfrmCreateWhere.btnClearClick(Sender: TObject);
begin
memGen.Clear;
end;

end.
