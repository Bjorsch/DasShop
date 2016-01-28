<%@ Page Title="" Language="C#" MasterPageFile="~/DasMaster.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="DasShop.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/search.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="wrapper">
        <div class="wrapper-input">
            <asp:Panel runat="server" DefaultButton="lnkBtSearch">
                <asp:Label CssClass="lbSearch" runat="server"><i class="fa fa-search"></i></asp:Label>
                <asp:TextBox ID="tbSearch" runat="server" CssClass="tbSearch" placeholder="Sök produkt" />
                <asp:LinkButton ID="lnkBtSearch" runat="server" Text="Go!" CssClass="lbtSearch" OnClick="lbtSearch_OnClick" />
                <asp:Label ID="lbNoResults" CssClass="lbNoResult" runat="server" Text="Din sökning gav tyvärr inga resultat. Prova ett annat sökord!"></asp:Label>
            </asp:Panel>
        </div>

        <asp:Repeater ID="repSearchResult" runat="server" ItemType="DasShop.Models.ProductEntity">
            <ItemTemplate>
                <a href="ProductPage.aspx?id=<%# Item.ProductID %>">
                    <div class="wrapper-prod">
                        <span class="img-span">
                            <img src="Media/Images/ProductBoxImages/<%# Item.ProductImageBox %>.png" />
                        </span>
                        <div class="wrapper-text">
                            <span class="productname"><%# Item.ProductName %></span>
                            <span class="categoryname"><%# Item.CategoryName %></span>
                            <span class="productprice"><%# Item.ProductPrice.ToString("####" + " SEK") %></span>
                        </div>
                    </div>
                </a>
            </ItemTemplate>
        </asp:Repeater>
        <div class="pagination">
            <div class="wrapper-pag">
                <asp:LinkButton CssClass="pag-next" ID="lnkBtPagPrev" OnClick="Pagination" runat="server"><i class="fa fa-arrow-left"></i> Föregående </asp:LinkButton>
                <asp:LinkButton CssClass="pag-before" ID="lnkBtPagNext" OnClick="Pagination" runat="server"> Nästa <i class="fa fa-arrow-right"></i></asp:LinkButton>
            </div>
        </div>

    </div>

</asp:Content>
