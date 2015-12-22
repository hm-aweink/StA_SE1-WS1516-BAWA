﻿<%@ Page Title="" Language="C#" MasterPageFile="~/default_layout.Master" AutoEventWireup="true" CodeBehind="AdmCoupon.aspx.cs" Inherits="web.AdmCoupon_Code" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBox" runat="server">
    <table style="width: 100%">
        <tr>
            <td style="text-align: left">
                <asp:Label ID="lblAdmCoupon" runat="server" Text="Gutscheinverwaltung" Font-Bold="true" Font-Size="X-Large"></asp:Label>
            </td>
            <td style="text-align: right">
                <asp:Button ID="btBack" runat="server" Text="Zurück" OnClick="btBack_Click" Height="50px" Width="100px" BackColor="#CF323D" ForeColor="White" Font-Bold="true" />
            </td>
        </tr>
    </table>

    <hr />

    <p>
        <asp:GridView ID="gvAdmCoupon" runat="server" Width="100%" OnSelectedIndexChanged="gvAdmCoupon_SelectedIndexChanged" AutoGenerateColumns="False" DataSourceID="AllCoupons">
            <SelectedRowStyle BorderColor="Red" BorderStyle="Solid" BorderWidth="3px" />
            <RowStyle BorderStyle="None" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                <asp:BoundField DataField="Id" HeaderText="CUID" SortExpression="Id" />
                <asp:BoundField DataField="Discount" HeaderText="Rabatt in %" SortExpression="Discount" />
                <asp:BoundField DataField="Code" HeaderText="Gutschein-Code" SortExpression="Code" />
                <asp:CheckBoxField DataField="IsValid" SortExpression="IsValid" />
                <asp:BoundField DataField="Uid" HeaderText="User-ID" SortExpression="Uid" />
                <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
            </Columns>
        </asp:GridView>

        <asp:ObjectDataSource ID="AllCoupons" runat="server" SelectMethod="GetAllCoupons" TypeName="bll.clsCouponFacade"></asp:ObjectDataSource>
        <asp:Button ID="btToggleCoupon" runat="server" Text="Coupon (de-)aktivieren" OnClick="btToggleCoupon_Click" Height="30px" Width="200px" Enabled="false" BackColor="Gray" ForeColor="White" Font-Bold="true" />
    </p>
    <br />
    <hr />
    <br />
    <asp:Table ID="tblNewCoupon" runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Benutzer</asp:TableHeaderCell>
            <asp:TableHeaderCell>Code</asp:TableHeaderCell>
            <asp:TableHeaderCell>Wert in %</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:DropDownList ID="ddlUsers" runat="server" DataSourceID="AllUsersAsDictionary" DataValueField="Key" DataTextField="Value" Width="200px"></asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtCode" Width="250px" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDiscount" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btGenerateCode" runat="server" Text="Code generieren" OnClick="btGenerateCode_Click" Height="30px" Width="200px" BackColor="#CF323D" ForeColor="White" Font-Bold="true" />
            </asp:TableCell>
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                <asp:Button ID="btCreateNew" runat="server" Text="Neuen Gutschein anlegen" OnClick="btCreateNew_Click" Height="30px" Width="200px" BackColor="#CF323D" ForeColor="White" Font-Bold="true" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <p>
        <asp:Label ID="lblError" ForeColor="Red" runat="server" Text=""></asp:Label>
    </p>

    <asp:ObjectDataSource ID="AllUsersAsDictionary" runat="server" SelectMethod="GetAllUsersForCoupons" TypeName="bll.clsCouponFacade"></asp:ObjectDataSource>

</asp:Content>