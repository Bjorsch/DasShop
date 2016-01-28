<%@ Page Title="" Language="C#" MasterPageFile="~/DasMasterAdmin.Master" AutoEventWireup="true" CodeBehind="ProductAdmin.aspx.cs" Inherits="DasShop.ProductAdmin" %>

<%@ MasterType VirtualPath="~/DasMasterAdmin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/ProductAdminStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-admin-wrapper">
        <div class="create-link">
            <a class="create-link-button" href="ProductCreate.aspx">Skapa ny produkt</a>
        </div>
        <div class="table-admin-wrapper">
            <asp:Repeater ID="RepProductWithoutCategory" runat="server" ItemType="DasDAL.Product">
                <HeaderTemplate>
                    <table class="product">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="odd-items">
                        <td><a href="ProductCrud.aspx?id=<%# Item.ProductID %>">Redigera</a></td>
                        <td class="product-without-category-id-number">
                            <%# Item.ProductID %>
                        </td>
                        <td class="product-without-category-name">
                            <%# Item.ProductName %>
                        </td>
                        <td class="no-category-td">
                            --Ej kopplad till kategori--
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even-items">
                        <td><a href="ProductCrud.aspx?id=<%# Item.ProductID %>">Redigera</a></td>
                        <td class="product-without-category-id-number">
                            <%# Item.ProductID %>
                        </td>
                        <td class="product-without-category-name">
                            <%# Item.ProductName %>
                        </td>
                        <td class="no-category-td">
                            --Ej kopplad till kategori--
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:Repeater ID="RepProducts" runat="server" ItemType="DasDAL.ProductRelCategory">
                <HeaderTemplate>
                    <table class="product">
                        <tr class="heading">
                            <th></th>
                            <th class="product-id-heading">Produkt ID</th>
                            <th class="product-name-heading">Produktnamn</th>                            
                            <th class="connected-category-heading">Kategori</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="even-items">
                        <td><a href="ProductCrud.aspx?id=<%# Item.Product.ProductID %>">Redigera</a></td>
                        <td class="product-id-number">
                            <%# Item.Product.ProductID %>
                        </td>
                        <td>
                            <%# Item.Product.ProductName %>
                        </td>
                        <td>
                            <%# Item.Category.CategoryName %>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="odd-items">
                        <td><a href="ProductCrud.aspx?id=<%# Item.Product.ProductID %>">Redigera</a></td>
                        <td class="product-id-number">
                            <%# Item.Product.ProductID %>
                        </td>
                        <td>
                            <%# Item.Product.ProductName %>
                        </td>
                        <td>
                            <%# Item.Category.CategoryName %>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

