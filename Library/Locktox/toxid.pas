unit ToxID;

{$macro on}
{$mode DELPHI}{$H+}

interface

uses
  Classes, SysUtils, strutils, ctypes, Util;

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

implementation

{$DEFINE TADDRTYPE:=TFriendAddress}
{$DEFINE IADDRTYPE:=IFriendAddress}
{$DEFINE ADDRSIZE:=TOX_ADDRESS_SIZE}
{$I toxidtpl.fnc}

{$DEFINE TADDRTYPE:=TPublicKey}
{$DEFINE IADDRTYPE:=IPublicKey}
{$DEFINE ADDRSIZE:=TOX_PUBLIC_KEY_SIZE}
{$I toxidtpl.fnc}

end.

