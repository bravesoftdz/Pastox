unit Util;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function bin_to_hex_string(BinData: PByte; Size: Integer): UTF8String;
function hex_string_to_bin(HexString: UTF8String): PByte;

implementation

function bin_to_hex_string(BinData: PByte; Size: Integer): UTF8String;
var
  HexString: UTF8String;
begin
  SetLength(HexString, Size * 2);
  BinToHex(PChar(BinData), PChar(HexString), Size);
  Result := HexString;
end;

function hex_string_to_bin(HexString: UTF8String): PByte;
var
  BinLen: Word;
begin
  BinLen := Length(HexString) div 2;
  Result := GetMemory(BinLen);
  HexToBin(PChar(HexString), PChar(Result), BinLen);
end;

end.

