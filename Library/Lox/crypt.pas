unit Crypt;

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils, Sodium;

type
  TNonce = record
  private
    type
      TNonceBytes = array [0 .. crypto_box_NONCEBYTES] of Byte;
    var
      value: TNonceBytes;

  public
    procedure CreateWithRandomBytes; overload;
    property AsBin: TNonceBytes read value write value;
  end;

implementation

procedure TNonce.CreateWithRandomBytes; overload;
begin
  randombytes(value, crypto_box_NONCEBYTES);
end;

end.

