unit ufTarefa2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Model.Tarefa2;

type
  TfTarefa2 = class(TForm)
    pbPriThread: TProgressBar;
    pbSegThread: TProgressBar;
    edtPriThread: TEdit;
    edtSegThread: TEdit;
    lblPriThread: TLabel;
    lblSegThread: TLabel;
    btnIniTarefas: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIniTarefasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FTarefaThread1, FTarefaThread2 : ITarefa2;
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

procedure TfTarefa2.btnIniTarefasClick(Sender: TObject);
begin
  FTarefaThread1.Start(StrToIntDef(edtPriThread.Text, 0), pbPriThread);
  FTarefaThread2.Start(StrToIntDef(edtSegThread.Text, 0), pbSegThread);
end;

procedure TfTarefa2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FTarefaThread1.Stop;
  FTarefaThread2.Stop;
  FreeAndNil(fTarefa2);
end;

procedure TfTarefa2.FormCreate(Sender: TObject);
begin
  FTarefaThread1 := TTarefa2.Criar;
  FTarefaThread2 := TTarefa2.Criar;
end;

end.
