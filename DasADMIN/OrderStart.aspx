<%@ Page Title="" Language="C#" MasterPageFile="~/DasMasterAdmin.Master" AutoEventWireup="true" CodeBehind="OrderStart.aspx.cs" Inherits="DasADMIN.OrderAdmin" %>

<%@ MasterType VirtualPath="~/DasMasterAdmin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/OrderStartStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-admin-wrapper">
        <asp:Repeater ID="OrderRepeater" runat="server" ItemType="DasDAL.OrderHead">
            <HeaderTemplate>
                <table class="order">
                    <tr class="heading">
                        <th></th>
                        <th class="order-id-heading">Order ID</th>
                        <th class="order-unique-heading">Unikt Order ID</th>
                        <th class="order-cust-heading">Kund ID</th>
                        <th class="order-mail-heading">Kund email</th>
                        <th class="order-date-heading">Order datum</th>
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr class="even-items">
                    <td><a href="OrderDetails.aspx?id=<%# Item.OrderHeadID %>">Detaljer</a></td>
                    <td class="order-ids"><%# Item.OrderHeadID%></td>
                    <td class="order-ids"><%# Item.UniqueOrderID%></td>
                    <td class="order-ids"><%# Item.CustomerID%></td>
                    <td class=""><%# Item.Email%></td>
                    <td class=""><%# Item.OrderDate%></td>
                </tr>
            </ItemTemplate>

            <AlternatingItemTemplate>
                <tr class="odd-items">
                    <td><a href="OrderDetails.aspx?id=<%# Item.OrderHeadID %>">Detaljer</a></td>
                    <td class="order-ids"><%# Item.OrderHeadID%></td>
                    <td class="order-ids"><%# Item.UniqueOrderID%></td>
                    <td class="order-ids"><%# Item.CustomerID%></td>
                    <td class=""><%# Item.Email%></td>
                    <td class=""><%# Item.OrderDate%></td>
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
