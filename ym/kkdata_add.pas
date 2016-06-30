unit kkdata_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm_add, DB, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  TFrmkkdataAdd = class(TFrmAdd)
    Label1: TLabel;
    Label3: TLabel;
    CombokkTime: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    EdtkkName: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edtkkwt: TEdit;
    Label7: TLabel;
    procedure EdtkkwtKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmkkdataAdd: TFrmkkdataAdd;
   ymkkdate,ymkkcoal,ymkkwt:string;

implementation

uses kkdata,main;

{$R *.dfm}

procedure TFrmkkdataAdd.EdtkkwtKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not(key in ['1','2','3','4','5','6','7','8','9','0','.',#30]) then
    abort;
end;

procedure TFrmkkdataAdd.BitBtn1Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  IF (CheckAllNull()=False) THEN begin
    MessageBox(Handle, '资料未填写全,请检查!', '错误', MB_ICONERROR or MB_OK) ;
    ABORT
  END;
{  sqlstr:='select count(ymjsmonth) from ymjs where ymjsmonth='''+trim(CombokkTime.text)+''''+
          ' and ymjscoal='''+trim(EdtkkName.text)+'''';
  adoqryopen(ADOQtmp,sqlstr);
  if ADOQtmp.Fields[0].AsString<>'0' then begin
        MessageBox(Handle, pchar(trim(EdtkkName.text)+trim(CombokkTime.text)+'原煤费用已结算,不能继续扣款!'), '提示', MB_ICONERROR or MB_OK) ;
        abort;
  end;      }
  if Frmkkdata.laction='ADD' then begin
          {  IF CheckExist('ymkkdata',' ymkkdate='''+trim(CombokkTime.text)+''' and ymkkcoal='''+trim(EdtkkName.text)+'''') THEN BEGIN
                MessageBox(Handle, pchar(trim(EdtkkName.text)+trim(CombokkTime.text)+'扣款记录已存在，不能重复添加!'), '错误', MB_ICONERROR or MB_OK) ;
                ABORT
            END;     }
            sqlstr:='insert into ymkkdata (ymkkno,ymkkdate,ymkkcoal,ymkkwt,ymkksign,keydate,keyuser) values ('+
                                  Labelno.Caption+','+
                                  #39+trim(CombokkTime.text)+#39+','+
                                  #39+trim(EdtkkName.Text)+#39+','+
                                  Edtkkwt.Text+','+
                                  '0'+','+
                                  #39+g_date+#39+','+
                                  #39+curuser.Name+#39+
                                  ')';
            savelog('增加<'+EdtkkName.Text+'>煤矿'+
             CombokkTime.text+'扣款记录，扣款'+Edtkkwt.Text+'吨',Labelno.Caption,'原煤扣款录入');
  end
  else if  Frmkkdata.laction='MODIFY' then begin
           sqlstr:='update ymkkdata set ymkkdate='+#39+trim(CombokkTime.Text)+#39+','+
                                  'ymkkcoal='+#39+trim(EdtkkName.Text)+#39+','+
                                  'ymkkwt='+Edtkkwt.Text+
                                  'keydate='+#39+datetostr(now)+#39+','+
                                  'keyuser='+#39+curuser.Name+#39+
                                  ' where ymkkno='+Labelno.Caption;
            savelog('修改<'+ymkkcoal+'>煤矿'+
             ymkkdate+'扣款记录，扣款'+ymkkwt+'吨',Labelno.Caption,'原煤扣款录入');
  end;
  adoqryexec(ADOQtmp,sqlstr);
  self.Close;

end;

procedure TFrmkkdataAdd.FormShow(Sender: TObject);
begin
  inherited;
  if  Frmkkdata.laction='MODIFY' then begin
    ymkkdate:=trim(CombokkTime.Text);
    ymkkcoal:=trim(EdtkkName.Text);
    ymkkwt:=Edtkkwt.Text
 end;
end;

end.
