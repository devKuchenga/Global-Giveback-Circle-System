<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SchoolInfo.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.SchoolInfoControl" %>

<%@ Register TagPrefix="SmarTik" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ddlSelector" Src="ddlSelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="EmailTextBox" Src="EmailTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="SelectCountry" Src="CountrySelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="TypoSchool" Src="TypoSchool.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="TypoSchoolSpec" Src="TypoSchoolSpecific.ascx" %>

<asp:Panel runat="server" ID="pnlData">
    <table class="adminContent">
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSchoolName" Text="School Name:" ToolTip="School Name"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtSchoolName" runat="server"></asp:TextBox>
                <asp:HiddenField ID="hfSchoolName" runat="server" />
            </td>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Type of school:" ToolTip="Type of school"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData" rowspan="6">
                <div class="adminInput" style="border: 3px solid #acacac;">Select Type of school from this list</div>
                    <div class="adminInput" style="height: 110px; overflow: auto; border-width: 0px 3px 3px 3px;
                    border-style: solid">
                    <SmarTik:TypoSchool ID="ctrlTypoSchool" runat="server" />
                </div>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSchooladdressLine1" Text="School address Line 1:"
                    ToolTip="School address Line 1" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtSchoolAddressLn1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSchooladdressLine2" Text="School address Line 2:"
                    ToolTip="School address Line 1" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtSchoolAddressLn2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSchooladdressLine3" Text="School address Line 3:"
                    ToolTip="School address Line 3" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtSchoolAddressLn3" runat="server"></asp:TextBox>
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
                <SmarTik:ToolTipLabel runat="server" ID="lblTitle" Text=" Contact Title:"
                    ToolTip=" Contact Title" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:ddlSelector ID="ddlContactTitle" CssClass="adminInput" runat="server" />
            </td>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="Type of school specific:"
                    ToolTip="Type of school specific" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData" rowspan="6">
                <div class="adminInput" style="border: 3px solid #acacac;">Select Type of school from this list</div>
                    <div class="adminInput" style="height: 220px; overflow: auto; border-width: 0px 3px 3px 3px;
                    border-style: solid">
                    <SmarTik:TypoSchoolSpec ID="ctrlTypoSchoolSpec" runat="server" />
                </div>
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
                <SmarTik:EmailTextBox ID="txtEmail" runat ="server" CssClass="adminInput" />
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
                <SmarTik:ToolTipLabel runat="server" ID="lblCountry" Text="Country:"
                    ToolTip="Country" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:SelectCountry ID="ddlCountry" runat="server" />                               
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblNotes" Text="Notes:"
                    ToolTip="Notes" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox CssClass="adminInput" ID="txtNotes" runat="server" TextMode="MultiLine"
                Height="100"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Panel>
