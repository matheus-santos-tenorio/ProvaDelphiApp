unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Model.Tarefa3;

type
  TfTarefa3 = class(TForm)
    lblValProjeto: TLabel;
    lblTotal: TLabel;
    lblTotalDivisoes: TLabel;
    btnObtTotal: TButton;
    btnObtTotDivisoes: TButton;
    edtTotal: TEdit;
    edtTotDivisoes: TEdit;
    dbgValProjeto: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnObtTotalClick(Sender: TObject);
    procedure btnObtTotDivisoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FProjeto: ITarefa3;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btnObtTotalClick(Sender: TObject);
begin
  edtTotal.Text := FormatFloat('R$, 0.00', FProjeto.Totalizador);
end;

procedure TfTarefa3.btnObtTotDivisoesClick(Sender: TObject);
begin
 edtTotDivisoes.Text := FormatFloat('R$, 0.00', FProjeto.Divisor);
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(fTarefa3);
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  FProjeto := TTarefa3.Criar;
  dbgValProjeto.DataSource := FProjeto.GetDataSource;
end;

end.
