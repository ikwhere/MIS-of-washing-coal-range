unit jmprc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, DB, ADODB,
  dxCntner, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmJmprc = class(TFrmMather)
    dxDBGrid1jmprcno: TdxDBGridMaskColumn;
    dxDBGrid1jmprcdate: TdxDBGridMaskColumn;
    dxDBGrid1jmprcname: TdxDBGridMaskColumn;
    dxDBGrid1jmprcustom: TdxDBGridMaskColumn;
    dxDBGrid1jmprc: TdxDBGridMaskColumn;
    dxDBGrid1jmprctax: TdxDBGridMaskColumn;
    dxDBGrid1jmtpprc: TdxDBGridMaskColumn;
    dxDBGrid1jmtpprctax: TdxDBGridMaskColumn;
    dxDBGrid1keydate: TdxDBGridMaskColumn;
    dxDBGrid1keyuser: TdxDBGridMaskColumn;
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
  FrmJmprc: TFrmJmprc;

implementation

uses jmprc_add;

{$R *.dfm}
function TFrmJmprc.l_init:boolean;
VAR sqlstr:string;
begin
  sqlstr:='select * from jmprc';
  adoqryopen(ADOQuery1,sqlstr);
end;
procedure TFrmJmprc.FormShow(Sender: TObject);
begin
  inherited;
  l_init
end;

procedure TFrmJmprc.Button1Click(Sender: TObject);
begin
  inherited;
  FrmJmPrcadd:=TFrmJmPrcadd.Create(self);
  FrmJmPrcadd.Labelno.Caption:=getmax('jmprc','jmprcno');
  FrmJmPrcadd.AutoInCombobox(FrmJmPrcadd.ComboMonth,'select kjqj from kjqj where clscunt=0  order by kjqj');
  FrmJmPrcadd.AutoInCombobox(FrmJmPrcadd.ComboCustom,'select CustomName from customs');
  FrmJmPrcadd.ShowModal;
  l_init
end;

procedure TFrmJmprc.Button2Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  {sqlstr:='select count(*) from jmsxdata where jmtpuser='''+trim(ADOQuery1.fieldbyname('jmprcustom').asstring)+''''+
          ' and jmprcname='''+trim(ADOQuery1.fieldbyname('jmxsname').asstring)+''' and jmxssign=1';
  adoqryopen(ADOQtmp,sqlstr);
  if ADOQtmp.Fields[0].AsString<>'0' then begin
        MessageBox(Handle, pchar(ADOQuery1.Fields[1].asstring+'费用已结算,价格不能修改!'), '提示', MB_ICONERROR or MB_OK) ;
        abort;
  end;    }
  FrmJmPrcadd:=TFrmJmPrcadd.Create(self);
  FrmJmPrcadd.AutoInCombobox(FrmJmPrcadd.ComboMonth,'select kjqj from kjqj where clscunt=0  order by kjqj');
  FrmJmPrcadd.AutoInCombobox(FrmJmPrcadd.ComboCustom,'select CustomName from customs');
  FrmJmPrcadd.Labelno.Caption:=ADOQuery1.fieldbyname('jmprcno').AsString;
  FrmJmPrcadd.ComboName.Text:=ADOQuery1.fieldbyname('jmprcname').AsString;
  FrmJmPrcadd.ComboCustom.Text:=ADOQuery1.fieldbyname('jmprcustom').AsString;
  FrmJmPrcadd.EdtPrc.Text:=ADOQuery1.fieldbyname('jmprc').AsString;
  FrmJmPrcadd.EdtPrctax.text:=ADOQuery1.fieldbyname('jmprctax').AsString;
  FrmJmPrcadd.Edttpprc.Text:=ADOQuery1.fieldbyname('jmtpprc').AsString;
  FrmJmPrcadd.Edttpprctax.Text:=ADOQuery1.fieldbyname('jmtpprctax').AsString;
  FrmJmPrcadd.ShowModal;
  l_init
end;

procedure TFrmJmprc.Button3Click(Sender: TObject);
begin
  inherited;
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN DeleteSelection
    ELSE
      IF FocusedNode <> nil THEN TdxDBGridNode(FocusedNode).Delete;
  END;
end;

end.
