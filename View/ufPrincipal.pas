unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery;

type
  TfPrincipal = class(TForm)
    mmTarefas: TMainMenu;
    miTarefas: TMenuItem;
    miTarefa1: TMenuItem;
    miTarefa2: TMenuItem;
    miTarefa3: TMenuItem;
    procedure miTarefa1Click(Sender: TObject);
    procedure miTarefa2Click(Sender: TObject);
    procedure miTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses ufTarefa1, ufTarefa2, ufTarefa3;

procedure TfPrincipal.miTarefa1Click(Sender: TObject);
begin
  if not Assigned(fTarefa1) then
    fTarefa1 := TfTarefa1.Create(Self);

  fTarefa1.Show;
end;

procedure TfPrincipal.miTarefa2Click(Sender: TObject);
begin
  if not Assigned(fTarefa2) then
    fTarefa2 := TfTarefa2.Create(Self);

  fTarefa2.Show;
end;

procedure TfPrincipal.miTarefa3Click(Sender: TObject);
begin
  if not Assigned(fTarefa3) then
    fTarefa3 := TfTarefa3.Create(Self);

  fTarefa3.Show;
end;

end.
