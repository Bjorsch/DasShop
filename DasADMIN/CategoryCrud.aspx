<%@ Page Title="" Language="C#" MasterPageFile="~/DasMasterAdmin.Master" AutoEventWireup="true" CodeBehind="CategoryCrud.aspx.cs" Inherits="DasADMIN.CategoryCrud" %>
<%@ MasterType VirtualPath="~/DasMasterAdmin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/CategoryCrudStyle.css" rel="stylesheet" />
    <script src="tinymce/tinymce.min.js"></script>
    <script src="tinymce/plugins/placeholder/placeholder.js"></script>
    <script>
        tinymce.init({
            selector: "#ContentPlaceHolder1_TextBoxDesc",
            menubar: false,
            force_br_newlines: false,
            force_p_newlines: false,
            forced_root_block: '',
            plugins: ["placeholder"]
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="crud-wrapper">
        <div class="tbx-wrapper">
            <div class="name">
                <asp:Label class="name-label" ID="Label1" runat="server" Text="Kategori namn"></asp:Label>
                <asp:TextBox class="name-box" ID="TextBoxName" runat="server" MaxLength="20" Width="500px" Height="20px"></asp:TextBox>
            </div>
            <div class="image">
                <asp:Label class="image-label" ID="Label3" runat="server" Text="Kategori bild"></asp:Label>
                <asp:TextBox class="image-box" ID="TextBoxImage" runat="server" Width="500px" Height="20px"></asp:TextBox>
            </div>
            <div class="parallax">
                <asp:Label class="parallax-label" ID="Label4" runat="server" Text="Parallax bild"></asp:Label>
                <asp:TextBox class="parallax-box" ID="TextBoxParallax" runat="server" Width="500px" Height="20px"></asp:TextBox>
            </div>
        </div>
        <div class="description">
            <asp:Label class="desc-label" ID="Label2" runat="server" Text="Kategori beskrivning"></asp:Label>
            <asp:TextBox class="desc-box" TextMode="MultiLine" placeholder="Fältet måste fyllas, max 200 tecken" MaxLength="500" Width="700px" Height="400px" ID="TextBoxDesc" runat="server"></asp:TextBox>
        </div>
        <div class="button-wrapper">
            <asp:LinkButton CssClass="btn-update" ID="BtnUpdate" OnClick="BtnUpdate_OnClick" runat="server">Spara</asp:LinkButton>
            <asp:LinkButton CssClass="btn-delete" ID="BtnDelete" OnClick="BtnDelete_OnClick" runat="server">Ta bort</asp:LinkButton>
        </div>
    </div>
</asp:Content>
