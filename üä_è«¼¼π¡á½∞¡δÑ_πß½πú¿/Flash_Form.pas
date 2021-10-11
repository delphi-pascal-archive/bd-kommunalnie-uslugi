unit Flash_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, ExtCtrls, Buttons, jpeg, XPMan, ComCtrls;

type
  TFlash_f = class(TForm)
    XPManifest1: TXPManifest;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    XPManifest2: TXPManifest;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    Image1: TImage;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flash_f: TFlash_f;
       vub_vodu:byte;
       vub_pilg:byte;
       nastr:byte;
implementation

uses UDM, U_Golovna, Menu, Unit_Voda;

{$R *.dfm}

procedure TFlash_f.BitBtn2Click(Sender: TObject);
begin
// закрити форму
Application.Terminate;
end;

procedure TFlash_f.BitBtn1Click(Sender: TObject);
var k: boolean;
begin
     DM.Login.Active:=True;
  DM.Login.First;
  k:= false;
    while not DM.Login.Eof do begin
    if DM.Login.FieldByName('Логін').Value=Edit1.Text then
      if DM.Login.FieldByName('Пароль').Value=Edit2.Text then begin
        k:=true;
       // if DM.Login.FieldByName('права').Value='user' then
       //   form1.N21.Visible:=false;
       // if DM.Login.FieldByName('права').Value='admin' then
        //  form1.N21.Visible:=true;
      end;
    DM.Login.Next;
  end;
  if k then begin
    Timer1.Enabled:=True;
    ProgressBar1.Visible:=True;Label3.Visible:=true;
    With ProgressBar1 do
    Begin Position:=Position+1;
   if Position<>Max Then Label3.Caption:='Виконується завантаження БД...' else
   begin
   
   Label3.Caption:='Базу даних завантажено! Натисніть кнопку Вхід';
   flash_f.Hide;
   MenuF.show;
   DM.Karta.Active:=True;
   DM.Adresu.Active:=True;
   DM.Pilgu.Active:=True;
   DM.Firma.Active:=True;
   DM.Tarif.Active:=True;
   end;end;
 end
  else ShowMessage('Невірні дані! Зверніться до  адміністратора!');

end;





procedure TFlash_f.Timer1Timer(Sender: TObject);
begin
Label3.Visible:=True;
ProgressBar1.Visible:=True;
With ProgressBar1 do
Begin
Position:=Position+1;
if Position=Max Then Label3.Caption:='Базу даних завантажено. Натисніть кнопку Вхід!';
end;
Label3.Font.Color:=clBlue;

end;

end.
