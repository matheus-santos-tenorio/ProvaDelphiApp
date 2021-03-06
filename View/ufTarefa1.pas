unit ufTarefa1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery, FireDAC.Phys.MySQLDef,
  FireDAC.Phys, FireDAC.Phys.MySQL;

type
  TfTarefa1 = class(TForm)
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    memColunas: TMemo;
    memTabelas: TMemo;
    memCondicoes: TMemo;
    memSQLGerado: TMemo;
    lblSqlGerado: TLabel;
    btnGeraSQL: TButton;
    spQuery: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSQLClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation 

{$R *.dfm}

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  spQuery.GeraSQL(memColunas.Lines.Text, memTabelas.Lines.Text, memCondicoes.Lines.Text);
  memSQLGerado.Text := spQuery.SQL.Text;
end;

procedure TfTarefa1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fTarefa1);
end;

procedure TfTarefa1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (memColunas.Focused) or (memTabelas.Focused) then
  begin
    case Key of
      #32: Key := #0;
      ',': Key := #13;
    end;
  end;
end;

end.
