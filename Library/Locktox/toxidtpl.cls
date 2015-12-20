  IADDRTYPE = Interface(IAbstractToxAddress)
    function Dup: IADDRTYPE;
    function IsEqual(const Value: IADDRTYPE): Boolean; overload;
  end;

  TADDRTYPE = class(TInterfacedObject, IADDRTYPE)
  private
    FHexData: UTF8String;
    FBinData: PByte;
    FValidAddress: Boolean;

  public
    constructor Create; overload;
    constructor Create(Value: PByte); overload;
    constructor Create(Value: UTF8String); overload;
    destructor Destroy; override;

    function Dup: IADDRTYPE;
    function IsEqual(const Value: IADDRTYPE): Boolean; overload;
    function IsEqual(const Value: UTF8String): Boolean; overload;

    procedure SetBinValue(const Value: PByte);
    procedure SetHexValue(const Value: UTF8String);
    function GetHexValue: UTF8String;
    function GetBinValue: PByte;

    property AsHex: UTF8String read FHexData write SetHexValue;
    property AsBin: PByte read FBinData write SetBinValue;
    property IsValidAddress: Boolean read FValidAddress;
  end;