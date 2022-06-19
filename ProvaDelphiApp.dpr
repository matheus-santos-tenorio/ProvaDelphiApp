program ProvaDelphiApp;

uses
  Vcl.Forms,
  ufPrincipal in 'View\ufPrincipal.pas' {fPrincipal},
  ufTarefa1 in 'View\ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'View\ufTarefa2.pas' {fTarefa2},
  Model.Tarefa3 in 'Model\Model.Tarefa3.pas',
  Model.Tarefa2 in 'Model\Model.Tarefa2.pas',
  ufTarefa3 in 'View\ufTarefa3.pas' {fTarefa3};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
