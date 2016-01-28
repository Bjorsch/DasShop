<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlternativeReceiptPage.aspx.cs" Inherits="DasShop.AlternativeReceiptPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
       .order-id{font-weight:bold;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="order-details-wrapper">
            <div class="order-header">
                <h2 class="order-header-heading">Kvitto - Tack för din beställning</h2>
            </div>
            <div class="product-details-wrapper">
                <asp:Label class="order-id" runat="server" Text="Order ID: "></asp:Label>
                <asp:Literal ID="OrderHeadIDLiteral" runat="server"></asp:Literal>
                <hr />
                <asp:Repeater ID="RepOrderHead2" runat="server" ItemType="DasDAL.OrderRow">
                    <ItemTemplate>
                        <div class="repeater-element">
                            <asp:Label class="order-product-id" runat="server" Text="Produkt ID: "></asp:Label>
                            <%# Item.ProductID %>
                            <br />
                            <asp:Label class="order-quantity" runat="server" Text="Antal av produkt: "></asp:Label>
                            <%# Item.Quantity %> stycken
                            <br />
                            <asp:Label class="order-product-name" runat="server" Text="Produktnamn: "></asp:Label>
                            <%# Item.ProductName %>
                            <br />
                            <asp:Label class="order-product-number" runat="server" Text="Produktnummer: "></asp:Label>
                            <%# Item.ProductNumber %>
                            <br />
                            <asp:Label class="order-product-price" runat="server" Text="Produktpris: "></asp:Label>
                            <%# Item.ProductPrice %> kronor
                            <hr />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="customer-sum-details-wrapper">
                    <asp:Label class="order-total-amount" runat="server" Text="Totalt antal produkter" ></asp:Label>
                    <asp:Literal ID="OrderTotalAmountOfProductLiteral" runat="server"></asp:Literal>
                    <br />
                    <br />

                    <asp:Label class="order-total-cost" runat="server" Text="Total varukostnad: "></asp:Label>
                    <asp:Literal ID="OrderTotalCostLiteral" runat="server"></asp:Literal>

                    <p id="fraktkostnad">Fraktkostnad: 49 kronor</p>

                    <asp:Label class="order-subtotal-cost" runat="server" Text="Total kostnad: " Font-Bold="true"></asp:Label>
                    <asp:Literal ID="OrderSubTotalCostLiteral" runat="server"></asp:Literal>
                    <br />
                <hr />
                    
                </div>
            </div>
            <div class="customer-details-wrapper">
                <div>
                    <h3 id="Kund">Kunduppgifter</h3>
                    <asp:Label class="cust-id" runat="server" Text="Kund nummer: "></asp:Label>
                    <asp:Literal ID="CustIDLiteral" runat="server"></asp:Literal>
                    <br />
                    <asp:Label class="cust-firstname" runat="server" Text="Förnamn: "></asp:Label>
                    <asp:Literal ID="CustFirstnameLiteral" runat="server"></asp:Literal>
                    <br />
                    <asp:Label class="cust-lastname" runat="server" Text="Efternamn: "></asp:Label>
                    <asp:Literal ID="CustLastnameLiteral" runat="server"></asp:Literal>
                    <br />
                    <asp:Label class="cust-SSN" runat="server" Text="Personnummer: "></asp:Label>
                    <asp:Literal ID="CustSSNLiteral" runat="server"></asp:Literal>
                    <br />
                    <asp:Label class="cust-street" runat="server" Text="Address: "></asp:Label>
                    <asp:Literal ID="CustStreetLiteral" runat="server"></asp:Literal>
                    <br />
                    <asp:Label class="cust-zip" runat="server" Text="Postnummer: "></asp:Label>
                    <asp:Literal ID="CustZipLiteral" runat="server"></asp:Literal>
                    <br />
                    <asp:Label class="cust-city" runat="server" Text="Stad: "></asp:Label>
                    <asp:Literal ID="CustCityLiteral" runat="server"></asp:Literal>
                    <br />
                    <asp:Label class="cust-country" runat="server" Text="Land: "></asp:Label>
                    <asp:Literal ID="CustCountryLiteral" runat="server"></asp:Literal>
                    <br />
                    <asp:Label class="cust-email" runat="server" Text="Email: "></asp:Label>
                    <asp:Literal ID="CustEmailLiteral" runat="server"></asp:Literal>
                    <br />
                    <asp:Label class="cust-phone" runat="server" Text="Telefon: " ></asp:Label>
                    <asp:Literal ID="CustPhoneLiteral" runat="server"></asp:Literal>
                    <br />
                    <hr />
                    <a href="http://localhost:11687/SecondIndex.aspx">Brick Kingdom Inc.</a>
                    <br />
                    <br />
                    <a><strong>Postaddress:</strong></a><br />
                    <a>Legovägen, 1337</a><br />
                    <a>123 45, Legoland</a><br /><br />
                    <a><strong>Huvudkontor:</strong></a><br />
                    <a>Tokyogatan, 1b</a><br />
                    <a>543 21, Dösjebro</a><br />
                    <a href="mailto:brickkingdom@outlook.com">Maila oss</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
