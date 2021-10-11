unit Unit_Voda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TVoda = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Voda: TVoda;

implementation

uses UDM, Unit_Kartka, Flash_Form;

{$R *.dfm}

procedure TVoda.BitBtn1Click(Sender: TObject);
begin
if vub_vodu=1 then begin
Kartka.Edit11.Text:=Voda.Edit1.Text;
Kartka.Edit12.Text:=Voda.Edit2.Text;
end;
if vub_vodu=2 then
begin
DM.Karta.Edit;
DM.Karta.FieldByName('Pop_Voda').AsInteger:=StrToInt(Edit1.Text);
DM.Karta.FieldByName('Pot_Voda').AsInteger:=StrToInt(Edit2.Text);
DM.Karta.Post;
DM.Karta.Refresh;
end;
Close;
end;

procedure TVoda.BitBtn2Click(Sender: TObject);
begin
Close;
end;

end.
