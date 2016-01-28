<%@ Page Title="" Language="C#" MasterPageFile="~/DasMasterAdmin.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="DasADMIN.OrderDetails" %>

<%@ MasterType VirtualPath="~/DasMasterAdmin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/OrderDetailsStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="order-details-wrapper">
        <div class="order-header">
            <p class="order-header-heading">Order detaljer</p>
        </div>
        <div class="product-details-wrapper">
            <div class="order-head-ID">
                        <asp:Label class="order-id" runat="server" Text="Order ID"></asp:Label>
                        <asp:Literal ID="OrderHeadIDLiteral" runat="server"></asp:Literal>
                    </div>
            <asp:Repeater ID="RepOrderHead" runat="server" ItemType="DasDAL.OrderRow">
                <ItemTemplate>       
                    <div class="repeater-element">
                        <asp:Label class="order-product-id" runat="server" Text="Produkt ID"></asp:Label>
                        <%# Item.ProductID %>

                        <asp:Label class="order-quantity" runat="server" Text="Antal av produkt"></asp:Label>
                        <%# Item.Quantity %> stycken

                    <asp:Label class="order-product-name" runat="server" Text="Produktnamn"></asp:Label>
                        <%# Item.ProductName %>

                        <asp:Label class="order-product-number" runat="server" Text="Produktnummer"></asp:Label>
                        <%# Item.ProductNumber %>

                        <asp:Label class="order-product-price" runat="server" Text="Produktpris"></asp:Label>
                        <%# Item.ProductPrice %> kronor
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="customer-sum-details-wrapper">
                <asp:Label class="order-total-amount" runat="server" Text="Totalt antal produkter"></asp:Label>
                <asp:Literal ID="OrderTotalAmountOfProductLiteral" runat="server"></asp:Literal>

                <asp:Label class="order-total-cost" runat="server" Text="Total varukostnad"></asp:Label>
                <asp:Literal ID="OrderTotalCostLiteral" runat="server"></asp:Literal>

                <p id="fraktkostnad">Fraktkostnad</p>
                <p>49 kr </p>

                <asp:Label class="order-subtotal-cost" runat="server" Text="Total kostnad"></asp:Label>
                <asp:Literal ID="OrderSubTotalCostLiteral" runat="server"></asp:Literal>
            </div>
        </div>

        <div class="customer-details-wrapper">
            <div>
                <asp:Label class="cust-id" runat="server" Text="Kund nummer"></asp:Label>
                <asp:Literal ID="CustIDLiteral" runat="server"></asp:Literal>

                <asp:Label class="cust-firstname" runat="server" Text="Förnamn"></asp:Label>
                <asp:Literal ID="CustFirstnameLiteral" runat="server"></asp:Literal>

                <asp:Label class="cust-lastname" runat="server" Text="Efternamn"></asp:Label>
                <asp:Literal ID="CustLastnameLiteral" runat="server"></asp:Literal>

                <asp:Label class="cust-SSN" runat="server" Text="Personnummer"></asp:Label>
                <asp:Literal ID="CustSSNLiteral" runat="server"></asp:Literal>

                <asp:Label class="cust-street" runat="server" Text="Address"></asp:Label>
                <asp:Literal ID="CustStreetLiteral" runat="server"></asp:Literal>

                <asp:Label class="cust-zip" runat="server" Text="Postnummer"></asp:Label>
                <asp:Literal ID="CustZipLiteral" runat="server"></asp:Literal>

                <asp:Label class="cust-city" runat="server" Text="Stad"></asp:Label>
                <asp:Literal ID="CustCityLiteral" runat="server"></asp:Literal>

                <asp:Label class="cust-country" runat="server" Text="Land"></asp:Label>
                <asp:Literal ID="CustCountryLiteral" runat="server"></asp:Literal>

                <asp:Label class="cust-email" runat="server" Text="Email"></asp:Label>
                <asp:Literal ID="CustEmailLiteral" runat="server"></asp:Literal>

                <asp:Label class="cust-phone" runat="server" Text="Telefon"></asp:Label>
                <div class="phone-literal">
                    <asp:Literal ID="CustPhoneLiteral" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
