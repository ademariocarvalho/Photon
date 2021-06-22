unit uPhoton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.ExtDlgs, SynPdf, jpeg, ShellAPI;

type
  TForm1 = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    MainMenu1: TMainMenu;
    A1: TMenuItem;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Processar1: TMenuItem;
    MetodoTrmico1: TMenuItem;
    Mtodofotogrfico1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    Panel1: TPanel;
    lbLargura: TLabel;
    lbAltura: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    SaveDialog1: TSaveDialog;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Bitmap: TBitmap;
  MyRect, MyOther: TRect;
  l,r,t,b, mx, my: Integer;

implementation

{$R *.dfm}

procedure TForm1.Abrir1Click(Sender: TObject);
begin
    { Execute an open picture dialog. }
  if OpenPictureDialog1.Execute then
    { First check if the file exists. }
    if FileExists(OpenPictureDialog1.FileName) then
      { If it exists, load the data into the image component. }
      Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName)
    else
      { Otherwise raise an exception. }
      raise Exception.Create('Arquivo não existente.');
end;

procedure TForm1.Button1Click(Sender: TObject);
//var
  //MyRect, MyOther: TRect;
  //Bitmap: TBitmap;
begin
  mx := Trunc(Image1.Width / 2);
  my := Trunc(Image1.Height / 2);
  Form1.Caption := 'Photon by Eletron [ mx:'+ IntToStr(mx) +'- my:'+ IntToStr(my)+']';
  for l := 0 to Image1.Width do
  begin
    if Image1.Canvas.Pixels[l, my]=clWhite then Break;
  end;

  for t := 0 to Image1.Height do
  begin
    if Image1.Canvas.Pixels[mx, t]=clWhite then Break;
  end;

  for b := Image1.Height downto 0 do
  begin
    if Image1.Canvas.Pixels[mx, b]=clWhite then Break;
  end;

  for r := Image1.Width downto 0 do
  begin
    if Image1.Canvas.Pixels[r, my]=clWhite then Break;
  end;

  //ShowMessage('Esq.: ' + IntToStr(l) + ' Sup.: ' + IntToStr(t) + ' Dir.: ' + IntToStr(r) + ' Inf.: ' + IntToStr(b) );

  MyRect := Rect(l,t,r,b);
  MyOther := Rect(l-l,t-t,r-l,b-t);
  Bitmap := TBitmap.Create;
  Bitmap.LoadFromFile(OpenPictureDialog1.FileName);
  //Form1.image1.Canvas.BrushCopy(MyRect, Bitmap, MyRect, clBlack);
  Form1.image1.Canvas.BrushCopy(MyOther, Bitmap, MyRect, clBlack);
  Bitmap.Free;
  //Image1.Canvas.Brush.Color:=clWindow;
  //Image1.Canvas.Pen.Color:=clGreen;
  //Image1.Canvas.Pen.Width:=20;
  //Image1.Canvas.MoveTo(100,100);
  //Image1.Canvas.LineTo(200,200);
  //Image1.Canvas.Rectangle(200,200,500,350);


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  with Image1.Canvas do
  begin
    Brush.Color:=clRed;
    Pen.Color:=clRed;
    MoveTo(0, 0);
    LineTo(ClientWidth, ClientHeight);
    MoveTo(0, ClientHeight);
    LineTo(ClientWidth, 0);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  MyRect := Rect(96,66,1280,766);
  MyOther := Rect(00,00,1184,700);
  Bitmap := TBitmap.Create;
  Bitmap.LoadFromFile('C:\Users\Ademario\PycharmProjects\FinalFantasy\pcb300.bmp');
  Form1.image1.Canvas.BrushCopy(MyOther, Bitmap,MyRect, clBlack);
  Form1.Canvas.CopyRect(MyOther,Bitmap.Canvas,MyRect);
  Bitmap.Free;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  x,y: Integer;
begin
  for y := 0 to 766-66 do
  begin
    for x := 0 to 1280-96 do
    begin
      if Image1.Canvas.Pixels[x,y]=clWhite then
      begin
        Image1.Canvas.Pixels[x,y]:=clBlack;
      end
      else
      begin
        Image1.Canvas.Pixels[x,y]:=clWhite;
      end;
    end;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  lpdf: TPdfDocument;
  lpage: TPdfPage;
  //bitmapimage: TBitmapImage;
  bitmapimage: TJPEGImage;
  pdfimage: TPdfImage;
begin
  if SaveDialog1.Execute() then
  begin
    lpdf:= TPdfDocument.Create();
    try
      lpdf.DefaultPaperSize:=psA4;
      lpdf.DefaultPageLandscape:=CheckBox1.Checked;
      lpage:=lpdf.AddPage;
      bitmapimage:=TJPEGImage.Create;
      bitmapimage.Assign(Image1.Picture.Graphic);
      pdfimage:=TPdfImage.Create(lPDF,bitmapimage,true);
      lPDF.AddXObject('Image1',pdfimage);
      lPDF.Canvas.DrawXObject(0,lPage.PageHeight-bitmapimage.Height,bitmapimage.Width,bitmapimage.Height,'Image1');
      lPDF.SaveToFile(SaveDialog1.FileName+'.pdf');
      ShellExecute(Handle,'open',PChar(SaveDialog1.FileName+'.pdf'),nil, nil,SW_SHOWNORMAL);
    finally
      lpdf.Free;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Refresh;
  lbLargura.Caption:='Largura: ' + IntToStr(Image1.Width);
  lbAltura.Caption:='Altura: ' + IntToStr(Image1.Height);
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
  Close();
end;

end.