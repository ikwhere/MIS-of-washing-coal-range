unit jmsxdata_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm_add, DB, ADODB, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFrmjmsxdataAdd = class(TFrmAdd)
    Label12: TLabel;
    Label1: TLabel;
    Edtph: TEdit;
    Label2: TLabel;
    Edttkno: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edtwt: TEdit;
    DatePicker1: TDateTimePicker;
    ComboUser: TComboBox;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmjmsxdataAdd: TFrmjmsxdataAdd;
  jmtpuser,jmxsdate,jmxswt:string;
implementation

uses jmsxdata,main;

{$R *.dfm}

procedure TFrmjmsxdataAdd.BitBtn1Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  IF (CheckAllNull()=False) THEN begin
    MessageBox(Handle, '����δ��дȫ,����!', '����', MB_ICONERROR or MB_OK) ;
    ABORT
  END;

  if Frmjmsxdata.laction='ADD' then begin
            sqlstr:='insert into jmsxdata (jmxsno,jmxsdate,jmtpuser,jmxsph,jmxswt,jmtpnum,jmxskeydt,jmxsuser,jmxsname) values ('+
                                  Labelno.Caption+','+
                                  #39+datetostr(DatePicker1.Date)+#39+','+
                                  #39+trim(ComboUser.Text)+#39+','+
                                  #39+trim(Edtph.Text)+#39+','+
                                  #39+trim(Edtwt.Text)+#39+','+
                                  #39+trim(Edttkno.Text)+#39+','+
                                  #39+g_date+#39+','+
                                  #39+curuser.Name+#39+',''��ú'')';
           savelog('����<'+trim(ComboUser.Text)+'>�ͻ�'+datetostr(DatePicker1.Date)+
           '��ú���ۼ�¼,����'+trim(Edtwt.Text)+'��',Labelno.Caption,'��ú��������¼��');
  end
  else if  Frmjmsxdata.laction='MODIFY' then begin
           sqlstr:='update jmsxdata set jmxsdate='+#39+datetostr(DatePicker1.Date)+#39+','+
                                  'jmtpuser='+#39+trim(ComboUser.Text)+#39+','+
                                  'jmxsph='+#39+trim(Edtph.Text)+#39+','+
                                  'jmxswt='+#39+trim(Edtwt.Text)+#39+','+
                                  'jmtpnum='+#39+trim(Edttkno.Text)+#39+ ','+
                                  'jmxskeydt='+#39+datetostr(now)+#39+','+
                                  'jmxsuser='+#39+curuser.Name+#39+
                                  ' where jmxsno='+Labelno.Caption+' and jmxsname=''��ú''';
            savelog('�޸�<'+jmtpuser+'>�ͻ�'+
            jmxsdate+'��ú���ۼ�¼������'+jmxswt+'��',Labelno.Caption,'��ú��������¼��');
  end;
  adoqryexec(ADOQtmp,sqlstr);
  self.Close;
end;

procedure TFrmjmsxdataAdd.FormShow(Sender: TObject);
begin
  inherited;
  if  Frmjmsxdata.laction='MODIFY' then begin
     jmtpuser:=trim(ComboUser.Text) ;
     jmxsdate:=datetostr(DatePicker1.Date);
     jmxswt:=trim(Edtwt.Text) ;
  end;
end;

end.