{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit Lox;

interface

uses
  LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('Lox', @Lox.Register);
end;

initialization
  RegisterPackage('Lox', @Register);
end.