unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls,  cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc,
  cxLookAndFeelPainters, cxButtons, RzButton, RzLabel, RzGroupBar, ImgList,
  RzPanel, RzBmpBtn, RXCtrls;

type
  TMenuF = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    Label5: TLabel;
    RzURLLabel1: TRzURLLabel;
    RzGroupBar1: TRzGroupBar;
    RzGroup1: TRzGroup;
    MyStyles: TImageList;
    RxLabel1: TRxLabel;
    procedure RzGroup1Items0Click(Sender: TObject);
    procedure RzGroup1Items1Click(Sender: TObject);
    procedure RzGroup1Items2Click(Sender: TObject);
    procedure RzGroup1Items3Click(Sender: TObject);
    procedure RzGroup1Items4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MenuF: TMenuF;

implementation

uses U_Golovna, Unit_Nastr, Unit_Kartka, Unit_Pereraxunok, Unit_Abonent,
  UDM;

{$R *.dfm}

procedure TMenuF.RzGroup1Items0Click(Sender: TObject);
begin
 Nastroyku.ShowModal;
end;

procedure TMenuF.RzGroup1Items1Click(Sender: TObject);
begin
Abonent.ShowModal;
end;

procedure TMenuF.RzGroup1Items2Click(Sender: TObject);
begin
DM.Karta.Refresh;
Golovna.ShowModal;

end;

procedure TMenuF.RzGroup1Items3Click(Sender: TObject);
begin

Pereraxunok.ShowModal;
end;

procedure TMenuF.RzGroup1Items4Click(Sender: TObject);
begin
Close;
// Вихід з програми, підтвердження
//CanClose := MessageBox(Handle,Pchar('Вихід з програми ?'),Pchar('Підтвердження'),MB_ICONINFORMATION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK;
Application.Terminate;
end;

end.
