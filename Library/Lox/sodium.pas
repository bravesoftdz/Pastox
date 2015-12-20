unit Sodium;

{$macro on}
{$mode objfpc}{$H+}
{$DEFINE NAFUNC:=cdecl; external LIBSODIUM}

interface

uses
  Classes, SysUtils, ctypes;

const
  LIBSODIUM = {$IFDEF Unix}'libsodium.so'{$ENDIF};

function sodium_init(): cint; NAFUNC;

procedure randombytes(buffer: pcuint8; len: culonglong); NAFUNC;

function crypto_hash_sha256(outbuf: pcuint8; inbuf: pcuint8; len: culonglong)
                                                              : cint; NAFUNC;

function crypto_box_keypair(pk: cuint8; sk: pcuint8): cint; NAFUNC;

function crypto_box(c: pcuint8; const m: pcuint8; mlen: culonglong;
                          const n: pcuint8; const k: pcuint8): cint; NAFUNC;
function crypto_box_open(const m: pcuint8; c: pcuint8; mlen: culonglong;
                          const n: pcuint8; const k: pcuint8): cint; NAFUNC;

function crypto_box_afternm(c: pcuint8; const m: pcuint8; mlen: culonglong;
                          const n: pcuint8; const k: pcuint8): cint; NAFUNC;
function crypto_box_open_afternm(c: pcuint8; const m: pcuint8; mlen: culonglong;
                          const n: pcuint8; const k: pcuint8): cint; NAFUNC;

function crypto_secretbox(c: pcuint8; const m: pcuint8; mlen: culonglong;
                          const n: pcuint8; const k: pcuint8): cint; NAFUNC;
function crypto_secretbox_open(const m: pcuint8; c: pcuint8; mlen: culonglong;
                          const n: pcuint8; const k: pcuint8): cint; NAFUNC;

implementation

end.

