inherited FrmCoal: TFrmCoal
  Left = 328
  Top = 152
  Caption = #29028#30719#20449#24687#24405#20837
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 49
    Width = 688
    Height = 335
    Align = alClient
    Filter.Criteria = {00000000}
    object dxDBGrid1coalno: TdxDBGridMaskColumn
      Caption = #29028#30719#32534#21495
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'coalno'
    end
    object dxDBGrid1coalname: TdxDBGridColumn
      Caption = #29028#30719#21517#31216
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'coalname'
    end
    object dxDBGrid1Column3: TdxDBGridMaskColumn
      Caption = #24405#20837#26102#38388
      HeaderAlignment = taCenter
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keydate'
    end
    object dxDBGrid1Column4: TdxDBGridMaskColumn
      Caption = #24405#20837#29992#25143
      HeaderAlignment = taCenter
      Width = 68
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keyuser'
    end
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
  end
end
