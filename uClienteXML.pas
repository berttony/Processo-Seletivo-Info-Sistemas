unit uClienteXML;

interface

uses Xml.xmldom, Xml.XMLDoc, Xml.XMLIntf;

type

{ Forward Decls }

  IXMLClienteType = interface;
  IXMLEnderecoType = interface;
  IXMLItensType = interface;

{ IXMLClienteType }

  IXMLClienteType = interface(IXMLNode)
    ['{3D12828C-4C99-41F7-9CF3-7FD34253EC89}']
    { Property Accessors }
    function Get_Nome: UnicodeString;
    function Get_Identidade: UnicodeString;
    function Get_CPF: UnicodeString;
    function Get_Telefone: UnicodeString;
    function Get_Email: UnicodeString;
    function Get_Endereco: IXMLEnderecoType;
    procedure Set_Nome(Value: UnicodeString);
    procedure Set_Identidade(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    procedure Set_Telefone(Value: UnicodeString);
    procedure Set_Email(Value: UnicodeString);
    { Methods & Properties }
    property Nome: UnicodeString read Get_Nome write Set_Nome;
    property Identidade: UnicodeString read Get_Identidade write Set_Identidade;
    property CPF: UnicodeString read Get_CPF write Set_CPF;
    property Telefone: UnicodeString read Get_Telefone write Set_Telefone;
    property Email: UnicodeString read Get_Email write Set_Email;
    property Endereco: IXMLEnderecoType read Get_Endereco;
  end;

{ IXMLEnderecoType }

  IXMLEnderecoType = interface(IXMLNodeCollection)
    ['{40A3CBC6-2379-4CF4-A5B0-99D8063BA684}']
    { Property Accessors }
    function Get_Itens(Index: Integer): IXMLItensType;
    { Methods & Properties }
    function Add: IXMLItensType;
    function Insert(const Index: Integer): IXMLItensType;
    property Itens[Index: Integer]: IXMLItensType read Get_Itens; default;
  end;

{ IXMLItensType }

  IXMLItensType = interface(IXMLNode)
    ['{541E8877-3C8D-4D38-9E76-E32710F43D45}']
    { Property Accessors }
    function Get_CEP: UnicodeString;
    function Get_Logradouro: UnicodeString;
    function Get_Numero: UnicodeString;
    function Get_Complemento: UnicodeString;
    function Get_Bairro: UnicodeString;
    function Get_Cidade: UnicodeString;
    function Get_Estado: UnicodeString;
    function Get_Pais: UnicodeString;
    procedure Set_CEP(Value: UnicodeString);
    procedure Set_Logradouro(Value: UnicodeString);
    procedure Set_Numero(Value: UnicodeString);
    procedure Set_Complemento(Value: UnicodeString);
    procedure Set_Bairro(Value: UnicodeString);
    procedure Set_Cidade(Value: UnicodeString);
    procedure Set_Estado(Value: UnicodeString);
    procedure Set_Pais(Value: UnicodeString);
    { Methods & Properties }
    property CEP: UnicodeString read Get_CEP write Set_CEP;
    property Logradouro: UnicodeString read Get_Logradouro write Set_Logradouro;
    property Numero: UnicodeString read Get_Numero write Set_Numero;
    property Complemento: UnicodeString read Get_Complemento write Set_Complemento;
    property Bairro: UnicodeString read Get_Bairro write Set_Bairro;
    property Cidade: UnicodeString read Get_Cidade write Set_Cidade;
    property Estado: UnicodeString read Get_Estado write Set_Estado;
    property Pais: UnicodeString read Get_Pais write Set_Pais;
  end;

{ Forward Decls }

  TXMLClienteType = class;
  TXMLEnderecoType = class;
  TXMLItensType = class;

{ TXMLClienteType }

  TXMLClienteType = class(TXMLNode, IXMLClienteType)
  protected
    { IXMLClienteType }
    function Get_Nome: UnicodeString;
    function Get_Identidade: UnicodeString;
    function Get_CPF: UnicodeString;
    function Get_Telefone: UnicodeString;
    function Get_Email: UnicodeString;
    function Get_Endereco: IXMLEnderecoType;
    procedure Set_Nome(Value: UnicodeString);
    procedure Set_Identidade(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    procedure Set_Telefone(Value: UnicodeString);
    procedure Set_Email(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLEnderecoType }

  TXMLEnderecoType = class(TXMLNodeCollection, IXMLEnderecoType)
  protected
    { IXMLEnderecoType }
    function Get_Itens(Index: Integer): IXMLItensType;
    function Add: IXMLItensType;
    function Insert(const Index: Integer): IXMLItensType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLItensType }

  TXMLItensType = class(TXMLNode, IXMLItensType)
  protected
    { IXMLItensType }
    function Get_CEP: UnicodeString;
    function Get_Logradouro: UnicodeString;
    function Get_Numero: UnicodeString;
    function Get_Complemento: UnicodeString;
    function Get_Bairro: UnicodeString;
    function Get_Cidade: UnicodeString;
    function Get_Estado: UnicodeString;
    function Get_Pais: UnicodeString;
    procedure Set_CEP(Value: UnicodeString);
    procedure Set_Logradouro(Value: UnicodeString);
    procedure Set_Numero(Value: UnicodeString);
    procedure Set_Complemento(Value: UnicodeString);
    procedure Set_Bairro(Value: UnicodeString);
    procedure Set_Cidade(Value: UnicodeString);
    procedure Set_Estado(Value: UnicodeString);
    procedure Set_Pais(Value: UnicodeString);
  end;

{ Global Functions }

function GetCliente(Doc: IXMLDocument): IXMLClienteType;
function LoadCliente(const FileName: string): IXMLClienteType;
function NewCliente: IXMLClienteType;

const
  TargetNamespace = '';

implementation

uses Xml.xmlutil;

{ Global Functions }

function GetCliente(Doc: IXMLDocument): IXMLClienteType;
begin
  Result := Doc.GetDocBinding('Cliente', TXMLClienteType, TargetNamespace) as IXMLClienteType;
end;

function LoadCliente(const FileName: string): IXMLClienteType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Cliente', TXMLClienteType, TargetNamespace) as IXMLClienteType;
end;

function NewCliente: IXMLClienteType;
begin
  Result := NewXMLDocument.GetDocBinding('Cliente', TXMLClienteType, TargetNamespace) as IXMLClienteType;
end;

{ TXMLClienteType }

procedure TXMLClienteType.AfterConstruction;
begin
  RegisterChildNode('Endereco', TXMLEnderecoType);
  inherited;
end;

function TXMLClienteType.Get_Nome: UnicodeString;
begin
  Result := ChildNodes['Nome'].Text;
end;

procedure TXMLClienteType.Set_Nome(Value: UnicodeString);
begin
  ChildNodes['Nome'].NodeValue := Value;
end;

function TXMLClienteType.Get_Identidade: UnicodeString;
begin
  Result := ChildNodes['Identidade'].Text;
end;

procedure TXMLClienteType.Set_Identidade(Value: UnicodeString);
begin
  ChildNodes['Identidade'].NodeValue := Value;
end;

function TXMLClienteType.Get_CPF: UnicodeString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLClienteType.Set_CPF(Value: UnicodeString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLClienteType.Get_Telefone: UnicodeString;
begin
  Result := ChildNodes['Telefone'].Text;
end;

procedure TXMLClienteType.Set_Telefone(Value: UnicodeString);
begin
  ChildNodes['Telefone'].NodeValue := Value;
end;

function TXMLClienteType.Get_Email: UnicodeString;
begin
  Result := ChildNodes['Email'].Text;
end;

procedure TXMLClienteType.Set_Email(Value: UnicodeString);
begin
  ChildNodes['Email'].NodeValue := Value;
end;

function TXMLClienteType.Get_Endereco: IXMLEnderecoType;
begin
  Result := ChildNodes['Endereco'] as IXMLEnderecoType;
end;

{ TXMLEnderecoType }

procedure TXMLEnderecoType.AfterConstruction;
begin
  RegisterChildNode('Itens', TXMLItensType);
  ItemTag := 'Itens';
  ItemInterface := IXMLItensType;
  inherited;
end;

function TXMLEnderecoType.Get_Itens(Index: Integer): IXMLItensType;
begin
  Result := List[Index] as IXMLItensType;
end;

function TXMLEnderecoType.Add: IXMLItensType;
begin
  Result := AddItem(-1) as IXMLItensType;
end;

function TXMLEnderecoType.Insert(const Index: Integer): IXMLItensType;
begin
  Result := AddItem(Index) as IXMLItensType;
end;

{ TXMLItensType }

function TXMLItensType.Get_CEP: UnicodeString;
begin
  Result := AttributeNodes['CEP'].Text;
end;

procedure TXMLItensType.Set_CEP(Value: UnicodeString);
begin
  SetAttribute('CEP', Value);
end;

function TXMLItensType.Get_Logradouro: UnicodeString;
begin
  Result := ChildNodes['Logradouro'].Text;
end;

procedure TXMLItensType.Set_Logradouro(Value: UnicodeString);
begin
  ChildNodes['Logradouro'].NodeValue := Value;
end;

function TXMLItensType.Get_Numero: UnicodeString;
begin
  Result := ChildNodes['Numero'].Text;
end;

procedure TXMLItensType.Set_Numero(Value: UnicodeString);
begin
  ChildNodes['Numero'].NodeValue := Value;
end;

function TXMLItensType.Get_Complemento: UnicodeString;
begin
  Result := ChildNodes['Complemento'].Text;
end;

procedure TXMLItensType.Set_Complemento(Value: UnicodeString);
begin
  ChildNodes['Complemento'].NodeValue := Value;
end;

function TXMLItensType.Get_Bairro: UnicodeString;
begin
  Result := ChildNodes['Bairro'].Text;
end;

procedure TXMLItensType.Set_Bairro(Value: UnicodeString);
begin
  ChildNodes['Bairro'].NodeValue := Value;
end;

function TXMLItensType.Get_Cidade: UnicodeString;
begin
  Result := ChildNodes['Cidade'].Text;
end;

procedure TXMLItensType.Set_Cidade(Value: UnicodeString);
begin
  ChildNodes['Cidade'].NodeValue := Value;
end;

function TXMLItensType.Get_Estado: UnicodeString;
begin
  Result := ChildNodes['Estado'].Text;
end;

procedure TXMLItensType.Set_Estado(Value: UnicodeString);
begin
  ChildNodes['Estado'].NodeValue := Value;
end;

function TXMLItensType.Get_Pais: UnicodeString;
begin
  Result := ChildNodes['Pais'].Text;
end;

procedure TXMLItensType.Set_Pais(Value: UnicodeString);
begin
  ChildNodes['Pais'].NodeValue := Value;
end;

end.