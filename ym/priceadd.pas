unit priceadd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm_add, DB, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  TFrmPriceAdd = class(TFrmAdd)
    Labtpuntno: TLabel;
    Label3: TLabel;
    ComboPrcTime: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdtPrcym: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    EdtPrcyms: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    EdtPrctp: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    EdtPrctps: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    EdtPrcName: TComboBox;
    procedure EdtPrcymKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPriceAdd: TFrmPriceAdd;
  prcdate,ymprccoal:string;
implementation

uses price,MAIN;

{$R *.dfm}

procedure TFrmPriceAdd.EdtPrcymKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not(key in ['1','2','3','4','5','6','7','8','9','0','.',#30]) then
  abort;
end;

procedure TFrmPriceAdd.BitBtn1Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  IF (CheckAllNull()=False) THEN begin
    MessageBox(Handle, '资料未填写全,请检查!', '错误', MB_ICONERROR or MB_OK) ;
    ABORT
  END;
  sqlstr:='select count(ymjsmonth) from ymjs where ymjsmonth='''+trim(ComboPrcTime.text)+''''+
          ' and ymjscoal='''+trim(EdtPrcName.text)+'''';
  adoqryopen(ADOQtmp,sqlstr);
  if ADOQtmp.Fields[0].AsString<>'0' then begin
        MessageBox(Handle, pchar(trim(EdtPrcName.text)+trim(ComboPrcTime.text)+'原煤费用已结算,不能继续扣款!'), '提示', MB_ICONERROR or MB_OK) ;
        abort;
  end;
  if Frmprice.laction='ADD' then begin
            IF CheckExist('ymprc',' prcdate='''+trim(ComboPrcTime.text)+''' and ymprccoal='''+trim(EdtPrcName.text)+'''') THEN BEGIN
                MessageBox(Handle, pchar(trim(EdtPrcName.text)+trim(ComboPrcTime.text)+'价格已存在，不能重复添加!'), '错误', MB_ICONERROR or MB_OK) ;
                ABORT
            END;
            sqlstr:='insert into ymprc (ymprcno,prcdate,ymprccoal,ymprc,ymprctax,ymtpprc,ymtpprctax,keydate,keyuser) values ('+
                                  Labelno.Caption+','+
                                  #39+trim(ComboPrcTime.text)+#39+','+
                                  #39+trim(EdtPrcName.Text)+#39+','+
                                  EdtPrcym.Text+','+
                                  EdtPrcyms.Text+','+
                                  EdtPrctp.Text+','+
                                  EdtPrctps.Text+
                                  #39+g_date+#39+','+
                                  #39+curuser.Name+#39+
                                  ')';
              savelog('增加<'+EdtPrcName.Text+'>煤矿'+
             ComboPrcTime.text+'价格记录',Labelno.Caption,'原煤价格维护');
  end
  else if  Frmprice.laction='MODIFY' then begin
           sqlstr:='update ymprc set prcdate='+#39+ComboPrcTime.Text+#39+','+
                                  'ymprccoal='+#39+trim(EdtPrcName.Text)+#39+','+
                                  'ymprc='+EdtPrcym.Text+','+
                                  'ymprctax='+EdtPrcyms.Text+','+
                                  'ymtpprc='+EdtPrctp.Text+','+
                                  'ymtpprctax='+EdtPrctps.Text+','+
                                  'keydate='+#39+datetostr(now)+#39+','+
                                  'keyuser='+#39+curuser.Name+#39+
                                  ' where ymprcno='+Labelno.Caption;
             savelog('修改<'+ymprccoal+'>煤矿'+
             prcdate+'价格记录',Labelno.Caption,'原煤价格维护');
  end;
  adoqryexec(ADOQtmp,sqlstr);
  self.Close;
end;

procedure TFrmPriceAdd.FormShow(Sender: TObject);
begin
  inherited;
  if  Frmprice.laction='MODIFY' then begin
      prcdate:=ComboPrcTime.text;
      ymprccoal:=EdtPrcName.Text;
  end;
end;

end.
