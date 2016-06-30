inherited Frmmyjs: TFrmmyjs
  Left = 189
  Top = 63
  Width = 945
  Height = 590
  Caption = #21407#29028#29028#27454#36816#36153#32467#31639
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 494
    Width = 937
    inherited Button1: TButton
      Left = 192
    end
    inherited Button2: TButton
      Left = 8
      Visible = False
    end
    inherited Button3: TButton
      Left = 288
    end
    inherited Button4: TButton
      Left = 656
    end
    inherited Button6: TButton
      Left = 384
    end
    object Button5: TButton
      Left = 56
      Top = 16
      Width = 89
      Height = 33
      Caption = #20184#27454
      TabOrder = 5
      OnClick = Button5Click
    end
    object Button7: TButton
      Left = 384
      Top = 16
      Width = 97
      Height = 33
      Caption = #26597#30475#30917#25151#26126#32454
      TabOrder = 6
      OnClick = Button7Click
    end
    object ComboJsFs: TComboBox
      Left = 512
      Top = 16
      Width = 97
      Height = 21
      ItemHeight = 13
      TabOrder = 7
      OnSelect = ComboJsFsSelect
      Items.Strings = (
        #26376#21333#31508#32467#31639
        #26376#22810#31508#32467#31639)
    end
  end
  inherited dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 49
    Width = 937
    Height = 445
    ShowGroupPanel = True
    Align = alClient
    OnDblClick = dxDBGrid1DblClick
    Filter.Criteria = {00000000}
    object dxDBGrid1ymjsno: TdxDBGridMaskColumn
      Caption = #32534#21495
      HeaderAlignment = taCenter
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymjsno'
    end
    object dxDBGrid1ymjscoal: TdxDBGridColumn
      Caption = #32467#31639#29028#30719
      HeaderAlignment = taCenter
      Width = 81
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymjscoal'
    end
    object dxDBGrid1ymjsmonth: TdxDBGridColumn
      Caption = #32467#31639#26376#20221
      HeaderAlignment = taCenter
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymjsmonth'
    end
    object dxDBGrid1ymjsweight: TdxDBGridMaskColumn
      Caption = #32467#31639#21544#25968
      HeaderAlignment = taCenter
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymjsweight'
    end
    object dxDBGrid1ymkkwt: TdxDBGridColumn
      Caption = #25187#27454#25968
      Width = 42
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymkkwt'
    end
    object dxDBGrid1ymjsdate: TdxDBGridDateColumn
      Caption = #32467#31639#26085#26399
      HeaderAlignment = taCenter
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymjsdate'
    end
    object dxDBGrid1ymjsprc: TdxDBGridCurrencyColumn
      Caption = #19981#21547#31246#29028#27454
      HeaderAlignment = taCenter
      ReadOnly = True
      Width = 66
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymjsprc'
      Nullable = False
    end
    object dxDBGrid1ymjsprctax: TdxDBGridCurrencyColumn
      Caption = #21547#31246#29028#27454
      HeaderAlignment = taCenter
      ReadOnly = True
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymjsprctax'
      Nullable = False
    end
    object dxDBGrid1ymjstpprc: TdxDBGridCurrencyColumn
      Caption = #19981#21547#31246#36816#36153
      HeaderAlignment = taCenter
      ReadOnly = True
      Width = 66
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymjstpprc'
      Nullable = False
    end
    object dxDBGrid1ymjstpprctax: TdxDBGridCurrencyColumn
      Caption = #21547#31246#36816#36153
      HeaderAlignment = taCenter
      ReadOnly = True
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymjstpprctax'
      Nullable = False
    end
    object dxDBGrid1ymjssign: TdxDBGridCheckColumn
      Caption = #26159#21542#20184#27454
      HeaderAlignment = taCenter
      Width = 71
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymjssign'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxDBGrid1Column12: TdxDBGridMaskColumn
      Caption = #24405#20837#26102#38388
      HeaderAlignment = taCenter
      Width = 76
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keydate'
    end
    object dxDBGrid1Column13: TdxDBGridMaskColumn
      Caption = #24405#20837#29992#25143
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keyuser'
    end
  end
  inherited Panel1: TPanel
    Width = 937
  end
  inherited ADOQtmp: TADOQuery
    Left = 680
    Top = 128
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      'select * from ymjs')
  end
end
