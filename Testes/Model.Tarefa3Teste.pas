unit Model.Tarefa3Teste;

interface
uses
  DUnitX.TestFramework, Model.Tarefa3;

type

  [TestFixture]
  TTarefa3Teste = class(TObject)
  private
    FTarefa3: ITarefa3;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Sample Methods
    // Simple single Test
    [Test]
    procedure Test1;
    procedure Test2;
  end;

implementation

procedure TTarefa3Teste.Setup;
begin
  FTarefa3 := TTarefa3.Criar;
end;

procedure TTarefa3Teste.TearDown;
begin

end;

procedure TTarefa3Teste.Test1;
var
  Resultado: Double;
begin
  Resultado := FTarefa3.Totalizador;

  Assert.IsTrue(Resultado > 0, 'Ocorreu um erro ao tentar totalizar os valores do CDS');
end;

procedure TTarefa3Teste.Test2;
var
  Resultado: Double;
begin
  Resultado := FTarefa3.Divisor;

  Assert.IsTrue(Resultado > 0, 'Ocorreu um erro ao tentar dividir os valores do CDS');
end;

initialization
  TDUnitX.RegisterTestFixture(TTarefa3Teste);
end.
