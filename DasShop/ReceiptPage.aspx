<%@ Page Title="" Language="C#" MasterPageFile="~/DasMaster.Master" AutoEventWireup="true" CodeBehind="ReceiptPage.aspx.cs" Inherits="DasShop.ReceiptPage" %>

<%@ MasterType VirtualPath="~/DasMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/ReceiptPageStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">

        <h2>Tack för din beställning!</h2>

        <div class="receipt-head">
            Kvitto
        <span class="order-details">
            <p>
                Ordernummer:
                <asp:Literal ID="OrderHeadIDLiteral" runat="server"></asp:Literal>
            </p>
            <p>
                Beställningdatum:
                <asp:Literal ID="litTimeOfOrder" runat="server"></asp:Literal>
            </p>
        </span>
        </div>

        <div class="customer-wrapper">
            <div class="cust-adress-wrapper">
                <asp:Label class="cust-adress" runat="server" Text="Leverans -och Fakturaadress"></asp:Label>
                <p>
                    <asp:Literal ID="CustFirstnameLiteral" runat="server"></asp:Literal>
                    <asp:Literal ID="CustLastnameLiteral" runat="server"></asp:Literal>
                    <br />
                    <asp:Literal ID="CustStreetLiteral" runat="server"></asp:Literal>
                    <br />
                    <asp:Literal ID="CustZipLiteral" runat="server"></asp:Literal>
                    <asp:Literal ID="CustCityLiteral" runat="server"></asp:Literal>
                </p>
            </div>
            <div class="cust-contact-wrapper">
                <asp:Label class="cust-contact" runat="server" Text="Kontaktuppgifter"></asp:Label>
                <p>
                    <asp:Literal ID="CustEmailLiteral" runat="server"></asp:Literal>
                    <br />
                    <asp:Literal ID="CustPhoneLiteral" runat="server"></asp:Literal>
                </p>
            </div>
        </div>

        <div class="tabell-wrapper">
            <table style="width: 100%">
                <thead>
                    <th>Produkt</th>
                    <th>Antal</th>
                    <th>à Pris</th>
                </thead>
                <tfoot>
                    <tr>
                        <td>Totalt</td>
                        <td>
                            <asp:Literal ID="OrderTotalAmountOfProductLiteral" runat="server"></asp:Literal></td>
                        <td>
                            <asp:Literal ID="OrderSubTotalCostLiteral" runat="server"></asp:Literal>

                        </td>
                    </tr>
                </tfoot>
                <asp:Repeater ID="RepOrderHead2" runat="server" ItemType="DasDAL.OrderRow">
                    <ItemTemplate>
                        <tbody>
                            <td><%# Item.ProductName %></td>
                            <td><%# Item.Quantity %> st</td>
                            <td><%# Item.ProductPrice.ToString("####") %> SEK</td>
                        </tbody>
                    </ItemTemplate>
                </asp:Repeater>
                <td>Fraktkostnad</td>
                <td></td>
                <td>49 SEK</td>
            </table>
        </div>

        <div class="total-wrapper">
            <div class="total-cost-wrapper">
                <p class="moms">(25% moms ingår)</p>

                <p>Betalningssätt: Faktura</p>
                <p>
                </p>
            </div>
        </div>

        <div class="shop-info-wrapper">
            <span><i class="fa fa-envelope"></i>&nbsp;brickkingdom@outlook.com</span>
            <span><i class="fa fa-phone"></i>&nbsp;0700 000 000 </span>
        </div>

    </div>
</asp:Content>
