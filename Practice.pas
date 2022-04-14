unit Practice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Generics.Collections, System.Types, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TPR = array [1..2] of integer;
  TRet = array [1..4] of TPR;
  TRef = reference to function(X: TPR): string;
  TRef2 = reference to function(X: TPR): TRet;
  TMemoize = reference to function(F: TRef): TRef;
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    RichEdit33: TRichEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure Calc();
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Memoize: TMemoize;
  Form1: TForm1;
  MyF, MyFEmpty: TRef;
  Moves: TRef2;
  MemoizedMyF: TRef;
  j:integer;
  hh:TPr;
  outp:text;
  Add,Mult,First,Win:integer;
implementation

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
ComboBox1.ItemIndex:=0;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Calc();
end;


procedure TForm1.Edit1Change(Sender: TObject);
begin
  Add:=StrToInt(Edit1.Text);
  Calc();
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  Mult:=StrToInt(Edit2.Text);
  Calc();
end;


procedure TForm1.Edit3Change(Sender: TObject);
begin
  First:=StrToInt(Edit3.Text);
  Calc();
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin
  Win:=StrToInt(Edit4.Text);
  Calc();
end;

procedure TForm1.Calc();
begin
 MemoizedMyF := Memoize(MyFEmpty);
 MemoizedMyF := Memoize(MyF);
 RichEdit33.Text:='';
 for j:=1 to (Win-First-1) do
  begin
    hh[1]:=j;
    hh[2]:=First;
    if ComboBox1.Text='All' then 
      begin
        if MemoizedMyF(hh)<>'' then RichEdit33.Text:=RichEdit33.Text+IntToStr(j)+':     '+ MemoizedMyF(hh)+' '#10
      end
    else
    if MemoizedMyF(hh)=ComboBox1.Text then RichEdit33.Text:=RichEdit33.Text+IntToStr(j)+':     '+ MemoizedMyF(hh)+' '#10;
    //if (j mod 20)=0 then Label1.Caption:=Label1.Caption  +' '#10#13;
end;
end;


begin

  Memoize := function(F: TRef): TRef
  var
   cache: TDictionary<TPR,string>;
   begin
   cache := TDictionary<TPR,string>.Create;
   Result :=
     function(s: TPR): string
     begin
       if not cache.TryGetValue(s, Result) then
       begin
         Result := F(s);
         cache.Add(s, Result);
       end;
     end;
  end;

  Moves := function(X: TPR): TRet
    begin
       Result[1,1] := x[1]+Add;
       Result[1,2] := x[2];
       Result[2,1] := x[1];
       Result[2,2] := x[2]+Add;
       Result[3,1] := x[1]*Mult;
       Result[3,2] := x[2];
       Result[4,1] := x[1];
       Result[4,2] := x[2]*Mult;
    end;

  MyFEmpty:= function(h:TPR):string
  begin
  end;

  MyF:= function(h:TPR):string
  var
  i:integer;
  Prom:TRet;
 label
  GotoLabel;
  begin
    if (h[1]+h[2])>=Win then
    begin
      Result:='СР';
      Goto GotoLabel;
    end;


    for i:=1 to 4 do
    begin
      Prom:= moves(h);
      if MemoizedMyF(Prom[i])='СР' then
      begin
        Result:='П1';
        Goto GotoLabel;
      end;
    end;

    if (MemoizedMyF(Prom[1])='П1') and (MemoizedMyF(Prom[2])='П1') and (MemoizedMyF(Prom[3])='П1') and (MemoizedMyF(Prom[4])='П1')then
      begin
        Result:='В1';
        Goto GotoLabel;
      end;

    for i:=1 to 4 do
    begin
      Prom:= moves(h);
      if MemoizedMyF(Prom[i])='В1' then
      begin
        Result:='П2';
        Goto GotoLabel;
      end;
    end;

    if ((MemoizedMyF(Prom[1])='П1') or (MemoizedMyF(Prom[1])='П2')) and ((MemoizedMyF(Prom[2])='П1') or (MemoizedMyF(Prom[2])='П2')) and ((MemoizedMyF(Prom[3])='П1') or (MemoizedMyF(Prom[3])='П2')) and ((MemoizedMyF(Prom[4])='П1') or (MemoizedMyF(Prom[4])='П2'))then
      begin
        Result:='В2';
        Goto GotoLabel;
      end;

    for i:=1 to 4 do
    begin
      Prom:= moves(h);
      if MemoizedMyF(Prom[i])='В2' then
      begin
        Result:='П3';
        Goto GotoLabel;
      end;
    end;

    if ((MemoizedMyF(Prom[1])='П1') or (MemoizedMyF(Prom[1])='П2') or (MemoizedMyF(Prom[1])='П3')) and ((MemoizedMyF(Prom[2])='П1') or (MemoizedMyF(Prom[2])='П2') or (MemoizedMyF(Prom[2])='П3')) and ((MemoizedMyF(Prom[3])='П1') or (MemoizedMyF(Prom[3])='П2') or (MemoizedMyF(Prom[3])='П3')) and ((MemoizedMyF(Prom[4])='П1') or (MemoizedMyF(Prom[4])='П2') or (MemoizedMyF(Prom[4])='П3'))then
      begin
        Result:='В3';
        Goto GotoLabel;
      end;

GotoLabel:
//  ShowMessage('Цикл закончился с значением i = ');
end;

MemoizedMyF := Memoize(MyF);

end.
