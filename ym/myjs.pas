unit myjs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, ADODB, DB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls, dxDBTLCl, dxGrClms, ComCtrls;

type
  TFrmmyjs = class(TFrmMather)
    dxDBGrid1ymjsno: TdxDBGridMaskColumn;
    dxDBGrid1ymjscoal: TdxDBGridColumn;
    dxDBGrid1ymjsweight: TdxDBGridMaskColumn;
    dxDBGrid1ymjsdate: TdxDBGridDateColumn;
    dxDBGrid1ymjssign: TdxDBGridCheckColumn;
    dxDBGrid1ymjsmonth: TdxDBGridColumn;
    dxDBGrid1ymjsprc: TdxDBGridCurrencyColumn;
    dxDBGrid1ymjsprctax: TdxDBGridCurrencyColumn;
    dxDBGrid1ymjstpprc: TdxDBGridCurrencyColumn;
    dxDBGrid1ymjstpprctax: TdxDBGridCurrencyColumn;
    Button5: TButton;
    dxDBGrid1ymkkwt: TdxDBGridColumn;
    Button7: TButton;
    ComboJsFs: TComboBox;
    dxDBGrid1Column12: TdxDBGridMaskColumn;
    dxDBGrid1Column13: TdxDBGridMaskColumn;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure dxDBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboJsFsSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     function l_init:boolean;
  end;

var
  Frmmyjs: TFrmmyjs;

implementation

uses myjs_add, myjs_select;

{$R *.dfm}

procedure TFrmmyjs.Button1Click(Sender: TObject);
begin
  inherited;
  FRMMyjsSelect:=TFRMMyjsSelect.Create(self);
 // Frmmyjs_add.SMonth:=INPUTBOX('输入框','请输入要结算的月份   输入格式YYYY-MM-DD',datetostr(date()));
  //if Frmmyjs_add.SMonth<>'' then begin
      FRMMyjsSelect.ShowModal;
      (Sender as TButton).Enabled:=true;
 // end;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TFrmmyjs.FormShow(Sender: TObject);
begin
  inherited;
l_init;
end;
function TFrmmyjs.l_init:boolean;
VAR sqlstr:string;
begin
    sqlstr:='select mtsysymjsfs from  mtsys';
    adoqryopen(ADOQuery1,sqlstr);
    if ADOQuery1.Fields[0].AsString='月单笔结算'  then
       ComboJsFs.Text:= '月单笔结算'
    else if ADOQuery1.Fields[0].AsString='月多笔结算' then
       ComboJsFs.Text:= '月多笔结算' ;
    sqlstr:='select * from ymjs';
    //tpno,tpdate,tpunit,tptruckno,tpcoal,tptotalwt,tpsuttle,tpzhz,hzpay
    adoqryopen(ADOQuery1,sqlstr);
    ADOQuery1.Refresh;
end;
procedure TFrmmyjs.Button5Click(Sender: TObject);
VAR sqlstr:string;
     DW:INTEGER;
begin
  inherited;
   IF ADOQuery1.fieldbyname('ymjssign').AsString='1' THEN BEGIN
      MessageBox(Handle, '确定此笔结报已付款,不能重复付款!', '提示', MB_ICONERROR or MB_OK);
      ABORT;
   END;
   IF MessageBox(Handle, '确定此笔结报付款,之后不能修改!', '提示', MB_ICONINFORMATION or MB_YESNO)=7 THEN
   ABORT;

   sqlstr:='update ymjs set ymjssign=1 where ymjsno='+ADOQuery1.fieldbyname('ymjsno').AsString;
   Adoqryexec(ADOQtmp,sqlstr);
   l_init
end;

procedure TFrmmyjs.Button3Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
   IF ADOQuery1.fieldbyname('ymjssign').AsString='1' THEN BEGIN
      MessageBox(Handle, '确定此笔结报已付款,不能删除!', '提示', MB_ICONERROR or MB_OK);
      ABORT;
   END;
  sqlstr:='update ymkkdata set ymkksign=0,ymjsno=0 where ymkkdate='''+ADOQuery1.fieldbyname('ymjsmonth').AsString+
                                                ''' and ymjsno='''+ ADOQuery1.fieldbyname('ymjsno').AsString+
                                                  ''' and ymkkcoal='''+ADOQuery1.fieldbyname('ymjscoal').AsString+'''';
  Adoqryexec(ADOQtmp,sqlstr);
  sqlstr:='select startdate,enddate from kjqj where kjqj='+#39+ADOQuery1.fieldbyname('ymjsmonth').AsString+#39;
  adoqryopen(ADOQtmp,sqlstr);
  sqlstr:='update wroomdata set tpzhz=0,ymjsno=0 where tpdate between '+#39+ADOQtmp.fieldbyname('startdate').AsString+#39+
            ' and '+#39+ADOQtmp.fieldbyname('enddate').AsString+#39+' and tpcoal='''+ADOQuery1.fieldbyname('ymjscoal').AsString+''''
            +' and ymjsno='+ADOQuery1.fieldbyname('ymjsno').AsString;
  Adoqryexec(ADOQtmp,sqlstr);
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN begin
       savelog('删除<'+ADOQuery1.fieldbyname('ymprccoal').AsString+'>煤矿'+
         ADOQuery1.fieldbyname('jmjsdate').AsString+'结算记录',ADOQuery1.fieldbyname('ymjsno').AsString,'原煤煤款运费结算');

        DeleteSelection
    end
    ELSE
      IF FocusedNode <> nil THEN begin
      savelog('删除<'+ADOQuery1.fieldbyname('ymprccoal').AsString+'>煤矿'+
        ADOQuery1.fieldbyname('jmjsdate').AsString+'结算记录',ADOQuery1.fieldbyname('ymjsno').AsString,'原煤煤款运费结算');

      TdxDBGridNode(FocusedNode).Delete;
      end;
  END;
end;

procedure TFrmmyjs.Button7Click(Sender: TObject);
begin
  inherited;
  Frmmyjs_add:=TFrmmyjs_add.Create(self);
  Frmmyjs_add.ymjsno:=ADOQuery1.fieldbyname('ymjsno').AsString;
  Frmmyjs_add.ShowModal;
end;

procedure TFrmmyjs.dxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Button7.Click
end;

procedure TFrmmyjs.Button2Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
   sqlstr:='update ymjs set ymjssign=0 where ymjsno='+ADOQuery1.fieldbyname('ymjsno').AsString;
   Adoqryexec(ADOQtmp,sqlstr);
end;

procedure TFrmmyjs.ComboJsFsSelect(Sender: TObject);
VAR sqlstr:string;
begin
  inherited;
    if ComboJsFs.Text= '月单笔结算' then
        sqlstr:='update mtsys set mtsysymjsfs=''月单笔结算'''
    else if ComboJsFs.Text= '月多笔结算' then
        sqlstr:='update mtsys set mtsysymjsfs=''月多笔结算''';
    adoqryexec(ADOQtmp,sqlstr);
end;

end.
