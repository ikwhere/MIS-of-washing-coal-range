unit xsjs_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, ComCtrls, StdCtrls, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, dxDBTLCl, dxGrClms;

type
  TFrmXsjsAdd = class(TFrmMather)
    Panel3: TPanel;
    dxDBGrid2: TdxDBGrid;
    ADOQuery2: TADOQuery;
    dxDBGrid1jmxsno: TdxDBGridMaskColumn;
    dxDBGrid1jmtpnum: TdxDBGridMaskColumn;
    dxDBGrid1jmxsname: TdxDBGridMaskColumn;
    dxDBGrid1jmtpuser: TdxDBGridMaskColumn;
    dxDBGrid1jmxswt: TdxDBGridMaskColumn;
    dxDBGrid1jmxsdate: TdxDBGridDateColumn;
    dxDBGrid1jmxsph: TdxDBGridMaskColumn;
    dxDBGrid1jmxskeydt: TdxDBGridDateColumn;
    dxDBGrid1jmxsuser: TdxDBGridMaskColumn;
    dxDBGrid1jmxssign: TdxDBGridCheckColumn;
    dxDBGrid1xsjsno: TdxDBGridMaskColumn;
    DataSource2: TDataSource;
    dxDBGrid2xskkno: TdxDBGridMaskColumn;
    dxDBGrid2xskkdate: TdxDBGridMaskColumn;
    dxDBGrid2xskkcustomer: TdxDBGridMaskColumn;
    dxDBGrid2xskkname: TdxDBGridMaskColumn;
    dxDBGrid2xskkwt: TdxDBGridCurrencyColumn;
    dxDBGrid2xskksign: TdxDBGridCheckColumn;
    dxDBGrid2xsjsno: TdxDBGridMaskColumn;
    dxDBGrid2xskeydate: TdxDBGridMaskColumn;
    dxDBGrid2xskeyuser: TdxDBGridMaskColumn;
    Labelno: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure dxDBGrid1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SMonth:STRING;
    Scustom:STRING;
    xsjsno:string;
    function l_init:boolean;
     function l_init1:boolean;
  end;

var
  FrmXsjsAdd: TFrmXsjsAdd;

implementation
uses Main;


{$R *.dfm}
function TFrmXsjsAdd.l_init:boolean;
VAR sqlstr:string;
begin
    sqlstr:='select startdate,enddate from kjqj where kjqj='+#39+SMonth+#39;
    adoqryopen(ADOQtmp,sqlstr);
    sqlstr:='SELECT * FROM jmsxdata'+
            ' where jmxssign=0' +
            ' and jmtpuser='''+Scustom+''''+
            ' and jmxsdate between '+#39+ADOQtmp.fieldbyname('startdate').AsString+#39+
            ' and '+#39+ADOQtmp.fieldbyname('enddate').AsString+#39;
    adoqryopen(ADOQuery1,sqlstr);
    ADOQuery1.Refresh;

   sqlstr:='select * from xskkdata where xskkdate='''+SMonth+''' and xskkcustomer='+#39+Scustom+#39+' and xskksign=0';
    adoqryopen(ADOQuery2,sqlstr);
    ADOQuery2.Refresh;
end;
function TFrmXsjsAdd.l_init1:boolean;
VAR sqlstr:string;
begin
   sqlstr:='select * FROM jmsxdata'+
           ' where xsjsno='+xsjsno+' and jmxssign=1';
    adoqryopen(ADOQuery1,sqlstr);
    ADOQuery1.Refresh;

   sqlstr:='select * from xskkdata where xsjsno='+xsjsno+' and xskksign=1';
    adoqryopen(ADOQuery2,sqlstr);
    ADOQuery2.Refresh;

end;

procedure TFrmXsjsAdd.FormShow(Sender: TObject);
begin
  inherited;
  if SMonth<>'' then l_init  //添加
  else if xsjsno<>'' then
        begin           //查看
           l_init1;
           button6.visible:=false;
        end;
end;

procedure TFrmXsjsAdd.Button6Click(Sender: TObject);
var i:integer;
    sqlstr:string;
    TmpMonth:string;
    ADOQtmp1,ADOQtmp2:TADOQuery;
    jsprc:Single;
    jsprctax:Single;
    jstpprc:Single;
    jstpprctax:Single;
    kkwt:Single;
    jsds:Single;
begin
  inherited;
  ADOQtmp1:= TADOQuery.Create(self);
  ADOQtmp2:= TADOQuery.Create(self);
  sqlstr:='select mtsysymjsfs from mtsys';
  adoqryopen(ADOQtmp1,sqlstr);
  FrmXsjsAdd.Labelno.Caption:= getmax('xsjs','xsjsno');
  jsprc:=0;
  jsprctax:=0;
  jstpprc:=0;
  jstpprctax:=0;
      with dxDBGrid2.DataSource.DataSet do                    //选择结算的扣款信息
         begin
            FOR i:= 0 to dxDBGrid2.SelectedCount-1 do
            begin
              GotoBookmark(Pointer(dxDBGrid2.SelectedRows[i]));
              IF NOT Fieldbyname('xskksign').Value THEN begin
                kkwt:=kkwt+Fieldbyname('xskkwt').AsFloat;
                sqlstr:='update xskkdata set xskksign=1,xsjsno='''+FrmXsjsAdd.Labelno.Caption+''' where xskkno='+Fieldbyname('xskkno').AsString;
                Adoqryexec(ADOQtmp1,sqlstr);
                //获取单价，计算扣款总价
                sqlstr:='select * from jmprc  where jmprcdate='''+SMonth+''' and jmprcustom='''+Scustom+''' and jmprcname='''+Fieldbyname('xskkname').asstring+'''';                 //获取结算月的煤炭价格
                AdoqryOpen(ADOQtmp1,sqlstr);
                jsprc:=jsprc-kkwt*ADOQtmp1.fieldbyname('jmprc').AsFloat;
                jsprctax:=jsprctax-kkwt*ADOQtmp1.fieldbyname('jmprctax').AsFloat;
              end;
            end;
      end;
       with dxDBGrid1.DataSource.DataSet do                  //选择结算的供煤信息
         begin
            FOR   i:=0 to dxDBGrid1.SelectedCount-1 do          
            begin
              GotoBookmark(Pointer(dxDBGrid1.SelectedRows[i]));
              IF NOT Fieldbyname('jmxssign').Value THEN begin
                //更新结算标志和结算单号
                jsds:=Fieldbyname('jmxswt').AsFloat;
                sqlstr:='update jmsxdata set jmxssign=1,xsjsno='''+FrmXsjsAdd.Labelno.Caption+''' where jmxsno='+Fields[0].AsString+' and jmxsname='''+Fieldbyname('jmxsname').asstring+'''';
                Adoqryexec(ADOQtmp1,sqlstr);
                //获取单价，计算销售总价
                sqlstr:='select * from jmprc  where jmprcdate='''+SMonth+''' and jmprcustom='''+Scustom+''' and jmprcname='''+Fieldbyname('jmxsname').asstring+'''';                 //获取结算月的煤炭价格
                AdoqryOpen(ADOQtmp1,sqlstr);
                jsprc:=jsprc+jsds*ADOQtmp1.fieldbyname('jmprc').AsFloat;
                jsprctax:=jsprctax+jsds*ADOQtmp1.fieldbyname('jmprctax').AsFloat;
                jstpprc:=jstpprc+jsds*ADOQtmp1.fieldbyname('jmtpprc').AsFloat;
                jstpprctax:=jstpprctax+jsds*ADOQtmp1.fieldbyname('jmtpprctax').AsFloat;
              end;
            end;
         end;
  { sqlstr:='select * from jmprc  where jmprcdate='''+SMonth+''' and jmprcustom='''+Scustom+''' and jmprcname='''+Fieldbyname('xskkwt').asstring+'''';                 //获取结算月的煤炭价格
   AdoqryOpen(ADOQtmp1,sqlstr);
   ymjsprc:=(ymjsds-ymkkwt)*ADOQtmp1.fieldbyname('ymprc').AsFloat;
   ymjsprctax:=(ymjsds-ymkkwt)*ADOQtmp1.fieldbyname('ymprctax').AsFloat;
   ymjstpprc:=ymjsds*ADOQtmp1.fieldbyname('ymtpprc').AsFloat;
   ymjstpprctax:=ymjsds*ADOQtmp1.fieldbyname('ymtpprctax').AsFloat;   }

   sqlstr:='insert into xsjs (xsjsno,xsjscustomer,xsjsweight,xsjsdate,xsjsprc,xsjsprctax,xsjstpprc,xsjstpprctax,xsjsmonth,xsjskkwt,keydate,keyuser) '+
                        ' values ('+Labelno.Caption+','+
                                   #39+Scustom+#39+','+
                                   #39+floattostr(jsds)+#39+','+
                                   #39+datetostr(now())+#39+','+
                                   CurrToStr(jsprc)+','+
                                   CurrToStr(jsprctax)+','+
                                   CurrToStr(jstpprc)+','+
                                   CurrToStr(jstpprctax)+','+
                                   #39+SMonth+#39+','+
                                   floatToStr(kkwt)+','+
                                   #39+g_date+#39+','+
                                  #39+curuser.Name+#39+')';
   Adoqryexec(ADOQtmp1,sqlstr);
   self.Close;
   savelog('增加<'+Scustom+'>客户'+SMonth+'销售结算记录',Labelno.Caption,'销售结算');
end;

procedure TFrmXsjsAdd.dxDBGrid1Click(Sender: TObject);
begin
  inherited;
 IF (dxDBGrid1.SelectedCount>0) or (dxDBGrid2.SelectedCount>0) THEN Button6.Enabled:=TRUE ELSE Button6.Enabled:=FALSE;
end;

end.
