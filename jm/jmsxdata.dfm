inherited Frmjmsxdata: TFrmjmsxdata
  Left = 336
  Top = 92
  Width = 797
  Height = 584
  Caption = #31934#29028#38144#21806#25968#25454#24405#20837
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 488
    Width = 789
  end
  inherited dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 49
    Width = 789
    Height = 439
    KeyField = 'jmxsno'
    ShowGroupPanel = True
    ShowSummaryFooter = True
    Align = alClient
    ParentShowHint = False
    Filter.Active = True
    Filter.Criteria = {00000000}
    object dxDBGrid1jmxsno: TdxDBGridMaskColumn
      Caption = #32534#21495
      HeaderAlignment = taCenter
      Width = 56
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxsno'
      SummaryFooterType = cstCount
    end
    object dxDBGrid1jmxsdate: TdxDBGridDateColumn
      Caption = #38144#21806#26085#26399
      HeaderAlignment = taCenter
      Width = 90
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxsdate'
      SummaryType = cstSum
      SummaryField = 'jmxswt'
      SummaryFormat = #21512#35745#38144#37327':0.00'
    end
    object dxDBGrid1jmxsph: TdxDBGridMaskColumn
      Caption = #23567#31080#31080#21495
      HeaderAlignment = taCenter
      Width = 114
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxsph'
      SummaryType = cstSum
    end
    object dxDBGrid1jmtpnum: TdxDBGridMaskColumn
      Caption = #36710#21495
      HeaderAlignment = taCenter
      Width = 99
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmtpnum'
      SummaryType = cstSum
    end
    object dxDBGrid1jmtpuser: TdxDBGridMaskColumn
      Caption = #23458#25143
      HeaderAlignment = taCenter
      Width = 76
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmtpuser'
      SummaryType = cstSum
      SummaryField = 'jmxswt'
      SummaryFormat = #21512#35745#38144#37327':0.00'
    end
    object dxDBGrid1jmxswt: TdxDBGridMaskColumn
      Caption = #38144#37327'('#21544')'
      HeaderAlignment = taCenter
      Width = 83
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxswt'
      SummaryFooterType = cstSum
    end
    object dxDBGrid1jmxskeydt: TdxDBGridDateColumn
      Caption = #24405#20837#26085#26399
      HeaderAlignment = taCenter
      Width = 103
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxskeydt'
      SummaryType = cstSum
    end
    object dxDBGrid1Column9: TdxDBGridColumn
      Caption = #24405#20837#29992#25143
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxsuser'
    end
    object dxDBGrid1Column8: TdxDBGridCheckColumn
      Caption = #26159#21542#32467#24080
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'jmxssign'
      ValueChecked = 'true'
      ValueUnchecked = 'false'
    end
  end
  inherited Panel1: TPanel
    Width = 789
    inherited Button8: TButton
      OnClick = Button8Click
    end
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      '')
  end
end
