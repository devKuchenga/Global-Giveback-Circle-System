<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SponsorInfo.ascx.vb"
    Inherits="GGBC.Smartik.Administration.Modules.SponsorInfoControl" %>

<%@ Register TagPrefix="SmarTik" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ddlSelector" Src="ddlSelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="EmailTextBox" Src="EmailTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="TypoPartner" Src="~/Modules/TypoPartner.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="TypoPartnerSpecific" Src="~/Modules/TypoPartnerSpecific.ascx" %>

<asp:Panel runat="server" ID="pnlData">
    <table class="adminContent">
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblCompanyName" Text="Company Name:" ToolTip="Company Name"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtCompanyName" runat="server"></asp:TextBox>
            </td>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Type of partner:" ToolTip="Type of partner"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData" rowspan="5">
                <div class="adminInput" style="border: 3px solid #acacac;">Select Type of partner from this list</div>
                    <div class="adminInput" style="height: 110px; overflow: auto; border-width: 0px 3px 3px 3px;
                    border-style: solid">
                    <SmarTik:TypoPartner runat="server" ID="ctrlTypoPartner" />
                </div>
                <%--<div class="adminInput" style="border-width: 0px; border-top: 3px solid #acacac;">
                    &nbsp;</div>--%>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblCompanyaddressLine1" Text="Company address Line 1:"
                    ToolTip="Company address Line 1" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtCompanyAddressLn1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblCompanyaddressLine2" Text="Company address Line 2:"
                    ToolTip="Company address Line 1" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtCompanyAddressLn2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblCompanyaddressLine3" Text="Company address Line 3:"
                    ToolTip="Company address Line 3" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtCompanyAddressLn3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblPriContactFname" Text="Primary contact First Name:"
                    ToolTip="Primary contact First Name" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtPriContactFname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblPriContactLname" Text="Primary Contact Last Name:"
                    ToolTip="Primary Contact Last Name" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtPriContactLname" runat="server"></asp:TextBox>
            </td>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="Type of partner (Specific):"
                    ToolTip="Type of partner (Specific)" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData" rowspan="9">
                <div class="adminInput" style="border: 3px solid #acacac;">
                    Select Type of specific partners from this list</div>
                <div class="adminInput" style="height: 180px; overflow: auto; border-width: 0px 3px 3px 3px;
                    border-style: solid">
                    <SmarTik:TypoPartnerSpecific ID="ctrlTypoPartnerSpecific" runat="server" ModuleId="5" />
                </div>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblTitle" Text="Primary Contact Title:"
                    ToolTip="Primary Contact Title" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:ddlSelector ID="ddlFirstContactTitle" CssClass="adminInput" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblPriContactPhoneno" Text="Primary Contact Phone Number:"
                    ToolTip="Primary Contact Phone Number" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtPriContactPhoneno" runat="server" Style="top: 0px;
                    left: 0px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblPriContactEmail" Text="Primary Contact Email:"
                    ToolTip="Primary Contact Email" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:EmailTextBox ID="txtPriContactEmail" runat="server" CssClass="adminInput"
                    Required="false" />
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSecContactFname" Text="Secondary contact First Name:"
                    ToolTip="Secondary contact First Name" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtSecContactFname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSecContactLname" Text="Secondary Contact Last Name:"
                    ToolTip="Secondary Contact Last Name" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtSecContactLname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSecTitle" Text="Secondary Contact Title:"
                    ToolTip="Secondary Contact Title" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:ddlSelector ID="ddlSecondContactTitle" CssClass="adminInput" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSecContactPhoneno" Text="Secondary Contact Phone Number:"
                    ToolTip="Secondary Contact Phone Number" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtSecContactPhoneno" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSecContactEmail" Text="Secondary Contact Email:"
                    ToolTip="Secondary Contact Email" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:EmailTextBox CssClass="adminInput" ID="txtSecContactEmail" runat="server"
                    Required="false" />
            </td>
            </tr>
            <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblDatejoinedGGBC" Text="Date Joined GGBC:"
                    ToolTip="Date Joined GGBC" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:DatePicker ID="dtDateJoinedGGBC" runat="server" />
            </td>
        </tr>
    </table>
</asp:Panel>
