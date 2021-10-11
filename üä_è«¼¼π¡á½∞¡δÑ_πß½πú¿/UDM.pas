unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB, Controls, StdCtrls, Mask, Buttons;

type
  TDM = class(TDataModule)
    Label1: TLabel;
    ADOConnection1: TADOConnection;
    Karta: TADOTable;
    DataSource1: TDataSource;
    Login: TADOTable;
    DataSource2: TDataSource;
    LoginID: TAutoIncField;
    LoginDSDesigner: TWideStringField;
    LoginDSDesigner2: TWideStringField;
    LoginDSDesigner3: TWideStringField;
    LoginDSDesigner4: TWideStringField;
    LoginDSDesigner5: TWideStringField;
    Adresu: TADOTable;
    DataSource3: TDataSource;
    Pilgu: TADOTable;
    DataSource4: TDataSource;
    PilguID: TAutoIncField;
    PilguKod_Pilgu: TWideStringField;
    PilguNazva_Pilgu: TWideStringField;
    PilguSuma: TBCDField;
    PilguNomer_Vidom: TIntegerField;
    BitBtn1: TBitBtn;
    AdresuID: TAutoIncField;
    AdresuAdresa: TWideStringField;
    KartaBitBtn: TBitBtn;
    Firma: TADOTable;
    DataSource5: TDataSource;
    FirmaID: TAutoIncField;
    FirmaNazva_org: TWideStringField;
    FirmaAdresa_org: TWideStringField;
    FirmaPrizv_gol: TWideStringField;
    FirmaPrizv_Bux: TWideStringField;
    FirmaTelefon: TWideStringField;
    FirmaRoz_Rax: TWideStringField;
    FirmaNazva_Banku: TWideStringField;
    FirmaMisto_Ban: TWideStringField;
    FirmaKod_Ban: TWideStringField;
    FirmaKod_Edrpu: TWideStringField;
    Tarif: TADOTable;
    DataSource6: TDataSource;
    TarifID: TAutoIncField;
    TarifTarif_Data: TDateTimeField;
    TarifTarif_Voda: TBCDField;
    TarifTarif_Kvartplata: TBCDField;
    TarifTarif_Opal: TBCDField;
    TarifNormat_Doc: TMemoField;
    KartaID: TAutoIncField;
    KartaMis: TWideStringField;
    KartaNomer_mis: TWordField;
    KartaOsob_Nomer: TWideStringField;
    KartaPrizv: TWideStringField;
    KartaName: TWideStringField;
    KartaPo_Bat: TWideStringField;
    KartaAdresa: TWideStringField;
    KartaNomer_kvart: TWordField;
    KartaPlosha_kvart: TIntegerField;
    KartaKilkist_Gul: TWordField;
    KartaPrivat: TBooleanField;
    KartaVud_Opal: TBooleanField;
    KartaKod_Pilgu: TWideStringField;
    KartaNazva_Pilgu: TWideStringField;
    KartaRozmir_Pilgu: TIntegerField;
    KartaSubsudija: TBCDField;
    KartaData_SubSud: TDateTimeField;
    KartaOstacha_Sub: TBCDField;
    KartaVhidna_Zaborg: TBCDField;
    KartaVoda: TBCDField;
    KartaOpal: TBCDField;
    KartaKvart: TBCDField;
    KartaNaraxovano: TBCDField;
    KartaOplacheno: TBCDField;
    KartaData_Oplatu: TDateTimeField;
    KartaNomer_Kvutan: TIntegerField;
    KartaNomer_Adres: TIntegerField;
    KartaPop_voda: TIntegerField;
    KartaPot_voda: TIntegerField;
    KartaOstatok_Zaborg: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses U_Golovna, Unit_Kartka;


{$R *.dfm}

end.
