unit scjmzl_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm_add, DB, ADODB, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFrmScjmAdd = class(TFrmAdd)
    Label14: TLabel;
    DatePicker1: TDateTimePicker;
    Label4: TLabel;
    Combobc: TComboBox;
    Label6: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Edthf: TEdit;
    Edtlf: TEdit;
    Edttz: TEdit;
    Edthff: TEdit;
    Edtnj: TEdit;
    Label5: TLabel;
    Edtcl: TEdit;
    Label7: TLabel;
    TimePicker1: TDateTimePicker;
    TimePicker2: TDateTimePicker;
    Label8: TLabel;
    Label3: TLabel;
    Edtfc: TEdit;
    REdtbz: TRichEdit;
    Label9: TLabel;
    Label11: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure EdthfKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmScjmAdd: TFrmScjmAdd;
  scjmdate,scjmbc:string;
implementation

uses scjmzl,main;

{$R *.dfm}

procedure TFrmScjmAdd.BitBtn1Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  IF (CheckAllNull()=False) THEN begin
    MessageBox(Handle, '资料未填写全,请检查!', '错误', MB_ICONERROR or MB_OK) ;
    ABORT
  END;

  if Frmscjm.laction='ADD' then begin
            sqlstr:='insert into scjm (scjmno,scjmdate,scjmbc,scjmstime,scjmetime,scjmcl,scjmhf,scjmhff,scjmlf,scjmtz,scjmfc,scjmnj,scjmbz,keydate,keyuser) values ('+
                                  Labelno.Caption+','+
                                  #39+datetostr(DatePicker1.Date)+#39+','+
                                  #39+trim(Combobc.Text)+#39+','+
                                  #39+timetostr(TimePicker1.time)+#39+','+
                                  #39+timetostr(TimePicker2.time)+#39+','+
                                  trim(Edtcl.Text)+','+
                                  Edthf.Text+','+
                                  Edthff.Text+','+
                                  Edtlf.Text+','+
                                  Edttz.Text+','+
                                  Edtfc.Text+','+
                                  Edtnj.Text+','+
                                  #39+REdtbz.Text+#39+','+
                                  #39+g_date+#39+','+
                                  #39+curuser.Name+#39+
                                  ')';
      savelog('增加<'+datetostr(DatePicker1.Date)+'>'+
      Combobc.Text+'精煤质量记录',Labelno.Caption,'精煤产量/质量录入');
  end
  else if  Frmscjm.laction='MODIFY' then begin
           sqlstr:='update scjm set scjmdate='+#39+datetostr(DatePicker1.date)+#39+','+
                                  'scjmbc='+#39+trim(Combobc.Text)+#39+','+
                                  'scjmstime='+#39+timetostr(TimePicker1.time)+#39+','+
                                  'scjmetime='+#39+timetostr(TimePicker2.time)+#39+','+
                                  'scjmcl='+trim(Edtcl.Text)+','+
                                  'scjmhf='+trim(Edthf.Text)+','+
                                  'scjmhff='+trim(Edthff.Text)+','+
                                  'scjmlf='+trim(Edtlf.Text)+','+
                                  'scjmtz='+trim(Edttz.Text)+','+
                                  'scjmfc='+trim(Edtfc.Text)+','+
                                  'scjmnj='+trim(Edtnj.Text)+','+
                                  'scjmbz='+#39+trim(REdtbz.Text)+#39+','+
                                  'keydate='+#39+datetostr(now)+#39+ ','+
                                  'keyuser='+#39+curuser.Name+#39+
                                  ' where scjmno='+Labelno.Caption;
        savelog('修改<'+datetostr(DatePicker1.Date)+'>'+
      Combobc.Text+'精煤质量记录',Labelno.Caption,'精煤产量/质量录入');
  end;
  adoqryexec(ADOQtmp,sqlstr);
  self.Close;
end;

procedure TFrmScjmAdd.EdthfKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not(key in ['1','2','3','4','5','6','7','8','9','0','.',#30]) then
    abort;
end;

procedure TFrmScjmAdd.FormShow(Sender: TObject);
begin
  inherited;
  if  Frmscjm.laction='MODIFY' then begin
     scjmdate:=datetostr(DatePicker1.date);
     scjmbc:=Combobc.Text
end;
end;

end.
