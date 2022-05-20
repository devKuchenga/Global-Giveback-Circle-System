<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Countries.aspx.vb" Inherits="GGBC.Smartik.Administration.Admin.CountriesPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <h2 title="Mentor Maintenance">
        Countries</h2>
    <h2 title="Mentor Maintenance">
        <asp:Label ID="lblErrorMsgs" runat="server" ForeColor="Red" Font-Bold="True" 
            Font-Size="Large"></asp:Label>
        <asp:Label ID="lblMsgs" runat="server" Font-Bold="True" Font-Size="Large" 
            ForeColor="#00CC00"></asp:Label>
            </h2>
        <table class="style1">
            <tr>
                <td><asp:GridView ID="GridView1" runat="server" Width="366px" AutoGenerateColumns="false"
        ShowFooter="true" Height="144px">
        <Columns>
            <asp:TemplateField HeaderText="Country">
                <ItemTemplate>
                    <%# Eval("Country")%>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCountry" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Add" CommandName = "Footer" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <AlternatingRowStyle BackColor="#C2D69B" />
        <EmptyDataTemplate>
            <tr style="background-color: Green;">
                <th scope="col">
                    Country 
                </th>
             </tr>
          
            <tr>
                <td>
                    <asp:TextBox ID="txtCountry" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Add" CommandName = "EmptyDataTemplate" />
                </td>
            </tr>
        </EmptyDataTemplate>
    </asp:GridView>
                    </td>
            </tr>
        </table>
    
</asp:Content>
