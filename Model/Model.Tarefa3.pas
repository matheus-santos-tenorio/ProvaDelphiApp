unit Model.Tarefa3;

interface

uses
  Datasnap.DBClient, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  ITarefa3 = interface
    ['{AF1FF272-CF3B-4D65-B70E-43928624A895}']

    function Totalizador: Double;
    function Divisor: Double;
    function GetDataSource: TDataSource;

  end;

  TTarefa3 = class(TInterfacedObject, ITarefa3)
    private
      FClientDataSet: TClientDataSet;
      FDataSource: TDataSource;

    public
      constructor Create;
      destructor Destroy; Override;

      class function Criar: ITarefa3;
      function Totalizador: Double;
      function Divisor: Double;
      function GetDataSource: TDataSource;
  end;

implementation

{ TspProjeto }

constructor TTarefa3.Create;
var
  Codigo, I: Integer;
begin
  Randomize;
  FClientDataSet := TClientDataSet.Create(nil);
  FDataSource    := TDataSource.Create(nil);

  FClientDataSet.FieldDefs.Add('IdProjeto', ftInteger);
  FClientDataSet.FieldDefs.Add('NomeProjeto', ftString, 12);
  FClientDataSet.FieldDefs.Add('Valor', ftFloat);

  FClientDataSet.CreateDataSet;

  for I := 1 to 10 do
  begin
    repeat
      Codigo := Random(1000);
    until (not (FClientDataSet.Locate('IdProjeto', Codigo, []))) and (Codigo <> 0) ;

    FClientDataSet.Append;
    FClientDataSet.FieldByName('IdProjeto').AsInteger := Codigo;
    FClientDataSet.FieldByName('NomeProjeto').AsString := 'Projeto ' + IntToStr(Codigo);
    FClientDataSet.FieldByName('Valor').AsFloat := Random(1000);
    TNumericField(FClientDataSet.FieldByName('Valor')).DisplayFormat := 'R$###,###,##0.00';
    FClientDataSet.Post;
  end;

  FDataSource.DataSet := FClientDataSet;
end;

class function TTarefa3.Criar: ITarefa3;
begin
  Result := TTarefa3.Create;
end;

destructor TTarefa3.Destroy;
begin
  FreeAndNil(FClientDataSet);
  FreeAndNil(FDataSource);
  inherited;
end;

function TTarefa3.Divisor: Double;
var
  Divisor: Double;
begin
  try
    FClientDataSet.First;
    Result := 0;
    Divisor := 0;
    while not FClientDataSet.Eof do
    begin
      if FClientDataSet.RecNo = 1 then
        Divisor := FClientDataSet.FieldByName('Valor').AsFloat
      else
      begin
        if Divisor > 0 then
          Result := Result + (FClientDataSet.FieldByName('Valor').AsFloat / Divisor);

        Divisor := FClientDataSet.FieldByName('Valor').AsFloat;
      end;

      FClientDataSet.Next;
    end;
  except
    on E: Exception do
      Exception.Create(E.ClassName + ' erro ao efetuar a divisão. ' + #13#10 + E.Message);
  end;
end;

function TTarefa3.GetDataSource: TDataSource;
begin
  Result := FDataSource;
end;

function TTarefa3.Totalizador: Double;
begin
  try
    FClientDataSet.First;
    Result := 0;
    while not FClientDataSet.Eof do
    begin
      Result := Result + FClientDataSet.FieldByName('Valor').AsFloat;
      FClientDataSet.Next;
    end;
  except
    on E: Exception do
      Exception.Create(E.ClassName + ' erro ao efetuar o somatorio. ' + #13#10 + E.Message);
  end;
end;

end.
