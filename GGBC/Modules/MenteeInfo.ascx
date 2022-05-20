<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MenteeInfo.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MenteeInfoControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ddlSelector" Src="ddlSelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="EmailTextBox" Src="EmailTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="CountrySelector" Src="CountrySelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="MentorSelector" Src="ddlMentorSelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="LocalOrgSelector" Src="ddlLocalOrgSelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="MenteeSponsors" Src="MenteeSponsors.ascx" %>


<script type="text/javascript">
    $(document).ready(function () {
        var txtFName = $("[id*=txtFName]").eq(0);
        var txtLname = $("[id*=txtLname]").eq(0);
        var ddSecSchool = $("[id*=ddSecSchool]").eq(0);
        var ddKCSEscore = $("[id*=ddKCSEscore]").eq(0);
        var dtDOB = $("[id*=dtDOB]");
        var dtDateJoinedGGBC = $("[id*=dtDateJoinedGGBC]");

        var req = "<div title='required field' class='required'>*</div>"
        $(req).insertAfter($(txtFName));
        $(req).insertAfter($(txtLname));
        $(req).insertAfter($(ddSecSchool));
        $(req).insertAfter($(ddKCSEscore));
        $(req).insertAfter($(dtDOB));
        $(req).insertAfter($(dtDateJoinedGGBC));
    });
</script>

<table class="adminContent">
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="Label1" Text="First Name:" ToolTip="First Name"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtFName" runat="server"></asp:TextBox>
            <asp:HiddenField ID="hfMenteeRegNo" runat="server" />
            <asp:HiddenField ID="hfMenteeFullName" runat="server" />
        </td>
        
        <td class="adminTitle" rowspan="7">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel17" Text="Picture:" ToolTip="Mentee Picture"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData" rowspan="7">
            <div class="adminInput" style=" border:3px solid #acacac;">
            <asp:Image ID="iMenteePicture" runat="server" AlternateText="pic" />
            <div style="border-top:3px solid #acacac;">
            <asp:FileUpload ID="fuMenteePicture" CssClass="adminInput" runat="server"
                    ToolTip="Upload mentee picture" />
            </div>
            </div>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Middle Name:" ToolTip="Middle Name"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminTitle">
            <asp:TextBox CssClass="adminInput" ID="txtMName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="Last Name:" ToolTip="Last Name"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtLname" runat="server"></asp:TextBox>
        </td>
        </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel3" Text="Address Line 1:" ToolTip="Address Line 1"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtAddressLn1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel4" Text="Address Line 2:" ToolTip="Address Line 2"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtAddressLn2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel5" Text="Address Line 3:" ToolTip="Address Line 3"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtAddressLn3" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel8" Text="Home Phone:" ToolTip="Phone (personal)"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtPhoneHome" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel9" Text="Mobile Phone:" ToolTip="Mobile Phone"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtMobilePhone" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel10" Text="Email (personal):"
                ToolTip="Personal email" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:EmailTextBox ID="txtPersonalEmail" runat="server" CssClass="adminInput" Required="true" />
        </td>
        
        <td class="adminTitle" rowspan="7">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel18" Text="Sponsors:"
                ToolTip="Mentee Sponsors" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData" rowspan="7">
            <div class="adminInput" style=" border:3px solid #acacac;">Select Sponsors from the list below</div>
            <div class="adminInput" style=" height:220px; overflow:auto; border-width:0px 3px 0px 2px; border-style:solid" >
            <SmarTik:MenteeSponsors ID="ctrlMenteeSponsors" runat="server" MappedOnly="0" CssClass="adminInput" />
            </div>
            <div class="adminInput" style=" border-width:0px; border-top:3px solid #acacac;">&nbsp;</div>
            
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel22" Text="Date joined GGBC:"
                ToolTip="Date joined GGBC" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="dtDateJoinedGGBC" runat="server">
            </SmarTik:STKDatePicker>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel6" Text="Next Of Kin First Name:"
                ToolTip="Next Of Kin First Name" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtNextOfKinFName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel7" Text="Next Of Kin Last Name:"
                ToolTip="Next Of Kin Last Name" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminTitle">
            <asp:TextBox CssClass="adminInput" ID="txtNOfKinLName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel11" Text="Next Of Kin Phone:"
                ToolTip="Next Of Kin Phone" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtNOKPhone" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel12" Text="Next of Kin Email:"
                ToolTip="Next of Kin Email" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:EmailTextBox ID="txtNOKEmail" runat="server" CssClass="adminInput" Required="false" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel30" Text="NOK Affiliation:"
                ToolTip="NOK Affiliation" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddlNOKAffiliation" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel29" Text="Is active:" ToolTip="Is active"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:CheckBox ID="cbIsActive" runat="server" />
        </td>
        
        <td>
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel19" Text="Sponsorship duration:"
                ToolTip="Sponsorship duration" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKNumericTextBox ID="txtSponsorshipDuration" runat="server" CssClass="nestedAdminInput" 
            MinimumValue="1" MaximumValue="1200" Value="1" RequiredErrorMessage="Please enter the scholarship duration" RangeErrorMessage="Value should be 1 to 1,200" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel31" Text="Mentor:" ToolTip="Mentor"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:MentorSelector ID="ddlMentorSelector" runat="server" CssClass="adminInput" />
        </td>
        
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel27" Text="GGBC Projected exit yr:"
                ToolTip="GGBC Projected exit yr" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="dtexitYearGGBC" runat="server" HideDays="true" HideMonths="true">
            </SmarTik:STKDatePicker>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel13" Text="Local Organization:"
                ToolTip="Local Organization" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:LocalOrgSelector ID="ddlLocalOrgSelector" runat="server" CssClass="adminInput" />
        </td>
        
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel24" Text="Date terminated:"
                ToolTip="Date terminated" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="dtDateTerminated" runat="server">
            </SmarTik:STKDatePicker>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel25" Text="Termination reasons:"
                ToolTip="Date assigned mentee" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddlTerminationReason" runat="server" CssClass="adminInput" />
        </td>
        
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel14" Text="DOB:"
                ToolTip="Date terminated" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="dtDOB" runat="server">
            </SmarTik:STKDatePicker>
        </td>
    </tr>
    <tr>
       <td class="adminTitle" rowspan="3" valign="top">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel16" Text="History:"
                ToolTip="Termination notes" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData" rowspan="3">
            <asp:TextBox ID="txtHistory" runat="server" CssClass="adminInput" TextMode="MultiLine"
                Rows="8"></asp:TextBox>
        </td>
        
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel15" Text="Butterfly Squad:"
                ToolTip="NOK Affiliation" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddlButterflySquad" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel26" Text="Termination notes:"
                ToolTip="Termination notes" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtTerminationNotes" runat="server" CssClass="adminInput" TextMode="MultiLine"
                Rows="8"></asp:TextBox>
        </td>
    </tr>
</table>
