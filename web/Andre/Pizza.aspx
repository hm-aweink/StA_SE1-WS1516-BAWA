﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Andre/default_layout.Master" AutoEventWireup="true" CodeBehind="Pizza.aspx.cs" Inherits="web.Andre.PizzaCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #Button1 {
            text-align: left;
        }

        #TextArea1 {
            height: 167px;
            width: 412px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBox" runat="server">
    <p style="font-family: 'Segoe UI'; font-weight: bold">Unsere Pizza</p>

    <p style="font-family: 'Segoe UI'; font-weight: bold; text-align: left">
        <asp:GridView ID="gvPizza" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource2" ForeColor="#333333" GridLines="None" Style="text-align: center" Width="100%" OnSelectedIndexChanged="gvPizza_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/Andre/img/marker20-2.png" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="PricePerUnit" HeaderText="PricePerUnit" SortExpression="PricePerUnit" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" Visible="False" />
                <asp:BoundField DataField="CUnit" HeaderText="CUnit" SortExpression="CUnit" Visible="False" />
                <asp:TemplateField HeaderText="Größe Pizza">
                    <ItemTemplate>
                        <asp:DropDownList ID="sizeSelect" runat="server" AutoPostBack="true" OnSelectedIndexChanged="sizeSelect_SelectedIndexChanged">
                            <asp:ListItem Value="">- Größe</asp:ListItem>
                            <asp:ListItem Value="28">Klein (28cm)</asp:ListItem>
                            <asp:ListItem Value="32">Gro&szlig; (32cm)</asp:ListItem>
                            <asp:ListItem Value="60">XXL (60cm)</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Extras">
                    <ItemTemplate>
                        <asp:CheckBoxList ID="ExtrasCheckBoxList" runat="server" AutoPostBack="False" DataSourceID="ExtrasDataSource" DataTextField="Name" DataValueField="ID">
                        </asp:CheckBoxList>
                        <asp:ObjectDataSource ID="ExtrasDataSource" runat="server" SelectMethod="ExtrasGetAll" TypeName="bll.clsExtraFacade"></asp:ObjectDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Preis"></asp:TemplateField>
                
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="ProductsGetAllByCategory" TypeName="bll.clsProductFacade">
            <SelectParameters>
                <asp:SessionParameter Name="_category" SessionField="category" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </p>

    <p style="font-family: 'Segoe UI'; font-weight: bold; text-align: center">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <a href="Orders.aspx">Test</a>
        <asp:Label ID="lblChooseSize" runat="server"></asp:Label>

    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
