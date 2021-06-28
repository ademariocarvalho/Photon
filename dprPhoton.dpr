program dprPhoton;

uses
  Vcl.Forms,
  uPhoton in 'uPhoton.pas' {frmPrincipal},
  uSobre in 'uSobre.pas' {frmSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
