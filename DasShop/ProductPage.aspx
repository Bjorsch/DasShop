<%@ Page Title="" Language="C#" MasterPageFile="~/DasMaster.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="DasShop.ProductPage" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Import Namespace="DasShop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/ProductStyle.css" rel="stylesheet" />
    <link href="slick/slick.css" rel="stylesheet" />
    <link href="slick/slick-theme.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <div class="column1">
            <div class="thumbnail-images">
                <div class="thumbnail-image-1">
                    <asp:Image ID="ProductImageBoxSmall" runat="server" />
                </div>
                <div class="thumbnail-image-2">
                    <asp:Image ID="ProductImageOOBoxSmall" runat="server" />
                </div>
            </div>
        </div>

        <div class="column2">
            <div class="fullsize-images">
                <div class="fullsize-image-1">
                    <asp:Image ID="ProductImageBoxBig" runat="server" />
                </div>
                <div class="fullsize-image-2">
                    <asp:Image ID="ProductImageOOBoxBig" runat="server" />
                </div>
            </div>
        </div>

        <div class="column3">
            <div class="image-and-name-wrapper">
                <div class="category-image">
                    <asp:HyperLink ID="CategoryLink" runat="server">
                        <asp:Image ID="CategoryImageInCart" runat="server" />
                    </asp:HyperLink>
                </div>
                <div class="productname">
                    <asp:Literal runat="server" ID="LitProductName"></asp:Literal>
                </div>

                <div class="productnumber">
                    <asp:Literal runat="server" ID="LitProductNumber"></asp:Literal>
                </div>

            </div>

            <div class="prices-wrapper">
                <div class="product-price">
                    <asp:Label ID="ProductPrice" runat="server" Text=""></asp:Label>
                </div>

                <div class="product-vat">
                    <asp:Label ID="ProductVAT" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <div class="add-to-cart-wrapper">
                <div class="add-to-cart-dropdown-qty">
                    <div class="add-to-cart-label">
                        <asp:Label ID="AmountLabel" runat="server" Text="Antal"></asp:Label>
                    </div>
                    <div class="add-amount-to-cart">
                        <asp:DropDownList ID="DropDownQuantity" runat="server" CssClass="ddl" Height="25px" Width="45px">
                            <asp:ListItem Value="1" Text="1" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="2" Text="2"></asp:ListItem>
                            <asp:ListItem Value="3" Text="3"></asp:ListItem>
                            <asp:ListItem Value="4" Text="4"></asp:ListItem>
                            <asp:ListItem Value="5" Text="5"></asp:ListItem>
                            <asp:ListItem Value="6" Text="6"></asp:ListItem>
                            <asp:ListItem Value="7" Text="7"></asp:ListItem>
                            <asp:ListItem Value="8" Text="8"></asp:ListItem>
                            <asp:ListItem Value="9" Text="9"></asp:ListItem>
                            <asp:ListItem Value="10" Text="10"></asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>

                <div class="button-wrapper">
                    <div class="add-to-cart-button">
                        <asp:Button ID="AddToCart" class="cart-button" runat="server" Text="Lägg i varukorg" href="CategoryPage.aspx" OnClick="AddToCart_Click" />
                    </div>
                </div>
            </div>
            <div class="description-wrapper">
                <div class="description">
                    <asp:Literal runat="server" ID="LitProductDescription"></asp:Literal>
                </div>
            </div>
        </div>
    </div>

    <div class="related-products-wrapper">
        <asp:Repeater ID="RelatedProductRepeater" runat="server" ItemType="DasShop.Models.ProductEntity">
            <ItemTemplate>
                <div class="related-products">
                    <div class="related-products-image-and-info-wrapper">
                        <a href="ProductPage.aspx?id=<%# Item.ProductID %>">
                            <div class="img-wrapper">
                                <img src="Media/Images/ProductBoxImages/<%# Item.ProductImageBox %>.png" />
                            </div>
                            <div class="info-wrapper">
                                <p class="RelatedProductName"><%# Item.ProductName %></p>
                                <p class="RelatedProductPrice"><%#string.Format("{0:####.##}", Item.ProductPrice) %> Kr</p>
                            </div>
                        </a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>


    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="slick/slick.min.js"></script>
    <script>
        $('.fullsize-images').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,

            asNavFor: '.thumbnail-images'
        });
        $('.thumbnail-images').slick({
            slidesToShow: 2,
            slidesToScroll: 1,
            asNavFor: '.fullsize-images',
            dots: false,
            centerMode: false,
            vertical: true,
            focusOnSelect: true

        });
    </script>
    <script>
        $('.related-products-wrapper').slick({
            slidesToShow: 5,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 3000
        });
    </script>
</asp:Content>
