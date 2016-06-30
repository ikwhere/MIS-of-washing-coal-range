unit jmsxzldata_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm_add, DB, ADODB, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFrmjmsxzldataadd = class(TFrmAdd)
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Label1: TLabel;
    DatePicker1: TDateTimePicker;
    Edtsf: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edthff: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edthf: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edttz: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edtlf: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edtljzs: TEdit;
    Label13: TLabel;
    procedure EdtsfKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmjmsxzldataadd: TFrmjmsxzldataadd;
  jmsxzldate:string;
implementation

uses jmsxzldata, MAIN;

{$R *.dfm}

procedure TFrmjmsxzldataadd.EdtsfKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not(key in ['1','2','3','4','5','6','7','8','9','0','.',#30]) then
    abort;
end;

procedure TFrmjmsxzldataadd.BitBtn1Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  IF (CheckAllNull()=False) THEN begin
    MessageBox(Handle, '资料未填写全,请检查!', '错误', MB_ICONERROR or MB_OK) ;
    ABORT
  END;
  IF trim(Edtsf.Text)='' THEN  Edtsf.Text:='0';
  IF trim(Edthf.Text)='' THEN  Edthf.Text:='0';

  IF trim(Edtlf.Text)='' THEN  Edtlf.Text:='0';
  IF trim(Edthff.Text)='' THEN  Edthff.Text:='0';
  IF trim(Edttz.Text)='' THEN  Edttz.Text:='0';
  IF trim(Edtljzs.Text)='' THEN  Edtljzs.Text:='0';
  if Frmjmsxzldata.laction='ADD' then begin
            sqlstr:='insert into jmsxzldata (jmsxzlno,jmsxzldate,jmsxzlsf,jmsxzlhf,jmsxzllf,jmsxzltz,jmsxzlhff,jmsxzlljzs,jmsxzlkeydate,jmsxzlkeyuser) values ('+
                                  Labelno.Caption+','+
                                  #39+datetostr(DatePicker1.Date)+#39+','+
                                  trim(Edtsf.Text)+','+
                                  trim(Edthf.Text)+','+
                                  trim(Edtlf.Text)+','+
                                  trim(Edttz.Text)+','+
                                  trim(Edthff.Text)+','+
                                  trim(Edtljzs.Text)+','+
                                  #39+g_date+#39+','+
                                  #39+curuser.Name+#39+')';
            savelog('增加<'+datetostr(DatePicker1.Date)+'>'+
            '销售精煤质量记录',Labelno.Caption,'精煤销售质量数据录入');
  end
  else if  Frmjmsxzldata.laction='MODIFY' then begin
           sqlstr:='update jmsxzldata set jmsxzldate='+#39+datetostr(DatePicker1.date)+#39+','+
                                  'jmsxzlsf='+trim(Edtsf.Text)+','+
                                  'jmsxzlhf='+trim(Edthf.Text)+','+
                                  'jmsxzllf='+trim(Edtlf.Text)+','+
                                  'jmsxzltz='+trim(Edttz.Text)+','+
                                  'jmsxzlhff='+trim(Edthff.Text)+','+
                                  'jmsxzlljzs='+trim(Edtljzs.Text)+','+
                                  'jmsxzlkeydate='+#39+g_date+#39+','+
                                  'jmsxzlkeyuser='+#39+curuser.Name+#39+
                                  ' where jmsxzlno='+Labelno.Caption;
           savelog('修改<'+jmsxzldate+'>'+
            '销售精煤质量记录',Labelno.Caption,'精煤销售质量数据录入');
  end;
  adoqryexec(ADOQtmp,sqlstr);
  self.Close;
end;

procedure TFrmjmsxzldataadd.FormShow(Sender: TObject);
begin
  inherited;
  if  Frmjmsxzldata.laction='MODIFY' then begin
          jmsxzldate:=datetostr(DatePicker1.date);
  end;
end;

end.
