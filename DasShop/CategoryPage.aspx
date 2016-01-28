<%@ Page Title="" Language="C#" MasterPageFile="~/DasMaster.Master" AutoEventWireup="true" CodeBehind="CategoryPage.aspx.cs" Inherits="DasShop.CategoryPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/CategoryStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="parallax" style="background-image: url('<%=ParallaxImg%>');">

        <div class="category-wrapper .clearfix">
            <div class="category-image">
                <asp:Image ID="CatImage" runat="server" />
            </div>

            <div class="category-description">
                <asp:Literal ID="CatDesc" runat="server"></asp:Literal>
            </div>
        </div>
    </div>

    <div class="first-product-wrapper">
        <asp:Repeater ID="CategoryProductRepeaterTopSix" runat="server" ItemType="DasDAL.Product">
            <ItemTemplate>

                <div class="first-product">
                    <a href="ProductPage.aspx?id=<%# Item.ProductID %>">
                        <img src="Media/Images/ProductInspirationImages/<%# Item.ProductImage %>.jpg" />
                        <h2><%# Item.ProductName %></h2>
                        <div class="button-wrapper">
                            <div class="add-to-cart-button">
                                <a class="cart-button" href="ProductPage.aspx?id=<%# Item.ProductID %>" > Köp </a> 
                            </div>
                        </div>
                        <p>
                            <%# Item.ProductPrice %>
                        </p>
                    </a>
                </div>

            </ItemTemplate>
        </asp:Repeater>



        <asp:Repeater ID="CategoryProductRepeaterLastSix" runat="server" ItemType="DasDAL.Product">
            <ItemTemplate>

                <div class="first-product">
                    <a href="ProductPage.aspx?id=<%# Item.ProductID %>">
                        <img src="Media/Images/ProductInspirationImages/<%# Item.ProductImage %>.jpg" />
                        <h2><%# Item.ProductName %></h2>
                        <div class="button-wrapper">
                                <div class="add-to-cart-button">
                                    <a class="cart-button" href="ProductPage.aspx?id=<%# Item.ProductID %>" > Köp </a> 
                                </div>
                            </div>
                        <p>
                            <%# Item.ProductPrice %>
                        </p>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div class="pagination-bottom ">
            <button id="PreviousPageButton" runat="server" class="previousPage" onserverclick="PreviousPageButton_Click"><i class="fa fa-arrow-left"> Föregående</i></button>
            <button id="NextPageButton" runat="server" class="nextPage" onserverclick="NextPageButton_Click">Nästa <i class="fa fa-arrow-right"></i></button>
        </div>
    </div>
</asp:Content>
