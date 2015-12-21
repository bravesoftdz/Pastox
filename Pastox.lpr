program Pastox;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, ToxCore, ToxID, Crypt, Util;

{$R *.res}

var
  aNonce: TNonce;
  nonceText: UTF8String;
begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  aNonce.CreateWithRandomBytes;
  nonceText := bin_to_hex_string(aNonce.AsBin, 24);
  write (nonceText);
  Application.Run;
end.

