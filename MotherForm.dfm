object FrmMather: TFrmMather
  Left = 173
  Top = 205
  Width = 696
  Height = 480
  Caption = 'FrmMather'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 384
    Width = 688
    Height = 62
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 120
      Top = 16
      Width = 89
      Height = 33
      Caption = #26032#22686
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 216
      Top = 16
      Width = 89
      Height = 33
      Caption = #20462#25913
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 312
      Top = 16
      Width = 89
      Height = 33
      Caption = #21024#38500
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 504
      Top = 15
      Width = 89
      Height = 33
      Caption = #36864#20986
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button6: TButton
      Left = 408
      Top = 16
      Width = 89
      Height = 33
      Caption = #20445#23384
      Enabled = False
      TabOrder = 4
      Visible = False
      OnClick = Button6Click
    end
  end
  object dxDBGrid1: TdxDBGrid
    Left = 192
    Top = 64
    Width = 289
    Height = 225
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    OnExit = dxDBGrid1Exit
    DataSource = DataSource1
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 49
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label3: TLabel
      Left = 24
      Top = 10
      Width = 105
      Height = 24
      AutoSize = False
      Caption = #26597#35810#26085#26399
    end
    object DatePicker1: TDateTimePicker
      Left = 152
      Top = 5
      Width = 153
      Height = 32
      CalAlignment = dtaLeft
      Date = 39844.4876477431
      Time = 39844.4876477431
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object DatePicker2: TDateTimePicker
      Left = 304
      Top = 5
      Width = 136
      Height = 32
      CalAlignment = dtaLeft
      Date = 39844.4876477431
      Time = 39844.4876477431
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object Button8: TButton
      Left = 472
      Top = 5
      Width = 97
      Height = 33
      Caption = #26597#35810
      TabOrder = 2
    end
  end
  object ADOQtmp: TADOQuery
    Parameters = <>
    Left = 584
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 640
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 520
    Top = 24
  end
end
