<%@ Page Title="" Language="C#" MasterPageFile="~/DasMaster.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DasShop.Index" %>

<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="DasDAL" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="head">
    <link href="Styles/IndexStyle.css" rel="stylesheet" />

    <script>
        $(document).on('ready', function () {
            $(".products").owlCarousel({
                items: 3,
                lazyLoad : true
                //navigation: true
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="video-header">
        <div class="video-container">
            <div class="video-content">
                <h3 class="main">Welcome to<br />
                   The Brick Kingdom</h3>
                <p>Maddorfakkor!</p>
              
            </div>
            
            <video autoplay="autoplay" loop="loop" muted="muted">
                <source src="Media/Videos/legoMovie.mov" type="video/mov" />
                <source src="Media/Videos/legoMovie.mp4" type="video/mp4" />
                <source src="Media/Videos/legoMovie.webm" type="video/webm" />
                Your browser does not support this video. Uppdate your browser or use another one.
            </video>
             <img src="Media/Images/legorow1.png" />
        </div>
    </div>
    <asp:Repeater ID="repProductGroups" ItemType="DasShop.ProductGroup" OnItemDataBound="repProductGroups_OnItemDataBound" runat="server">
        <ItemTemplate>
            <div class="productlist-wrapper">
                <div class="productlist clearfix">
                    <div class="category-name">
                        <img src="Media/Images/CategoryLogo/<%#Item.LogoImg %>.png" /></div>
                    <div class="products">

                        <asp:Repeater runat="server" ID="repProducts" ItemType="DasDAL.Product">
                            <ItemTemplate>
                                <div class="the-product item ">
                                    <img class="lazyOwl" data-src="Media/Images/ProductInspirationImages/<%# Item.ProductImage %>.jpg" />
                                    <a href="ProductPage.aspx?id=<%# Item.ProductID %>">
                                        <h2><%# Item.ProductName %></h2>
                                    </a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
