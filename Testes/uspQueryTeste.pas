unit uspQueryTeste;

interface
uses
  DUnitX.TestFramework, uspQuery;

type

  [TestFixture]
  TuspQueryTeste = class(TObject)
    FspQuery: TspQuery;
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

procedure TuspQueryTeste.Setup;
begin
  FspQuery := TspQuery.Create(Nil);
end;

procedure TuspQueryTeste.TearDown;
begin
  FreeAndNil(FspQuery);
end;

procedure TuspQueryTeste.Test1;
begin
  FspQuery.GeraSQL('NOME, IDADE, CPF', 'PESSOA', 'IDADE > 18');

  Assert.IsTrue(FspQuery.SQL.Text <> '', 'Ocorreu um erro ao tentar gerar o SQL, Coluna = (NOME, IDADE, CPF) Tabela = (PESSOA) Condição = (IDADE > 18)');
end;

initialization
  TDUnitX.RegisterTestFixture(TuspQueryTeste);
end.
