<%@ Page Title="" Language="C#" MasterPageFile="~/DasMaster.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DasShop.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/AdminStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataSourceID="ObjectDataSource1"
        DataKeyNames="CategoryID" ShowFooter="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="CategoryID" SortExpression="CategoryID" Visible="False" >
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CategoryID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="LinkButton1" OnClick="lbInsert_Click" runat="server">Lägg till Kategori</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CategoryName" SortExpression="CategoryName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CategoryDescription" SortExpression="CategoryDescription">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CategoryDescription") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CategoryDescription") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCategoryDescription" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CategoryImage" SortExpression="CategoryImage">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CategoryImage") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("CategoryImage") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCategoryImage" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CategoryParallax" SortExpression="CategoryParallax">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("CategoryParallax") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("CategoryParallax") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCategoryParallax" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    <br />
    <br />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="Deletecategory" 
        InsertMethod="InsertCategory" 
        SelectMethod="GetAllCategories" 
        TypeName="DasShop.Models.CategoryDAL" 
        UpdateMethod="UpdateCategory">
        <DeleteParameters>
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter Name="CategoryDescription" Type="String" />
            <asp:Parameter Name="CategoryImage" Type="String" />
            <asp:Parameter Name="CategoryParallax" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter Name="CategoryDescription" Type="String" />
            <asp:Parameter Name="CategoryImage" Type="String" />
            <asp:Parameter Name="CategoryParallax" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <br />
</asp:Content>
