unit uEndereco;

interface
uses REST.Json, System.Json, idHTTP, IdSSLOpenSSL;

type
   TEndereco = class
   private
     FLogradouro: string;
     FBairro: string;
     FCep: string;
     FComplemento: string;
     FLocalidade: string;
     FUf: string;
     class function GetCEP(CEP:string): TJSONObject;
   public
     constructor Create();
     class function getEnderecoViaCep(pCEP: string): TEndereco;
     Property  Cep         : string read FCep         write FCep;
     Property  Logradouro  : string read FLogradouro  write FLogradouro;
     Property  Complemento : string read FComplemento write FComplemento;
     Property  Bairro      : string read FBairro      write FBairro;
     Property  Localidade  : string read FLocalidade  write FLocalidade;
     Property  Uf          : string read FUf          write FUf;
   end;

implementation

uses
  System.Classes, System.SysUtils;

{ TEndereco }

constructor TEndereco.Create();
begin
   FLogradouro := '';
   FBairro := '';
   FComplemento := '';
   FLocalidade := '';
   FUf := '';
   FCep := '';
end;

class function TEndereco.GetCEP(CEP: string): TJSONObject;
var
   HTTP: TIdHTTP;
   IDSSLHandler : TIdSSLIOHandlerSocketOpenSSL;
   Response: TStringStream;
begin
   Result := Nil;
   HTTP := TIdHTTP.Create;
   IDSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create;
   Response := TStringStream.Create('');
   try
      HTTP.IOHandler := IDSSLHandler;
      HTTP.Get('https://viacep.com.br/ws/' + CEP + '/json', Response);
      if (HTTP.ResponseCode = 200) and not(Utf8ToAnsi(RawByteString(Response.DataString)) = '{'#$A'  "erro": true'#$A'}') then
         Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(Utf8ToAnsi(RawByteString(Response.DataString))), 0) as TJSONObject;
   finally
      HTTP.Free;
      IDSSLHandler.Free;
      Response.Destroy;
   end;
end;

class function TEndereco.getEnderecoViaCep(pCEP: string): TEndereco;
begin
  Result := TJson.JsonToObject<TEndereco>(GetCEP(pCEP));

  if not Assigned(Result) then
     raise Exception.Create('CEP inválido.');
end;
end.
