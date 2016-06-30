unit ymzl_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm_add, DB, ADODB, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFrmYmzlAdd = class(TFrmAdd)
    Label4: TLabel;
    Label3: TLabel;
    Edtback: TEdit;
    Label6: TLabel;
    Edthf: TEdit;
    Edtlf: TEdit;
    Label10: TLabel;
    Edttz: TEdit;
    Label12: TLabel;
    Edthff: TEdit;
    Label14: TLabel;
    DatePicker1: TDateTimePicker;
    ComboCoal: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Edtnj: TEdit;
    REdtbz: TRichEdit;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure EdttzKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmYmzlAdd: TFrmYmzlAdd;
  ymzlcoal,ymzldate:string;
implementation

uses ymzl,main;

{$R *.dfm}

procedure TFrmYmzlAdd.BitBtn1Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  IF (CheckAllNull()=False) THEN begin
    MessageBox(Handle, '资料未填写全,请检查!', '错误', MB_ICONERROR or MB_OK) ;
    ABORT
  END;

  if Frmymzl.laction='ADD' then begin
            sqlstr:='insert into ymzl (ymzlno,ymzlcoal,ymzldate,ymzlback,ymzlhf,ymzllf,ymzltz,ymzlhff,ymzlnj,ymzlbz,keydate,keyuser) values ('+
                                  Labelno.Caption+','+
                                  #39+trim(ComboCoal.text)+#39+','+
                                  #39+datetostr(DatePicker1.date)+#39+','+
                                  Edtback.Text+','+
                                  Edthf.Text+','+
                                  Edtlf.Text+','+
                                  Edttz.Text+','+
                                  Edthff.Text+','+
                                  Edtnj.Text+','+
                                  #39+REdtbz.Text+#39+','+
                                  #39+g_date+#39+','+
                                  #39+curuser.Name+#39+
                                  ')';
        savelog('增加<'+ComboCoal.text+'>煤矿'+datetostr(DatePicker1.date)+'原煤供货结算记录',Labelno.Caption,'原煤质量数据录入');
  end
  else if  Frmymzl.laction='MODIFY' then begin
           sqlstr:='update ymzl set ymzlcoal='+#39+trim(ComboCoal.Text)+#39+','+
                                  'ymzldate='+#39+datetostr(DatePicker1.date)+#39+','+
                                  'ymzlback='+trim(Edtback.Text)+','+
                                  'ymzlhf='+trim(Edthf.Text)+','+
                                  'ymzllf='+trim(Edtlf.Text)+','+
                                  'ymzltz='+trim(Edttz.Text)+','+
                                  'ymzlhff='+trim(Edthff.Text)+','+
                                  'ymzlnj='+trim(Edtnj.Text)+','+
                                  'ymzlbz='+#39+trim(REdtbz.Text)+#39+','+
                                  'keydate='+#39+datetostr(now)+#39+','+
                                  'keyuser='+#39+curuser.Name+#39+
                                  ' where ymzlno='+Labelno.Caption;
        savelog('修改<'+ComboCoal.text+'>煤矿'+datetostr(DatePicker1.date)+'原煤供货结算记录',Labelno.Caption,'原煤质量数据录入');
  end;
  adoqryexec(ADOQtmp,sqlstr);
  self.Close;
end;

procedure TFrmYmzlAdd.EdttzKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not(key in ['1','2','3','4','5','6','7','8','9','0','.',#30]) then
    abort;
end;

procedure TFrmYmzlAdd.FormShow(Sender: TObject);
begin
  inherited;
  if  Frmymzl.laction='MODIFY' then begin
      ymzlcoal:=trim(ComboCoal.Text);
      ymzldate:=datetostr(DatePicker1.date)
  end;
end;

end.
