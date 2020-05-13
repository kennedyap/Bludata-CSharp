<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormPrincipal.aspx.cs" Inherits="WebAplication.Forms.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Página Principal</title>
    <style dir="ltr">
        form {
            border: 3px solid #f1f1f1;
            text-align: center
        }

        input[type=text], input[type=email] {
            width: 25%;
            height: 20%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            text-align: center
        }

        input[type=submit] {
            background-color: #4d3030;
            color: white;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 25%;
            align-content: center;
            text-align: center
        }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
            text-align: center
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
            text-align: center
        }

        .container {
            padding: 16px;
            text-align: center
        }

        .gridwiew {
            border-collapse: collapse;
            text-align: center;
            position: center;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
        }

        .grid td {
            padding: 10px;
            border: 1px solid #c1c1c1;
            color: #444;
            font-size: 1em;
            text-align: center
        }

        .grid th {
            padding: 4px;
            color: #707083;
            text-shadow: 1px,1px,0px #ffff;
            background: -webkit-gradient(linear, left bottom, left top, collor-stop(0,#e5e5e9), color-stop(1,#fbfbfc));
            border: 1px solid #c1c1c1;
            font-size: 1em;
            text-align: center;
        }

            .grid th a {
                color: white;
                text-decoration: none;
                text-align: center
            }

                .grid th a:hover {
                    color: #444;
                    text-decoration: none;
                    text-align: center
                }

        .grid .alt {
            background: linear-gradient(#e6e6e6,#e6e6e6);
            text-align: center
        }

        body {
            background-image: url(../Images/preto.png);
            text-align: center
        }

        h2 {
            color: white;
            text-align: center
        }

        label {
            color: white;
            text-align: center
        }
    </style>
</head>
<body>
    <form id="frm_principal" runat="server">
        <h2 style="text-align: center">O que deseja fazer agora?</h2>

        <div class="container">
            <asp:Button ID="btn_Cads_Fornecedor" Width="160px" runat="server" Text="Cadastrar Fornecedores" PostBackUrl="../Forms/FormCadsFornecedor.aspx" />
            <asp:Button ID="btn_Cads_Empresa" Width="160px" runat="server" Text="Cadastrar Empresas" PostBackUrl="../Forms/FormCadsEmpresa.aspx" />
        </div>

        <div>
            <h2>
                <label>Fornecedores Cadastrados.</label></h2>
             <label><b>Filtro:</b></label><br />
            <asp:DropDownList ID="drpFiltros" runat="server">
                <asp:ListItem Text="Nome" Value="Nome"/>
                <asp:ListItem Text="CPF/CNPJ" Value="CpfCnpj"/>
                <asp:ListItem Text="Data Cads" Value="DtCads"/>
            </asp:DropDownList>
            <asp:TextBox ID="txtFiltroFornecedor" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" Width="50px" runat="server" Text="Ok" OnClick="Button1_Click" />
            <asp:GridView ID="GridFornecedor" Width="500px" HorizontalAlign="Center" AutoGenerateColumns="false" runat="server" CssClass="grid" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-CssClass="alt" BackColor="White">
                <Columns>
                    <asp:BoundField DataField="Empresa" HeaderText="Empresa" />
                    <asp:BoundField DataField="Nome" HeaderText="Nome" />
                    <asp:BoundField DataField="CpfCnpj" HeaderText="CPF/CNPJ" />
                    <asp:BoundField DataField="DtCads" HeaderText="Data Cadastro" />
                    <asp:BoundField DataField="Rg" HeaderText="RG" />
                    <asp:BoundField DataField="DtNascimento" HeaderText="Data Nascimento" />
                </Columns>
            </asp:GridView>
        </div>

        <div>
            <h2>
                <label>Empresas Cadastradas.</label></h2>
            <asp:GridView ID="GridEmpresas" HorizontalAlign="Center" AutoGenerateColumns="false" runat="server" CssClass="grid" BackColor="White">
                <Columns>
                    <asp:BoundField DataField="UF" HeaderText="UF" />
                    <asp:BoundField DataField="NomeFantasia" HeaderText="Nome Fantasia" />
                    <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                </Columns>
            </asp:GridView>
        </div>

    </form>
</body>
</html>
