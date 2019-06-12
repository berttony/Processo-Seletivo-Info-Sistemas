unit uCliente;

interface
uses System.Generics.Collections, uEndereco;

type
   TCLiente = class
     private
        FEmail: String;
        FCPF: String;
        FId: Integer;
        FIdentidade: String;
        FNome: String;
        FTelefone: String;
    FEnderecos: TList<TEndereco>;
        procedure SetCPF(const Value: String);
        procedure SetEmail(const Value: String);
        procedure SetId(const Value: Integer);
        procedure SetIdentidade(const Value: String);
        procedure SetNome(const Value: String);
        procedure SetTelefone(const Value: String);
    procedure SetEnderecos(const Value: TList<TEndereco>);

     public
        constructor Create;
        destructor Destroy; Override;
        Property   Id         : Integer read FId write SetId;
        Property   Nome       : string  read FNome write SetNome;
        Property   Identidade : string  read FIdentidade write SetIdentidade;
        Property   CPF        : string  read FCPF write SetCPF;
        Property   Telefone   : string  read FTelefone write SetTelefone;
        Property   Email      : string  read FEmail write SetEmail;
        Property   Enderecos : TList<TEndereco> read FEnderecos write SetEnderecos;
   end;


implementation

{ TCLiente }

constructor TCLiente.Create;
begin
   FEmail := '';
   FCPF := '';
   FId := 0;
   FIdentidade := '';
   FNome := '';
   FTelefone := '';
   FEnderecos := TList<TEndereco>.Create;
end;

destructor TCLiente.Destroy;
begin
  FEnderecos.Free;
  inherited;
end;

procedure TCLiente.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TCLiente.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TCLiente.SetEnderecos(const Value: TList<TEndereco>);
begin
  FEnderecos := Value;
end;

procedure TCLiente.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCLiente.SetIdentidade(const Value: String);
begin
  FIdentidade := Value;
end;

procedure TCLiente.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TCLiente.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
