<%@ Page Title="" Language="C#" MasterPageFile="~/DasMaster.Master" AutoEventWireup="true" CodeBehind="SecondIndex.aspx.cs" Inherits="DasShop.SecondIndex" %>

<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="DasDAL" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="head">
    <link href="Styles/SecondIndex.css" rel="stylesheet" />
    <link href="Styles/jquery.pagepiling.css" rel="stylesheet" />
    <script src="Javascript/jquery.pagepiling.min.js"></script>

    <script>
        $(document).on('ready', function () {
            $(".wrapper-product").owlCarousel({
                items: 1,
                lazyLoad: true
            });
        });

        $(document).ready(function () {
            $('#pagepiling').pagepiling({
                navigation: {
                    'textColor': '#951419',
                    'bulletsColor': '#951419',
                    'position': 'right',
                    'tooltips': ['Hem', 'Turtels', 'DC Comics', 'The Hobbit', 'Jurassic World', 'Disney Princesses', 'Star Wars']
                },
                scrollingSpeed: 100
            });

            document.getElementById('pageVideo').play();
        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="pagepiling">
        <div class="section">
            
            <div class="video-header">
                <div class="video-container">
                    <video autoplay="autoplay" loop="loop" muted="muted" id="pageVideo">
                        <%--<source src="Media/Videos/legoMovie.mov" type="video/mov" />--%>
                        <%--<source src="Media/Videos/legoMovie.mp4" type="video/mp4" />--%>
                        <%--<source src="Media/Videos/legoMovie.webm" type="video/webm" />--%>
                        <source src="Media/Videos/VideoOnly.webm" type="video/webm" />
                        Your browser does not support this video. Uppdate your browser or use another one.
                    </video>

                    <div class="video-content">
                        <div class="wrapper-video-content">
                            <h2>Välkommen till Brick Kingdom</h2>
                            <p id="slogan">Allt inom filmbaserat Lego</p>

                            <div class="wrapper-product">
                                <asp:Repeater ID="repProducts" ItemType="DasShop.Models.FrontPageRandomProduct" runat="server">
                                    <ItemTemplate>

                                        <div class="the-product item">

                                            <h3><%# Item.ProductName %></h3>
                                            <div class="product-presentation">
                                                <a href="ProductPage.aspx?id=<%# Item.ProductID %>">
                                                    <img class="lazyOwl" src="Media/Images/ProductInspirationImages/<%# Item.ProductImage %>.jpg" />
                                                </a>
                                                <p class="short-description">
                                                    <%# string.Join(" ", Item.ProductDescription.Split(' ').Take(15)) +  "..." %>
                                                </p>
                                                <p class="read-more">
                                                    <a href="ProductPage.aspx?id=<%# Item.ProductID %>"> Ta mig dit! <i class="fa fa-arrow-right animated infinite fadeOutRight"></i></a>
                                                </p>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        
            <div class="sale-arrow animated zoomInLeft">
                <div class="text-wrapper">
                    <p class="big animated bounceInDown">HEY!</p>
                    <p class="small animated bounceInDown">there's a</p>
                    <p class="big animated bounceInDown">SALE</p>
                    <p class="small animated bounceInDown">going on down here!</p>
                    <p class="big animated bounceInDown">Scroll!</p>
                </div>
                <i class="fa fa-arrow-down animated infinite bounce"></i>
                <i class="fa fa-arrow-down animated infinite bounce"></i>
                <i class="fa fa-arrow-down animated infinite bounce"></i>
            </div>

        </div>
        <!-- end First section -->

        <div class="section second-section">
            <div class="special-sale">REA </div>
            <div class="campain-wrapper">
                <div class="campain-info">
                    <img src="Media/Images/ProductBoxImages/turtle-108-img-box.png" />
                    <div class="campain-text">
                        <h2>Flykten från Kraangs Laboratorium</h2>
                        <span class="new-price">399 SEK</span><span class="old-price">499 SEK</span>
                    </div>
                </div>
            </div>
            <a href="CategoryPage.aspx?id=2">“Go Ninja, Go Ninja, Go!”<i class="fa fa-arrow-right animated infinite fadeOutRight"></i></a>

        </div>
        <!-- end Second section -->

        <div class="section third-section">
            <div class="special-bestseller">Bäst säljare </div>
            <div class="campain-wrapper">
                <div class="campain-info">
                    <img src="Media/Images/ProductBoxImages/superhero-100-img-box.png" />
                    <div class="campain-text">
                        <h2>Hamnjakt med BatBoat</h2>
                        <span class="old-price">399 SEK</span>
                    </div>
                </div>
            </div>
            <a href="CategoryPage.aspx?id=3">“To the Batcave!” <i class="fa fa-arrow-right animated infinite fadeOutRight"></i></a>
        </div>
        <!-- end third section--->

        <div class="section fourth-section">
            <div class="wrapper">
                <div class="box">
                    <div class="box-img-wrap">
                        <img src="Media/Images/ProductBoxImages/hobbit-100-img-box.png" />
                    </div>
                    <p class="name">Ensliga berget</p>
                    <p class="price">399 SEK</p>
                </div>
                <div class="box">
                    <div class="box-img-wrap">
                        <img src="Media/Images/ProductBoxImages/hobbit-101-img-box.png" />
                    </div>
                    <p class="name">Femhärarslaget</p>
                    <p class="price" style="color: red; font-weight: 900">299 SEK</p>
                </div>
                <div class="box">
                    <div class="box-img-wrap">
                        <img src="Media/Images/ProductBoxImages/hobbit-102-img-box.png" />
                    </div>
                    <p class="name">Attacken mot Sjöstaden</p>
                    <p class="price">499 SEK</p>
                </div>
                <div class="box">
                    <div class="box-img-wrap">
                        <img src="Media/Images/ProductBoxImages/hobbit-103-img-box.png" />
                    </div>
                    <p class="name">Striden mot Häxmästaren</p>
                    <p class="price">399 SEK</p>
                </div>

                <div class="box">
                    <div class="box-img-wrap">
                        <img src="Media/Images/ProductBoxImages/hobbit-104-img-box.png" />
                    </div>
                    <p class="name">Striden i Dol Guldur</p>
                    <p class="price">499 SEK</p>
                </div>
                <div class="box">
                    <div class="box-img-wrap">
                        <img src="Media/Images/ProductBoxImages/hobbit-105-img-box.png" />
                    </div>
                    <p class="name">Mirkwood alvarmé</p>
                    <p class="price" style="color: red; font-weight: 900">399 SEK</p>
                </div>
            </div>
            <a href="CategoryPage.aspx?id=7">“We wants it, we needs it. Must have the precious!”  <i class="fa fa-arrow-right animated infinite fadeOutRight"></i></a>

        </div>
        <!-- end fourth section--->

        <div class="section fifth-section">
            <div class="wrapper">
                <div class="box">
                    <img src="Media/Images/ProductBoxImages/jurassicpark-100-img-box.png" />
                    <div class="info-text">
                        <h2>Pteranodonfångst</h2>
                        <p class="price" style="color: red; font-weight: 900">199 SEK</p>
                        <p class="old-price">299 SEK</p>
                    </div>
                </div>
                <div class="box">
                    <img src="Media/Images/ProductBoxImages/jurassicpark-101-img-box.png" />
                    <div class="info-text">
                        <h2>Dilophosaurusbakhåll</h2>
                        <p class="price">299 SEK</p>
                    </div>
                </div>
                <div class="box">
                    <img src="Media/Images/ProductBoxImages/jurassicpark-102-img-box.png" />
                    <div class="info-text">
                        <h2>Raptorattack</h2>
                        <p class="price">299 SEK</p>
                    </div>
                </div>
            </div>
            <a href="CategoryPage.aspx?id=5">“Welcome... To Jurassic Park!”<i class="fa fa-arrow-right animated infinite fadeOutRight"></i></a>
        </div>
        <!-- end fifth section--->

        <div class="section sixth-section">
            <div class="wrapper">
                <div class="box">
                    <div class="box-img-wrap">
                        <img src="Media/Images/ProductBoxImages/disney-100-img-box.png" />
                    </div>
                    <p class="name">Elsas gnistrande isslott</p>
                    <p class="price">299 SEK</p>
                </div>
                <div class="box">
                    <div class="box-img-wrap">
                        <img src="Media/Images/ProductBoxImages/disney-101-img-box.png" />
                    </div>
                    <p class="name">Ariels undervattenspalats</p>
                    <p class="price" style="color: red; font-weight: 900">399 SEK</p>
                </div>
                <div class="box">
                    <div class="box-img-wrap">
                        <img src="Media/Images/ProductBoxImages/disney-103-img-box.png" />
                    </div>
                    <p class="name">Törnrosas kungliga sovrumn</p>
                    <p class="price">299 SEK</p>
                </div>
                <div class="box">
                    <div class="box-img-wrap">
                        <img src="Media/Images/ProductBoxImages/disney-104-img-box.png" />
                    </div>
                    <p class="name">Askungens förtrollade vagn</p>
                    <p class="price">499 SEK</p>
                </div>
            </div>
            <a href="CategoryPage.aspx?id=1">“Can't hold it back any more!”<i class="fa fa-arrow-right animated infinite fadeOutRight"></i></a>

        </div>
        <!-- end sixth section--->

        <div class="section seventh-section">
            <div class="wrapper">
                <div class="box">
                    <img src="Media/Images/ProductBoxImages/starwars-101-img-box.png" />
                    <div class="info-text">
                        <h2>TIE Advanced Prototype</h2>
                        <p class="price">599 SEK</p>
                    </div>
                </div>
                <div class="box">
                    <img src="Media/Images/ProductBoxImages/starwars-102-img-box.png" />
                    <div class="info-text">
                        <h2>AT-AT</h2>
                        <p class="price">499 SEK</p>
                    </div>
                </div>
            </div>
            <a href="CategoryPage.aspx?id=6">“Boba Fett? <i>Boba Fett?</i> Where?” <i class="fa fa-arrow-right animated infinite fadeOutRight"></i></a>
        </div>
        <!-- end seventh section--->


    </div>
    <!-- end pagepiling -->
</asp:Content>
