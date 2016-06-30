unit xskk_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm_add, DB, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  TFrmxskkAdd = class(TFrmAdd)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CombokkTime: TComboBox;
    Edtkkwt: TEdit;
    ComboCustom: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    ComboName: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtkkwtKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmxskkAdd: TFrmxskkAdd;
  xskkdate,xskkcustomer,xskkname,xskkwt:string;
implementation

uses xskk,MAIN;

{$R *.dfm}

procedure TFrmxskkAdd.BitBtn1Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  IF (CheckAllNull()=False) THEN begin
    MessageBox(Handle, '����δ��дȫ,����!', '����', MB_ICONERROR or MB_OK) ;
    ABORT
  END;
{  sqlstr:='select count(ymjsmonth) from ymjs where ymjsmonth='''+trim(CombokkTime.text)+''''+
          ' and ymjscoal='''+trim(ComboName.text)+'''';
  adoqryopen(ADOQtmp,sqlstr);
  if ADOQtmp.Fields[0].AsString<>'0' then begin
        MessageBox(Handle, pchar(trim(ComboName.text)+trim(CombokkTime.text)+'ԭú�����ѽ���,���ܼ����ۿ�!'), '��ʾ', MB_ICONERROR or MB_OK) ;
        abort;
  end;         }
  if Frmxskk.laction='ADD' then begin
            sqlstr:='insert into xskkdata (xskkno,xskkdate,xskkcustomer,xskkname,xskkwt,xskksign,xskeydate,xskeyuser) values ('+
                                  Labelno.Caption+','+
                                  #39+trim(CombokkTime.text)+#39+','+
                                  #39+trim(ComboCustom.Text)+#39+','+
                                  #39+trim(ComboName.Text)+#39+','+
                                  Edtkkwt.Text+','+
                                  '0'+','+
                                  #39+g_date+#39+','+
                                  #39+curuser.Name+#39+')';
         savelog('����<'+ComboCustom.Text+'>�ͻ�'+CombokkTime.Text+
        '�ۿ�'+ComboName.text+'��¼,�ۿ�'+Edtkkwt.Text+'��',Labelno.Caption,'���ۿۿ�¼��');
  end
  else if  Frmxskk.laction='MODIFY' then begin
           sqlstr:='update xskkdata set xskkdate='+#39+trim(CombokkTime.Text)+#39+','+
                                  'xskkcustomer='+#39+trim(ComboCustom.Text)+#39+','+
                                  'xskkname='+#39+trim(ComboName.Text)+#39+','+
                                  'xskkwt='+Edtkkwt.Text+','+
                                  'xskeydate='+#39+g_date+#39+','+
                                  'xskeyuser='+#39+curuser.Name+#39+
                                  ' where xskkno='+Labelno.Caption;
        savelog('�޸�<'+xskkcustomer+'>�ͻ�'+xskkdate+
        '�ۿ�'+xskkname+'��¼,�ۿ�'+xskkwt+'��',Labelno.Caption,'���ۿۿ�¼��');

  end;
  adoqryexec(ADOQtmp,sqlstr);
  self.Close;

end;

procedure TFrmxskkAdd.FormShow(Sender: TObject);
begin
  inherited;
  if  Frmxskk.laction='MODIFY' then begin
      xskkdate:=trim(CombokkTime.Text);
      xskkcustomer:=trim(ComboCustom.Text);
      xskkname:=trim(ComboName.Text);
      xskkwt:=Edtkkwt.Text;
  end;
end;

procedure TFrmxskkAdd.EdtkkwtKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not(key in ['1','2','3','4','5','6','7','8','9','0','.',#30]) then
    abort;
end;

end.