<%@ Page Title="" Language="C#" MasterPageFile="~/DasMaster.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="DasShop.Checkout" %>

<%@ MasterType VirtualPath="DasMaster.Master" %>

<%@ Import Namespace="DasShop" %>
<%@ Import Namespace="DasShop.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/Checkout.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <div class="wrapper-info">
            <!-- heading -->
            <div class="col">
                <div class="orderhead">
                    <div class="col-top">
                        <h3>Din Varukorg</h3>
                    </div>
                    <div class="col-content">
                        <div class="orderrow-head">
                            <span>Produktnamn</span>
                            <span>à pris</span>
                            <span>antal</span>
                            <span>totalt</span>
                        </div>
                        

                        <!-- orderrow-head -->
                        <div class="orderrow">
                            <asp:Repeater ID="repOrderrows" ItemType="DasShop.Models.CartItem" runat="server" OnItemDataBound="repOrderrows_OnItemDataBound" EnableViewState="True">
                                <ItemTemplate>
                                    <div class="one-orderrow">
                                        <span id="productname">
                                            <asp:LinkButton ID="lbRemoveProductFromCart" OnClick="ChangeCart" runat="server" CssClass="remove"><i class="fa fa-times"></i></asp:LinkButton>
                                            <a href="ProductPage.aspx?id=<%# Item.ProductID %>">
                                                <asp:Label ID="lblProductName" runat="server" Text='<%# Item.ProductName %>'></asp:Label></a>
                                        </span>

                                        <span id="productprice">
                                            <asp:Label ID="lblProductPrice" runat="server"><%# Item.ProductPrice.ToString("####") %> SEK</asp:Label>
                                        </span>

                                        <span id="qty">
                                            <asp:LinkButton ID="lbSubtractQuantityToProduct" OnClick="ChangeCart" runat="server"><i class="fa fa-minus-square"></i></asp:LinkButton>
                                            <asp:Label ID="lblProductQuantity" runat="server" Text='<%# Item.Quantity %>'></asp:Label>
                                            <asp:LinkButton ID="lbAddQuantityToProduct" OnClick="ChangeCart" runat="server"><i class="fa fa-plus-square"></i></asp:LinkButton>
                                        </span>

                                        <span id="totalprice">
                                            <asp:Label ID="lblTotalPriceAndQuantity" runat="server"><%# Item.TotalPrice.ToString("####") %> SEK</asp:Label>
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <!-- orderrow-foot -->
                        <asp:LinkButton ID="lbClearCart" CssClass="clear-cart" OnClick="lbClearCart_OnClick" runat="server"><i class="fa fa-trash"></i> Töm Varukorgen</asp:LinkButton>
                    </div>
                </div>
                <!-- orderhead -->

            </div>
            <!-- col 1 -->
            <div class="col">
                <div class="customer-info">
                    <div class="col-top">
                        <h3>Personuppgifter</h3>
                    </div>
                    <div class="col-content">
                        <label for="<%=tbFirstName.ClientID %>">Förnamn: </label>
                        <asp:TextBox runat="server" ID="tbFirstName" placeholder="Emmet" pattern="[A-Öa-ö ]{2,20}" required />

                        <label for="<%=tbLastname.ClientID %>">Efternamn: </label>
                        <asp:TextBox ID="tbLastname" placeholder="Brickowski" pattern="[A-Öa-ö]{2,20}" required runat="server" />

                        <label for="<%=tbStreet.ClientID %>">Address: </label>
                        <asp:TextBox ID="tbStreet" placeholder="Yellowbrickroad 67" pattern="[A-Öa-ö0-9 ]{2,50}" required runat="server" />

                        <label for="<%=tbZip.ClientID %>">Postnummer: </label>
                        <asp:TextBox ID="tbZip" placeholder="12345" pattern="[0-9]{5}|[0-9 ]{6}" required runat="server" />

                        <label for="<%=tbCity.ClientID %>">Stad: </label>
                        <asp:TextBox ID="tbCity" placeholder="LegoCity" pattern="[A-Öa-ö]{2,20}" required runat="server" type="text" />

                        <label for="country">Land: </label>
                        <asp:DropDownList ID="ddlCountry" runat="server" CssClass="ddinput">
                            <asp:ListItem Selected="True" Value="Sweden"> Sverige </asp:ListItem>
                        </asp:DropDownList>

                        <label for="<%=tbSsn.ClientID %>">Personnummer: </label>
                        <asp:TextBox ID="tbSsn" pattern="[0-9 ]{10,12}" placeholder="ÅÅMMDDXXXX" required runat="server" />

                        <label for="<%=tbEmail.ClientID %>">E-mail: </label>
                        <asp:TextBox ID="tbEmail" type="email" placeholder="Lego@love.com" required runat="server" />

                        <label for="<%=tbPhone.ClientID %>">Telefon: </label>
                        <asp:TextBox ID="tbPhone" type="tel" placeholder="0701222333" pattern="[0-9]{10}" required runat="server" />

                    </div>
                    <!-- costumer info -->
                </div>
            </div>
            <!-- col 2 -->
            <div class="col">
                <div class="total">
                    <div class="col-top">
                        <h3>Din beställning</h3>
                    </div>
                    <div class="col-content">
                        <p class="total-head">Totalkostnad:</p>
                        <p class="total-text"><%= SubTotal.ToString("####") %> SEK </p>

                        <p class="total-head">Antal produkter:</p>
                        <p class="total-text"><strong><%= CartTotalItems %> st</strong></p>

                        <input class="radio" id="invoice" type="radio" checked required />
                        <label class="radio" for="invoice">Faktura</label>
                        <!-- payment -->

                        <input class="radio" id="posten" type="radio" checked required />
                        <label class="radio" for="posten">Posten</label>
                        <p>49 SEK Fraktkostnad</p>
                        <!-- delivery -->

                        <!-- total -->
                        <asp:Literal ID="litNoValidOrder" runat="server" Text="" />
                        <asp:Button runat="server" ID="btnPurchase" OnClick="btnPurchase_OnClick" href="RecepitPage?id=<%= OrderHeadID %>" Text="Köp" CssClass="checkoutButton" />
                        <!-- purchase -->
                    </div>
                </div>
            </div>
        </div>
        <!-- col 3 -->
    </div>
    <!-- wrapper -->

</asp:Content>
