unit PducTkwt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmPducTkwt = class(TFrmMather)
    dxDBGrid1scpductkno: TdxDBGridMaskColumn;
    dxDBGrid1scpductkname: TdxDBGridMaskColumn;
    dxDBGrid1scpductkunit: TdxDBGridMaskColumn;
    dxDBGrid1scpductkunitv: TdxDBGridMaskColumn;
    dxDBGrid1scpductkunit1: TdxDBGridMaskColumn;
    dxDBGrid1scpductkunitv1: TdxDBGridMaskColumn;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  FrmPducTkwt: TFrmPducTkwt;

implementation

uses PducTkwt_add;

{$R *.dfm}
function TFrmPducTkwt.l_init:boolean;
VAR sqlstr:string;
begin
  sqlstr:='select * from scpductkwt';
  adoqryopen(ADOQuery1,sqlstr);
end;
procedure TFrmPducTkwt.Button1Click(Sender: TObject);
begin
  inherited;
  FrmPducTkwtAdd:=TFrmPducTkwtAdd.Create(self);
  FrmPducTkwtAdd.Labelno.Caption:=getmax('scpductkwt','scpductkno');
  FrmPducTkwtAdd.ShowModal;
  l_init
end;

procedure TFrmPducTkwt.FormShow(Sender: TObject);
begin
  inherited;
  l_init
end;

procedure TFrmPducTkwt.Button2Click(Sender: TObject);
begin
  inherited;
  FrmPducTkwtAdd:=TFrmPducTkwtAdd.Create(self);
  FrmPducTkwtAdd.Labelno.Caption:=ADOQuery1.fieldbyname('scpductkno').AsString;
  FrmPducTkwtAdd.Edtname.TEXT:=ADOQuery1.fieldbyname('scpductkname').AsString;
  FrmPducTkwtAdd.Edtname.Enabled:=false;
  FrmPducTkwtAdd.Edtunit.TEXT:=ADOQuery1.fieldbyname('scpductkunit').AsString;
  FrmPducTkwtAdd.Edtunitv.Text:=ADOQuery1.fieldbyname('scpductkunitv').AsString;
  FrmPducTkwtAdd.Edtunit1.Text:=ADOQuery1.fieldbyname('scpductkunit1').AsString;
  FrmPducTkwtAdd.Edtunitv1.Text:=ADOQuery1.fieldbyname('scpductkunitv1').AsString;
  FrmPducTkwtAdd.ShowModal;
  l_init
end;

procedure TFrmPducTkwt.Button3Click(Sender: TObject);
begin
  inherited;
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN begin
        savelog('删除<'+ADOQuery1.fieldbyname('scpductkname').AsString+'>'+
        '单位记录',ADOQuery1.fieldbyname('scpductkno').AsString,'产品名称及单位吨数维护');
        DeleteSelection
      end
    ELSE
      IF FocusedNode <> nil THEN begin
          TdxDBGridNode(FocusedNode).Delete;
        savelog('删除<'+ADOQuery1.fieldbyname('scpductkname').AsString+'>'+
        '单位记录',ADOQuery1.fieldbyname('scpductkno').AsString,'产品名称及单位吨数维护');
      end;
  END;

end;

end.
