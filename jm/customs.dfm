inherited FrmCustoms: TFrmCustoms
  Left = 301
  Top = 178
  Width = 697
  Caption = #23458#25143#21333#20301#32500#25252
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 689
  end
  inherited dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 49
    Width = 689
    Height = 335
    Align = alClient
    Filter.Criteria = {00000000}
    object dxDBGrid1CustomNo: TdxDBGridMaskColumn
      Caption = #23458#25143#32534#21495
      HeaderAlignment = taCenter
      Width = 94
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CustomNo'
    end
    object dxDBGrid1CustomName: TdxDBGridMaskColumn
      Caption = #23458#25143#22995#21517
      HeaderAlignment = taCenter
      Width = 304
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CustomName'
    end
    object dxDBGrid1Column3: TdxDBGridMaskColumn
      Caption = #24405#20837#26102#38388
      HeaderAlignment = taCenter
      Width = 85
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keydate'
    end
    object dxDBGrid1Column4: TdxDBGridMaskColumn
      Caption = #24405#20837#29992#25143
      HeaderAlignment = taCenter
      Width = 85
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keyuser'
    end
  end
  inherited Panel1: TPanel
    Width = 689
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
  end
end
