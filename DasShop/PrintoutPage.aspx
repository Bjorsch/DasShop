<%@ Page Title="" Language="C#" MasterPageFile="~/DasMaster.Master" AutoEventWireup="true" CodeBehind="PrintoutPage.aspx.cs" Inherits="DasShop.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/ContactPageStyle.css" rel="stylesheet" />
    <script>
        var contents = window.opener.document.getElementById("directionsPanel");
        document.write(contents.innerHTML);
        window.print();     
    </script>
</asp:Content>
<asp:Content class="body-print" ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

</asp:Content>

