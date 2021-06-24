object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Photon by Eletron'
  ClientHeight = 338
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 25
    Top = 41
    Width = 664
    Height = 278
    HorzScrollBar.Visible = False
    Align = alClient
    Color = clMenuHighlight
    ParentColor = False
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitWidth = 954
    ExplicitHeight = 680
    object Image1: TImage
      Left = 2
      Top = 2
      Width = 358
      Height = 212
      Cursor = crCross
      AutoSize = True
      OnMouseMove = Image1MouseMove
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 689
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 954
    object lbLargura: TLabel
      Left = 280
      Top = 14
      Width = 45
      Height = 13
      Caption = 'lbLargura'
    end
    object lbAltura: TLabel
      Left = 352
      Top = 14
      Width = 37
      Height = 13
      Caption = 'lbAltura'
    end
    object Button1: TButton
      Left = 16
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Buscar Pixel'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 97
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Canvas'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 178
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Copy'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 395
      Top = 10
      Width = 54
      Height = 25
      Caption = 'Invert'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 455
      Top = 10
      Width = 53
      Height = 25
      Caption = 'pdf'
      TabOrder = 4
      OnClick = Button5Click
    end
    object CheckBox1: TCheckBox
      Left = 525
      Top = 12
      Width = 97
      Height = 17
      Caption = 'Paisagem'
      TabOrder = 5
    end
    object Edit1: TEdit
      Left = 608
      Top = 14
      Width = 49
      Height = 21
      TabOrder = 6
      Text = '0'
    end
    object Edit2: TEdit
      Left = 663
      Top = 14
      Width = 49
      Height = 21
      TabOrder = 7
      Text = '0'
    end
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 41
    Width = 25
    Height = 278
    Align = alLeft
    Orientation = pbVertical
    Position = 80
    BarColor = clBlue
    BackgroundColor = clHighlight
    TabOrder = 2
    Visible = False
    ExplicitLeft = -4
    ExplicitTop = 40
    ExplicitHeight = 680
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 319
    Width = 689
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 50
      end>
    ExplicitLeft = -3
    ExplicitTop = 274
    ExplicitWidth = 660
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 608
    Top = 65
  end
  object MainMenu1: TMainMenu
    Left = 696
    Top = 65
    object A1: TMenuItem
      Caption = 'Arquivo'
      object Abrir1: TMenuItem
        Caption = '&Abrir'
        OnClick = Abrir1Click
      end
      object Salvar1: TMenuItem
        Caption = '&Salvar'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Processar1: TMenuItem
      Caption = 'Processar'
      object MetodoTrmico1: TMenuItem
        Caption = 'Metodo T'#233'rmico'
      end
      object Mtodofotogrfico1: TMenuItem
        Caption = 'M'#233'todo fotogr'#225'fico'
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object Sobre1: TMenuItem
        Caption = 'Sobre'
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Pdf |*.pdf'
    Left = 608
    Top = 121
  end
end
