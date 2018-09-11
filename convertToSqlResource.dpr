program convertToSqlResource;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := (System.DebugHook <> 0);

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
