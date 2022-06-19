unit uspQuery;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Classes, System.SysUtils, Vcl.Dialogs, FireDAC.Phys.MySQLDef,
  FireDAC.Phys, FireDAC.Phys.MySQL;

type
  TspQuery = class(TFDQuery)

  private
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;
  public

    property spCondicoes: TStringList read FspCondicoes;
    property spColunas: TStringList read FspColunas;
    property spTabelas: TStringList read FspTabelas;

    procedure GeraSQL(pColunas, pTabelas, pCondicoes: String);

    constructor Create(AOwner: TComponent); Override;
    destructor Destroy; Override;

  end;

implementation

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited;

  FspCondicoes := TStringList.Create;
  FspColunas   := TStringList.Create;
  FspTabelas   := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  FreeAndNil(FspCondicoes);
  FreeAndNil(FspColunas);
  FreeAndNil(FspTabelas);
  inherited;
end;

procedure TspQuery.GeraSQL(pColunas, pTabelas, pCondicoes: String);
var
  I:Integer;
  Colunas: String;
begin
  try
    FspColunas.Text := pColunas;
    FspTabelas.Text := pTabelas;
    FspCondicoes.Text := pCondicoes;

    if (FspColunas.Count = 0) and (Trim(FspColunas.Text) = '') then
    begin
      ShowMessage('É necessário informar uma coluna!');
      Exit;
    end
    else if (FspTabelas.Count = 0) or (Trim(FspTabelas.Text) = '') then
    begin
      ShowMessage('É necessário informar uma tabela!');
      Exit;
    end
    else if FspTabelas.Count > 1 then
    begin
      ShowMessage('Só é possível informar uma tabela!');
      Exit;
    end;

    SQL.Text := '';
    Colunas := '';

    for I := 0 to Pred(FspColunas.Count) do
    begin
      if Trim(FspColunas[I]) = '' then
        Continue
      else if I <> Pred(FspColunas.Count) then
        Colunas := Colunas + FspColunas[I] + ', '
      else
        Colunas := Colunas + FspColunas[I];
    end;

    SQL.Add(' Select ' + Trim(Colunas));
    SQL.Add(' From ' + Trim(FspTabelas[0]));

    if (FspCondicoes.Count > 0) and (Trim(FspCondicoes.text) <> '') then
      SQL.Add(' Where ' + Trim(FspCondicoes.text));
  except
    on E: Exception do
      ShowMessage(E.ClassName + ' erro ao efetuar a geração do SQL. ' + #13#10 + E.Message);
  end;
end;

end.
