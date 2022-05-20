<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MentorInfo.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MentorInfoControl" %>

<%@ Register TagPrefix="SmarTik" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ddlSelector" Src="ddlSelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="EmailTextBox" Src="EmailTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="CountrySelector" Src="CountrySelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="MentorEvent" Src="MentorEvent.ascx" %>

<script type="text/javascript">
    $(document).ready(function () {
        var req = "<div title='required field' class='required'>*</div>"
        var txtFName = $("[id*=txtFName]").eq(0);
        var txtLname = $("[id*=txtLname]").eq(0);
        var txtMobilePhone = $("[id*=txtMobilePhone]").eq(0);
        var ddlMentorAffiliation = $("[id*=ddlMentorAffiliation]").eq(0);
        var dtDateJoinedGGBC = $("[id*=dtDateJoinedGGBC]");

        $(req).insertAfter($(txtFName));
        $(req).insertAfter($(txtLname));
        $(req).insertAfter($(txtMobilePhone));
        $(req).insertAfter($(ddlMentorAffiliation));
        $(req).insertAfter($(dtDateJoinedGGBC));
    });
</script>

<table class="adminContent" id="tblMentorInfo">
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="Label1" Text="First Name:" ToolTip="First Name"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtFName" runat="server"></asp:TextBox>
            <asp:HiddenField ID="hfMentorId" runat="server" />
            <asp:HiddenField ID="hfMentorName" runat="server" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel33" Text="Picture:" ToolTip="Mentor Picture"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData" rowspan="9">
          <div class="adminInput" style=" border:3px solid #acacac;">
            <asp:Image ID="iMentorPicture" runat="server" AlternateText="pic" CssClass="adminInput" />
            <div style="border-top:3px solid #acacac;">
            Upload new: <asp:FileUpload ID="fuMentorPicture" CssClass="adminInput" runat="server"
                    ToolTip="Upload mentor picture" />
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
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel7" Text="Work phone:" ToolTip="Work phone"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtWorkPhone" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel8" Text="Phone (personal):"
                ToolTip="Phone (personal)" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtPhonePersonal" runat="server"></asp:TextBox>
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
        </tr>
        <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel11" Text="Email (work):" ToolTip="Job email"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:EmailTextBox ID="txtWorkEmail" runat="server" CssClass="adminInput" Required="false" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel6" Text="Mentor Events:" ToolTip="Mentor events"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData" rowspan="6" >
            <div class="adminInput" style=" border:3px solid #acacac;">Select Mentor events from the list below</div>
            <div class="adminInput" style=" height:105px; overflow:auto; border-width:0px 3px 0px 2px; border-style:solid" >
                <SmarTik:MentorEvent ID="ctrlMentorEvent" runat="server" CssClass="adminInput" />
            </div>
            <div class="adminInput" style=" border-width:0px; border-top:3px solid #acacac;">&nbsp;</div>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel12" Text="Reference First Name:"
                ToolTip="Reference First Name" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtRefFname" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel13" Text="Reference Middle Name:"
                ToolTip="Reference Middle Name" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtRefMname" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel14" Text="Reference Last Name:"
                ToolTip="Reference Last Name" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtRefLname" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel15" Text="Reference Address Line 1:"
                ToolTip="Reference Address Line 1" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtRefAddrLn1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel16" Text="Reference Address Line 2:"
                ToolTip="Reference Address Line 2" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtRefAddrLN2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel17" Text="Reference Address Line 3:"
                ToolTip="Reference Address Line 3" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="style26">
            <asp:TextBox CssClass="adminInput" ID="txtRefAddrLn3" runat="server"></asp:TextBox>
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel18" Text="Reference Email:"
                ToolTip="Reference Email" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtRefEmail" runat="server"></asp:TextBox>
        </td>
     </tr>
     <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel19" Text="Reference Phone No:"
                ToolTip="Reference Phone No" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtRefPhoneno" runat="server"></asp:TextBox>
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel20" Text="Mentor Affiliation:"
                ToolTip="Mentor affiliation" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddlMentorAffiliation" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel22" Text="Date joined GGBC:"
                ToolTip="Date joined BBC" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="dtDateJoinedGGBC" runat="server">
            </SmarTik:STKDatePicker>
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel23" Text="Date assigned mentee:"
                ToolTip="Date assigned mentee" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="dtDateAssignedMentee" runat="server">
            </SmarTik:STKDatePicker>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel30" Text="Nationality/Residence:"
                ToolTip="Nationality or Residence" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddlNationality" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel32" Text="Occupation:" ToolTip="Occupation"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtOccupation" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel31" Text="Mentee ID -(If Previous Mentee):"
                ToolTip="Mentee ID -(If Previous Mentee)" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox CssClass="adminInput" ID="txtPrevMenteeID" runat="server"></asp:TextBox>
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel27" Text="Country:" ToolTip="County"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:CountrySelector ID="ddlCountry" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel28" Text="Mentor level:" ToolTip="Mentor level"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddlMentorLevel" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel21" Text="Source:" ToolTip="Source"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddlSource" runat="server" CssClass="adminInput" />
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
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel26" Text="Termination notes:"
                ToolTip="Termination notes" ToolTipImage="~/Common/ico-help.gif" />
        </td>

        <td class="adminData" colspan="3">
                <asp:TextBox ID="txtTerminationNotes" runat="server" CssClass="adminInput" TextMode="MultiLine"
                Rows="8"></asp:TextBox>
        </td>
    </tr>
</table>
