unit Unit_Nastr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids,
  Mask, ToolEdit, RxLookup, GridsEh, DBGridEh, XPMan;

type
  TNastroyku = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBNavigator1: TDBNavigator;
    Label12: TLabel;
    Edit9: TEdit;
    Label13: TLabel;
    Edit10: TEdit;
    Label14: TLabel;
    Edit11: TEdit;
    Label15: TLabel;
    Edit12: TEdit;
    Label16: TLabel;
    Edit13: TEdit;
    Label17: TLabel;
    ComboBox1: TComboBox;
    Bevel1: TBevel;
    DBNavigator2: TDBNavigator;
    DBMemo1: TDBMemo;
    Label19: TLabel;
    BitBtn3: TBitBtn;
    TabSheet4: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label20: TLabel;
    from: TEdit;
    SpeedButton1: TSpeedButton;
    Label21: TLabel;
    where: TEdit;
    SpeedButton2: TSpeedButton;
    Button1: TButton;
    Open1: TOpenDialog;
    Save1: TSaveDialog;
    BitBtn4: TBitBtn;
    Open2: TOpenDialog;
    ProgressBar1: TProgressBar;
    Image1: TImage;
    BitBtn5: TBitBtn;
    Label22: TLabel;
    DBEdit4: TDBEdit;
    RxLookupEdit1: TRxLookupEdit;
    Label23: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    BitBtn6: TBitBtn;
    DBGridEh1: TDBGridEh;
    XPManifest1: TXPManifest;
    Label27: TLabel;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    DateTimePicker1: TDateTimePicker;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    DBGridEh2: TDBGridEh;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    BitBtn7: TBitBtn;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Memo1: TMemo;
    Label9: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
     procedure doit;
  public
    { Public declarations }
  end;

var
  Nastroyku: TNastroyku;

implementation

uses UDM, Flash_Form, Unit_Narax;

{$R *.dfm}
// процедура для копіювання
procedure TNastroyku.doit();
label 1;
var
f1,f2: file of byte;
cop: byte;
sizez: longint;
begin
 {$I-}
 try
 assignfile(f1,from.text);
 assignfile(f2,where.Text);
 reset(f1);
 sizez:=trunc(filesize(f1));
 label4.Caption:=intTOstr(sizez div 1024)+'Кб';
 rewrite(f2);
 1: while not eof(f1) do begin
   blockread(f1,cop,1);
   blockwrite(f2,cop,1);
// прогрес
With Nastroyku.ProgressBar1 do
Begin
Position:=Position+1;
if Position<>Max Then goto 1;
end;
   end;
 closefile(f1);
 closefile(f2);
 finally;
 end;
 if IOResult<>0 then messagedlg('Помилка при копіюванні  файла!',mterror, [mbok],0)
 else begin
 showmessage('Успішно скопійовано!');
 end;
end;


procedure TNastroyku.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TNastroyku.BitBtn1Click(Sender: TObject);
begin
DM.Karta.Refresh;
DM.Karta.First;
DM.Karta.Edit;
while not DM.Karta.Eof do
begin
DM.Karta.Edit;
DM.Karta.FieldByName('Mis').AsString:=ComboBox1.Text;
DM.Karta.FieldByName('Nomer_Mis').AsInteger:=ComboBox1.ItemIndex;
DM.Karta.Post;
DM.Karta.Next;
end;
DM.Karta.Refresh;
DM.Tarif.Edit;
DM.Tarif.FieldByName('Tarif_Data').AsDateTime:=DateTimePicker1.Date;
DM.Tarif.Post;


// вилучення старих записів
while not DM.Firma.Eof do
  begin
  IF  DM.Firma.RecordCount>0 then  dm.Firma.Delete;
  DM.Firma.Next;
  end;

DM.Firma.Edit;
DM.Firma.Last;
DM.Firma.Insert;
DM.Firma.FieldByName('Nazva_Org').AsString:=Edit1.Text;
DM.Firma.FieldByName('Adresa_Org').AsString:=Edit2.Text;
DM.Firma.FieldByName('Prizv_Gol').AsString:=Edit3.Text;
DM.Firma.FieldByName('Prizv_Bux').AsString:=Edit4.Text;
DM.Firma.FieldByName('Telefon').AsString:=Edit5.Text;
DM.Firma.FieldByName('Roz_Rax').AsString:=Edit9.Text;
DM.Firma.FieldByName('Nazva_Banku').AsString:=Edit10.Text;
DM.Firma.FieldByName('Misto_Ban').AsString:=Edit11.Text;
DM.Firma.FieldByName('Kod_Ban').AsString:=Edit12.Text;
DM.Firma.FieldByName('Kod_Edrpu').AsString:=Edit13.Text;
DM.Firma.Post;

end;

procedure TNastroyku.FormActivate(Sender: TObject);
begin
DM.Login.First;
DM.Login.Refresh;
label27.Caption:='Всіх будинків -'+IntTostr(DM.Adresu.RecordCount);
DM.Karta.Refresh;
DM.Tarif.Last;
if nastr=2 then Nastroyku.PageControl1.ActivePage:=TabSheet2;
if nastr=3 then Nastroyku.PageControl1.ActivePage:=TabSheet3;

DM.Tarif.Last;
Edit1.Text:=DM.Firma.FieldByName('Nazva_Org').AsString;
Edit2.Text:=DM.Firma.FieldByName('Adresa_Org').AsString;
Edit3.Text:=DM.Firma.FieldByName('Prizv_Gol').AsString;
Edit4.Text:=DM.Firma.FieldByName('Prizv_Bux').AsString;
Edit5.Text:=DM.Firma.FieldByName('Telefon').AsString;
Edit9.Text:=DM.Firma.FieldByName('Roz_Rax').AsString;
Edit10.Text:=DM.Firma.FieldByName('Nazva_Banku').AsString;
Edit11.Text:=DM.Firma.FieldByName('Misto_Ban').AsString;
Edit12.Text:=DM.Firma.FieldByName('Kod_Ban').AsString;
Edit13.Text:=DM.Firma.FieldByName('Kod_Edrpu').AsString;

ComboBox1.ItemIndex:=DM.Karta.FieldByName('Nomer_Mis').AsInteger;
DateTimePicker1.Date:=Date;
end;

procedure TNastroyku.BitBtn3Click(Sender: TObject);
begin
if  MessageBox(GetForegroundWindow,pchar('При переході на наступний місяць, попередній закривається.'+#13+
'Оперативні дані стираються!!!'+#13+' Зберігаються тільки дані з абонентами.'),'Підтвердження',MB_YESNO or MB_ICONWARNING or MB_DEFBUTTON2) = IDYES then
ComboBox1.ItemIndex:=ComboBox1.Itemindex+1;

//Зберегти файл з даними поточного місяця
 from.Text:='baza.mdb';
 where.Text:='ARXIV\'+from.Text;
 //+IntToStr(DM.Karta.FieldByName('Nomer_Mis').AsInteger);
  doit;
//Очистити таблицю з поточними даними
DM.Karta.First;
DM.Karta.Edit;
while not DM.Karta.Eof do
begin
DM.Karta.Edit;
DM.Karta.FieldByName('Kod_Pilgu').AsString:='';
DM.Karta.FieldByname('Nazva_Pilgu').AsString:='';
DM.Karta.FieldByname('Rozmir_Pilgu').AsString:='';

DM.Karta.FieldByName('Subsudija').AsFloat:=0;
DM.Karta.FieldByName('Naraxovano').AsFloat:=0;
DM.Karta.FieldByName('Oplacheno').AsFloat:=0;

DM.Karta.FieldByName('Vhidna_Zaborg').AsFloat:=0;
DM.Karta.FieldByName('Voda').AsFloat:=0;
DM.Karta.FieldByName('Opal').AsFloat:=0;
DM.Karta.FieldByName('Kvart').AsFloat:=0;
DM.Karta.FieldByname('Nomer_Kvutan').AsInteger:=0;
DM.Karta.FieldByname('Data_Oplatu').AsDateTime:=0;



DM.Karta.FieldByName('Pop_Voda').AsInteger:=DM.Karta.FieldByName('Pot_Voda').AsInteger;
DM.Karta.FieldByName('Pot_Voda').AsInteger:=0;
DM.Karta.Post;
DM.Karta.Next;
end;
DM.Karta.Refresh;


end;


procedure TNastroyku.Button1Click(Sender: TObject);
begin
//Резервна копія
doit;
end;

procedure TNastroyku.SpeedButton1Click(Sender: TObject);
begin
//відкривання файлу
if open1.Execute then from.Text:=open1.FileName
 else
 showmessage('Файл не був відкритий');
end;

procedure TNastroyku.SpeedButton2Click(Sender: TObject);
begin
// зберігання файлу
if save1.Execute then where.Text:=save1.FileName+'.mdb'
   else showmessage('Ви не вибрали місце для зберігання файлу!');
end;

procedure TNastroyku.BitBtn4Click(Sender: TObject);
begin
If Open2.EXECUTE Then
Begin
DM.ADOConnection1.Close;
DM.ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;'
+ 'Data Source='+Open2.FileName+';Persist Security Info=False ';
DM.ADOConnection1.Open;
end;
// активність таблиць
   DM.Karta.Active:=True;
   DM.Adresu.Active:=True;
   DM.Pilgu.Active:=True;
   DM.Firma.Active:=True;
   DM.Tarif.Active:=True;
end;

procedure TNastroyku.BitBtn5Click(Sender: TObject);
begin
// запис пароля і юзера
If DM.Login.Modified Then DM.Login.Post;
end;

procedure TNastroyku.BitBtn6Click(Sender: TObject);
begin
DM.Login.Edit;
DM.Login.Last;
If DM.Login.Modified Then DM.Login.Post;
end;

procedure TNastroyku.BitBtn7Click(Sender: TObject);
begin
// встановлення тарифів
DM.Tarif.Edit;
DM.Tarif.Last;
DM.Tarif.Insert;
DM.Tarif.FieldByName('Tarif_Data').AsDateTime:=DateTimePicker1.Date;
DM.Tarif.FieldByName('Tarif_Voda').AsFloat:=StrToFloat(Edit6.Text);
DM.Tarif.FieldByName('Tarif_KvartPlata').AsFloat:=StrToFloat(Edit7.Text);
DM.Tarif.FieldByName('Tarif_Opal').AsFloat:=StrToFloat(Edit8.Text);
DM.Tarif.FieldByName('Normat_Doc').AsString:=Memo1.Text;
DM.Tarif.Post;
end;

end.
