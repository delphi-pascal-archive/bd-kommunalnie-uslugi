unit Unit_Pilgu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls, GridsEh,
  DBGridEh;

type
  TPilgu = class(TForm)
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    DBGridEh1: TDBGridEh;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pilgu: TPilgu;

implementation

uses UDM, Unit_Kartka, Unit_Abonent, Flash_Form;

{$R *.dfm}

procedure TPilgu.BitBtn1Click(Sender: TObject);
begin

if vub_pilg=1 then begin
Kartka.Edit8.Text:=DM.Pilgu.FieldByname('Kod_Pilgu').AsString;
Kartka.Edit9.Text:=DM.Pilgu.FieldByname('Nazva_Pilgu').AsString;
Kartka.Edit10.Text:=DM.Pilgu.FieldByname('Suma').AsString;
Pilgu.Close;
end;
{if  vub_pilg=2 then begin

Abonent.Edit8.Text:=DM.Pilgu.FieldByname('Kod_Pilgu').AsString;
Abonent.Edit9.Text:=DM.Pilgu.FieldByname('Nazva_Pilgu').AsString;
Abonent.Edit10.Text:=DM.Pilgu.FieldByname('Suma').AsString;
Pilgu.Close;
end;  }
end;
procedure TPilgu.BitBtn3Click(Sender: TObject);
begin
Close;
end;

end.
