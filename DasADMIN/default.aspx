<%@ Page Title="" Language="C#" MasterPageFile="~/DasMasterAdmin.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="DasADMIN.AdminStartpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/AdminStartPageStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-wrapper">        
         <div class="admin-categories">
            <h2>Ordrar</h2>
            <a href="OrderStart.aspx">Gå till alla ordrar</a>           
        </div>
        <div class="admin-products">
            <h2>Produkter</h2>
            <a href="ProductCreate.aspx">Skapa ny produkt</a>
            <a href="ProductAdmin.aspx">Redigera produkt</a>
        </div>
        <div class="admin-categories">
            <h2>Kategorier</h2>
            <a href="CategoryCreate.aspx">Skapa ny kategori</a>
            <a href="CategoryAdmin.aspx">Redigera kategori</a>
        </div>      
    </div>
</asp:Content>
