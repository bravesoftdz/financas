unit TabbedTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Gestures, FMX.Controls.Presentation, FMX.Edit, FMX.EditBox,
  FMX.NumberBox, FMX.Layouts, FMX.ScrollBox, FMX.Memo, FMX.Objects,
  System.Actions, FMX.ActnList, FMX.MaterialSources, FMX.Colors;

type
  TTabbedForm = class(TForm)
    HeaderToolBar: TToolBar;
    ToolBarLabel: TLabel;
    GestureManager1: TGestureManager;
    StyleBook1: TStyleBook;
    Image1: TImage;
    SpeedButton4: TSpeedButton;
    TabControl1: TTabControl;
    ti_geral: TTabItem;
    ti_carteira: TTabItem;
    Layout1: TLayout;
    Edit1: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Layout2: TLayout;
    Edit2: TEdit;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    SpeedButton3: TSpeedButton;
    ti_pagavista: TTabItem;
    ti_pagcredito: TTabItem;
    tab_teste: TTabItem;
    bt_teste: TButton;
    ColorBox1: TColorBox;
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure SpeedButton4Click(Sender: TObject);
    procedure bt_testeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabbedForm: TTabbedForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TTabbedForm.bt_testeClick(Sender: TObject);
begin
tab_teste.Visible:= false;
end;

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

procedure TTabbedForm.SpeedButton4Click(Sender: TObject);
begin
tab_teste.Visible := true;
TabControl1.ActiveTab:=tab_teste;
end;

end.
