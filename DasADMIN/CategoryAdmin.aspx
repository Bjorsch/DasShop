<%@ Page Title="" Language="C#" MasterPageFile="~/DasMasterAdmin.Master" AutoEventWireup="true" CodeBehind="CategoryAdmin.aspx.cs" Inherits="DasShop.Admin" %>
<%@ MasterType VirtualPath="~/DasMasterAdmin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/CategoryAdminStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="category-admin-wrapper">
        <div class="create-link">
            <a class="create-link-button" href="CategoryCreate.aspx">Skapa ny kategori</a>
        </div>
    
        <div class="table-admin-wrapper">

            <asp:Repeater ID="RepCategory" runat="server" ItemType="DasDAL.Category">
                <HeaderTemplate>
                    <table class="category">
                        <tr class="heading">
                            <th></th>
                            <th class="category-id-heading">Kategori ID</th>
                            <th class="category-name-heading">Kategori namn</th>
                            <th class="category-desc-heading"></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="even-items">
                        <td><a href="CategoryCrud.aspx?id=<%# Item.CategoryID %>">Redigera</a></td>
                        <td class="category-id-number">
                            <%# Item.CategoryID %>
                        </td>
                        <td>
                            <%# Item.CategoryName %>
                        </td>
                        <td class="cat-desc">
                            
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="odd-items">
                        <td><a href="CategoryCrud.aspx?id=<%# Item.CategoryID %>">Redigera</a></td>
                        <td class="category-id-number">
                            <%# Item.CategoryID %>
                        </td>
                        <td>
                            <%# Item.CategoryName %>
                        </td>
                        <td  class="cat-desc">
                            
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
