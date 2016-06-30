unit sxjs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, ComCtrls, StdCtrls, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, dxDBTLCl, dxGrClms;

type
  TFrmsxjs = class(TFrmMather)
    dxDBGrid1xsjsno: TdxDBGridMaskColumn;
    dxDBGrid1xsjscustomer: TdxDBGridMaskColumn;
    dxDBGrid1xsjsname: TdxDBGridMaskColumn;
    dxDBGrid1xsjsweight: TdxDBGridMaskColumn;
    dxDBGrid1xsjsdate: TdxDBGridMaskColumn;
    dxDBGrid1xsjsprc: TdxDBGridMaskColumn;
    dxDBGrid1xsjsprctax: TdxDBGridMaskColumn;
    dxDBGrid1xsjstpprc: TdxDBGridMaskColumn;
    dxDBGrid1xsjstpprctax: TdxDBGridMaskColumn;
    dxDBGrid1xsjssign: TdxDBGridCheckColumn;
    dxDBGrid1xsjsmonth: TdxDBGridMaskColumn;
    dxDBGrid1xsjskkwt: TdxDBGridMaskColumn;
    dxDBGrid1Column13: TdxDBGridColumn;
    dxDBGrid1Column14: TdxDBGridColumn;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxDBGrid1DblClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  Frmsxjs: TFrmsxjs;

implementation

{$R *.dfm}
uses  xsjs_select, xsjs_add;
procedure TFrmsxjs.Button1Click(Sender: TObject);
begin
  inherited;
  FrmXsjsSelect:=TFrmXsjsSelect.Create(self);
  FrmXsjsSelect.ShowModal;
  (Sender as TButton).Enabled:=true;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TFrmsxjs.Button3Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
   IF ADOQuery1.fieldbyname('xsjssign').AsString='1' THEN BEGIN
      MessageBox(Handle, '确定此笔结报已付款,不能删除!', '提示', MB_ICONERROR or MB_OK);
      ABORT;
   END;
  sqlstr:='update xskkdata set xskksign=0,xsjsno=0 where xskkdate='''+ADOQuery1.fieldbyname('xsjsmonth').AsString+
                                                ''' and xsjsno='''+ ADOQuery1.fieldbyname('xsjsno').AsString+
                                                  ''' and xskkcustomer='''+ADOQuery1.fieldbyname('xsjscustomer').AsString+'''';
  Adoqryexec(ADOQtmp,sqlstr);
  sqlstr:='select startdate,enddate from kjqj where kjqj='+#39+ADOQuery1.fieldbyname('xsjsmonth').AsString+#39;
  adoqryopen(ADOQtmp,sqlstr);
  sqlstr:='update jmsxdata set jmxssign=0,xsjsno=0 where jmxsdate between '+#39+ADOQtmp.fieldbyname('startdate').AsString+#39+
            ' and '+#39+ADOQtmp.fieldbyname('enddate').AsString+#39+' and jmtpuser='''+ADOQuery1.fieldbyname('xsjscustomer').AsString+''''
            +' and xsjsno='+ADOQuery1.fieldbyname('xsjsno').AsString;
  Adoqryexec(ADOQtmp,sqlstr);
  savelog('删除<'+ADOQuery1.fieldbyname('xsjscustomer').AsString+'>客户'+
  ADOQuery1.fieldbyname('xsjsmonth').AsString+'销售结算记录',ADOQuery1.fieldbyname('xsjsno').AsString,'销售结算');
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN begin
         savelog('删除<'+ADOQuery1.fieldbyname('xsjscustomer').AsString+'>客户'+ADOQuery1.fieldbyname('xsjsdate').AsString+
        '销售结算'+'记录',ADOQuery1.fieldbyname('jsxsno').AsString,'销售结算');

        DeleteSelection
    end
    ELSE
      IF FocusedNode <> nil THEN begin
         savelog('删除<'+ADOQuery1.fieldbyname('xsjscustomer').AsString+'>客户'+ADOQuery1.fieldbyname('xsjsdate').AsString+
        '销售结算'+'记录',ADOQuery1.fieldbyname('jsxsno').AsString,'销售结算');
        TdxDBGridNode(FocusedNode).Delete;
      end;
  END;
end;

procedure TFrmsxjs.Button5Click(Sender: TObject);
begin
  inherited;
  FrmXsjsAdd:=TFrmXsjsAdd.Create(self);
  FrmXsjsAdd.xsjsno:=ADOQuery1.fieldbyname('xsjsno').AsString;
  FrmXsjsAdd.ShowModal;
end;
function TFrmsxjs.l_init:boolean;
VAR sqlstr:string;
begin

    sqlstr:='select * from xsjs';
    //tpno,tpdate,tpunit,tptruckno,tpcoal,tptotalwt,tpsuttle,tpzhz,hzpay
    adoqryopen(ADOQuery1,sqlstr);
    ADOQuery1.Refresh;
end;
procedure TFrmsxjs.FormShow(Sender: TObject);
begin
  inherited;
l_init
end;

procedure TFrmsxjs.dxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  button5.Click;
end;

procedure TFrmsxjs.Button8Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
    sqlstr:='select * from xsjs where xsjsdate between '+#39+datetostr(DatePicker1.Date)+#39+' and '+#39+datetostr(DatePicker2.Date)+#39+'';
    adoqryopen(ADOQuery1,sqlstr);
    ADOQuery1.Refresh;
end;

end.
