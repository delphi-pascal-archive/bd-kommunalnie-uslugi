unit U_Golovna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DBCtrls, Grids, DBGrids, ExtCtrls, StdCtrls, Mask,
  Buttons, ComCtrls, frxClass, frxDBSet, frxDesgn, GridsEh, DBGridEh;

type
  TGolovna = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    DBNavigator1: TDBNavigator;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox5: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox6: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn9: TBitBtn;
    DBEdit13: TDBEdit;
    GroupBox7: TGroupBox;
    Label17: TLabel;
    Label16: TLabel;
    DBCheckBox2: TDBCheckBox;
    Label18: TLabel;
    GroupBox8: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    frxDesigner1: TfrxDesigner;
    Vidomist: TfrxReport;
    Vidom: TfrxDBDataset;
    frxReport2: TfrxReport;
    BitBtn13: TBitBtn;
    Povidomlen: TfrxReport;
    Povidoml: TfrxDBDataset;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Panel3: TPanel;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    GroupBox9: TGroupBox;
    Edit1: TEdit;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    BitBtn16: TBitBtn;
    GroupBox10: TGroupBox;
    Bevel1: TBevel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label19: TLabel;
    DBEdit8: TDBEdit;
    Label20: TLabel;
    DBEdit16: TDBEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Golovna: TGolovna;
  vuba:integer;
  CDir,Wpath:string;
implementation

uses UDM, Unit_Narax, Unit_Kartka, Unit_Nastr, Unit_Voda, Flash_Form, Menu,
  Unit_Abonent, Unit_Oplata, Unit_Pilgu, Unit_Pereraxunok;

{$R *.dfm}

procedure TGolovna.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
Close;

end;

procedure TGolovna.N2Click(Sender: TObject);
begin
Close;
end;

procedure TGolovna.Edit1Change(Sender: TObject);
begin
if    RadioButton3.Checked=true then
begin
Edit1.MaxLength:=4;
DM.Karta.First;
//поки не кінець таблиці
while not DM.Karta.Eof do begin
   if DM.Karta['Osob_Nomer']=Edit1.Text then
      break;  //знайшли перший запис і вийшли з циклу
      DM.Karta.Next; //інакше перейшли на наступний запис
end; //while
end; // end begin
if    RadioButton4.Checked=true then
begin
Edit1.MaxLength:=25;
DM.Karta.First;
//поки не кінець таблиці
while not DM.Karta.Eof do begin
   if DM.Karta['Prizv']=Edit1.Text then
      break;  //знайшли перший запис і вийшли з циклу
      DM.Karta.Next; //інакше перейшли на наступний запис
end; //while
end; // end begin
end;

procedure TGolovna.BitBtn2Click(Sender: TObject);
begin

Narax.ShowModal;

end;

procedure TGolovna.BitBtn8Click(Sender: TObject);
begin
nastr:=3;
Nastroyku.ShowModal;

end;

procedure TGolovna.BitBtn10Click(Sender: TObject);
begin
///
// додати нового абонента. Очистка полів форми Kartka

vuba:=1;   // ознака додавання абонента
Kartka.Caption:='Облікова картка. Додавання нового абонента.';
Kartka.Edit1.Clear;
Kartka.Edit2.Clear;
Kartka.Edit3.Clear;
Kartka.Edit4.Clear;
Kartka.Edit5.Clear;
Kartka.Edit6.Clear;
Kartka.Edit7.Clear;
Kartka.Edit8.Clear;
Kartka.Edit9.Clear;
Kartka.Edit10.Clear;
Kartka.Edit11.Clear;
Kartka.Edit12.Clear;
Kartka.ComboBox1.Text:='';
//Kartka.ComboBox1.Clear;
Kartka.CheckBox2.Checked:=false;
Kartka.ShowModal;
end;

procedure TGolovna.BitBtn11Click(Sender: TObject);
begin
vuba:=2; // ознака вибору редагування

Kartka.Caption:='Облікова картка. Редагування показників.';

Kartka.ComboBox1.Text:=DM.Karta.FieldByname('Adresa').AsString;
Kartka.Edit1.Text:=DM.Karta.FieldByname('Nomer_kvart').AsString;
Kartka.Edit2.Text:=FloatToStr(DM.Karta.FieldByname('Plosha_kvart').AsFloat);
Kartka.Edit3.Text:=DM.Karta.FieldByname('Osob_Nomer').AsString;
Kartka.Edit4.Text:=DM.Karta.FieldByname('Prizv').AsString;
Kartka.Edit5.Text:=DM.Karta.FieldByname('Name').AsString;
Kartka.Edit6.Text:=DM.Karta.FieldByname('Po_Bat').AsString;
Kartka.Edit7.Text:=IntToStr(DM.Karta.FieldByname('Kilkist_Gul').AsInteger);
Kartka.Edit8.Text:=DM.Karta.FieldByname('Kod_Pilgu').AsString;
Kartka.Edit9.Text:=DM.Karta.FieldByname('Nazva_Pilgu').AsString;
Kartka.Edit10.Text:=FloatToStr(DM.Karta.FieldByname('Rozmir_Pilgu').AsFloat);
Kartka.Edit11.Text:=IntToStr(DM.Karta.FieldByname('Pop_Voda').AsInteger);
Kartka.Edit12.Text:=IntToStr(DM.Karta.FieldByname('Pot_Voda').AsInteger);
Kartka.CheckBox2.Checked:=DM.Karta.FieldByname('Vud_Opal').AsBoolean;
Kartka.ShowModal;


end;

procedure TGolovna.BitBtn12Click(Sender: TObject);
begin
// вилучити абонента.
vuba:=3; //Озанака вилучення
if dm.Karta.RecordCount>0 then
if  MessageBox(GetForegroundWindow,pchar('Ви впенені, що хочете вилучити абонента і його дані?'),'Підтвердження',MB_YESNO or MB_ICONWARNING or MB_DEFBUTTON2) = IDYES then
dm.Karta.Delete;
end;

procedure TGolovna.FormActivate(Sender: TObject);
begin
GetDir(0,cDir);
Wpath:=cDir+'\';
Label17.Caption:='Поточний місяць '+DM.Karta.FieldByName('Mis').AsString+' 2010';
Golovna.Caption:='Нарахування квартплати за місяць '+ DM.Karta.FieldByName('Mis').AsString+' 2010';
Label18.Caption:='Всіх абонетів '+IntToStr(DM.Karta.RecordCount);
end;

procedure TGolovna.BitBtn1Click(Sender: TObject);
begin
Oplata.ShowModal;
Oplata.Edit1.Clear;
Oplata.Edit2.Clear;
Oplata.Edit3.Clear;

end;

procedure TGolovna.BitBtn13Click(Sender: TObject);
begin
frxReport2.DesignReport;
end;

procedure TGolovna.BitBtn3Click(Sender: TObject);
begin
// відомість
Golovna.Vidomist.LoadFromFile(Wpath+'Vidomist1.fr3');
Golovna.Vidomist.ShowReport;
end;

procedure TGolovna.BitBtn4Click(Sender: TObject);
begin
//повідомлення
Golovna.Povidomlen.LoadFromFile(Wpath+'Povidom.fr3');
Golovna.Povidomlen.ShowReport;
end;

procedure TGolovna.BitBtn14Click(Sender: TObject);
begin
nastr:=2;
Nastroyku.ShowModal;

end;

procedure TGolovna.BitBtn15Click(Sender: TObject);
begin
Pilgu.ShowModal;
end;

end.
