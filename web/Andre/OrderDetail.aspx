﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Andre/default_layout.Master" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="web.Andre.OrderDetail_Code" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBox" runat="server">
    <p><asp:Label ID="lblOrderNumber" runat="server" Font-Size="X-Large" Font-Bold="true" ForeColor="Black" Text=""></asp:Label></p>
    <hr />
    <p>
        <asp:GridView ID="gvOrderDetail" runat="server" Width="100%">
        </asp:GridView>
    </p>
    <table style="width:100%">
        <tr>
            <td style="text-align:left">
                <asp:Button ID="btOrderOverview" runat="server" Text="Zurück zur Übersicht" OnClick="btOrderOverview_Click" Height="40px" Width="200px" BackColor="#CF323D" ForeColor="White" Font-Bold="true" />
            </td>
            <td style="text-align:right">
                <asp:Label ID="lblTotalSum" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>