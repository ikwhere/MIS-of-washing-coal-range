unit truckinfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmTruckInfo = class(TFrmMather)
    dxDBGrid1tkno: TdxDBGridMaskColumn;
    dxDBGrid1tkunitno: TdxDBGridMaskColumn;
    dxDBGrid1tkunitname: TdxDBGridMaskColumn;
    dxDBGrid1tknumber: TdxDBGridMaskColumn;
    dxDBGrid1driver: TdxDBGridMaskColumn;
    dxDBGrid1tktrukwt: TdxDBGridMaskColumn;
    dxDBGrid1Column7: TdxDBGridMaskColumn;
    dxDBGrid1Column8: TdxDBGridMaskColumn;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  FrmTruckInfo: TFrmTruckInfo;

implementation

uses truckinfo_add;

{$R *.dfm}
function TFrmTruckInfo.l_init:boolean;
VAR sqlstr:string;
begin
  sqlstr:='select * from truckinfo';
  adoqryopen(ADOQuery1,sqlstr);
end;
procedure TFrmTruckInfo.FormShow(Sender: TObject);
begin
  inherited;
  l_init
end;

procedure TFrmTruckInfo.Button1Click(Sender: TObject);
begin
  inherited;
  FrmTruckInfo_Add:=TFrmTruckInfo_Add.Create(self);
  FrmTruckInfo_Add.Labelno.Caption:=getmax('truckinfo','tkno');
  FrmTruckInfo_Add.AutoInCombobox(FrmTruckInfo_Add.Combotkunt,'select tpunitname from tpunit');
  FrmTruckInfo_Add.Combotkunt.ItemIndex:=1;
  FrmTruckInfo_Add.ShowModal;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TFrmTruckInfo.Button2Click(Sender: TObject);
begin
  inherited;
  FrmTruckInfo_Add:=TFrmTruckInfo_Add.Create(self);
  FrmTruckInfo_Add.Labelno.Caption:=ADOQuery1.Fields[0].AsString;
  FrmTruckInfo_Add.AutoInCombobox(FrmTruckInfo_Add.Combotkunt,'select tpunitname from tpunit');
  FrmTruckInfo_Add.Labtpuntno.Caption:=ADOQuery1.Fields[1].AsString;
  FrmTruckInfo_Add.Combotkunt.TEXT:=ADOQuery1.Fields[2].AsString;
  FrmTruckInfo_Add.Edttknum.Text:=ADOQuery1.Fields[3].AsString;
  FrmTruckInfo_Add.Edtdriver.Text:=ADOQuery1.Fields[4].AsString;
  FrmTruckInfo_Add.Edttkwt.Text:=ADOQuery1.Fields[5].AsString;
  FrmTruckInfo_Add.ShowModal;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TFrmTruckInfo.Button3Click(Sender: TObject);
begin
  inherited;
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN begin
        savelog('删除<'+ADOQuery1.fieldbyname('tknumber').AsString+'>运输车辆记录',ADOQuery1.fieldbyname('tkno').AsString,'承运车号录入');
        DeleteSelection
    end
    ELSE
      IF FocusedNode <> nil THEN begin
        savelog('删除<'+ADOQuery1.fieldbyname('tknumber').AsString+'>运输车辆记录',ADOQuery1.fieldbyname('tkno').AsString,'承运车号录入');
        TdxDBGridNode(FocusedNode).Delete;
      end;
  END;

end;

end.
