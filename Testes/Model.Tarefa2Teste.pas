unit Model.Tarefa2Teste;

interface
uses
  DUnitX.TestFramework, Model.Tarefa2, Vcl.ComCtrls;

type

  [TestFixture]
  TTarefa2Teste = class(TObject)
  private
    FTarefa2: ITarefa2;
    FProgressBar: TProgressBar;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Sample Methods
    // Simple single Test
    [Test]
    procedure Test1;
  end;

implementation

uses
  System.SysUtils;

procedure TTarefa2Teste.Setup;
begin
  FTarefa2 := TTarefa2.Criar;
  FProgressBar := TProgressBar.Create(Nil);
end;

procedure TTarefa2Teste.TearDown;
begin
  if Assigned(FProgressBar) then
    FreeAndNil(FProgressBar);
end;

procedure TTarefa2Teste.Test1;
begin
  FTarefa2.Start(100, FProgressBar);

  Assert.IsTrue(FTarefa2.Status = dsIniciado, 'Ocorreu um erro ao tentar inicializar a thread passando o valor 100');
end;

initialization
  TDUnitX.RegisterTestFixture(TTarefa2Teste);
end.
