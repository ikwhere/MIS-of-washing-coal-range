inherited Frmympchzhrp: TFrmympchzhrp
  Left = 209
  Top = 220
  Caption = #21407#29028#36141#36827#32508#21512#25253#34920
  ClientHeight = 232
  ClientWidth = 355
  PixelsPerInch = 96
  TextHeight = 13
  inherited Labelno: TLabel
    Left = 10
    Top = 115
  end
  object Label1: TLabel [1]
    Left = 52
    Top = 112
    Width = 65
    Height = 25
    AutoSize = False
    Caption = #29028'      '#30719#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 166
    Width = 355
    inherited BitBtn1: TBitBtn
      Left = 88
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      Left = 176
    end
  end
  object ComboBox1: TComboBox [3]
    Left = 119
    Top = 112
    Width = 169
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object DatePicker1: TDateTimePicker [4]
    Left = 120
    Top = 24
    Width = 81
    Height = 25
    CalAlignment = dtaLeft
    Date = 39851.7222601968
    Time = 39851.7222601968
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
  end
  object DatePicker2: TDateTimePicker [5]
    Left = 208
    Top = 24
    Width = 81
    Height = 25
    CalAlignment = dtaLeft
    Date = 39851.7222601968
    Time = 39851.7222601968
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
  end
  object RadioButton1: TRadioButton [6]
    Left = 24
    Top = 24
    Width = 81
    Height = 25
    Caption = #32047#35745#25253#34920#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton [7]
    Left = 24
    Top = 72
    Width = 89
    Height = 25
    Caption = #26376'  '#25253'  '#34920#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = RadioButton2Click
  end
  object ComboBox2: TComboBox [8]
    Left = 120
    Top = 72
    Width = 169
    Height = 21
    Style = csDropDownList
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 6
  end
  inherited ADOQuery1: TADOQuery
    Active = True
    CursorType = ctStatic
    SQL.Strings = (
      
        'select * from wroomdata,ymzl where ymzldate=tpdate and ymzlcoal=' +
        'tpcoal ')
  end
  object frxReport1: TfrxReport
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39851.7300934954
    ReportOptions.LastChange = 39851.7334861458
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 304
    Top = 64
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 420
      PaperHeight = 297
      PaperSize = 8
      LeftMargin = 10
      RightMargin = 10
      TopMargin = 10
      BottomMargin = 10
      object ReportTitle1: TfrxReportTitle
        Height = 136.06308
        Top = 18.89765
        Width = 1511.812
        object Memo1: TfrxMemoView
          Left = 585.82715
          Top = 30.23624
          Width = 517.79561
          Height = 60.47248
          GroupIndex = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -56
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #21407#29028#36141#36827#32508#21512#26376#25253#34920)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 404.40971
          Top = 30.23624
          Width = 181.41744
          Height = 57.69295
          GroupIndex = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -56
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 427.08689
        Top = 215.43321
        Width = 1511.812
        RowCount = 0
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    DataSet = ADOQuery1
    Left = 304
    Top = 96
  end
end
