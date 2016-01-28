<%@ Page Title="" Language="C#" MasterPageFile="~/DasMasterAdmin.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="ProductCrud.aspx.cs" Inherits="DasADMIN.ProductCrud" %>

<%@ MasterType VirtualPath="~/DasMasterAdmin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/ProductCrudStyle.css" rel="stylesheet" />
    <script src="tinymce/tinymce.min.js"></script>
    <script src="tinymce/plugins/placeholder/placeholder.js"></script>
    <script>
        tinymce.init({
            selector: "#ContentPlaceHolder1_prodDescription",
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
                <asp:Label class="name-label" ID="Name" runat="server" Text="Namn"></asp:Label>
                <asp:TextBox class="tbx-name" ID="prodName" Title="Namn" Required PlaceHolder="Max 50 tecken" runat="server" MaxLength="50" Width="500px" Height="20px"></asp:TextBox>
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1"
                    runat="server"
                    ErrorMessage="Boxen kan inte vara tom och och godkända tecken är: A-Ö, a-ö, 0-9"
                    ControlToValidate="prodName"
                    ValidationExpression="[A-Za-zÅÄÖåäö0-9 ]*$"></asp:RegularExpressionValidator>
            </div>
            <div class="number">
                <asp:Label class="number-label" ID="Number" runat="server" Text="Produktnummer"></asp:Label>
                <asp:TextBox class="tbx-number" ID="prodNumber" Title="Produktnummer" PlaceHolder="t.ex. starwars-100" runat="server" MaxLength="20" Width="500px" Height="20px"></asp:TextBox>
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator2"
                    runat="server"
                    ErrorMessage="Boxen kan inte vara tom och godkända tecken är: A-Ö, a-ö, 0-9, -"
                    ControlToValidate="prodNumber"
                    ValidationExpression="[A-Za-zÅÄÖåäö0-9\-\ ]*$"></asp:RegularExpressionValidator>
            </div>
            <div class="price">
                <asp:Label class="price-label" ID="Price" runat="server" Text="Produktpris"></asp:Label>
                <asp:TextBox class="tbx-price" ID="prodPrice" Title="Pris" PlaceHolder="t.ex. 199,00" runat="server" MaxLength="20" Width="500px" Height="20px"></asp:TextBox>

            </div>
            <div class="image">
                <asp:Label class="image-label" ID="Image" runat="server" Text="Produktbild"></asp:Label>
                <asp:TextBox class="tbx-image" ID="prodImage" Title="Produktbild" PlaceHolder="t.ex. starwars-100-img" runat="server" Width="500px" Height="20px"></asp:TextBox>
            </div>

            <div class="image-box">
                <asp:Label class="image-box-label" ID="ImageBox" runat="server" Text="Produktbild med låda"></asp:Label>
                <asp:TextBox class="tbx-box-image" ID="prodImageBox" Title="Produktbild med låda" PlaceHolder="t.ex. starwars-100-img-box" runat="server" Width="500px" Height="20px"></asp:TextBox>

            </div>
            <div class="image-OObox">
                <asp:Label class="image-OObox-label" ID="ImageOOBox" runat="server" Text="Produktbild utan låda"></asp:Label>
                <asp:TextBox class="tbx-OObox-image" ID="prodImageOOBox" Title="Produktbild utan låda" PlaceHolder="t.ex. starwars-100-img-OObox" runat="server" Width="500px" Height="20px"></asp:TextBox>

            </div>
            <div class="dropdown-list">
                <asp:Label class="ddl-label" ID="Label8" runat="server" Text="Kategori"></asp:Label>
                <asp:DropDownList CssClass="ddl-relcat" ID="ProductCrudDDL" runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="description">
            <asp:Label class="desc-label" ID="Desc" runat="server" Text="Product Description"></asp:Label>
            <asp:TextBox ID="prodDescription" runat="server" placeholder="Fältet måste fyllas, max 200 tecken" TextMode="MultiLine" MaxLength="500" Width="700px" Height="400px"></asp:TextBox>
        </div>
        <div class="button-wrapper">
            <asp:Button CssClass="btn-update" ID="BtnUpdate" OnClick="BtnUpdate_OnClick" runat="server" Text="Spara" CausesValidation="true"></asp:Button>
            <asp:Button CssClass="btn-delete" ID="BtnDelete" OnClick="BtnDelete_OnClick" runat="server" Text="Ta Bort"></asp:Button>
        </div>
    </div>
</asp:Content>
