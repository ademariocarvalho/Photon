unit uSobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmSobre = class(TForm)
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Memo1: TMemo;
    Label1: TLabel;
    LinkLabel1: TLinkLabel;
    LinkLabel2: TLinkLabel;
    Image3: TImage;
    Image4: TImage;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure LinkLabel2LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation
uses ShellAPI;

{$R *.dfm}

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  LinkLabel1.Caption := '<a href="https://github.com/ademariocarvalho/Photon">GitHub</a>';
  LinkLabel2.Caption := '<a href="https://t.me/professor_ademario">Telegram</a>';
end;

procedure TfrmSobre.LinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShellExecute(0, nil, PChar(Link), nil, nil, 1);
end;

procedure TfrmSobre.LinkLabel2LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShellExecute(0, nil, PChar(Link), nil, nil, 1);
end;

procedure TfrmSobre.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
