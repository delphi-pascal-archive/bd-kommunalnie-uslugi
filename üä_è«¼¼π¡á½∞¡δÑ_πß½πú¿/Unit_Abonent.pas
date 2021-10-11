unit Unit_Abonent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons, XPMan;

type
  TAbonent = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label6: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    XPManifest1: TXPManifest;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Abonent: TAbonent;

implementation

uses UDM, Unit_Pilgu, Flash_Form, Unit_Nastr, Unit_Kartka, U_Frame1, Menu;

{$R *.dfm}

procedure TAbonent.BitBtn3Click(Sender: TObject);
begin
Close;
end;

procedure TAbonent.FormActivate(Sender: TObject);
var str1,str2:string;
begin
 //   Показати вікон абонент із записами у вікні
DM.Karta.Refresh; DM.Karta.First;
Abonent.ComboBox1.Text:=DM.Karta.FieldByname('Adresa').AsString;
Abonent.Edit1.Text:=DM.Karta.FieldByname('Nomer_kvart').AsString;
Abonent.Edit2.Text:=FloatToStr(DM.Karta.FieldByname('Plosha_kvart').AsFloat);
Abonent.Edit3.Text:=DM.Karta.FieldByname('Osob_Nomer').AsString;
Abonent.Edit4.Text:=DM.Karta.FieldByname('Prizv').AsString;
Abonent.Edit5.Text:=DM.Karta.FieldByname('Name').AsString;
Abonent.Edit6.Text:=DM.Karta.FieldByname('Po_Bat').AsString;
Abonent.Edit7.Text:=IntToStr(DM.Karta.FieldByname('Kilkist_Gul').AsInteger);
Abonent.CheckBox2.Checked:=DM.Karta.FieldByname('Vud_Opal').AsBoolean;;

end;


procedure TAbonent.BitBtn2Click(Sender: TObject);
begin
// Додавання, перегляд відомостей про абонента і зберігання іноформації при введенні
DM.Karta.Refresh;
DM.Karta.Edit;
DM.Karta.Last;
DM.Karta.Insert;
DM.Karta.FieldByname('Adresa').AsString:=ComboBox1.Text;
DM.Karta.FieldByName('Nomer_kvart').AsString:=Edit1.Text;
DM.Karta.FieldByName('Plosha_kvart').AsFloat:=StrToFloat(Edit2.Text);
DM.Karta.FieldByName('Osob_Nomer').AsString:=Edit3.Text;
DM.Karta.FieldByName('Prizv').AsString:=Edit4.Text;
DM.Karta.FieldByName('Name').AsString:=Edit5.Text;
DM.Karta.FieldByName('Po_Bat').AsString:=Edit6.Text;
DM.Karta.FieldByName('Kilkist_Gul').AsInteger:=StrToInt(Edit7.Text);
DM.Karta.FieldByName('Vud_Opal').AsBoolean:=CheckBox2.Checked;
DM.Karta.FieldByName('Mis').AsString:=Nastroyku.ComboBox1.Text;
DM.Karta.FieldByName('Nomer_Mis').AsInteger:=Nastroyku.ComboBox1.ItemIndex;
DM.Karta.Post;
ShowMessage('Дані збережено!');
end;

Procedure Navigator;
begin
Abonent.ComboBox1.Text:=DM.Karta.FieldByname('Adresa').AsString;
Abonent.Edit1.Text:=DM.Karta.FieldByname('Nomer_kvart').AsString;
Abonent.Edit2.Text:=FloatToStr(DM.Karta.FieldByname('Plosha_kvart').AsFloat);
Abonent.Edit3.Text:=DM.Karta.FieldByname('Osob_Nomer').AsString;
Abonent.Edit4.Text:=DM.Karta.FieldByname('Prizv').AsString;
Abonent.Edit5.Text:=DM.Karta.FieldByname('Name').AsString;
Abonent.Edit6.Text:=DM.Karta.FieldByname('Po_Bat').AsString;
Abonent.Edit7.Text:=IntToStr(DM.Karta.FieldByname('Kilkist_Gul').AsInteger);
Abonent.CheckBox2.Checked:=DM.Karta.FieldByname('Vud_Opal').AsBoolean;

end;


procedure TAbonent.BitBtn4Click(Sender: TObject);
begin
DM.Karta.Prior;
Navigator;
end;

procedure TAbonent.BitBtn5Click(Sender: TObject);
begin
DM.Karta.Next;
Navigator;
end;

procedure TAbonent.BitBtn6Click(Sender: TObject);
begin
DM.Karta.First;
Navigator;
end;

procedure TAbonent.BitBtn7Click(Sender: TObject);
begin
DM.Karta.Last;
Navigator;
end;

procedure TAbonent.BitBtn8Click(Sender: TObject);
var str1:string;
begin
Abonent.Edit1.Clear;
Abonent.Edit2.Clear;
Abonent.Edit3.Clear;
Abonent.Edit4.Clear;
Abonent.Edit5.Clear;
Abonent.Edit6.Clear;
Abonent.Edit7.Clear;
Abonent.ComboBox1.Text:='';
Abonent.CheckBox2.Checked:=false;
DM.Karta.Refresh;
DM.Karta.Edit;
DM.Karta.Insert;

///
DM.Adresu.First;
   while not DM.Adresu.Eof do begin
   str1:=DM.Adresu.FieldByName('Adresa').AsString;
   Abonent.ComboBox1.Items.Add(str1);
   DM.Adresu.Next;
end;




end;

procedure TAbonent.BitBtn1Click(Sender: TObject);
begin
if dm.Karta.RecordCount>0 then
if  MessageBox(GetForegroundWindow,pchar('Ви впенені, що хочете вилучити абонента і його дані?'),'Підтвердження',MB_YESNO or MB_ICONWARNING or MB_DEFBUTTON2) = IDYES then
dm.Karta.Delete;
Abonent.Edit1.Clear;
Abonent.Edit2.Clear;
Abonent.Edit3.Clear;
Abonent.Edit4.Clear;
Abonent.Edit5.Clear;
Abonent.Edit6.Clear;
Abonent.Edit7.Clear;
Abonent.ComboBox1.Text:='';
Abonent.CheckBox2.Checked:=false;
Abonent.FormActivate(Sender);
end;

end.
