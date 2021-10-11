program Flash;

uses
  Forms,
  Flash_Form in 'Flash_Form.pas' {Flash_f},
  UDM in 'UDM.pas' {DM: TDataModule},
  U_Golovna in 'U_Golovna.pas' {Golovna},
  Menu in 'Menu.pas' {MenuF},
  Unit_Pereraxunok in 'Unit_Pereraxunok.pas' {Pereraxunok},
  Unit_Nastr in 'Unit_Nastr.pas' {Nastroyku},
  Unit_Kartka in 'Unit_Kartka.pas' {Kartka},
  Unit_Pilgu in 'Unit_Pilgu.pas' {Pilgu},
  Unit_Narax in 'Unit_Narax.pas' {Narax},
  Unit_Voda in 'Unit_Voda.pas' {Voda},
  Unit_Abonent in 'Unit_Abonent.pas' {Abonent},
  Unit_Oplata in 'Unit_Oplata.pas' {Oplata};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFlash_f, Flash_f);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TGolovna, Golovna);
  Application.CreateForm(TMenuF, MenuF);
  Application.CreateForm(TPereraxunok, Pereraxunok);
  Application.CreateForm(TNastroyku, Nastroyku);
  Application.CreateForm(TKartka, Kartka);
  Application.CreateForm(TPilgu, Pilgu);
  Application.CreateForm(TNarax, Narax);
  Application.CreateForm(TVoda, Voda);
  Application.CreateForm(TAbonent, Abonent);
  Application.CreateForm(TOplata, Oplata);
  Application.Run;
end.
