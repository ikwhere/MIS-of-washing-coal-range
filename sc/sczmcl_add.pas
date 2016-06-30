unit sczmcl_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm_add, DB, ADODB, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFrmSczmclAdd = class(TFrmAdd)
    Label14: TLabel;
    DatePicker1: TDateTimePicker;
    Label4: TLabel;
    Combobc: TComboBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Edtzmcl: TEdit;
    Label11: TLabel;
    Edtzmcs: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edtgscl: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edtgscs: TEdit;
    Label8: TLabel;
    Edtnmcl: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Edtnmcs: TEdit;
    Label13: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure EdtzmclKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdtzmcsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtgscsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtnmcsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSczmclAdd: TFrmSczmclAdd;
  sczmdate,sczmbc:String;
implementation

uses sczmcl,main;

{$R *.dfm}

procedure TFrmSczmclAdd.EdtzmclKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not(key in ['1','2','3','4','5','6','7','8','9','0','.',#30]) then
    abort;
end;

procedure TFrmSczmclAdd.BitBtn1Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  IF (CheckAllNull()=False) THEN begin
    MessageBox(Handle, '资料未填写全,请检查!', '错误', MB_ICONERROR or MB_OK) ;
    ABORT
  END;
  IF trim(Edtzmcl.Text)='' THEN  Edtzmcl.Text:='0';
  IF trim(Edtzmcs.Text)='' THEN  Edtzmcs.Text:='0';

  IF trim(Edtgscl.Text)='' THEN  Edtgscl.Text:='0';
  IF trim(Edtgscs.Text)='' THEN  Edtgscs.Text:='0';
  IF trim(Edtnmcl.Text)='' THEN  Edtnmcl.Text:='0';
  IF trim(Edtnmcs.Text)='' THEN  Edtnmcs.Text:='0';
  if FrmSczmcl.laction='ADD' then begin
            sqlstr:='insert into sczm (sczmno,sczmdate,sczmbc,sczmcl,sczmcs,scgscl,scgscs,scnmcl,scnmcs,keydate,keyuser) values ('+
                                  Labelno.Caption+','+
                                  #39+datetostr(DatePicker1.Date)+#39+','+
                                  #39+trim(Combobc.Text)+#39+','+
                                  trim(Edtzmcl.Text)+','+
                                  trim(Edtzmcs.Text)+','+
                                  trim(Edtgscl.Text)+','+
                                  trim(Edtgscs.Text)+','+
                                  trim(Edtnmcl.Text)+','+
                                  trim(Edtnmcs.Text)+','+
                                  #39+g_date+#39+','+
                                  #39+curuser.Name+#39+
                                  ')';
           savelog('增加<'+datetostr(DatePicker1.Date)+'>'+trim(Combobc.Text)+
           '中煤/泥煤/矸石生产记录',Labelno.Caption,'中煤/矸石/泥煤产量录入');
  end
  else if  FrmSczmcl.laction='MODIFY' then begin
           sqlstr:='update sczm set sczmdate='+#39+datetostr(DatePicker1.date)+#39+','+
                                  'sczmbc='+#39+trim(Combobc.Text)+#39+','+
                                  'sczmcl='+trim(Edtzmcl.Text)+','+
                                  'sczmcs='+trim(Edtzmcs.Text)+','+
                                  'scgscl='+trim(Edtgscl.Text)+','+
                                  'scgscs='+trim(Edtgscs.Text)+','+
                                  'scnmcl='+trim(Edtnmcl.Text)+','+
                                  'scnmcs='+trim(Edtnmcs.Text)+','+
                                  'keydate='+#39+datetostr(now)+#39+ ','+
                                  'keyuser='+#39+curuser.Name+#39+
                                  ' where sczmno='+Labelno.Caption;
            savelog('修改<'+sczmdate+'>'+sczmbc+'中煤/泥煤/矸石生产记录',Labelno.Caption,'中煤/矸石/泥煤产量录入');
  end;
  adoqryexec(ADOQtmp,sqlstr);
  self.Close;
end;

procedure TFrmSczmclAdd.EdtzmcsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR sqlstr:string;
begin
  inherited;
  sqlstr:='select scpductkunitv,scpductkunitv1 from scpductkwt where scpductkname='+#39+'中煤'+#39+' and scpductkunit='+#39+'车'+#39;
  adoqryopen(ADOQuery1,sqlstr);
  try
  IF (ADOQuery1.fieldbyname('scpductkunitv1').AsString='') OR (ADOQuery1.fieldbyname('scpductkunitv').AsString='') THEN begin
      MessageBox(Handle, '您未维护相关产量与车载相关转换数据!', '提示', MB_ICONERROR or MB_OK) ;
    //  Edtzmcs.Text:='';
      ABORT;
  END;
  Edtzmcl.Text:=floattostr(strtofloat(Edtzmcs.Text)*ADOQuery1.fieldbyname('scpductkunitv1').AsFloat/ADOQuery1.fieldbyname('scpductkunitv').AsFloat);
  except
  end;
end;

procedure TFrmSczmclAdd.EdtgscsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR sqlstr:string;
begin
  inherited;
  sqlstr:='select scpductkunitv,scpductkunitv1 from scpductkwt where scpductkname='+#39+'矸石'+#39+' and scpductkunit='+#39+'车'+#39;
  adoqryopen(ADOQuery1,sqlstr);
  try
  IF (ADOQuery1.fieldbyname('scpductkunitv1').AsString='') OR (ADOQuery1.fieldbyname('scpductkunitv').AsString='') THEN BEGIN
      MessageBox(Handle, '您未维护相关产量与车载相关转换数据!', '提示', MB_ICONERROR or MB_OK) ;
   //   Edtgscs.Text:='';
      ABORT
  END;

    Edtgscl.Text:=floattostr(strtofloat(Edtgscs.Text)*ADOQuery1.fieldbyname('scpductkunitv1').AsFloat/ADOQuery1.fieldbyname('scpductkunitv').AsFloat);
  except
  end;
end;

procedure TFrmSczmclAdd.EdtnmcsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR sqlstr:string;
begin
  inherited;
  sqlstr:='select scpductkunitv,scpductkunitv1 from scpductkwt where scpductkname='+#39+'泥煤'+#39+' and scpductkunit='+#39+'铲'+#39;
  adoqryopen(ADOQuery1,sqlstr);
  try
  IF (ADOQuery1.fieldbyname('scpductkunitv1').AsString='') OR (ADOQuery1.fieldbyname('scpductkunitv').AsString='') THEN BEGIN
      MessageBox(Handle, '您未维护相关产量与车载相关转换数据!', '提示', MB_ICONERROR or MB_OK) ;
    //  Edtnmcs.Text:='';
      ABORT
  END;
  Edtnmcl.Text:=floattostr(strtofloat(Edtnmcs.Text)*ADOQuery1.fieldbyname('scpductkunitv1').AsFloat/ADOQuery1.fieldbyname('scpductkunitv').AsFloat);
  except
  end;
end;

procedure TFrmSczmclAdd.Button1Click(Sender: TObject);
begin
  inherited;
  Edtzmcl.Enabled:=NOT Edtzmcl.Enabled
end;

procedure TFrmSczmclAdd.Button2Click(Sender: TObject);
begin
  inherited;
  Edtgscl.Enabled:=NOT Edtzmcl.Enabled
end;

procedure TFrmSczmclAdd.Button3Click(Sender: TObject);
begin
  inherited;
  Edtnmcl.Enabled:=NOT Edtzmcl.Enabled
end;

procedure TFrmSczmclAdd.FormShow(Sender: TObject);
begin
  inherited;
  if  FrmSczmcl.laction='MODIFY' then begin
     sczmdate:=datetostr(DatePicker1.date);
     sczmbc:=trim(Combobc.Text);
  end;
end;

end.
