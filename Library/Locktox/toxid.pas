unit ToxID;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, strutils, ctypes;

{$I toxdefs.inc}

type
  IAbstractToxAddress = Interface(IInterface)
    procedure Clear;
    function IsEqual(const Value: UTF8String): Boolean; overload;
    property AsHex: UTF8String;
    property AsBin: PByte;
    property IsValidAddress: Boolean;
  end;

  IFriendAddress = Interface(IAbstractToxAddress)
    function Dup: IFriendAddress;
    function IsEqual(const Value: IFriendAddress): Boolean; overload;
  end;

  TFriendAddress = class(TInterfacedObject, IFriendAddress)
  private
    FHexData: UTF8String;
    FBinData: PByte;
    FValidAddress: Boolean;
    procedure SetHex(const Value: UTF8String);
    procedure SetBin(const Value: PByte);

  public
    constructor Create; overload;
    constructor Create(Value: PByte); overload;
    constructor Create(Value: UTF8String); overload;
    destructor Destroy; override;

    procedure Clear;
    function Dup: IFriendAddress;
    function IsEqual(const Value: IFriendAddress): Boolean; overload;
    function IsEqual(const Value: UTF8String): Boolean; overload;

    property AsHex: UTF8String read FHexData write SetHex;
    property AsBin: PByte read FBinData write SetBin;
    property IsValidAddress: Boolean read FValidAddress;
  end;

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

