unit Unit_Oplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TOplata = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label8: TLabel;
    Edit4: TEdit;
    Label9: TLabel;
    Bevel1: TBevel;
    Label10: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Oplata: TOplata;

implementation

uses UDM;

{$R *.dfm}

procedure TOplata.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TOplata.FormActivate(Sender: TObject);
var nomer_kvut:string[14];
begin
DateTimePicker1.Date:=Date;
Oplata.Label10.Caption:='Прізвище абонента - '+DM.Karta.FieldByName('Prizv').AsString ;
Oplata.Edit4.Text:=FloatTostr(DM.Karta.FieldByName('Naraxovano').AsFloat);
nomer_kvut:=IntToStr(DM.Karta.FieldByName('Nomer_Mis').AsInteger)+DM.Karta.FieldByName('Osob_Nomer').AsString;
Edit2.Text:=nomer_kvut;
end;

procedure TOplata.BitBtn1Click(Sender: TObject);
var Ost_Zaborg:real;
begin
DM.Karta.Edit;
DM.Karta.FieldByName('Nomer_Kvutan').AsString:=Edit2.Text;
DM.Karta.FieldByName('Oplacheno').AsFloat:=StrToFloat(Edit1.Text);
DM.Karta.FieldByName('Subsudija').AsFloat:=StrToFloat(Edit3.Text);
DM.Karta.FieldByName('Data_Oplatu').AsDateTime:=DateTimePicker1.Date;
Ost_Zaborg:=DM.Karta.FieldByName('Oplacheno').AsFloat-DM.Karta.FieldByName('Naraxovano').AsFloat;
DM.Karta.FieldByName('Ostatok_Zaborg').AsFloat:=Ost_Zaborg;
DM.Karta.Post;
Close;
end;

end.
