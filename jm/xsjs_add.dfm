inherited FrmXsjsAdd: TFrmXsjsAdd
  Left = 339
  Top = 177
  Caption = #22686#21152#32467#31639
  OldCreateOrder = True
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited Button1: TButton
      Left = -16
      Visible = False
    end
    inherited Button2: TButton
      Left = 80
      Visible = False
    end
    inherited Button3: TButton
      Left = 176
      Visible = False
    end
    inherited Button4: TButton
      Left = 352
    end
    inherited Button6: TButton
      Left = 256
      Visible = True
    end
  end
  inherited dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 49
    Width = 688
    Height = 158
    Align = alClient
    OnClick = dxDBGrid1Click
    Filter.Criteria = {00000000}
    object dxDBGrid1jmxsno: TdxDBGridMaskColumn
      Caption = #32534#21495
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxsno'
    end
    object dxDBGrid1jmtpnum: TdxDBGridMaskColumn
      Caption = #36710#21495
      HeaderAlignment = taCenter
      Width = 83
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmtpnum'
    end
    object dxDBGrid1jmxsname: TdxDBGridMaskColumn
      Caption = #20135#21697
      HeaderAlignment = taCenter
      Width = 86
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxsname'
    end
    object dxDBGrid1jmtpuser: TdxDBGridMaskColumn
      Caption = #23458#25143
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmtpuser'
    end
    object dxDBGrid1jmxswt: TdxDBGridMaskColumn
      Caption = #38144#37327
      HeaderAlignment = taCenter
      Width = 41
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxswt'
    end
    object dxDBGrid1jmxsdate: TdxDBGridDateColumn
      Caption = #38144#21806#26085#26399' '
      HeaderAlignment = taCenter
      Width = 58
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxsdate'
    end
    object dxDBGrid1jmxsph: TdxDBGridMaskColumn
      Caption = #31080#21495
      HeaderAlignment = taCenter
      Width = 73
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxsph'
    end
    object dxDBGrid1jmxskeydt: TdxDBGridDateColumn
      Caption = #24405#20837#26085#26399
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxskeydt'
    end
    object dxDBGrid1jmxsuser: TdxDBGridMaskColumn
      Caption = #24405#20837#29992#25143
      HeaderAlignment = taCenter
      Width = 55
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxsuser'
    end
    object dxDBGrid1jmxssign: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxssign'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxDBGrid1xsjsno: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 65
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjsno'
    end
  end
  inherited Panel1: TPanel
    Caption = #38144#21806#35760#24405
    Font.Height = -16
    inherited Label3: TLabel
      Visible = False
    end
    inherited DatePicker1: TDateTimePicker
      Height = 28
      Visible = False
    end
    inherited DatePicker2: TDateTimePicker
      Height = 28
      Visible = False
    end
    inherited Button8: TButton
      Visible = False
    end
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 207
    Width = 688
    Height = 41
    Align = alBottom
    Caption = #25187#27454#26126#32454
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Labelno: TLabel
      Left = 192
      Top = 16
      Width = 6
      Height = 20
      Visible = False
    end
  end
  object dxDBGrid2: TdxDBGrid [4]
    Left = 0
    Top = 248
    Width = 688
    Height = 136
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alBottom
    TabOrder = 4
    OnClick = dxDBGrid1Click
    OnExit = dxDBGrid1Exit
    DataSource = DataSource2
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
    object dxDBGrid2xskkno: TdxDBGridMaskColumn
      Caption = #32534#21495
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskkno'
    end
    object dxDBGrid2xskkdate: TdxDBGridMaskColumn
      Caption = #25187#27454#26085#26399
      HeaderAlignment = taCenter
      Width = 96
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskkdate'
    end
    object dxDBGrid2xskkcustomer: TdxDBGridMaskColumn
      Caption = #23458#25143
      HeaderAlignment = taCenter
      Width = 91
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskkcustomer'
    end
    object dxDBGrid2xskkname: TdxDBGridMaskColumn
      Caption = #20135#21697
      HeaderAlignment = taCenter
      Width = 58
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskkname'
    end
    object dxDBGrid2xskkwt: TdxDBGridCurrencyColumn
      Caption = #25187#27454#25968#37327#65288#21544#65289
      HeaderAlignment = taCenter
      Width = 94
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskkwt'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGrid2xsjsno: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjsno'
    end
    object dxDBGrid2xskeydate: TdxDBGridMaskColumn
      Caption = #24405#20837#29992#25143
      HeaderAlignment = taCenter
      Width = 65
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskeydate'
    end
    object dxDBGrid2xskeyuser: TdxDBGridMaskColumn
      Caption = #24405#20837#29992#25143
      HeaderAlignment = taCenter
      Width = 72
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskeyuser'
    end
    object dxDBGrid2xskksign: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskksign'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
  end
  object ADOQuery2: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 528
    Top = 288
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 576
    Top = 280
  end
end
