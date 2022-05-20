<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MenteeButterflyInfo.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MenteeButterflyInfoControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="EmailTextBox" Src="EmailTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ddlSelector" Src="ddlSelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>


<table class="adminContent">
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="col1Label" Text="Date Admitted to butterfly squad:" ToolTip="Date Admitted to butterfly squad"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="txtdateadmittedtobs" runat="server" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="Date completed role as Butterfly squad:"
                ToolTip="Date completed role as Butterfly squad" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="txtdatecompletedbs" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Specific Position Held:" ToolTip="Specific Position Held"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddbsposition" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel3" Text="Comments:" ToolTip="Comments"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData" colspan="3">
            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" CssClass="adminInput" />
        </td>
    </tr>
</table>
