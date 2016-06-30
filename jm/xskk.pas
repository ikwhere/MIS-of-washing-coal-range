unit xskk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, ComCtrls, StdCtrls, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, dxDBTLCl, dxGrClms;

type
  TFrmxskk = class(TFrmMather)
    dxDBGrid1xskkno: TdxDBGridMaskColumn;
    dxDBGrid1xskkdate: TdxDBGridMaskColumn;
    dxDBGrid1xskkcustomer: TdxDBGridMaskColumn;
    dxDBGrid1xskkname: TdxDBGridMaskColumn;
    dxDBGrid1xskkwt: TdxDBGridCurrencyColumn;
    dxDBGrid1xskksign: TdxDBGridCheckColumn;
    dxDBGrid1xsjsno: TdxDBGridMaskColumn;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  Frmxskk: TFrmxskk;

implementation

uses xskk_add, kkdata_add;

{$R *.dfm}

procedure TFrmxskk.Button3Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN begin
         savelog('删除<'+ADOQuery1.fieldbyname('ymkkcustomer').AsString+'>客户'+ADOQuery1.fieldbyname('xskkdate').AsString+
        '扣款'+ADOQuery1.fieldbyname('xskkname').AsString+'记录,扣款'+ADOQuery1.fieldbyname('xskkwt').AsString+'吨',ADOQuery1.fieldbyname('xskkno').AsString,'销售扣款录入');
        DeleteSelection
    end
    ELSE
      sqlstr:='select xskksign,xsjsno from xskkdata where xskkno='''+trim(ADOQuery1.fieldbyname('xskkno').asstring)+'''';
      adoqryopen(ADOQtmp,sqlstr);
      if ADOQtmp.Fields[0].AsString='True'  then begin
          MessageBox(Handle, pchar('此笔扣款记录已纳入结算，结算单号'+ADOQtmp.Fields[1].AsString+',不能删除!'), '提示', MB_ICONERROR or MB_OK) ;
          abort;
      end;
      IF FocusedNode <> nil THEN begin
      savelog('删除<'+ADOQuery1.fieldbyname('ymkkcustomer').AsString+'>客户'+ADOQuery1.fieldbyname('xskkdate').AsString+
        '扣款'+ADOQuery1.fieldbyname('xskkname').AsString+'记录,扣款'+ADOQuery1.fieldbyname('xskkwt').AsString+'吨',ADOQuery1.fieldbyname('xskkno').AsString,'销售扣款录入');
      TdxDBGridNode(FocusedNode).Delete;
      end;
  END;
end;

procedure TFrmxskk.Button1Click(Sender: TObject);
begin
  inherited;
  FrmxskkAdd:=TFrmxskkAdd.Create(self);
  FrmxskkAdd.Labelno.Caption:=getmax('xskkdata','xskkno');
  FrmxskkAdd.AutoInCombobox(FrmxskkAdd.CombokkTime,'select kjqj from kjqj where clscunt=0 order by kjqj');
  FrmxskkAdd.AutoInCombobox(FrmxskkAdd.ComboCustom,'select customname from customs');
  FrmxskkAdd.AutoInCombobox(FrmxskkAdd.ComboName,'select xsname from xsname');
  FrmxskkAdd.CombokkTime.ItemIndex:=0;
  FrmxskkAdd.ComboCustom.ItemIndex:=0;
  FrmxskkAdd.ComboName.ItemIndex:=0;
  FrmxskkAdd.ShowModal;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TFrmxskk.Button2Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  sqlstr:='select xskksign,xsjsno from xskkdata where xskkno='''+trim(ADOQuery1.fieldbyname('xskkno').asstring)+'''';
  adoqryopen(ADOQtmp,sqlstr);
  if ADOQtmp.Fields[0].AsString='True'  then begin
        MessageBox(Handle, pchar('此笔扣款记录已纳入结算，结算单号'+ADOQtmp.Fields[1].AsString+',不能修改!'), '提示', MB_ICONERROR or MB_OK) ;
        abort;
  end;
  FrmxskkAdd:=TFrmxskkAdd.Create(self);
  FrmxskkAdd.Labelno.Caption:=ADOQuery1.Fields[0].AsString;
  FrmxskkAdd.AutoInCombobox(FrmxskkAdd.CombokkTime,'select kjqj from kjqj where clscunt=0 order by kjqj');
  FrmxskkAdd.AutoInCombobox(FrmxskkAdd.ComboCustom,'select customname from customs');
  FrmxskkAdd.AutoInCombobox(FrmxskkAdd.ComboName,'select xsname from xsname');
  FrmxskkAdd.CombokkTime.TEXT:=ADOQuery1.Fieldbyname('xskkdate').AsString;
  FrmxskkAdd.ComboCustom.Text:=ADOQuery1.Fieldbyname('xskkcustomer').AsString;
  FrmxskkAdd.ComboName.Text:=ADOQuery1.Fieldbyname('xskkname').AsString;
  FrmxskkAdd.Edtkkwt.Text:=ADOQuery1.Fieldbyname('xskkwt').AsString;
  FrmxskkAdd.ShowModal;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;
 function TFrmxskk.l_init:boolean;
var sqlstr:string;
begin
  sqlstr:='select * from xskkdata ';
  adoqryopen(ADOQuery1,sqlstr);
end;
procedure TFrmxskk.FormShow(Sender: TObject);
begin
  inherited;
l_init
end;

end.
