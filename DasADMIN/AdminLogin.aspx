<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="DasADMIN.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/AdminLoginStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lobster" />
    <link href='https://fonts.googleapis.com/css?family=Aldrich' rel='stylesheet' type='text/css' />
    <link href="Styles/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <div class="panel-wrapper">
                <div class="logo">
                    <img src="Media/Images/600px-Minifigures.png" />
                </div>

                <h3 class="text-heading">Logga in som administratör</h3>

                <div class="input-username">
                    <i class="fa fa-user fa-2x"></i>
                    <asp:TextBox CssClass="txt-username" ID="txtUsername" runat="server" autofocus="autofocus" placeholder="Användarnamn" required></asp:TextBox>
                </div>
                <div class="input-password">
                    <i class="fa fa-lock fa-2x"></i>
                    <asp:TextBox CssClass="txt-password" ID="txtPassword" runat="server" TextMode="Password" required placeholder="Lösenord"></asp:TextBox>
                </div>
                <div class="checkbox-remember">
                    <a class="remember-me">Kom ihåg?</a>
                    <asp:CheckBox ID="RememberMe" runat="server" />
                </div>
                <asp:Button CssClass="btn-login" ID="BtnLogin" runat="server" Text="Logga in" OnClick="BtnLogin_Click" />
                <p>
                    <asp:Label ID="Msg" ForeColor="red" runat="server" />
                </p>
            </div>
        </section>
    </form>
</body>
</html>
