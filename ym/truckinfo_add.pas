unit truckinfo_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm_add, DB, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  TFrmTruckInfo_Add = class(TFrmAdd)
    Labtpuntno: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Combotkunt: TComboBox;
    Edtdriver: TEdit;
    Edttkwt: TEdit;
    Edttknum: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure EdttkwtKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTruckInfo_Add: TFrmTruckInfo_Add;

implementation

uses truckinfo,main;

{$R *.dfm}

procedure TFrmTruckInfo_Add.BitBtn1Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  IF (CheckAllNull()=False) THEN begin
    MessageBox(Handle, '资料未填写全,请检查!', '错误', MB_ICONERROR or MB_OK) ;
    ABORT
  END;
  adoqryopen(ADOQtmp,'select tpno from tpunit where tpunitname='''+Combotkunt.Text+'''');
  Labtpuntno.Caption:=ADOQtmp.fieldbyname('tpno').AsString;
  if FrmTruckInfo.laction='ADD' then begin
            if CheckExist('truckinfo','tknumber='+#39+trim(Edttknum.Text)+#39) then begin
                  MessageBox(Handle, pchar('车牌号  '+trim(Edttknum.text)+'  已存在,不能重复添加!'), '提示', MB_ICONERROR or MB_OK) ;
                  abort;
            end;
            sqlstr:='insert into truckinfo (tkno,tkunitno,tkunitname,tknumber,driver,tktrukwt) values ('+
                                  Labelno.Caption+','+
                                  Labtpuntno.Caption+','+
                                  #39+trim(Combotkunt.text)+#39+','+
                                  #39+trim(Edttknum.Text)+#39+','+
                                  #39+trim(Edtdriver.Text)+#39+','+
                                  Edttkwt.Text+','+
                                  #39+g_date+#39+','+
                                  #39+curuser.Name+#39+
                                  ')';
            savelog('增加<'+Edttknum.Text+'>运输车辆记录',Labelno.Caption,'承运车号录入');
  end
  else if  FrmTruckInfo.laction='MODIFY' then begin
           sqlstr:='update truckinfo set tkunitno='+Labtpuntno.Caption+','+
                                  'tkunitname='+#39+trim(Combotkunt.Text)+#39+','+
                                  'tknumber='+#39+trim(Edttknum.Text)+#39+','+
                                  'driver='+#39+trim(Edtdriver.Text)+#39+','+
                                  'tktrukwt='+Edttkwt.Text+','+
                                  'keydate='+#39+datetostr(now)+#39+','+
                                  'keyuser='+#39+curuser.Name+#39+                                  
                                  ' where tkno='+Labelno.Caption;
       //    savelog('修改<'+Edttknum.Text+'>运输车辆记录',Labelno.Caption,'承运车号录入');
  end;
  adoqryexec(ADOQtmp,sqlstr);
  self.Close;

end;

procedure TFrmTruckInfo_Add.EdttkwtKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if not(key in ['1','2','3','4','5','6','7','8','9','0','.',#30]) then
  abort;
end;

end.
