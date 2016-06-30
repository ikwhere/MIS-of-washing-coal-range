inherited FRMMyjsSelect: TFRMMyjsSelect
  Left = 219
  Top = 215
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = #35831#36873#25321#32467#31639#26376#20221#21644#21333#20301
  ClientHeight = 166
  ClientWidth = 302
  OldCreateOrder = True
  Position = poDesktopCenter
  WindowState = wsNormal
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 8
    Top = 12
    Width = 49
    Height = 33
    AutoSize = False
    Caption = #26376#20221
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 69
    Width = 49
    Height = 33
    AutoSize = False
    Caption = #29028#30719
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel2: TPanel
    Top = 104
    Width = 302
    inherited Button1: TButton
      Left = 48
      Caption = #30830#23450
    end
    inherited Button2: TButton
      Left = 456
    end
    inherited Button4: TButton
      Left = 144
    end
  end
  inherited dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 49
    Width = 302
    Height = 55
    Align = alClient
    Visible = False
    Filter.Criteria = {00000000}
  end
  inherited Panel1: TPanel
    Width = 302
    Visible = False
    inherited Label3: TLabel
      Width = 85
    end
  end
  object Comboxkjqj: TComboBox [5]
    Left = 64
    Top = 16
    Width = 177
    Height = 22
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 3
  end
  object Comboxdw: TComboBox [6]
    Left = 64
    Top = 72
    Width = 177
    Height = 22
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 4
  end
end
