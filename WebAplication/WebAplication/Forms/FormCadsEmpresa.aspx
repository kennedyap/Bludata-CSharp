<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormCadsEmpresa.aspx.cs" Inherits="WebAplication.Forms.FormCadsProfessor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Cadastro de Empresas</title>
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
            background-color: #5167e3;
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

        span.psw {
            float: right;
            padding-top: 16px;
        }

        body {
            background-image: url(../Images/azul.jpg)
        }

        h2 {
            color: white
        }

        label {
            color: white
        }
    </style>
</head>
<body>
    <form id="frm_cadastroEmpresas" runat="server">
        <h2 style="text-align: center">Cadastro de Empresas.</h2>
        <div class="imgcontainer">
            <img src="../Images/notebook.jpg" alt="Professor" class="avatar" />
        </div>
        <div class="container">
            <label><b>UF</b></label><br />
            <asp:DropDownList id="drpUF" runat="server">
                <asp:ListItem Text=""/>
                <asp:ListItem Text="RO"/>
                <asp:ListItem Text="AC"/>
                <asp:ListItem Text="AM"/>
                <asp:ListItem Text="RR"/>
                <asp:ListItem Text="PA"/>
                <asp:ListItem Text="AP"/>
                <asp:ListItem Text="TO"/>
                <asp:ListItem Text="MA"/>
                <asp:ListItem Text="PI"/>
                <asp:ListItem Text="CE"/>
                <asp:ListItem Text="RN"/>
                <asp:ListItem Text="PB"/>
                <asp:ListItem Text="PE"/>
                <asp:ListItem Text="AL"/>
                <asp:ListItem Text="SE"/>
                <asp:ListItem Text="BA"/>
                <asp:ListItem Text="MG"/>
                <asp:ListItem Text="ES"/>
                <asp:ListItem Text="RJ"/>
                <asp:ListItem Text="SP"/>
                <asp:ListItem Text="PR"/>
                <asp:ListItem Text="SC"/>
                <asp:ListItem Text="RS"/>
                <asp:ListItem Text="MS"/>
                <asp:ListItem Text="MT"/>
                <asp:ListItem Text="GO"/>
                <asp:ListItem Text="DF"/>
            </asp:DropDownList>
            <br />
            <br />
            <label><b>Nome Fantasia</b></label>
            <asp:TextBox ID="txtNomeFantasia" runat="server" placeholder="Escreva um Nome"></asp:TextBox>
            <label><b>CNPJ</b></label>
            <asp:TextBox ID="txtCNPJ" runat="server" placeholder="Escreva um Nome"></asp:TextBox>
            <asp:Button ID="btn_Salvar"  Width="150px" runat="server" Text="Cadastrar" OnClick="btn_Salvar_Click" />
            <asp:Button ID="btn_Voltar"  Width="150px" runat="server" Text="Voltar" PostBackUrl="../Forms/FormPrincipal.aspx" />
        </div>
    </form>
</body>
</html>
