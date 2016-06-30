inherited Frmsxjs: TFrmsxjs
  Left = 210
  Top = 171
  Width = 830
  Height = 524
  Caption = #38144#21806#32467#31639
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 428
    Width = 822
    inherited Button2: TButton
      Left = 8
      Visible = False
    end
    inherited Button6: TButton
      Left = 24
    end
    object Button5: TButton
      Left = 408
      Top = 16
      Width = 89
      Height = 33
      Caption = #26597#30475#32467#31639#26126#32454
      TabOrder = 5
      OnClick = Button5Click
    end
  end
  inherited dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 49
    Width = 822
    Height = 379
    KeyField = 'xsjsno'
    ShowGroupPanel = True
    Align = alClient
    OnDblClick = dxDBGrid1DblClick
    Filter.Criteria = {00000000}
    ShowRowFooter = True
    object dxDBGrid1xsjsno: TdxDBGridMaskColumn
      Caption = #32534#21495
      HeaderAlignment = taCenter
      Width = 41
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjsno'
    end
    object dxDBGrid1xsjscustomer: TdxDBGridMaskColumn
      Caption = #23458#25143
      HeaderAlignment = taCenter
      Width = 82
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjscustomer'
    end
    object dxDBGrid1xsjsname: TdxDBGridMaskColumn
      Caption = #20135#21697
      HeaderAlignment = taCenter
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjsname'
    end
    object dxDBGrid1xsjsmonth: TdxDBGridMaskColumn
      Caption = #32467#31639#26376#20221
      HeaderAlignment = taCenter
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjsmonth'
    end
    object dxDBGrid1xsjsweight: TdxDBGridMaskColumn
      Caption = #32467#31639#21544#25968
      HeaderAlignment = taCenter
      Width = 55
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjsweight'
    end
    object dxDBGrid1xsjskkwt: TdxDBGridMaskColumn
      Caption = #25187#27454#25968
      HeaderAlignment = taCenter
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjskkwt'
      SummaryFooterType = cstSum
      SummaryField = 'xsjskkwt'
    end
    object dxDBGrid1xsjsdate: TdxDBGridMaskColumn
      Caption = #32467#31639#26085#26399'*'
      HeaderAlignment = taCenter
      Width = 86
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjsdate'
    end
    object dxDBGrid1xsjsprc: TdxDBGridMaskColumn
      Caption = #19981#21547#31246#21806#20215
      HeaderAlignment = taCenter
      Width = 67
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjsprc'
      SummaryFooterType = cstSum
      SummaryField = 'xsjsprc'
    end
    object dxDBGrid1xsjsprctax: TdxDBGridMaskColumn
      Caption = #21547#31246#21806#20215
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjsprctax'
      SummaryFooterType = cstMax
      SummaryFooterField = 'xsjsprctax'
    end
    object dxDBGrid1xsjstpprc: TdxDBGridMaskColumn
      Caption = #19981#21547#31246#36816#36153
      HeaderAlignment = taCenter
      Width = 71
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjstpprc'
      SummaryFooterType = cstSum
      SummaryFooterField = 'xsjstpprc'
    end
    object dxDBGrid1xsjstpprctax: TdxDBGridMaskColumn
      Caption = #21547#31246#36816#36153
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjstpprctax'
      SummaryFooterType = cstSum
      SummaryFooterField = 'xsjstpprctax'
    end
    object dxDBGrid1xsjssign: TdxDBGridCheckColumn
      Caption = #26159#21542#20184#27454
      HeaderAlignment = taCenter
      Width = 67
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjssign'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxDBGrid1Column13: TdxDBGridColumn
      Caption = #24405#20837#26085#26399
      Width = 73
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keydate'
    end
    object dxDBGrid1Column14: TdxDBGridColumn
      Caption = #24405#20837#29992#25143
      Width = 97
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keyuser'
    end
  end
  inherited Panel1: TPanel
    Width = 822
    inherited Button8: TButton
      OnClick = Button8Click
    end
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
  end
end
