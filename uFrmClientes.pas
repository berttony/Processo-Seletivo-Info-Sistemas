unit uFrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, uCliente;

type
  TFrmClientes = class(TForm)
    pcCadastro: TPageControl;
    TabClientes: TTabSheet;
    TabListaClientes: TTabSheet;
    gbClientes: TGroupBox;
    edtidCliente: TDBEdit;
    edtNome: TDBEdit;
    edtRG: TDBEdit;
    edtCPF: TDBEdit;
    edtEmail: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    gbEnderecos: TGroupBox;
    gridEnderecos: TDBGrid;
    cdsClientes: TFDMemTable;
    DSClientes: TDataSource;
    DSEndereco: TDataSource;
    cdsClientesidCliente: TIntegerField;
    cdsClientesnome: TStringField;
    cdsClientesrg: TStringField;
    cdsClientescpf: TStringField;
    cdsClientesemail: TStringField;
    cdsEnderecos: TFDMemTable;
    cdsEnderecosCEP: TStringField;
    cdsEnderecoslogradouro: TStringField;
    cdsEnderecosnumero: TStringField;
    cdsEnderecoscomplemento: TStringField;
    cdsEnderecosbairro: TStringField;
    cdsEnderecoscidade: TStringField;
    cdsEnderecosestado: TStringField;
    cdsEnderecospais: TStringField;
    cdsEnderecosidCliente: TIntegerField;
    gridClientes: TDBGrid;
    edtCEP: TDBEdit;
    edtLogradouro: TDBEdit;
    edtNumero: TDBEdit;
    edtComplemento: TDBEdit;
    edtBairro: TDBEdit;
    edtEstado: TDBEdit;
    edtPais: TDBEdit;
    edtCidade: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    TabSheet1: TTabSheet;
    edtHost: TEdit;
    edtPorta: TEdit;
    edUsuario: TEdit;
    edSenha: TEdit;
    edRemetente: TEdit;
    edNomRemetente: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    btEnviar: TButton;
    edDestinatario: TEdit;
    Label20: TLabel;
    edtTelefone: TDBEdit;
    Label21: TLabel;
    cdsClientesTelefone: TStringField;
    navClientes: TDBNavigator;
    navEnderecos: TDBNavigator;
    procedure cdsClientesNewRecord(DataSet: TDataSet);
    procedure btEnviarClick(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function getXml : String;
  end;

var
  FrmClientes: TFrmClientes;

implementation

{$R *.dfm}

uses uEndereco,uEmail,uEnvioEmail, uClienteXML;

procedure TFrmClientes.FormCreate(Sender: TObject);
begin
  cdsClientes.CreateDataSet;
  cdsEnderecos.CreateDataSet;
end;

procedure TFrmClientes.cdsClientesNewRecord(DataSet: TDataSet);
begin
  cdsClientes.FieldByName('idCliente').AsInteger := cdsClientes.RecordCount + 1;
end;

procedure TFrmClientes.edtCEPExit(Sender: TObject);
Var
   objEndereco : TEndereco;
begin
   if not (cdsEnderecos.State in dsEditModes) then
     Exit;

   if cdsEnderecosCEP.AsString.Replace('-','').Length = 8 then
   begin
      objEndereco := TEndereco.getEnderecoViaCep(cdsEnderecosCEP.AsString);
      try
        cdsEnderecoslogradouro.AsString  := objEndereco.Logradouro;
        cdsEnderecoscomplemento.AsString := objEndereco.Complemento;
        cdsEnderecosbairro.AsString      := objEndereco.Bairro;
        cdsEnderecoscidade.AsString      := objEndereco.Localidade;
        cdsEnderecosestado.AsString      := objEndereco.Uf;
      finally
        objEndereco.Free;
      end;
   end;
end;

function TFrmClientes.getXml : String;
Var
 iXMLCliente: IXMLClienteType;
 I : Integer;
 xmlName : string;
 DiretorioArquivo: string;
 Arquivo : TStringList;
begin
   Arquivo:= TStringList.Create;
   try
     DiretorioArquivo := ExtractFilePath(Application.ExeName);
     xmlName := 'Clientes.xml';
     Arquivo.Add('<?xml version="1.0" encoding="UTF-8"?>');
     Arquivo.Add('<Clientes>');
     cdsClientes.First;
     while not cdsClientes.Eof do
     begin
       iXMLCliente := NewCliente;
       iXMLCliente.Nome       := cdsClientesnome.AsString;
       iXMLCliente.Identidade := cdsClientesrg.AsString;
       iXMLCliente.CPF        := cdsClientescpf.AsString;
       iXMLCliente.Telefone   := cdsClientesTelefone.AsString;
       iXMLCliente.Email      := cdsClientesemail.AsString;
       cdsEnderecos.First;
       I := 0;
       while not cdsEnderecos.Eof do
       begin
          iXMLCliente.Endereco.Add;
          iXMLCliente.Endereco.Itens[I].CEP         := cdsEnderecosCEP.AsString;
          iXMLCliente.Endereco.Itens[I].Logradouro  := cdsEnderecoslogradouro.AsString;
          iXMLCliente.Endereco.Itens[I].Numero      := cdsEnderecosnumero.AsString;
          iXMLCliente.Endereco.Itens[I].Complemento := cdsEnderecoscomplemento.AsString;
          iXMLCliente.Endereco.Itens[I].Bairro      := cdsEnderecosbairro.AsString;
          iXMLCliente.Endereco.Itens[I].Cidade      := cdsEnderecoscidade.AsString;
          iXMLCliente.Endereco.Itens[I].Estado      := cdsEnderecosestado.AsString;
          iXMLCliente.Endereco.Itens[I].Pais        := cdsEnderecospais.AsString;
          cdsEnderecos.Next;
          inc(I);
       end;
       Arquivo.Add(iXMLCliente.XML);

       cdsClientes.Next;
     end;

     Arquivo.Add('</Clientes>');
     Arquivo.SaveToFile(DiretorioArquivo + xmlName);

     Result := DiretorioArquivo + xmlName;
   finally
     Arquivo.Free;
   end;
end;

procedure TFrmClientes.btEnviarClick(Sender: TObject);
Var
   Email : TEmail;
begin
   Email := TEmail.Create;
   try
     Email.Porta         := StrToIntDef(edtPorta.Text,0);
     Email.Host          := edtHost.Text;
     Email.UsuarioEmail  := edUsuario.Text;
     Email.SenhaEmail    := edSenha.Text;
     Email.Remetente     := edRemetente.Text;
     Email.NomeRemetente := edNomRemetente.Text;
     Email.Destinatarios.Add(edDestinatario.Text);
     Email.Assunto       := 'Processo Seletivo Info Sistemas [Berttony]';
     Email.TipoConteudo  := 'text/plain; charset=iso-8859-1';
     Email.CorpoEmail.Add('Cliente Cadastrado em anexo .');
     Email.CaminhosAnexos.Add(getXml);
     TEnvioEmail.FEnviaEmail(Email);
   finally
     Email.Free;
   end;
end;

end.
