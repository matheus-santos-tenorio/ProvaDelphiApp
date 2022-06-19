object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Principal'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmTarefas
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object mmTarefas: TMainMenu
    Left = 24
    Top = 16
    object miTarefas: TMenuItem
      Caption = 'Tarefas'
      object miTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = miTarefa1Click
      end
      object miTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = miTarefa2Click
      end
      object miTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = miTarefa3Click
      end
    end
  end
end
