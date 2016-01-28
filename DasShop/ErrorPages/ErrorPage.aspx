<%@ Page Title="" Language="C#" MasterPageFile="~/DasMaster.Master" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="DasShop.ErrorPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/ErrorStyle.css" rel="stylesheet" />
    <meta http-equiv="refresh" content="3;url=SecondIndex.aspx" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="wrapper">
        <h2>Aj aj... Något gick fel!</h2>
        <p>Du kommer skickas vidare till startsidan</p>
        <img src="Media/broken.jpg" />
    </div>
</asp:Content>
