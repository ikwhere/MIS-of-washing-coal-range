unit jmsxdata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls, dxDBTLCl, dxGrClms, Buttons, ComCtrls;

type
  TFrmjmsxdata = class(TFrmMather)
    dxDBGrid1jmxsno: TdxDBGridMaskColumn;
    dxDBGrid1jmtpnum: TdxDBGridMaskColumn;
    dxDBGrid1jmtpuser: TdxDBGridMaskColumn;
    dxDBGrid1jmxswt: TdxDBGridMaskColumn;
    dxDBGrid1jmxsdate: TdxDBGridDateColumn;
    dxDBGrid1jmxsph: TdxDBGridMaskColumn;
    dxDBGrid1jmxskeydt: TdxDBGridDateColumn;
    dxDBGrid1Column8: TdxDBGridCheckColumn;
    dxDBGrid1Column9: TdxDBGridColumn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  Frmjmsxdata: TFrmjmsxdata;

implementation

uses jmsxdata_add;

{$R *.dfm}
function TFrmjmsxdata.l_init:boolean;
var sqlstr:string;
begin
  sqlstr:='select * from jmsxdata  where jmxsname=''精煤''';
  adoqryopen(ADOQuery1,sqlstr);
end;
procedure TFrmjmsxdata.Button1Click(Sender: TObject);
begin
  inherited;
  FrmjmsxdataAdd:=TFrmjmsxdataAdd.Create(self);
  FrmjmsxdataAdd.Labelno.Caption:=getmax('jmsxdata','jmxsno','jmxsname=''精煤''');
  FrmjmsxdataAdd.AutoInCombobox(FrmjmsxdataAdd.ComboUser,'select CustomName from customs');
  FrmjmsxdataAdd.DatePicker1.Date:=now();
  FrmjmsxdataAdd.ShowModal;
  l_init
end;

procedure TFrmjmsxdata.Button2Click(Sender: TObject);
begin
  inherited;
  FrmjmsxdataAdd:=TFrmjmsxdataAdd.Create(self);
  FrmjmsxdataAdd.AutoInCombobox(FrmjmsxdataAdd.ComboUser,'select CustomName from customs');
  FrmjmsxdataAdd.Labelno.Caption:=ADOQuery1.fieldbyname('jmxsno').AsString;
  FrmjmsxdataAdd.DatePicker1.Date:=ADOQuery1.fieldbyname('jmxsdate').AsDateTime;
  FrmjmsxdataAdd.ComboUser.Text:=ADOQuery1.fieldbyname('jmtpuser').AsString;
  FrmjmsxdataAdd.Edtph.Text:=ADOQuery1.fieldbyname('jmxsph').AsString;
  FrmjmsxdataAdd.Edtwt.Text:=ADOQuery1.fieldbyname('jmxswt').AsString;
  FrmjmsxdataAdd.Edttkno.text:=ADOQuery1.fieldbyname('jmtpnum').AsString;
  FrmjmsxdataAdd.ShowModal;
  
  l_init
end;

procedure TFrmjmsxdata.FormShow(Sender: TObject);
begin
  inherited;
   l_init
end;

procedure TFrmjmsxdata.Button3Click(Sender: TObject);
begin
  inherited;
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN begin
      savelog('删除<'+ADOQuery1.fieldbyname('jmtpuser').AsString+'>客户'+
  '销售记录,销量'+ADOQuery1.fieldbyname('jmxswt').AsString+'吨',ADOQuery1.fieldbyname('jmxsno').AsString,'精煤销售数据录入');
    DeleteSelection;
    end
    ELSE
      IF FocusedNode <> nil THEN begin
       savelog('删除<'+ADOQuery1.fieldbyname('jmtpuser').AsString+'>客户'+ADOQuery1.fieldbyname('jmxsdate').AsString+ADOQuery1.fieldbyname('jmxsname').AsString+
      '销售记录,销量'+ADOQuery1.fieldbyname('jmxswt').AsString+'吨',ADOQuery1.fieldbyname('jmxsno').AsString,'精煤销售数据录入');
      TdxDBGridNode(FocusedNode).Delete;
      end;
  END;
end;

procedure TFrmjmsxdata.Button8Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
    sqlstr:='select * from jmsxdata where jmxsdate between '+#39+datetostr(DatePicker1.Date)+#39+' and '+#39+datetostr(DatePicker2.Date)+#39+'';
    adoqryopen(ADOQuery1,sqlstr);
    ADOQuery1.Refresh;
end;

end.
