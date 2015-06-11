unit unitFindRecords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmFindRecords = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditZnachenie: TEdit;
    CBTableName: TComboBox;
    Label3: TLabel;
    CBFieldName: TComboBox;
    btnFind: TBitBtn;
    btnClose: TBitBtn;
    procedure CBTableNameChange(Sender: TObject);
    procedure CBFieldNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFindRecords: TfrmFindRecords;

implementation

uses Dmo;
var tableName:string;
    fieldName:string;
    Fieldtext:boolean;

{$R *.dfm}

procedure TfrmFindRecords.CBTableNameChange(Sender: TObject);
var i:integer;
begin
    i:=cbTableName.ItemIndex;
    case i of
     0:begin
          cbFieldName.Items.Clear;
          tablename:='Components';
          cbFieldName.Items.Add('Имя');
       end;
     1:begin
          cbFieldName.Items.Clear;
          tablename:='Types';
          cbFieldName.Items.Add('Имя типа');
          cbFieldName.Items.Add('Имя комплектующего');
       end;
     2:begin
          cbFieldName.Items.Clear;
          tablename:='Elements';
          cbFieldName.Items.Add('Имя');
          cbFieldName.Items.Add('Единица измерения');
          cbFieldName.Items.Add('В наличии');
          cbFieldName.Items.Add('Имя типа');
       end;
     3:begin
          cbFieldName.Items.Clear;
          tablename:='Info';
          cbFieldName.Items.Add('Дата');
          cbFieldName.Items.Add('№ документа');
          cbFieldName.Items.Add('Цена за единицу');
          cbFieldName.Items.Add('От кого получено (кому выдано)');
          cbFieldName.Items.Add('Приход');
          cbFieldName.Items.Add('Расход');
          cbFieldName.Items.Add('Остаток');
          cbFieldName.Items.Add('№ п/п');
          cbFieldName.Items.Add('Имя элемента');          
       end;
      else            tablename:='Elements';    end;


end;

procedure TfrmFindRecords.CBFieldNameChange(Sender: TObject);
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
                     fieldName:='nameС';
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
                   fieldText:=false;
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

end.
