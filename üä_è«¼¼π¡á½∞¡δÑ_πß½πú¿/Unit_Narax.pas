unit Unit_Narax;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TNarax = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Narax: TNarax;
  Voda,Opal,Kvart,Suma,S:real;
implementation

uses UDM, Unit_Nastr, U_Golovna, Unit_Pilgu;

{$R *.dfm}
procedure TNarax.FormActivate(Sender: TObject);
begin
//Timer1.Enabled:=False;

// Narax.button1.Visible:=false;

Label1.Visible:=true;Label1.Caption:='Виконується розрахунок квартплати...';
Label2.Visible:=False;Label2.Caption:='для '+IntToStr(DM.Karta.RecordCount)+' абонентів';
Narax.ProgressBar1.Position:=0;
Narax.ProgressBar1.Min:=0;
Narax.ProgressBar1.Max:=DM.Karta.RecordCount;

//Timer1.Interval:=1;

end;



procedure TNarax.BitBtn1Click(Sender: TObject);
begin
// нарахування всім абонентам
//Timer1.Enabled:=True;
ProgressBar1.Visible:=true;
Narax.Label2.Visible:=True;
Narax.Label1.Visible:=True;
DM.Tarif.Refresh;
DM.Karta.Refresh;
DM.Karta.First;DM.Karta.Edit;
////////
DM.Karta.DisableControls;
while not DM.Karta.Eof do begin
Voda:=(DM.Karta.FieldByName('Pot_Voda').AsInteger-DM.Karta.FieldByName('Pop_Voda').AsInteger)*StrToFloat(Golovna.DBEdit14.Text);
//(DM.Tarif.FieldByName('tarif.Voda').Asfloat);
Opal:=(Dm.Karta.FieldByname('Plosha_kvart').AsFloat)*StrToFloat(Golovna.DBEdit15.Text);
//(DM.Tarif.FieldByName('tarif.Kvartplata').Asfloat);
Kvart:=(Dm.Karta.FieldByname('Plosha_kvart').AsFloat)*StrToFloat(Golovna.DBEdit16.Text);
//(DM.Tarif.FieldByName('tarif.Opal').Asfloat);
Suma:=Voda+Opal+Kvart;
if  DM.Karta.FieldByName('Kod_Pilgu').AsString<>'10' then
begin
DM.Karta.Edit;
if DM.Karta.FieldByName('Vud_Opal').AsBoolean=true then
Opal:=Opal-Opal*DM.Karta.FieldByName('Rozmir_Pilgu').AsFloat/100 else Opal:=0;
Voda:=Voda-Voda*DM.Karta.FieldByName('Rozmir_Pilgu').AsFloat/100;
Kvart:=Kvart-Kvart*DM.Karta.FieldByName('Rozmir_Pilgu').AsFloat/100;
DM.Karta.FieldByName('Voda').AsFloat:= Voda;
DM.Karta.FieldByName('Opal').AsFloat:= Opal;
DM.Karta.FieldByName('Kvart').AsFloat:=Kvart;
Suma:=Voda+Opal+Kvart;
DM.Karta.FieldByName('Naraxovano').AsFloat:=Suma;
end
else  begin
DM.Karta.Edit;
if DM.Karta.FieldByName('Vud_Opal').AsBoolean=true then
Opal:=Opal-Opal*DM.Karta.FieldByName('Rozmir_Pilgu').AsFloat/100 else Opal:=0;
Suma:=Suma;
DM.Karta.FieldByName('Voda').AsFloat:=Voda;
DM.Karta.FieldByName('Opal').AsFloat:=Opal;
DM.Karta.FieldByName('Kvart').AsFloat:=Kvart;
DM.Karta.FieldByName('Naraxovano').AsFloat:=Suma;
end;
DM.Karta.Post;
DM.Karta.Next;
///

With Narax.ProgressBar1 do
Begin
Position:=Position+1;
if Position=Max Then Narax.Label1.Caption:='Розрахунок завершено!'else   Narax.Label1.Caption:='Виконується розрахунок квартплати.' ;

end;
///

end; //while

S:=0;DM.Karta.First;
while not DM.Karta.Eof do begin
S:=S+DM.Karta.FieldByName('Naraxovano').AsFloat;
DM.Karta.Next;
end;
DM.Karta.First;
Golovna.Label16.Caption:='Всього нараховано:'+FloatToStr(S)+' грн.';
Golovna.Label16.Visible:=True;
DM.Karta.EnableControls;
end;

procedure TNarax.BitBtn3Click(Sender: TObject);
begin
Close;
end;

procedure TNarax.Timer1Timer(Sender: TObject);
begin
{Label1.Visible:=True;
With Narax.ProgressBar1 do
Begin
Position:=Position+1;
if Position=Max Then Narax.Label1.Caption:='Розрахунок завершено!';
end;  }
end;


procedure TNarax.BitBtn2Click(Sender: TObject);
begin
// нарахування для одного абонента

Timer1.Enabled:=True;Narax.Label2.Visible:=True;
DM.Karta.Refresh;
DM.Karta.Edit;
// цикл був
Voda:=(DM.Karta.FieldByName('Pot_Voda').AsInteger-DM.Karta.FieldByName('Pop_Voda').AsInteger)*StrToFloat(Golovna.DBEdit14.Text);
Opal:=(Dm.Karta.FieldByname('Plosha_kvart').AsFloat)*StrToFloat(Golovna.DBEdit15.Text);
Kvart:=(Dm.Karta.FieldByname('Plosha_kvart').AsFloat)* StrToFloat(Golovna.DBEdit16.Text);
Suma:=Voda+Opal+Kvart;
if  DM.Karta.FieldByName('Kod_Pilgu').AsString<>'10' then
begin
DM.Karta.Edit;
if DM.Karta.FieldByName('Vud_Opal').AsBoolean=true then
Opal:=Opal-Opal*DM.Karta.FieldByName('Rozmir_Pilgu').AsFloat/100 else Opal:=0;
Voda:=Voda-Voda*DM.Karta.FieldByName('Rozmir_Pilgu').AsFloat/100;
Kvart:=Kvart-Kvart*DM.Karta.FieldByName('Rozmir_Pilgu').AsFloat/100;
DM.Karta.FieldByName('Voda').AsFloat:= Voda;
DM.Karta.FieldByName('Opal').AsFloat:= Opal;
DM.Karta.FieldByName('Kvart').AsFloat:=Kvart;
Suma:=Voda+Opal+Kvart;
DM.Karta.FieldByName('Naraxovano').AsFloat:=Suma;
end
else  begin
DM.Karta.Edit;
if DM.Karta.FieldByName('Vud_Opal').AsBoolean=true then
Opal:=Opal-Opal*DM.Karta.FieldByName('Rozmir_Pilgu').AsFloat/100 else Opal:=0;
Suma:=Suma;
DM.Karta.FieldByName('Voda').AsFloat:=Voda;
DM.Karta.FieldByName('Opal').AsFloat:=Opal;
DM.Karta.FieldByName('Kvart').AsFloat:=Kvart;
DM.Karta.FieldByName('Naraxovano').AsFloat:=Suma;
end;
DM.Karta.Post;
DM.Karta.Next;
//while

S:=0;DM.Karta.First;
while not DM.Karta.Eof do begin
S:=S+DM.Karta.FieldByName('Naraxovano').AsFloat;
DM.Karta.Next;
end;
DM.Karta.First;
Golovna.Label16.Caption:='Всього нараховано:'+FloatToStr(S)+' грн.';
Golovna.Label16.Visible:=True;

end;

end.
