<%@ Page Title="" Language="C#" MasterPageFile="~/DasMasterAdmin.Master" AutoEventWireup="true" CodeBehind="CategoryCreate.aspx.cs" Inherits="DasADMIN.CategoryCreate" %>
<%@ MasterType VirtualPath="~/DasMasterAdmin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/CategoryCreateStyle.css" rel="stylesheet" />
    <script src="tinymce/tinymce.min.js"></script>
    <script src="tinymce/plugins/placeholder/placeholder.js"></script>
    <script>
        tinymce.init({
            selector: "#ContentPlaceHolder1_TextBoxDesc",
            menubar: false,
            force_br_newlines: true,
            force_p_newlines: false,
            forced_root_block: '',
            plugins: [ "placeholder" ]
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="crud-wrapper">
        <div class="tbx-wrapper">
            <div class="name">
                <asp:Label class="name-label" ID="Label1" runat="server" Text="Kategori namn"></asp:Label>
                <asp:TextBox class="name-box" ID="TextBoxName" runat="server" Required PlaceHolder="Max 20 tecken" pattern="[A-Za-zÅÄÖåäö0-9- ]{1,40}" MaxLength="20" Width="500px" Height="20px"></asp:TextBox>
            </div>

            <div class="image">
                <asp:Label class="image-label" ID="Label3" runat="server" Text="Kategori bild"></asp:Label>
                <asp:TextBox class="image-box" ID="TextBoxImage" runat="server" Required PlaceHolder="T.ex. turtlesLogoImg" pattern="[A-Za-zÅÄÖåäö0-9- ]{1,40}" Width="500px" Height="20px"></asp:TextBox>
            </div>

            <div class="parallax">
                <asp:Label  class="parallax-label" ID="Label4" runat="server" Text="Parallax bild"></asp:Label>
                <asp:TextBox class="parallax-box" ID="TextBoxParallax" Required PlaceHolder="T.ex. TheHobbit" pattern="[A-Za-z0-9- ]{1,40}" runat="server" Width="500px" Height="20px"></asp:TextBox>
            </div>
        </div>

        <div class="description">
            <asp:Label class="desc-label" ID="Label2" runat="server" Text="Kategori beskrivning"></asp:Label>
            <asp:TextBox class="desc-box"  TextMode="MultiLine" placeholder="Fältet måste fyllas i, max 200 tecken" MaxLength="500" Width="700px" Height="400px" ID="TextBoxDesc" runat="server"></asp:TextBox>
        </div>

        <div class="button-wrapper">
            <asp:Button CssClass="btn-create" ID="BtnCreate" OnClick="BtnCreate_OnClick" runat="server" Text="Spara"></asp:Button>
        </div>
    </div>
</asp:Content>
