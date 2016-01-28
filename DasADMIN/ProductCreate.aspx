<%@ Page Title="" Language="C#" MasterPageFile="~/DasMasterAdmin.Master" AutoEventWireup="true" CodeBehind="ProductCreate.aspx.cs" Inherits="DasADMIN.ProductCreate" %>

<%@ MasterType VirtualPath="~/DasMasterAdmin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/ProductCreateStyle.css" rel="stylesheet" />
    <script src="tinymce/tinymce.min.js"></script>
    <script src="tinymce/plugins/placeholder/placeholder.js"></script>
    <script>
        tinymce.init({
            selector: "#ContentPlaceHolder1_TextBoxDescription",
            menubar: false,
            force_br_newlines: false,
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
                <asp:Label class="name-label" ID="Label1" runat="server" Text="Produktnamn"></asp:Label>
                <asp:TextBox class="name-box" ID="TextBoxName" Title="Namn" PlaceHolder="Max 50 tecken" Pattern="[A-Za-zåäöÅÄÖ0-9 ]{1,20}" Required runat="server" MaxLength="50" Width="500px" Height="20px"></asp:TextBox>
            </div>

            <div class="number">
                <asp:Label class="number-label" ID="Label5" runat="server" Text="Produktnummer"></asp:Label>
                <asp:TextBox class="number-box" ID="TextBoxNumber" Pattern="[A-Za-z0-9- ]{1,40}" Required Title="Produktnummer" PlaceHolder="t.ex. starwars-100" runat="server" MaxLength="20" Width="500px" Height="20px"></asp:TextBox>
            </div>

            <div class="price">
                <asp:Label class="price-label" ID="Label6" runat="server" Text="Produktpris"></asp:Label>
                <asp:TextBox class="price-box" ID="TextBoxPrice" Title="Pris" Pattern="[0-9]{1,4}[,]{1}[0-9]{1,4}" Required PlaceHolder="t.ex. 199,00" runat="server" MaxLength="20" Width="500px" Height="20px"></asp:TextBox>
            </div>

            <div class="image">
                <asp:Label class="image-label" ID="Label3" runat="server" Text="Inspirationsbild"></asp:Label>
                <asp:TextBox class="image-box" ID="TextBoxImage" Pattern="[A-Za-zåäöÅÄÖ0-9- ]{1,40}" Title="Produktbild" Required PlaceHolder="t.ex. starwars-100-img" runat="server" Width="500px" Height="20px"></asp:TextBox>
            </div>
            <div class="image-box">
                <asp:Label class="image-box-label" ID="Label4" runat="server" Text="Produktbild med låda"></asp:Label>
                <asp:TextBox class="box-image-box" ID="TextBoxImageBox" Pattern="[A-Za-zåäöÅÄÖ0-9- ]{1,40}" Title="Produktbild med låda" Required PlaceHolder="t.ex. starwars-100-img-box" runat="server" Width="500px" Height="20px"></asp:TextBox>
            </div>
            <div class="image-OObox">
                <asp:Label class="image-OObox-label" ID="Label7" runat="server" Text="Produktbild utan låda"></asp:Label>
                <asp:TextBox class="OObox-image-box" ID="TextBoxImageOOBox" Pattern="[A-Za-zåäöÅÄÖ0-9- ]{1,40}" Title="Produktbild utan låda" Required PlaceHolder="t.ex. starwars-100-img-OObox" runat="server" Width="500px" Height="20px"></asp:TextBox>
            </div>
            <div class="dropdown-list">
                <asp:Label class="ddl-label" ID="Label8" runat="server" Text="Kategori"></asp:Label>
                <asp:DropDownList
                    CssClass="ddl-cat"
                    ID="DDLCat"
                    runat="server"
                    AppendDataBoundItems="true"
                    DataSourceID="LinqDataSource1"
                    DataTextField="CategoryName"
                    DataValueField="CategoryID">
                    <asp:ListItem Text="--Välj kategori--" Value="none" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1"
                    runat="server"
                    Text="Du måste välja en kategori"
                    ControlToValidate="DDLCat"
                    InitialValue="none"
                    ValidationExpression="[0-9]+$">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="description">
            <asp:Label class="desc-label" ID="Label2" runat="server" Text="Produktbeskrivning"></asp:Label>
            <asp:TextBox class="desc-box" TextMode="MultiLine" placeholder="Fältet måste fyllas, max 200 tecken" MaxLength="200" Width="700px" Height="400px" ID="TextBoxDescription" runat="server"></asp:TextBox>
        </div>
        <div class="button-wrapper">
            <asp:Button CssClass="btn-create" ID="BtnCreate" OnClick="BtnCreate_OnClick" Text="Spara" runat="server"></asp:Button>
        </div>
    </div>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DasDAL.DasDBDataContext" EntityTypeName="" Select="new (CategoryName, CategoryID)" TableName="Categories">
    </asp:LinqDataSource>
</asp:Content>
