<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="LocalOrganizationInfo.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.LocalOrganizationInfoControl" %>

<%@ Register TagPrefix="SmarTik" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="EmailTextBox" Src="~/Modules/EmailTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ddlSelector" Src="ddlSelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="TypoPartnerSpecific" Src="~/Modules/TypoPartnerSpecific.ascx" %>

<asp:Panel runat="server" ID="pnlData">
    <asp:HiddenField ID="hfLOrgName" runat="server" />
    <table class="adminContent">
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblLROrgName" Text="LR Org Name:" ToolTip="Organization Name"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtLROrgName" runat="server"></asp:TextBox>
            </td>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="Type of partner (Specific):"
                    ToolTip="Type of partner (Specific)" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData" rowspan="6">
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
                <SmarTik:ToolTipLabel runat="server" ID="lblTargetNumber" Text="LR Target Number:" ToolTip="LR Target No"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:STKNumericTextBox runat="server" cssclass="adminInput" id="txtLRTargetNumber1"
                value="0" requirederrormessage="Please enter the LR Target number"
                minimumvalue="0" maximumvalue="100000000" rangeerrormessage="LR target number should from 0 to 100,000,000 " />
            
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblDatejoinedGGBC" Text="Date Joined GGBC:"
                    ToolTip="Date Joined GGBC" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:STKDatePicker ID="ctrlDateJoinedGGBC" runat="server"></SmarTik:STKDatePicker>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblContactFname" Text=" contact First Name:"
                    ToolTip=" contact First Name" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtContactFname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblContactLname" Text=" Contact Last Name:"
                    ToolTip=" Contact Last Name" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtContactLname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblContactPhoneno" Text=" Contact Phone Number:"
                    ToolTip=" Contact Phone Number" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtContactPhoneno" runat="server" Style="top: 0px; left: 0px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblContactEmail" Text=" Contact Email:"
                    ToolTip=" Contact Email" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:EmailTextBox CssClass="adminInput" ID="txtcContactEmail" runat="server" />
            </td>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblNotes" Text="Notes:"
                    ToolTip="Notes" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData" rowspan="6">
                <asp:TextBox ID="txtNotes" runat="server" CssClass="adminInput"  TextMode="MultiLine" Rows="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblRecruitmentStartDate" Text="Recruitment Start date:"
                    ToolTip="Recruitment start date" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:STKDatePicker ID="ctrlRecruitmentStartDate" runat="server"></SmarTik:STKDatePicker>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblRecruitmentEndDate" Text="Recruitment End date:"
                    ToolTip="Recruitment end date" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:STKDatePicker ID="ctrlRecruitmentEndDate" runat="server"></SmarTik:STKDatePicker>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblOrgaddressLine1" Text="Org address Line 1:"
                    ToolTip="Org address Line 1" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtOrgAddressLn1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblOrgaddressLine2" Text="Org address Line 2:"
                    ToolTip="Org address Line 1" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtOrgAddressLn2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblReportingType" Text="Reporting Type:"
                    ToolTip="Recruitment Title" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:ddlSelector ID="ddlReportingType" CssClass="adminInput" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblActualTargetNo" Text="Actual Target Number:" ToolTip="Actual Target Name"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:STKNumericTextBox runat="server" cssclass="adminInput" id="txtActualTargetNo"
                value="0" requirederrormessage="Please enter the actual Target number"
                minimumvalue="0" maximumvalue="100000000" rangeerrormessage="Actual target number should be from 0 to 100,000,000 " />
            </td>
        </tr>            
    </table>
</asp:Panel>
