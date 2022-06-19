object fTarefa2: TfTarefa2
  Left = 500
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tarefa 2'
  ClientHeight = 134
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblPriThread: TLabel
    Left = 8
    Top = 8
    Width = 296
    Height = 13
    Caption = 'Tempo (em Milesegundos) do carregamento da 1'#186' progessbar: '
  end
  object lblSegThread: TLabel
    Left = 8
    Top = 58
    Width = 296
    Height = 13
    Caption = 'Tempo (em Milesegundos) do carregamento da 2'#186' progessbar: '
  end
  object pbPriThread: TProgressBar
    Left = 8
    Top = 32
    Width = 354
    Height = 17
    TabOrder = 0
  end
  object pbSegThread: TProgressBar
    Left = 8
    Top = 82
    Width = 354
    Height = 17
    TabOrder = 1
  end
  object edtPriThread: TEdit
    Left = 310
    Top = 5
    Width = 52
    Height = 21
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 2
    Text = '1'
  end
  object edtSegThread: TEdit
    Left = 310
    Top = 55
    Width = 52
    Height = 21
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 3
    Text = '1'
  end
  object btnIniTarefas: TButton
    Left = 8
    Top = 103
    Width = 356
    Height = 25
    Caption = 'Iniciar Tarefas'
    TabOrder = 4
    OnClick = btnIniTarefasClick
  end
end
