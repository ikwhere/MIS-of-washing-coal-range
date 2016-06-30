unit customs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmCustoms = class(TFrmMather)
    dxDBGrid1CustomNo: TdxDBGridMaskColumn;
    dxDBGrid1CustomName: TdxDBGridMaskColumn;
    dxDBGrid1Column3: TdxDBGridMaskColumn;
    dxDBGrid1Column4: TdxDBGridMaskColumn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  FrmCustoms: TFrmCustoms;

implementation
uses customs_add;
{$R *.dfm}
function TFrmCustoms.l_init:boolean;
var sqlstr:string;
begin
  sqlstr:='select * from customs';
  adoqryopen(ADOQuery1,sqlstr);
end;
procedure TFrmCustoms.Button1Click(Sender: TObject);
begin
  inherited;
  FrmCustomsAdd:=TFrmCustomsAdd.Create(self);
  FrmCustomsAdd.Labelno.Caption:=getmax('customs','CustomNo');
  FrmCustomsAdd.ShowModal;
  l_init
end;

procedure TFrmCustoms.Button2Click(Sender: TObject);
begin
  inherited;
  FrmCustomsAdd:=TFrmCustomsAdd.Create(self);
  FrmCustomsAdd.Labelno.Caption:=ADOQuery1.fieldbyname('CustomNo').AsString;
  FrmCustomsAdd.EdtName.text:=ADOQuery1.fieldbyname('CustomName').AsString;

end;

procedure TFrmCustoms.FormShow(Sender: TObject);
begin
  inherited;
l_init
end;

procedure TFrmCustoms.Button3Click(Sender: TObject);
begin
  inherited;
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN BEGIN
        savelog('删除<'+ADOQuery1.fieldbyname('CustomName').AsString+'>'+
        '客户信息记录',ADOQuery1.fieldbyname('CustomNo').AsString,'客户单位维护');
        DeleteSelection
        END
    ELSE
      IF FocusedNode <> nil THEN BEGIN
         savelog('删除<'+ADOQuery1.fieldbyname('CustomName').AsString+'>'+
        '客户信息记录',ADOQuery1.fieldbyname('CustomNo').AsString,'客户单位维护');
        TdxDBGridNode(FocusedNode).Delete;
      END;
  END;
end;

end.
