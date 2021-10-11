unit Unit_Pereraxunok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask,  ExtCtrls,DBCtrls,Buttons, XPMan, ComCtrls,
  Grids, DBGrids;

type
  TPereraxunok = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    XPManifest1: TXPManifest;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    Open2: TOpenDialog;
    Open1: TOpenDialog;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pereraxunok: TPereraxunok;

implementation

uses UDM, U_Golovna, Menu;

{$R *.dfm}

procedure TPereraxunok.BitBtn4Click(Sender: TObject);
begin
If Open1.EXECUTE Then
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


Close;
end;

procedure TPereraxunok.BitBtn1Click(Sender: TObject);
begin
//


end;

procedure TPereraxunok.BitBtn2Click(Sender: TObject);
begin
///
end;

procedure TPereraxunok.BitBtn3Click(Sender: TObject);
begin
  //DM.Posluga.Delete;

end;

end.
