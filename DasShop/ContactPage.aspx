<%@ Page Title="" Language="C#" MasterPageFile="~/DasMaster.Master" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="DasShop.ContactPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/ContactPageStyle.css" rel="stylesheet" />
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">    
    </script>
    <script src="Javascript/JS_for_google_API.js"></script>
    <script src="Javascript/JS_to_hide_searchbutton.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <p class="rubrik"><span>Kontakta oss</span></p>
        <div class="left-column">
            <article class="contact-details">
                <p>
                    Det började en varm sommardag, inte allt för längesedan, tre nördar satt samlade runt ett bord i en mörk, kvav lägenhet.
                        Legoklossarna låg tätt tillsammans med ett och annat ihopknycklat hamburgarpapper.
                    Projektetbygget var He-Man legoserie, en ovanlig serie med mycket svårfunna delar som det äntligen, efter månaders sökande, hittat den sista delen: She-Ras Kristall Slott.
                    Då kläcktes ideen!<br />
                    Varför inte samla alla dessa byggserier under ett tak, de som vi nördar så desperat letar efter?
                       <br/> Och så blev det!<br />
                    <br />
                </p>
                <p>Vi välkomnar er stolt till Brick Kingdom.</p>
                <br />
                <h3>Brick Kingdom Inc.</h3>
                <h3>Postaddress:</h3>
                <br />
                <p>Legovägen, 1337</p>
                <p>123 45, Legoland</p>
                <br />
                <h3>Huvudkontor:</h3>
                <br />
                <p>Tokyogatan, 1b</p>
                <p>543 21, Dösjebro</p>
                <a href="mailto:brickkingdom@legocity.net">Maila oss</a>
            </article>
        </div>
        <div class="right-column">
            <div id="map_canvas"></div>
            <hr />
            <div class="centrera">
                <input type="text" id="routeStart" value="" autofocus="autofocus" />

                <button type="button" id="btnCalculateRoute" class="" title="print" value="" onclick="calcRoute();return false;">
                    <span class="glyphicon glyphicon-print"></span>Beräkna rutt
                </button>

                <button type="button" class="print" title="print" onclick="window.open('PrintoutPage.aspx')">
                    <span class="glyphicon glyphicon-print"></span>Skriv ut
                </button>
            </div>
            <br />
            <p class="map-text">Skriv in din startposition och klicka på "Beräkna rutt".</p>
            <div id="directionsPanel">
            </div>
        </div>
    </div>
</asp:Content>



