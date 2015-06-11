unit unitPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,main;

type
  TfrmEnterPass = class(TForm)
    pnlMain: TPanel;
    pnlunderMain: TPanel;
    cbLogin: TComboBox;
    Label1: TLabel;
    edtPass: TEdit;
    btnEnter: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure btnEnterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure addLoginToCB(logn:string;var cb:TComboBOX);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnterPass: TfrmEnterPass;
  users:string='';

implementation

uses dmo;

{$R *.dfm}
procedure TfrmEnterPass.addLoginToCB(logn:string;var cb:TComboBOX);
begin
      cb.Items.Add(Logn);
end;
procedure TfrmEnterPass.btnEnterClick(Sender: TObject);
begin
  with frmMain do
   begin
      SetUser(cbLogin.Text,edtPass.text);
//      cbLogin.Items.Add(cbLogin.text);

   end;
   close;
end;

procedure TfrmEnterPass.FormCreate(Sender: TObject);
var f:Tfile;
p:integer;
begin
  with frmMain do
  begin
      if MainopenFile('sklad.ini',f) then
          begin
           find(f,'users="',p,filepos(f));
           users:=getPath(f,p+7);
           CloseFile(f);
          end;
  end;
//  showmessage(users);
  cbLogin.Items.CommaText:=users;
  cbLogin.Text:=cbLogin.Items.Strings[cbLogin.Items.Count-1];

end;

procedure TfrmEnterPass.FormDestroy(Sender: TObject);
var f:Tfile;
p:integer;
s,i:integer;
begin
  with frmMain do
  begin
      if MainOpenFile('sklad.ini',f) then
          begin
            find(f,'users="',p,filepos(f));
            seek(f,p+7);
            for i:=1 to length(cbLogin.Items.CommaText) do
            begin
              s:=ord(cbLogin.Items.CommaText[i]);
              Write(f,s);
            end;
              s:=ord('"');
              Write(f,s);
           CloseFile(f);
          end;
  end;

end;

procedure TfrmEnterPass.btnCancelClick(Sender: TObject);
begin

  dm.IBDatabase.Close;
  dm.IBDatabase.CloseDataSets;
  frmEnterPass.close;
end;

procedure TfrmEnterPass.FormActivate(Sender: TObject);
begin
  edtPass.Clear;
  edtPass.SetFocus;
  
end;

end.
