<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormCadsFornecedor.aspx.cs" Inherits="WebAplication.Forms.FormCadsFornecedor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Cadastro de Alunos</title>
    <style>
        form {
            border: 3px solid #f1f1f1;
        }

        input[type=text], input[type=email] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        input[type=submit] {
            background-color: #d74f4f;
            color: white;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 50%;
            align-content: center;
            margin-left: 22%;
        }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
        }

        body {
            background-image: url(../Images/vermelho.jpg)
        }

        h2 {
            color: white
        }

        label {
            color: white
        }
    </style>
    <script type="text/javascript">

        function SetVisibilidade(x) {
            if (x == 0)
                document.getElementById('divHiddenGropu').style.display = 'block';
            else
                document.getElementById('divHiddenGropu').style.display = 'none';
            return;
        }
    </script>
</head>
<body>
    <form id="frm_cadastrFornecedor" runat="server">
        <h2 style="text-align: center">Cadastro de Fornecedores.</h2>
        <div class="imgcontainer">
            <img src="../Images/img_aluno.png" alt="Fornecedor" class="avatar" />
        </div>
        <div class="container">
            <label><b>Empresa</b></label><br />
            <asp:DropDownList ID="drpEmpresas" runat="server">
            </asp:DropDownList>
            <asp:Button ID="btnCadsEmpresa" runat="server" Text="Nova Empresa?" PostBackUrl="../Forms/FormCadsEmpresa.aspx" Style="width: 125px; margin-left: 8px;" />
            <br />
            <label><b>Nome</b></label>
            <asp:TextBox ID="txtNome_Fornecedor" runat="server" placeholder="Escreva um Nome"></asp:TextBox>
            <label><b>CPF/CNPJ</b></label>
            <asp:RadioButton ID="rdbCPF" Text="CPF" runat="server" GroupName="rad1" Checked="True" onclick="SetVisibilidade(0)" />
            <asp:RadioButton ID="rdbCNPJ" Text="CNPJ" runat="server" GroupName="rad1" onclick="SetVisibilidade(1)" />
            <asp:TextBox ID="txtCPFCNPJ" runat="server" placeholder="Escreva um valor"></asp:TextBox>
            <div class="container" id="divHiddenGropu">
                <label><b>RG</b></label>
                <asp:TextBox ID="txtRG" runat="server" placeholder="Escreva um RG"></asp:TextBox>
                <label><b>Data Nascimento</b></label>
                <asp:TextBox ID="txtDtNascimento" runat="server" placeholder="Escreva uma Data Nascimento"></asp:TextBox>
            </div>
            <label><b>Data Cadastro</b></label>
            <asp:TextBox ID="txtData_cads" runat="server"></asp:TextBox>
            <label><b>Telefone</b></label><asp:Button ID="btnAdc_Telefone" runat="server" Text="Adicionar Telefone" OnClick="btnAdc_Telefone_Click" Style="width: 125px; margin-left: 8px;" />
            <asp:TextBox MaxLength="10" ID="txtTelefone" runat="server" placeholder="Escreva um Telefone"></asp:TextBox>
            <asp:GridView ID="GridTelefone" Style="text-align: center; margin-left: 45%" runat="server" CssClass="grid" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-CssClass="alt" BackColor="White"></asp:GridView>
        </div>
        <asp:Button ID="btn_Salvar"  Width="150px" runat="server" Text="Cadastrar" OnClick="btn_Salvar_Click" />
        <asp:Button ID="btn_Voltar"  Width="150px" runat="server" Text="Voltar" PostBackUrl="../Forms/FormPrincipal.aspx" />
    </form>
</body>
</html>
