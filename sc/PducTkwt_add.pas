unit PducTkwt_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm_add, DB, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  TFrmPducTkwtAdd = class(TFrmAdd)
    Label6: TLabel;
    Label12: TLabel;
    Edtname: TEdit;
    Edtunit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edtunitv: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edtunit1: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    Edtunitv1: TEdit;
    Label8: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPducTkwtAdd: TFrmPducTkwtAdd;

implementation

uses PducTkwt,main;

{$R *.dfm}

procedure TFrmPducTkwtAdd.BitBtn1Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  IF (CheckAllNull()=False) THEN begin
    MessageBox(Handle, '资料未填写全,请检查!', '错误', MB_ICONERROR or MB_OK) ;
    ABORT
  END;

  if FrmPducTkwt.laction='ADD' then begin
            sqlstr:='insert into scpductkwt (scpductkno,scpductkname,scpductkunit,scpductkunitv,scpductkunit1,scpductkunitv1,keydate,keyuser) values ('+
                                  Labelno.Caption+','+
                                  #39+trim(Edtname.text)+#39+','+
                                  #39+trim(Edtunit.Text)+#39+','+
                                  trim(Edtunitv.Text)+','+
                                  #39+trim(Edtunit1.Text)+#39+','+
                                  trim(Edtunitv1.Text)+','+
                                   #39+g_date+#39+','+
                                  #39+curuser.Name+#39+
                                  ')';
         savelog('增加<'+trim(Edtunit.Text)+'>'+
        '单位记录',Labelno.Caption,'产品名称及单位吨数维护');
  end
  else if  FrmPducTkwt.laction='MODIFY' then begin
           sqlstr:='update scpductkwt set scpductkname='+#39+trim(Edtname.text)+#39+','+
                                  'scpductkunit='+#39+trim(Edtunit.Text)+#39+','+
                                  'scpductkunitv='+trim(Edtunitv.Text)+','+
                                  'scpductkunit1='+#39+trim(Edtunit1.Text)+#39+','+
                                  'scpductkunitv1='+trim(Edtunitv1.Text)+','+
                                  'keydate='+#39+datetostr(now)+#39+ ','+
                                  'keyuser='+#39+curuser.Name+#39+
                                  ' where scpductkno='+Labelno.Caption;
         savelog('修改<'+trim(Edtunit.Text)+'>'+
        '单位记录',Labelno.Caption,'产品名称及单位吨数维护');
  end;
  adoqryexec(ADOQtmp,sqlstr);
  self.Close;
end;


end.
