procedure TADDRTYPE.SetBinValue(const Value: PByte);
begin
  FHexData := bin_to_hex_string(Value, ADDRSIZE);
  if Length(FHexData) = ADDRSIZE * 2 then
    FValidAddress := True
  else
    FValidAddress := False;
end;

procedure TADDRTYPE.SetHexValue(const Value: UTF8String);
begin
  FValidAddress := False;

  if Length(Value) = ADDRSIZE * 2 then
  begin
    FHexData := Value;
    FBinData := hex_string_to_bin(Value);
  end
  else
    FValidAddress := False;
end;

function TADDRTYPE.GetBinValue: PByte;
begin
  result := FBinData;
end;

function TADDRTYPE.GetHexValue: UTF8String;
begin
  result := FHexData;
end;

constructor TADDRTYPE.Create;
begin
  inherited;
  FBinData := GetMemory(ADDRSIZE);
  SetLength(FHexData, ADDRSIZE * 2);
  FValidAddress := False;
end;

constructor TADDRTYPE.Create(Value: PByte);
begin
  inherited Create();
  FBinData := GetMemory(ADDRSIZE);
  SetLength(FHexData, ADDRSIZE * 2);
  AsBin := Value;
end;

function TADDRTYPE.Dup: IADDRTYPE;
var
  Copied: TADDRTYPE;
begin
  Copied := TADDRTYPE.Create;
  Copied.AsHex := AsHex;
  Result := Copied;
end;

constructor TADDRTYPE.Create(Value: UTF8String);
begin
  inherited Create();
  FBinData := GetMemory(ADDRSIZE);
  SetLength(FHexData, ADDRSIZE * 2);
  AsHex := Value;
end;

destructor TADDRTYPE.Destroy;
begin
  FreeMemory(FBinData);
  inherited;
end;

function TADDRTYPE.IsEqual(const Value: IADDRTYPE): Boolean; overload;
begin
  Result := IsEqual(Value.AsHex);
end;

function TADDRTYPE.IsEqual(const Value: UTF8String): Boolean; overload;
begin
  Result := (CompareStr(UpperCase(Value), FHexData) = 0) and FValidAddress;
end;
