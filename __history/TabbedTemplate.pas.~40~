unit TabbedTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Gestures, FMX.Controls.Presentation, FMX.Edit, FMX.EditBox,
  FMX.NumberBox, FMX.Layouts, FMX.ScrollBox, FMX.Memo, Data.DB, MemDS, DBAccess,
  Uni, UniProvider, MySQLUniProvider;

type
  TTabbedForm = class(TForm)
    HeaderToolBar: TToolBar;
    ToolBarLabel: TLabel;
    TabControl1: TTabControl;
    ti_geral: TTabItem;
    ti_carteira: TTabItem;
    ti_pagavista: TTabItem;
    ti_pagcredito: TTabItem;
    GestureManager1: TGestureManager;
    Label1: TLabel;
    Ed_recebido: TEdit;
    Layout1: TLayout;
    SpeedButton1: TSpeedButton;
    Lb_atual: TLabel;
    Layout2: TLayout;
    Edit2: TEdit;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    UniConnection1:TUniConnection;
    UniQuery1: TUniQuery;
    MySQLUniProvider1: TMySQLUniProvider;
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure operacao(Sender: TUniQuery; Text: String; Operacao: Integer);
    function aspas(Texto : String) : String;
  end;

var
  TabbedForm: TTabbedForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

function TTabbedForm.aspas(Texto: String): String;
begin
  result := chr(39)+ Texto + chr (39);
end;

procedure TTabbedForm.operacao(Sender: TUniQuery; Text: String; Operacao: Integer);
var
calculo: integer;
sinal: string;
begin
UniConnection1.Connected := true;
  Sender.Close ;
  Sender.SQL.Clear;
  Sender.SQL.Text := Text;
  Sender.Open;
  if Operacao<>0 then
  begin
    if Operacao=1 then
    begin
      calculo := Sender.FieldByName('valor').Value + StrToInt(Ed_recebido.Text);
    end
    else
    if Operacao=2 then
    begin
      calculo := Sender.FieldByName('valor').Value - StrToInt(Ed_recebido.Text);
    end;
    Sender.Close ;
    Sender.SQL.Clear;
    Sender.SQL.Text := 'update saldo set valor = :calculo where id =1';
    Sender.ParamByName('calculo').AsInteger := calculo;
    Sender.ExecSQL;
    ShowMessage('Saldo Atualizado');
    Label4.Text := IntToStr(calculo);
    Ed_recebido.Text := '';
    Edit2.Text := '';
  end
  else
  begin
    Label4.Text := Sender.FieldByName('valor').Value;
  end;


UniConnection1.Connected := false;
end;

{procedure TTabbedForm.Button1Click(Sender: TObject);
begin
UniConnection1.Connect;
abrir(UniQuery1,'select * from Cliente where nome like '+aspas(Edit1.Text + '%') );
ShowMessage(UniQuery1.RecordCount.ToString);
end;}

procedure TTabbedForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := ti_geral;
end;

procedure TTabbedForm.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount-1] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex+1];
      Handled := True;
    end;

    sgiRight:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex-1];
      Handled := True;
    end;
  end;
{$ENDIF}
end;

procedure TTabbedForm.SpeedButton1Click(Sender: TObject);
begin
  operacao(UniQuery1,'select valor from saldo where id = 1',1);
end;

procedure TTabbedForm.SpeedButton2Click(Sender: TObject);
begin
   operacao(UniQuery1,'select valor from saldo where id = 1',2);
end;

procedure TTabbedForm.SpeedButton3Click(Sender: TObject);
begin
  operacao(UniQuery1,'select valor from saldo where id = 1',0);

end;

end.
