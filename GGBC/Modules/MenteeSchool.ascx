<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MenteeSchool.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MenteeSchoolControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="EmailTextBox" Src="EmailTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ddlSelector" Src="ddlSelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="SchSelector" Src="ddlSchoolSelector.ascx" %>

<table class="adminContent">
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Secondary school Name:" ToolTip="Secondary school Name"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:SchSelector ID="ddSecSchool" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="Secondary School Sponsor:"
                ToolTip="Secondary School Sponsor" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtSecSchoolSponsor" CssClass="adminInput" TextMode="MultiLine" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel3" Text="Secondary school amount:" ToolTip="Secondary school amount"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">

            <SmarTik:STKDecimalTextBox runat="server" CssClass="adminInput" ID="txtSecAmount1"
                Value="1" RequiredErrorMessage="Please enter the secondary amount" MinimumValue="1"
                MaximumValue="999999999" RangeErrorMessage="Value should be from 1 to 999,999,999 "/>
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel4" Text="Class:"
                ToolTip="Class" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddClass" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel5" Text="Anticipated Graduation Year:" ToolTip="Anticipated Graduation Year"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="txtAnticipatedgradyear" runat="server" HideDays="true" HideMonths="true"></SmarTik:STKDatePicker>
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel6" Text="Actual Graduation Year:"
                ToolTip="Actual Graduation Year" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="txtActualGradYear" runat="server" HideDays="true" HideMonths="true" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel7" Text="KCSE Score:" ToolTip="KCSE Score"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddKCSEscore" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel8" Text="Date of ICT Course:"
                ToolTip="Date of ICT Course" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="txtdateofICTcourse" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel9" Text="ICT Training:" ToolTip="ICT Training"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:SchSelector ID="ddICTTraining" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel10" Text="ICT Completed:"
                ToolTip="ICT Completed" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddICTCompleted" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel11" Text="Microsoft Certification:" ToolTip="Microsoft Certification"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddMScertification" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel12" Text="Microsoft Certification Results:"
                ToolTip="Microsoft Certification Results" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddMScertresults" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel13" Text="Cisco Certification:" ToolTip="Cisco Certification"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddCiscocertification" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel14" Text="Cisco Certification Results:"
                ToolTip="Cisco Certification Results" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddCiscocertresults" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel15" Text="Tertiary Instituition:" ToolTip="Tertiary Instituition"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddTertiarySchool" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel16" Text="Tertiary School Name:"
                ToolTip="Tertiary School Name" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
           <SmarTik:SchSelector ID="ddTertiary" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel17" Text="Tertiary School Address 1:" ToolTip="Tertiary School Address 1"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtTertSchaddr1" runat="server"></asp:TextBox>
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel18" Text="Tertiary School Address 2:" ToolTip="Tertiary School Address 2"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtTertSchaddr2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel19" Text="Tertiary School Address 3:" ToolTip="Tertiary School Address 3"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtTertSchaddr3" runat="server"></asp:TextBox>
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel20" Text="Tertiary School Sponsor:" ToolTip="Tertiary School Sponsor"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtTerSchsponsor" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel21" Text="Tertiary School Amount:" ToolTip="Tertiary School Amount"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            
            <SmarTik:STKDecimalTextBox runat="server" cssclass="adminInput" id="txtTertSchAmount"
                value="0" requirederrormessage="Please enter the Tertiary School Amount"
                minimumvalue="0" maximumvalue="100000000" rangeerrormessage="Value should from 0 to 100,000,000 " />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel22" Text="Date joined Tertiary:" ToolTip="Date joined Tertiary"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
               <SmarTik:STKDatePicker ID="txtDateJoinedTert" runat="server" />    
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel23" Text="Expected Tertiary Graduation Date:" ToolTip="Expected Tertiary Graduation Date"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="txtExpectedtertgraddate" runat="server" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel24" Text="Actual Graduation Date:" ToolTip="Actual Graduation Date"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
           <SmarTik:STKDatePicker ID="txtActualtertgraddate" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel25" Text="Course Type:" ToolTip="Course Type"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddCourse" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel26" Text="Degree Earned:" ToolTip="Degree Earned"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
           <SmarTik:ddlSelector ID="ddDegreeEarned" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel27" Text="Concentration:" ToolTip="Concentration"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddConcentration" runat="server" CssClass="adminInput" />
        </td>
    </tr>
</table>