object FrmClientes: TFrmClientes
  Left = 0
  Top = 0
  Caption = 'Clientes'
  ClientHeight = 623
  ClientWidth = 1276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pcCadastro: TPageControl
    Left = 0
    Top = 0
    Width = 1276
    Height = 623
    ActivePage = TabClientes
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 743
    object TabListaClientes: TTabSheet
      Caption = 'Lista de Clientes'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 735
      ExplicitHeight = 0
      object gridClientes: TDBGrid
        Left = 0
        Top = 0
        Width = 1268
        Height = 595
        Align = alClient
        DataSource = DSClientes
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'idCliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rg'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cpf'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telefone'
            Visible = True
          end>
      end
    end
    object TabClientes: TTabSheet
      Caption = 'Manuten'#231#227'o de Clientes'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 735
      ExplicitHeight = 0
      object gbClientes: TGroupBox
        Left = 3
        Top = 2
        Width = 1220
        Height = 161
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label1: TLabel
          Left = 11
          Top = 24
          Width = 47
          Height = 13
          Caption = 'ID Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 78
          Top = 24
          Width = 27
          Height = 13
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 826
          Top = 27
          Width = 19
          Height = 13
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 699
          Top = 27
          Width = 14
          Height = 13
          Caption = 'RG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 11
          Top = 68
          Width = 28
          Height = 13
          Caption = 'E-mail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 240
          Top = 68
          Width = 42
          Height = 13
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtidCliente: TDBEdit
          Left = 11
          Top = 43
          Width = 58
          Height = 21
          DataField = 'idCliente'
          DataSource = DSClientes
          Enabled = False
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 78
          Top = 43
          Width = 618
          Height = 21
          DataField = 'nome'
          DataSource = DSClientes
          TabOrder = 1
        end
        object edtRG: TDBEdit
          Left = 699
          Top = 43
          Width = 121
          Height = 21
          DataField = 'rg'
          DataSource = DSClientes
          TabOrder = 2
        end
        object edtCPF: TDBEdit
          Left = 826
          Top = 43
          Width = 121
          Height = 21
          DataField = 'cpf'
          DataSource = DSClientes
          TabOrder = 3
        end
        object edtEmail: TDBEdit
          Left = 11
          Top = 84
          Width = 223
          Height = 21
          DataField = 'email'
          DataSource = DSClientes
          TabOrder = 4
        end
        object edtTelefone: TDBEdit
          Left = 240
          Top = 84
          Width = 121
          Height = 21
          DataField = 'Telefone'
          DataSource = DSClientes
          TabOrder = 5
        end
        object navClientes: TDBNavigator
          Left = 11
          Top = 118
          Width = 360
          Height = 33
          DataSource = DSClientes
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
          TabOrder = 6
        end
      end
      object gbEnderecos: TGroupBox
        Left = 3
        Top = 169
        Width = 1222
        Height = 395
        Caption = 'Endere'#231'o'
        TabOrder = 2
        object Label6: TLabel
          Left = 14
          Top = 14
          Width = 19
          Height = 13
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 84
          Top = 14
          Width = 55
          Height = 13
          Caption = 'Logradouro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 645
          Top = 14
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 705
          Top = 17
          Width = 65
          Height = 13
          Caption = 'Complemento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 14
          Top = 64
          Width = 28
          Height = 13
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 141
          Top = 64
          Width = 33
          Height = 13
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 268
          Top = 64
          Width = 33
          Height = 13
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 395
          Top = 64
          Width = 19
          Height = 13
          Caption = 'Pa'#237's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object gridEnderecos: TDBGrid
          Left = 2
          Top = 146
          Width = 1218
          Height = 247
          Align = alBottom
          DataSource = DSEndereco
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CEP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'logradouro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'numero'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'complemento'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'bairro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'estado'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pais'
              Width = 110
              Visible = True
            end>
        end
        object edtLogradouro: TDBEdit
          Left = 84
          Top = 33
          Width = 550
          Height = 21
          DataField = 'logradouro'
          DataSource = DSEndereco
          TabOrder = 1
        end
        object edtNumero: TDBEdit
          Left = 645
          Top = 33
          Width = 54
          Height = 21
          DataField = 'numero'
          DataSource = DSEndereco
          TabOrder = 2
        end
        object edtComplemento: TDBEdit
          Left = 705
          Top = 33
          Width = 375
          Height = 21
          DataField = 'complemento'
          DataSource = DSEndereco
          TabOrder = 7
        end
        object edtBairro: TDBEdit
          Left = 14
          Top = 80
          Width = 121
          Height = 21
          DataField = 'bairro'
          DataSource = DSEndereco
          TabOrder = 3
        end
        object edtEstado: TDBEdit
          Left = 268
          Top = 80
          Width = 121
          Height = 21
          DataField = 'estado'
          DataSource = DSEndereco
          TabOrder = 5
        end
        object edtPais: TDBEdit
          Left = 395
          Top = 80
          Width = 121
          Height = 21
          DataField = 'pais'
          DataSource = DSEndereco
          TabOrder = 6
        end
        object edtCidade: TDBEdit
          Left = 141
          Top = 80
          Width = 121
          Height = 21
          DataField = 'cidade'
          DataSource = DSEndereco
          TabOrder = 4
        end
        object navEnderecos: TDBNavigator
          Left = 11
          Top = 107
          Width = 360
          Height = 33
          DataSource = DSEndereco
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
          TabOrder = 8
        end
      end
      object edtCEP: TDBEdit
        Left = 17
        Top = 202
        Width = 62
        Height = 21
        Hint = 'Informe o CEP'
        DataField = 'CEP'
        DataSource = DSEndereco
        TabOrder = 0
        OnExit = edtCEPExit
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'E-mail'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 735
      ExplicitHeight = 0
      object Label14: TLabel
        Left = 5
        Top = 6
        Width = 22
        Height = 13
        Caption = 'Host'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 136
        Top = 6
        Width = 26
        Height = 13
        Caption = 'Porta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 5
        Top = 46
        Width = 67
        Height = 13
        Caption = 'Usuario E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 197
        Top = 46
        Width = 61
        Height = 13
        Caption = 'Senha E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 5
        Top = 125
        Width = 53
        Height = 13
        Caption = 'Remetente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 5
        Top = 86
        Width = 83
        Height = 13
        Caption = 'Nome Remetente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 5
        Top = 169
        Width = 58
        Height = 13
        Caption = 'Destinat'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtHost: TEdit
        Left = 5
        Top = 22
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'smtp.gmail.com'
      end
      object edtPorta: TEdit
        Left = 136
        Top = 22
        Width = 121
        Height = 21
        TabOrder = 1
        Text = '465'
      end
      object edUsuario: TEdit
        Left = 5
        Top = 61
        Width = 180
        Height = 21
        TabOrder = 2
        Text = 'berttonyoffs@gmail.com'
      end
      object edSenha: TEdit
        Left = 197
        Top = 61
        Width = 180
        Height = 21
        PasswordChar = '*'
        TabOrder = 3
        Text = '@more575'
      end
      object edRemetente: TEdit
        Left = 5
        Top = 144
        Width = 182
        Height = 21
        TabOrder = 4
        Text = 'berttonyoffs@gmail.com'
      end
      object edNomRemetente: TEdit
        Left = 5
        Top = 102
        Width = 180
        Height = 21
        TabOrder = 5
        Text = 'Berttony Ventura'
      end
      object btEnviar: TButton
        Left = 3
        Top = 220
        Width = 75
        Height = 25
        Caption = 'Enviar E-mail'
        TabOrder = 6
        OnClick = btEnviarClick
      end
      object edDestinatario: TEdit
        Left = 5
        Top = 184
        Width = 182
        Height = 21
        TabOrder = 7
        Text = 'berttonyoffs@gmail.com'
      end
    end
  end
  object cdsClientes: TFDMemTable
    OnNewRecord = cdsClientesNewRecord
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'idCliente'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 568
    Top = 152
    object cdsClientesidCliente: TIntegerField
      DisplayLabel = 'ID Cliente'
      FieldName = 'idCliente'
    end
    object cdsClientesnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'nome'
      Size = 150
    end
    object cdsClientesrg: TStringField
      DisplayLabel = 'RG'
      DisplayWidth = 15
      FieldName = 'rg'
      Size = 10
    end
    object cdsClientescpf: TStringField
      DisplayLabel = 'CPF'
      DisplayWidth = 15
      FieldName = 'cpf'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsClientesemail: TStringField
      DisplayLabel = 'E-mail'
      DisplayWidth = 30
      FieldName = 'email'
      Size = 60
    end
    object cdsClientesTelefone: TStringField
      FieldName = 'Telefone'
    end
  end
  object DSClientes: TDataSource
    DataSet = cdsClientes
    Left = 620
    Top = 152
  end
  object DSEndereco: TDataSource
    DataSet = cdsEnderecos
    Left = 640
    Top = 464
  end
  object cdsEnderecos: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'idCliente'
    MasterSource = DSClientes
    MasterFields = 'idCliente'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 562
    Top = 464
    object cdsEnderecosidCliente: TIntegerField
      FieldName = 'idCliente'
    end
    object cdsEnderecosCEP: TStringField
      DisplayWidth = 9
      FieldName = 'CEP'
      EditMask = '00000\-000;0;_'
      Size = 8
    end
    object cdsEnderecoslogradouro: TStringField
      DisplayLabel = 'Logradouro'
      DisplayWidth = 50
      FieldName = 'logradouro'
      Size = 150
    end
    object cdsEnderecosnumero: TStringField
      DisplayLabel = 'N'#250'mero'
      DisplayWidth = 4
      FieldName = 'numero'
      Size = 10
    end
    object cdsEnderecoscomplemento: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 60
      FieldName = 'complemento'
      Size = 150
    end
    object cdsEnderecosbairro: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 20
      FieldName = 'bairro'
      Size = 150
    end
    object cdsEnderecoscidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'cidade'
      Size = 150
    end
    object cdsEnderecosestado: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 20
      FieldName = 'estado'
      Size = 150
    end
    object cdsEnderecospais: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'pais'
      Size = 150
    end
  end
end
