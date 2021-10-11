unit Unit_Kartka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Mask, Buttons;

type
  TKartka = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel1: TBevel;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox3: TGroupBox;
    BitBtn4: TBitBtn;
    Label13: TLabel;
    Label14: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    ComboBox1: TComboBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Kartka: TKartka;

implementation

uses UDM, Unit_Pilgu, Unit_Voda, U_Golovna, Flash_Form, Unit_Abonent;

{$R *.dfm}

procedure TKartka.BitBtn1Click(Sender: TObject);
begin
Pilgu.ShowModal;
vub_pilg:=1;
end;

procedure TKartka.BitBtn3Click(Sender: TObject);
begin
Close;
end;

procedure TKartka.BitBtn2Click(Sender: TObject);
begin
// збереження нового абонента  дані про квартиру
if vuba=1 then begin
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
DM.Karta.FieldByName('Kod_Pilgu').AsString:=Edit8.Text;
DM.Karta.FieldByName('Nazva_Pilgu').AsString:=Edit9.Text;
DM.Karta.FieldByName('Rozmir_Pilgu').AsFloat:=StrToFloat(Edit10.Text);

DM.Karta.FieldByName('Pop_Voda').AsInteger:=StrToInt(Edit11.Text);
DM.Karta.FieldByName('Pot_Voda').AsInteger:=StrToInt(Edit12.Text);
DM.Karta.Post;

end;
//збереження редагованого абонента  дані про квартиру
if vuba=2 then begin
DM.Karta.Edit;
DM.Karta.FieldByname('Adresa').AsString:=ComboBox1.Text;
DM.Karta.FieldByName('Nomer_kvart').AsString:=Edit1.Text;
DM.Karta.FieldByName('Plosha_kvart').AsFloat:=StrToFloat(Edit2.Text);
DM.Karta.FieldByName('Osob_Nomer').AsString:=Edit3.Text;
DM.Karta.FieldByName('Prizv').AsString:=Edit4.Text;
DM.Karta.FieldByName('Name').AsString:=Edit5.Text;
DM.Karta.FieldByName('Po_Bat').AsString:=Edit6.Text;
DM.Karta.FieldByName('Kilkist_Gul').AsInteger:=StrToInt(Edit7.Text);
DM.Karta.FieldByName('Vud_Opal').AsBoolean:=CheckBox2.Checked;
DM.Karta.FieldByName('Kod_Pilgu').AsString:=Edit8.Text;
DM.Karta.FieldByName('Nazva_Pilgu').AsString:=Edit9.Text;
DM.Karta.FieldByName('Rozmir_Pilgu').AsFloat:=StrToFloat(Edit10.Text);

DM.Karta.FieldByName('Pop_Voda').AsInteger:=StrToInt(Edit11.Text);
DM.Karta.FieldByName('Pot_Voda').AsInteger:=StrToInt(Edit12.Text);

DM.Karta.Post;
end;
Close;
end;

procedure TKartka.BitBtn4Click(Sender: TObject);
begin
vub_vodu:=1;
Voda.ShowModal;
end;

procedure TKartka.FormActivate(Sender: TObject);
var str:string;
begin
   DM.Adresu.First;
   while not DM.Adresu.Eof do begin
   str:=DM.Adresu.FieldByName('Adresa').AsString;
   Kartka.ComboBox1.Items.Add(str);
   DM.Adresu.Next;
   end;
end;

end.
