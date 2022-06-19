unit Model.Tarefa2;

interface

uses
  Vcl.ComCtrls;

type
  TStatus = (dsParado, dsIniciado, dsFinalizado, dsErro, dsInterrompido);

  ITarefa2 = Interface
    ['{DA81C305-75CC-475D-BDA2-5AED9470F437}']

    procedure Start(pValor: Integer; pProgressBar: TProgressBar);
    procedure Stop;
    procedure ExecThread;

    function GetStatus:TStatus;

    property Status: TStatus read GetStatus;
  End;

  TTarefa2 = class (TInterfacedObject, ITarefa2)
    private
      FStatus: TStatus;
      FErro: String;

      FValor: Integer;
      FProgressBar: TProgressBar;

    public
      constructor Create;
      destructor Destroy; Override;

      class function Criar: ITarefa2;

      procedure Start(pValor: Integer; pProgressBar: TProgressBar);
      procedure Stop;
      procedure ExecThread;

      function GetStatus:TStatus;

      property Status: TStatus read GetStatus;
  end;

implementation

uses
  System.SysUtils, System.Threading, System.Classes;

{ TTarefa2 }

constructor TTarefa2.Create;
begin
  FStatus := dsParado;
end;

class function TTarefa2.Criar: ITarefa2;
begin
  Result := TTarefa2.Create;
end;

destructor TTarefa2.Destroy;
begin

  inherited;
end;

procedure TTarefa2.ExecThread;
var
  Task: ITask;
begin
  Task := TTask.Create(
          procedure
          begin
            try
              while FProgressBar.Position < 100 do
              begin
                if FStatus = dsIniciado then
                begin
                  Sleep(FValor);

                  TThread.Synchronize(nil, procedure
                  begin
                    FProgressBar.Position := FProgressBar.Position + 1
                  end);
                end
                else
                  Break;
              end;
              FStatus := dsFinalizado;
            except
              on E: Exception do
              begin
                FStatus := dsErro;
                Exception.Create(E.Message);
              end;
            end;
          end);

  Task.Start;
end;

function TTarefa2.GetStatus: TStatus;
begin
  Result := FStatus;
end;

procedure TTarefa2.Start(pValor: Integer; pProgressBar: TProgressBar);
begin
  if pValor = 0 then
    raise Exception.Create('Informe um valor superior a 0')
  else if FStatus = dsIniciado then
    raise Exception.Create('Já existe uma thread inicializada');

  FValor := pValor;
  FProgressBar := pProgressBar;

  FProgressBar.Position := 0;
  FStatus := dsIniciado;
  ExecThread;
end;

procedure TTarefa2.Stop;
begin
  FStatus := dsInterrompido;
end;

end.
