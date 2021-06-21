unit uPhoton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Panel1: TPanel;
    Button1: TButton;
    lbLargura: TLabel;
    lbAltura: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  l,r,t,b: Integer;
begin
  // Close();
  for l := 0 to Image1.Width do
  begin
    if Image1.Canvas.Pixels[l,200]=clWhite then Break;
  end;

  for t := 0 to Image1.Height do
  begin
    if Image1.Canvas.Pixels[200,t]=clWhite then Break;
  end;

  for b := Image1.Height downto 0 do
  begin
    if Image1.Canvas.Pixels[200,b]=clWhite then Break;
  end;

  for r := Image1.Width downto 0 do
  begin
    if Image1.Canvas.Pixels[r,200]=clWhite then Break;
  end;

  ShowMessage('Esq.: ' + IntToStr(l) + ' Sup.: ' + IntToStr(t) + ' Dir.: ' + IntToStr(r) + ' Inf.: ' + IntToStr(b) );

  Image1.Canvas.Brush.Color:=clGreen;
  Image1.Canvas.Pen.Color:=clGreen;
  Image1.Canvas.MoveTo(100,100);
  Image1.Canvas.LineTo(200,200);


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  lbLargura.Caption:='Largura: ' + IntToStr(Image1.Width);
  lbAltura.Caption:='Altura: ' + IntToStr(Image1.Height);
end;

end.
