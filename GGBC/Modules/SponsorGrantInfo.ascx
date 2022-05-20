<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SponsorGrantInfo.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.SponsorGrantInfo1Control" %>

<%@ Register TagPrefix="SmarTik" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DecimalTextBox" Src="DecimalTextBox.ascx" %>
<%@ Register TagPrefix="SmarTIk" TagName="TypoS" %>

<asp:Panel runat="server" ID="pnlData">
    <table class="adminContent">
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblBeginDate" Text="Begin Date:" ToolTip="Begin Date"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:STKDatePicker ID="dtBeginDate" runat="server"></SmarTik:STKDatePicker>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblEndDate" Text="End Date:" ToolTip="End Date"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:STKDatePicker ID="dtEndDate" runat="server"></SmarTik:STKDatePicker>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblTypeOfPayment" Text="Type of payment:"
                    ToolTip="Type of payment" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:DropDownList ID="ddlTypeOfPayment" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblAgreedGrantAmount" Text="Agreed Grant Amount:"
                    ToolTip="Agreed Grant Amount" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:DecimalTextBox runat="server" CssClass="adminInput" ID="txtAgreedGrantAmount"
                    Value="0" RequiredErrorMessage="Please enter the agreed grant amount"
                    MinimumValue="1" MaximumValue="100,000,000" RangeErrorMessage="Agreed grant amount should be from 1 to 100,000,000  ">
                </SmarTik:DecimalTextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblCompanyaddressLine3" Text="Company address Line 3:"
                    ToolTip="Company address Line 3" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox ID="txtCompanyAddressLn3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblPriContactFname" Text="Primary contact First Name:"
                    ToolTip="Primary contact First Name" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox ID="txtPriContactFname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblPriContactLname" Text="Primary Contact Last Name:"
                    ToolTip="Primary Contact Last Name" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox ID="txtPriContactLname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblTitle" Text="Primary Contact Title:"
                    ToolTip="Primary Contact Title" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <ajaxToolkit:ComboBox ID="cmbTitle" runat="server" AutoPostBack="True" AutoCompleteMode="SuggestAppend">
                </ajaxToolkit:ComboBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblPriContactPhoneno" Text="Primary Contact Phone Number:"
                    ToolTip="Primary Contact Phone Number" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox ID="txtPriContactPhoneno" runat="server" Style="top: 0px; left: 0px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblPriContactEmail" Text="Primary Contact Email:"
                    ToolTip="Primary Contact Email" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox ID="txtPriContactEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSecContactFname" Text="Secondary contact First Name:"
                    ToolTip="Secondary contact First Name" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox ID="txtSecContactFname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSecContactLname" Text="Secondary Contact Last Name:"
                    ToolTip="Secondary Contact Last Name" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox ID="txtSecContactLname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSecTitle" Text="Secondary Contact Title:"
                    ToolTip="Secondary Contact Title" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <ajaxToolkit:ComboBox ID="cmbSecTitle" runat="server" AutoPostBack="True" AutoCompleteMode="SuggestAppend">
                </ajaxToolkit:ComboBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSecContactPhoneno" Text="Secondary Contact Phone Number:"
                    ToolTip="Secondary Contact Phone Number" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox ID="txtSecContactPhoneno" runat="server" Style="top: 0px; left: 0px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblSecContactEmail" Text="Secondary Contact Email:"
                    ToolTip="Secondary Contact Email" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox ID="txtSecContactEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblDatejoinedGGBC" Text="Date Joined GGBC:"
                    ToolTip="Date Joined GGBC" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox runat="server" ID="txtdatejoinedGGBC" Enabled="False"></asp:TextBox>
                <asp:ImageButton runat="Server" ID="Imgdatejoinedggbc" ImageUrl="~/images/cal.gif"
                    AlternateText="Click to show calendar" />
                <ajaxToolkit:CalendarExtender ID="clDOB" runat="server" TargetControlID="txtdatejoinedggbc"
                    PopupButtonID="Imgdatejoinedggbc" ClearTime="True" PopupPosition="TopLeft" Format="dd MMM yyyy" />
            </td>
        </tr>
    </table>
</asp:Panel>
