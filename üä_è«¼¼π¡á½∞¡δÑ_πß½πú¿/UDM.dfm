object DM: TDM
  OldCreateOrder = False
  Left = 450
  Top = 68
  Height = 607
  Width = 234
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 139
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1103' '#1090#1072#1088#1080#1092#1091
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Baza.mdb;Persist Se' +
      'curity Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 32
  end
  object Karta: TADOTable
    Connection = ADOConnection1
    TableName = 'Oblikova_karta'
    Left = 48
    Top = 176
    object KartaID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object KartaMis: TWideStringField
      FieldName = 'Mis'
      Size = 15
    end
    object KartaNomer_mis: TWordField
      FieldName = 'Nomer_mis'
    end
    object KartaOsob_Nomer: TWideStringField
      FieldName = 'Osob_Nomer'
      Size = 4
    end
    object KartaPrizv: TWideStringField
      FieldName = 'Prizv'
    end
    object KartaName: TWideStringField
      FieldName = 'Name'
    end
    object KartaPo_Bat: TWideStringField
      FieldName = 'Po_Bat'
    end
    object KartaAdresa: TWideStringField
      FieldName = 'Adresa'
      Size = 25
    end
    object KartaNomer_kvart: TWordField
      FieldName = 'Nomer_kvart'
    end
    object KartaPlosha_kvart: TIntegerField
      FieldName = 'Plosha_kvart'
    end
    object KartaKilkist_Gul: TWordField
      FieldName = 'Kilkist_Gul'
    end
    object KartaPrivat: TBooleanField
      FieldName = 'Privat'
    end
    object KartaVud_Opal: TBooleanField
      FieldName = 'Vud_Opal'
    end
    object KartaKod_Pilgu: TWideStringField
      FieldName = 'Kod_Pilgu'
      Size = 50
    end
    object KartaNazva_Pilgu: TWideStringField
      FieldName = 'Nazva_Pilgu'
    end
    object KartaRozmir_Pilgu: TIntegerField
      FieldName = 'Rozmir_Pilgu'
    end
    object KartaSubsudija: TBCDField
      FieldName = 'Subsudija'
      Precision = 19
    end
    object KartaData_SubSud: TDateTimeField
      FieldName = 'Data_SubSud'
    end
    object KartaOstacha_Sub: TBCDField
      FieldName = 'Ostacha_Sub'
      Precision = 19
    end
    object KartaVhidna_Zaborg: TBCDField
      FieldName = 'Vhidna_Zaborg'
      Precision = 19
    end
    object KartaVoda: TBCDField
      FieldName = 'Voda'
      Precision = 19
    end
    object KartaOpal: TBCDField
      FieldName = 'Opal'
      Precision = 19
    end
    object KartaKvart: TBCDField
      FieldName = 'Kvart'
      Precision = 19
    end
    object KartaNaraxovano: TBCDField
      FieldName = 'Naraxovano'
      Precision = 19
    end
    object KartaOplacheno: TBCDField
      FieldName = 'Oplacheno'
      Precision = 19
    end
    object KartaData_Oplatu: TDateTimeField
      FieldName = 'Data_Oplatu'
    end
    object KartaNomer_Kvutan: TIntegerField
      FieldName = 'Nomer_Kvutan'
    end
    object KartaNomer_Adres: TIntegerField
      FieldName = 'Nomer_Adres'
    end
    object KartaPop_voda: TIntegerField
      FieldName = 'Pop_voda'
    end
    object KartaPot_voda: TIntegerField
      FieldName = 'Pot_voda'
    end
    object KartaOstatok_Zaborg: TBCDField
      FieldName = 'Ostatok_Zaborg'
      Precision = 19
    end
  end
  object DataSource1: TDataSource
    DataSet = Karta
    Left = 144
    Top = 176
  end
  object Login: TADOTable
    Connection = ADOConnection1
    TableName = 'Login'
    Left = 48
    Top = 104
    object LoginID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object LoginDSDesigner: TWideStringField
      FieldName = #1055#1088#1110#1079#1074#1080#1097#1077
      Size = 50
    end
    object LoginDSDesigner2: TWideStringField
      FieldName = #1055#1086#1089#1072#1076#1072
      Size = 50
    end
    object LoginDSDesigner3: TWideStringField
      FieldName = #1087#1088#1072#1074#1072
      Size = 50
    end
    object LoginDSDesigner4: TWideStringField
      FieldName = #1051#1086#1075#1110#1085
      Size = 50
    end
    object LoginDSDesigner5: TWideStringField
      FieldName = #1055#1072#1088#1086#1083#1100
      Size = 50
    end
  end
  object DataSource2: TDataSource
    DataSet = Login
    Left = 144
    Top = 104
  end
  object Adresu: TADOTable
    Connection = ADOConnection1
    TableName = 'Adresa'
    Left = 48
    Top = 248
    object AdresuID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object AdresuAdresa: TWideStringField
      FieldName = 'Adresa'
      Size = 25
    end
  end
  object DataSource3: TDataSource
    DataSet = Adresu
    Left = 152
    Top = 248
  end
  object Pilgu: TADOTable
    Connection = ADOConnection1
    TableName = 'Pilgu'
    Left = 48
    Top = 336
    object PilguID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object PilguKod_Pilgu: TWideStringField
      FieldName = 'Kod_Pilgu'
      Size = 5
    end
    object PilguNazva_Pilgu: TWideStringField
      FieldName = 'Nazva_Pilgu'
      Size = 25
    end
    object PilguSuma: TBCDField
      FieldName = 'Suma'
      Precision = 19
    end
    object PilguNomer_Vidom: TIntegerField
      FieldName = 'Nomer_Vidom'
    end
  end
  object DataSource4: TDataSource
    DataSet = Pilgu
    Left = 144
    Top = 328
  end
  object BitBtn1: TBitBtn
    Left = 296
    Top = 216
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
  end
  object KartaBitBtn: TBitBtn
    Left = 296
    Top = 216
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
  end
  object Firma: TADOTable
    Connection = ADOConnection1
    TableName = 'Firma'
    Left = 48
    Top = 400
    object FirmaID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object FirmaNazva_org: TWideStringField
      FieldName = 'Nazva_org'
      Size = 25
    end
    object FirmaAdresa_org: TWideStringField
      FieldName = 'Adresa_org'
      Size = 35
    end
    object FirmaPrizv_gol: TWideStringField
      FieldName = 'Prizv_gol'
    end
    object FirmaPrizv_Bux: TWideStringField
      FieldName = 'Prizv_Bux'
    end
    object FirmaTelefon: TWideStringField
      FieldName = 'Telefon'
      Size = 16
    end
    object FirmaRoz_Rax: TWideStringField
      FieldName = 'Roz_Rax'
      Size = 16
    end
    object FirmaNazva_Banku: TWideStringField
      FieldName = 'Nazva_Banku'
    end
    object FirmaMisto_Ban: TWideStringField
      FieldName = 'Misto_Ban'
      Size = 16
    end
    object FirmaKod_Ban: TWideStringField
      FieldName = 'Kod_Ban'
    end
    object FirmaKod_Edrpu: TWideStringField
      FieldName = 'Kod_Edrpu'
    end
  end
  object DataSource5: TDataSource
    DataSet = Firma
    Left = 144
    Top = 400
  end
  object Tarif: TADOTable
    Connection = ADOConnection1
    TableName = 'Tarif'
    Left = 48
    Top = 480
    object TarifID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object TarifTarif_Data: TDateTimeField
      FieldName = 'Tarif_Data'
    end
    object TarifTarif_Voda: TBCDField
      FieldName = 'Tarif_Voda'
      Precision = 19
    end
    object TarifTarif_Kvartplata: TBCDField
      FieldName = 'Tarif_Kvartplata'
      Precision = 19
    end
    object TarifTarif_Opal: TBCDField
      FieldName = 'Tarif_Opal'
      Precision = 19
    end
    object TarifNormat_Doc: TMemoField
      FieldName = 'Normat_Doc'
      BlobType = ftMemo
    end
  end
  object DataSource6: TDataSource
    DataSet = Tarif
    Left = 144
    Top = 480
  end
end
