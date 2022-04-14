unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    Заголовочек1: TLabel;
    Button1: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure Заголовочек1MouseActivate(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure Заголовочек1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Заголовочек1MouseEnter(Sender: TObject);
    procedure Заголовочек1MouseLeave(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Button1MouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
Button1.Width:=100
end;

procedure TForm1.Button1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
Заголовочек1.Caption:='123'
end;

procedure TForm1.Button1MouseEnter(Sender: TObject);
begin
Button1.Brush.Color:=1;
Button1.Brush.Color:=bsSolid;
end;

procedure TForm1.Заголовочек1MouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
Заголовочек1.Caption:='Ghbdt'
end;

procedure TForm1.Заголовочек1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
Заголовочек1.Caption:='Ghbdt'
end;

procedure TForm1.Заголовочек1MouseEnter(Sender: TObject);
begin
Заголовочек1.Caption:='Ghbdt'
end;

procedure TForm1.Заголовочек1MouseLeave(Sender: TObject);
begin
Заголовочек1.Caption:='34523466'
end;

end.
