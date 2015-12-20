unit ToxID;

{$macro on}
{$mode DELPHI}{$H+}

interface

uses
  Classes, SysUtils, strutils, ctypes;

{$I toxdefs.inc}

type
  IAbstractToxAddress = Interface(IInterface)
    function IsEqual(const Value: UTF8String): Boolean; overload;
    procedure SetHexValue(const Value: UTF8String);
    procedure SetBinValue(const Value: PByte);

    function GetHexValue: UTF8String;
    function GetBinValue: PByte;

    property AsHex: UTF8String read GetHexValue write SetHexValue;
    property AsBin: PByte read GetBinValue write SetBinValue;

    property IsValidAddress: Boolean;
  end;

  {$DEFINE TADDRTYPE:=TFriendAddress}
  {$DEFINE IADDRTYPE:=IFriendAddress}
  {$DEFINE ADDRSIZE:=TOX_ADDRESS_SIZE}
  {$I toxidtpl.cls}

  {$DEFINE TADDRTYPE:=TPublicKey}
  {$DEFINE IADDRTYPE:=IPublicKey}
  {$DEFINE ADDRSIZE:=TOX_PUBLIC_KEY_SIZE}
  {$I toxidtpl.cls}



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

{$DEFINE TADDRTYPE:=TFriendAddress}
{$DEFINE IADDRTYPE:=IFriendAddress}
{$DEFINE ADDRSIZE:=TOX_ADDRESS_SIZE}
{$I toxidtpl.fnc}

{$DEFINE TADDRTYPE:=TPublicKey}
{$DEFINE IADDRTYPE:=IPublicKey}
{$DEFINE ADDRSIZE:=TOX_PUBLIC_KEY_SIZE}
{$I toxidtpl.fnc}

end.

