unit uPhoton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.ExtDlgs, SynPdf, jpeg, ShellAPI, Vcl.ComCtrls, System.Win.TaskbarCore,
  Vcl.Taskbar, System.ImageList, Vcl.ImgList, VCLTee.TeCanvas, VCLTee.TeePenDlg,
  VCLTee.TeeFilters, VCLTee.TeeFiltersEditor, Vcl.Imaging.pngimage, Vcl.ToolWin,
  Vcl.StdActns, Vcl.ActnList, System.Actions, Vcl.Buttons, PngSpeedButton,
  IniFiles, Vcl.ExtActns, Vcl.Touch.GestureMgr, Vcl.WinXCtrls;

type
  TfrmPrincipal = class(TForm)
    OpenPictureDialog1: TOpenPictureDialog;
    MainMenu1: TMainMenu;
    A1: TMenuItem;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Processar1: TMenuItem;
    MetodoTermico1: TMenuItem;
    Metodofotografico1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    SaveDialog1: TSaveDialog;
    FilterEditor1: TMenuItem;
    N2: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    StatusBar1: TStatusBar;
    ScrollBox2: TScrollBox;
    ImageFiltered1: TImageFiltered;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    GroupBox1: TGroupBox;
    edtLinha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtColuna: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Image2: TImage;
    Edit5: TEdit;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    ActionList1: TActionList;
    ImageList1: TImageList;
    FileOpen1: TFileOpen;
    EditCut1: TEditCut;
    SearchFind1: TSearchFind;
    EditCopy1: TEditCopy;
    ToolBar1: TToolBar;
    tbAbrir: TToolButton;
    ToolButton8: TToolButton;
    tbRecortar: TToolButton;
    tbInverter: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    edtBase: TEdit;
    edtEspacoV: TEdit;
    edtEspacoH: TEdit;
    edtEsquerda: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button5: TButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    tbConfig: TToolButton;
    tbSuporte: TToolButton;
    edtConfig: TEdit;
    GestureManager1: TGestureManager;
    PreviousTab1: TPreviousTab;
    NextTab1: TNextTab;
    Action1: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ButtonPen2Click(Sender: TObject);
    procedure ImageFiltered1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FilterEditor1Click(Sender: TObject);
    procedure edtLinhaChange(Sender: TObject);
    procedure edtColunaChange(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tbRecortarClick(Sender: TObject);
    procedure tbInverterClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure tbAbrirClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure tbConfigClick(Sender: TObject);
    procedure tbSuporteClick(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure buscar_borda(img: TImage);
  end;

var
  frmPrincipal: TfrmPrincipal;
  //Bitmap: TBitmap;
  borda: TRect;
  cont: Integer;
  //MyRect, MyOther: TRect;


implementation
uses uSobre;

{$R *.dfm}
procedure TfrmPrincipal.buscar_borda(img: TImage);
var
  i, mx, my: Integer;
begin
  mx := Trunc(img.Width / 2);
  my := Trunc(img.Height / 2);
  frmPrincipal.Caption := 'Photon by Eletron [ mx:'+ IntToStr(mx) +'- my:'+ IntToStr(my)+']';
  for i := 0 to img.Width do
  begin
    if img.Canvas.Pixels[i, my]=clWhite then
    begin
      borda.Left:=i;
      Break;
    end;
  end;

  for i:=0 to img.Height do
  begin
    if img.Canvas.Pixels[mx, i]=clWhite then
    begin
      borda.Top:=i;
      Break;
    end;
  end;

  for i:=img.Height downto 0 do
  begin
    if img.Canvas.Pixels[mx, i]=clWhite then
    begin
      borda.Bottom:=i;
      Break;
    end;
  end;

  for i := img.Width downto 0 do
  begin
    if img.Canvas.Pixels[i, my]=clWhite then
    begin
      borda.Right:=i;
      Break;
    end;
  end;
  //MyRect := Rect(l,t,r,b);
  //MyOther := Rect(l-l,t-t,r-l,b-t);
  //Bitmap := TBitmap.Create;
  //Bitmap.Canvas.Brush:=img.Canvas.Brush;
  //Bitmap:=img.Picture.Bitmap; //.LoadFromFile();
  //Form1.image1.Canvas.BrushCopy(MyRect, Bitmap, MyRect, clBlack);
  //Form1.image1.Canvas.BrushCopy(MyOther, Bitmap, MyRect, clBlack);
  //Bitmap.Free;
end;

procedure TfrmPrincipal.Abrir1Click(Sender: TObject);
begin
  { Execute an open picture dialog. }
  if OpenPictureDialog1.Execute then { First check if the file exists. }
  if FileExists(OpenPictureDialog1.FileName) then
  begin { If it exists, load the data into the image component. }
    ImageFiltered1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    ImageFiltered1.AutoSize := True;
    PageControl1.TabIndex := 0;
  end
  else { Otherwise raise an exception. }
    raise Exception.Create('Arquivo n?o existente.');
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  buscar_borda(ImageFiltered1);
  ShowMessage('Esq.: ' + IntToStr(borda.Left) + ' Sup.: '
              +IntToStr(borda.Top) + ' Dir.: ' + IntToStr(borda.Right)
              + ' Inf.: '+ IntToStr(borda.Bottom) );
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  with ImageFiltered1.Canvas do
  begin
    Brush.Color:=clRed;
    Pen.Color:=clRed;
    MoveTo(0, 0);
    LineTo(ClientWidth, ClientHeight);
    MoveTo(0, ClientHeight);
    LineTo(ClientWidth, 0);
  end;
  //ImageFiltered1.Filters.Add(TCropFilter);
  //(ImageFiltered1.Filters[3] as TCropFilter).Smooth:=True;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
var
  c:TCropFilter;
begin
  {MyRect := Rect(96,66,1280,766);
  MyOther := Rect(00,00,1184,700);
  Bitmap := TBitmap.Create;
  Bitmap.LoadFromFile('C:\Users\Ademario\PycharmProjects\FinalFantasy\pcb300.bmp');
  Form1.image1.Canvas.BrushCopy(MyOther, Bitmap,MyRect, clBlack);
  //Form1.Canvas.CopyRect(MyOther,Bitmap.Canvas,MyRect);
  Bitmap.Free;}
  buscar_borda(ImageFiltered1);
  c := TCropFilter.Create(nil);
  c.Left := borda.Left;
  c.Top := borda.Top;
  c.Width := borda.Right-borda.Left;
  c.Height := borda.Bottom-borda.Top;
  c.Smooth := True;
  c.Apply(ImageFiltered1.Picture.Bitmap);

  Image1.Width := 850;
  Image1.Height := 600;

  //Image1.Refresh;
  //Image1.Repaint;
  Image1.Picture.Bitmap:=ImageFiltered1.Picture.Bitmap;
  c.Free;
  PageControl1.TabIndex := 1;
  //Image1.Proportional := True;

end;

{procedure TForm1.Button4Click(Sender: TObject);
var
  x,y: Integer;
begin
  //ProgressBar1.BarColor:=clBlue;
  ProgressBar1.Visible:=true;
  ProgressBar1.Max := 700; //700*1184;
  for y := 0 to 700 do
  begin
    for x := 0 to 1184 do
    begin
      if ImageFiltered1.Canvas.Pixels[x,y]=clWhite then
      begin
        ImageFiltered1.Canvas.Pixels[x,y]:=clBlack;
      end
      else
      begin
        ImageFiltered1.Canvas.Pixels[x,y]:=clWhite;
      end;
    end;
    ProgressBar1.Position := y; //x*y;
  end;
  ProgressBar1.Visible:=false;
end;}

procedure TfrmPrincipal.Button5Click(Sender: TObject);
var
  lpdf : TPdfDocument;
  lpage : TPdfPage;
  //bitmapimage: TBitmapImage;
  jpegimage : TJPEGImage;
  pdfimage : TPdfImage;
  k, xpos,ypos : Real;
  base, esquerda, linha, coluna : Integer;
begin
  if SaveDialog1.Execute() then
  begin
    lpdf:= TPdfDocument.Create();
    try
      //k -> calibra??o - ajuste para dimens?o real da pcb
      k:=StrToFloat(edtConfig.Text); // 0.239271255; <OBS: no convers?o usa virgula em vez de ponto>
      lpdf.DefaultPaperSize:=psA4;
      lpdf.DefaultPageLandscape:=CheckBox1.Checked;
      lpage:=lpdf.AddPage;
      jpegimage:=TJPEGImage.Create;
      jpegimage.Assign(ImageFiltered1.Picture.Graphic);

      pdfimage:=TPdfImage.Create(lPDF,jpegimage,true);
      lPDF.Canvas.Doc.AddXObject('Image1',pdfimage);

      esquerda := StrToInt(edtEsquerda.Text);
      base := StrToInt(edtBase.Text);
      for linha := 0 to StrToInt(edtLinha.Text)-1 do
      begin
        for coluna := 0 to StrToInt(edtColuna.Text)-1 do
        begin
          xpos := esquerda*(coluna+1) + coluna*jpegimage.Width*k;
          ypos := base*(linha+1) + linha*jpegimage.Height*k;
          lPDF.Canvas.DrawXObject(xpos, ypos, jpegimage.Width*k,jpegimage.Height*k,'Image1');
        end;
      end;
      lPDF.SaveToFile(SaveDialog1.FileName+'.pdf');
      ShellExecute(Handle,'open',PChar(SaveDialog1.FileName+'.pdf'),nil, nil,SW_SHOWNORMAL);
      Edit1.Text:=lpage.PageWidth.ToString +':'+jpegimage.Width.ToString;
      Edit2.Text:=lpage.PageHeight.ToString +':'+jpegimage.Height.ToString;;
    finally
      lpdf.Free;
    end;
  end;
end;

procedure TfrmPrincipal.ButtonPen2Click(Sender: TObject);
var i : TInvertFilter;
begin
  i:=TInvertFilter.Create(nil);
  i.Apply(ImageFiltered1.Picture.Bitmap);
  ImageFiltered1.Picture.Bitmap:=ImageFiltered1.Picture.Bitmap;
  i.Free;
end;

{begin
  ImageFiltered1.Filters[0].Apply(ImageFiltered1.Picture.Bitmap);
  ImageFiltered1.Picture.Graphic:=ImageFiltered1.Filtered;
  ImageFiltered1.Proportional:=true;
  ImageFiltered1.Proportional:=true;
  //ImageFiltered1.Transparent:=true;
end;}

procedure TfrmPrincipal.CheckBox2Click(Sender: TObject);
begin
  //ImageFiltered1.Filters.Item[0]=100;
    ImageFiltered1.Filters[0].Enabled:=CheckBox1.Checked;
    //ImageFiltered1.Filters[0].Region.Left:=100;
    //ImageFiltered1.Filters[0].Region.Top:=100;
    //ImageFiltered1.Filters[0].Region.Width:=100;
    //ImageFiltered1.Filters[0].Region.Height:=100;
    //Image1.Picture.Graphic:=ImageFiltered1.Filtered;
    ImageFiltered1.Invalidate;
    ImageFiltered1.Repaint;
    ImageFiltered1.Refresh;

end;

procedure TfrmPrincipal.edtLinhaChange(Sender: TObject);
begin
  if edtLinha.Text <> '' then
    Edit5.Text :=IntToStr(StrToInt(edtLinha.Text) * StrToInt(edtColuna.Text));
end;

procedure TfrmPrincipal.edtColunaChange(Sender: TObject);
begin
  if edtColuna.Text <> '' then
    Edit5.Text :=IntToStr(StrToInt(edtLinha.Text) * StrToInt(edtColuna.Text));
end;

procedure TfrmPrincipal.FilterEditor1Click(Sender: TObject);
begin
  if ShowFiltersEditor(Self, ImageFiltered1.Picture.Graphic,
                       ImageFiltered1.Filters) then
  begin
    ImageFiltered1.Invalidate;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  ArquivoINI: TIniFile;
  Mensagem : string;
begin
//  ImageFiltered1.Canvas.Refresh;
//  lbLargura.Caption:='Largura: ' + IntToStr(ImageFiltered1.Width);
//  lbAltura.Caption:='Altura: ' + IntToStr(ImageFiltered1.Height);
//  ImageFiltered1.Filters[0].Enabled:=CheckBox1.Checked;
//  ImageFiltered1.Filters[0].Region.Left:=0;
//  ImageFiltered1.Filters[0].Region.Top:=0;
//  ImageFiltered1.Filters[0].Region.Width:=0;
//  ImageFiltered1.Filters[0].Region.Height:=0;
//  ImageFiltered1.Repaint;
//  ImageFiltered1.Refresh;
//  ImageFiltered1.Filtered;
  PageControl1.TabIndex := 0;
  cont := 0;
  ArquivoINI := TIniFile.Create(ExtractFilePath(ParamStr(0))+'photon.ini');
  Mensagem := ArquivoINI.ReadString('PHOTON', 'VAR_AJUSTE_K', 'Erro ao ler o valor');
  edtConfig.Text := Mensagem;
  ArquivoINI.Free;

end;

procedure TfrmPrincipal.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var
    l, a : string;
begin
  StatusBar1.Panels.Items[0].Width:=200;
  l := Image1.Width.ToString;
  a := Image1.Height.ToString;
  StatusBar1.Panels.Items[0].Text:=' Dimens?o da imagem ['+ l +'X'+ a+']';
  l := x.ToString;
  a := y.ToString;
  StatusBar1.Panels.Items[1].Text:='('+ l +','+ a+')';
end;

procedure TfrmPrincipal.ImageFiltered1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var
    l, a : string;
begin
  StatusBar1.Panels.Items[0].Width:=200;
  l := ImageFiltered1.Width.ToString;
  a := ImageFiltered1.Height.ToString;
  StatusBar1.Panels.Items[0].Text:=' Dimens?o da imagem ['+ l +'X'+ a+']';
  l := x.ToString;
  a := y.ToString;
  StatusBar1.Panels.Items[1].Text:='('+ l +','+ a+')';
end;


procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close();
end;

procedure TfrmPrincipal.Sobre1Click(Sender: TObject);
begin
  if not Assigned(frmSobre) then
  begin
    frmSobre := TfrmSobre.Create(self);
  end;
  try
    frmSobre.ShowModal;
  finally
    FreeAndNil(frmSobre); // libera mem?ria
  end;
end;

procedure TfrmPrincipal.tbAbrirClick(Sender: TObject);
begin
  Abrir1.Click();
end;

procedure TfrmPrincipal.tbRecortarClick(Sender: TObject);
var
  c:TCropFilter;
begin
  {MyRect := Rect(96,66,1280,766);
  MyOther := Rect(00,00,1184,700);
  Bitmap := TBitmap.Create;
  Bitmap.LoadFromFile('C:\Users\Ademario\PycharmProjects\FinalFantasy\pcb300.bmp');
  Form1.image1.Canvas.BrushCopy(MyOther, Bitmap,MyRect, clBlack);
  //Form1.Canvas.CopyRect(MyOther,Bitmap.Canvas,MyRect);
  Bitmap.Free;}
  buscar_borda(ImageFiltered1);
  c := TCropFilter.Create(nil);
  c.Left := borda.Left;
  c.Top := borda.Top;
  c.Width := borda.Right-borda.Left;
  c.Height := borda.Bottom-borda.Top;
  //c.Smooth := True;
  c.Apply(ImageFiltered1.Picture.Bitmap);

  Image1.Width := 850;
  Image1.Height := 600;

  //Image1.Refresh;
  //Image1.Repaint;
  tbInverter.Click;
  Image1.Picture.Bitmap:=ImageFiltered1.Picture.Bitmap;
  c.Free;
  PageControl1.TabIndex := 1;
  edtEsquerda.SetFocus();
  //Image1.Proportional := True;
end;

procedure TfrmPrincipal.ToolButton1Click(Sender: TObject);
var i : TReverseFilter;
begin
  i:=TReverseFilter.Create(nil);
  i.Apply(Image1.Picture.Bitmap);
  //ImageFiltered1.Picture.Bitmap:=ImageFiltered1.Picture.Bitmap;
  Image1.Picture.Bitmap:=Image1.Picture.Bitmap;
  i.Free;
end;

procedure TfrmPrincipal.ToolButton3Click(Sender: TObject);
begin
  buscar_borda(ImageFiltered1);
  ShowMessage('Esq.: ' + IntToStr(borda.Left) + ' Sup.: '
              +IntToStr(borda.Top) + ' Dir.: ' + IntToStr(borda.Right)
              + ' Inf.: '+ IntToStr(borda.Bottom) );
end;

procedure TfrmPrincipal.ToolButton5Click(Sender: TObject);
begin
  Close();
end;

procedure TfrmPrincipal.tbInverterClick(Sender: TObject);
var i : TInvertFilter;
begin
  i:=TInvertFilter.Create(nil);
  i.Apply(ImageFiltered1.Picture.Bitmap);
  ImageFiltered1.Picture.Bitmap:=ImageFiltered1.Picture.Bitmap;
  Image1.Picture.Bitmap:=ImageFiltered1.Picture.Bitmap;
  i.Free;
end;

procedure TfrmPrincipal.ToolButton6Click(Sender: TObject);
begin
  with ImageFiltered1.Canvas do
  begin
    Brush.Color:=clRed;
    Pen.Color:=clRed;
    MoveTo(0, 0);
    LineTo(ClientWidth, ClientHeight);
    MoveTo(0, ClientHeight);
    LineTo(ClientWidth, 0);
  end;
  //ImageFiltered1.Filters.Add(TCropFilter);
  //(ImageFiltered1.Filters[3] as TCropFilter).Smooth:=True;
end;

procedure TfrmPrincipal.tbSuporteClick(Sender: TObject);
var ArquivoINI: TIniFile;
begin
  tbConfig.Enabled := not tbConfig.Enabled;
  cont := 0;
  if edtConfig.Visible then
  begin
    // ExtractFilePath(ParamStr(0))-->> diret?rio do execut?vel do projeto
    ArquivoINI := TIniFile.Create(ExtractFilePath(ParamStr(0))+'photon.ini');
    ArquivoINI.WriteString('PHOTON','VAR_AJUSTE_K',edtConfig.Text);
    ArquivoINI.Free;
    edtConfig.Visible := False;
  end;
end;

procedure TfrmPrincipal.tbConfigClick(Sender: TObject);
begin
  cont := cont + 1;

  if cont=10 then
  begin
    edtConfig.Visible := True;
  end;
end;

{procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  ImageFiltered1.Left := ScrollBar1.Position;
end;}

end.
