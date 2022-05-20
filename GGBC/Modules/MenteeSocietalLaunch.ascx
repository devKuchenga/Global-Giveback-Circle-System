<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MenteeSocietalLaunch.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MenteeSocietalLaunchControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="EmailTextBox" Src="EmailTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ddlSelector" Src="ddlSelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>

<script type="text/javascript">
    $(document).ready(function () {
        //var dselector = $("[id*=ddPlacementAfterGrad");
        // var dselector = $("[id*=ddPlacementAfterGrad]").eq(0);
        var ddlPlacementAfterGrad = $("[id*=ddPlacementAfterGrad]").eq(0);
        var ddlPlacementType = $("[id*=ddPlacementType]").eq(0);

        $(ddlPlacementAfterGrad).val("-1");
        $(ddlPlacementType).val("-1");
        //$($(PlacementAfterGrad) + "option:first-child").attr("selected", "selected");
        $(ddlPlacementAfterGrad).change(function (e) {
            var selVal = $(this).val();
            switch (selVal) {
                case "-1":
                case "2":

                    $("[title*=tdPlacementType]").each(function () {
                        $(this).css({ display: 'none' });
                    });

                    $("#insertAfter").nextAll("tr").each(function () {
                        $("#" + $(this).attr("title")).find("tbody:last").append($(this)).removeAttr("title");
                    });
                    $(ddlPlacementType).val("-1");
                    break;

                case "1":
                    $("[title*=tdPlacementType]").each(function () {
                        $(this).css({ display: '' });
                    });
                    $(ddlPlacementType).val("-1");
                    break;
            }
            //e.preventDefault();
        });

        $(ddlPlacementType).change(function (e) {
            var plcType = $(this).val();
            switch (plcType) {
                case "-1":
                    $("#insertAfter").nextAll("tr").each(function () {
                        $("#" + $(this).attr("title")).find("tbody:last").append($(this)).removeAttr("title");
                    });
                    break;
                case "1": //Organization
                    $("#insertAfter").nextAll("tr").each(function () {
                        $("#" + $(this).attr("title")).find("tbody:last").append($(this)).removeAttr("title");
                    });

                    //insert
                    $("#Organization").find("tr").each(function () {
                        $(this).insertAfter($("#SocietalLaunch").find("tr:last")).attr('title', 'Organization');
                    });
                    break;
                case "2": //Higher Education
                    $("#insertAfter").nextAll("tr").each(function () {
                        $("#" + $(this).attr("title")).find("tbody:last").append($(this)).removeAttr("title");
                    });

                    //insert
                    $("#HigherEducation").find("tr").each(function () {
                        $(this).insertAfter($("#SocietalLaunch").find("tr:last")).attr('title', 'HigherEducation');
                    });
                    break;
            }
            e.preventDefault();
        });

    });
</script>

<table class="adminContent" id="SocietalLaunch">
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="col1Label" Text="Degree Earned To Date:"
                ToolTip="Degree Earned To Date" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
                    <asp:TextBox ID="txtDegreeEarnedtodate" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="Actual Course Type:"
                ToolTip="Actual Course Type" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddActualcoursetype" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel3" Text="Actual Certificate/Degree Earned:"
                ToolTip="Actual Certificate/Degree Earned" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
        <asp:TextBox ID="txtActualCertDegreeearned" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel4" Text="Higher Education Amount:"
                ToolTip="Higher Education Amount" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDecimalTextBox runat="server" CssClass="adminInput" ID="txtHighereduamount"
                Value="0" RequiredErrorMessage="Please enter the higer education amount" MinimumValue="0"
                MaximumValue="999999999" RangeErrorMessage="Value should from 0 to 999,999,999 " />
        </td>
    </tr>
    <tr title="Row one">
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel5" Text="Actual Year of Completion:"
                ToolTip="Actual Year of Completion" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="txtActualYOCompletion" runat="server" HideDays="true"
                HideMonths="true" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel28" Text="Total Scholarship Amount:"
                ToolTip="Total Scholarship Amount" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKNumericTextBox runat="server" CssClass="adminInput" ID="txtTotalScholarshipAmount"
                Value="0" RequiredErrorMessage="Please enter the total scholarship amount" MinimumValue="0"
                MaximumValue="99999999" RangeErrorMessage="Value should from 0 to 99,999,999 " />
        </td>
    </tr>
    <tr id="insertAfter">
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel6" Text="Placement After Graduation:"
                ToolTip="Placement After Graduation" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddPlacementAfterGrad" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle" style="display: none" title="tdPlacementType">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel8" Text="Placement Type:" ToolTip="Placement Type"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData" style="display: none" title="tdPlacementType">
            <SmarTik:ddlSelector ID="ddPlacementType" runat="server" CssClass="adminInput" />
        </td>
    </tr>
</table>
<table class="adminContent" id="HigherEducation" style="display: none">
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="HigherEducol1" Text="Name Of Institution:"
                ToolTip="Name Of Institution" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtNameofinst" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel9" Text="Address Line 1:" ToolTip="Address Line 1"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtAddOFinstL1" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel10" Text="Address Line 2:" ToolTip="Address Line 2"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtAddOFInstL2" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel11" Text="Address Line 3:" ToolTip="Address Line 3"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtAddOFInstL3" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel12" Text="Degree Program:" ToolTip="Degree Program"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddDegreeProgram" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel13" Text="Start Date:" ToolTip="Start Date"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:DatePicker ID="txtStartDate" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel14" Text="Concentration:" ToolTip="Concentration"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddConcentration" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel15" Text="Expected Graduation Date:"
                ToolTip="Expected Graduation Date" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:DatePicker ID="txtExpectedGraddate" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel16" Text="Degree Earned:" ToolTip="Degree Earned"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddDegreeEarned" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel17" Text="Actual Graduation Date:"
                ToolTip="Actual Graduation Date" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:DatePicker ID="txtActualGraddate" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel24" Text="Give back option:"
                ToolTip="Give back option" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <div style="float:left; display:inline; padding-right:3px"><asp:CheckBox ID="ocbCash" runat="server" Text="Cash" /></div>
            <div style="float:left ;display:inline;padding-right:3px "><asp:CheckBox ID="ocbTime" runat="server" Text="Time" /></div>
            <div style="float:left;display:inline ;padding-right:3px"><asp:CheckBox ID="ocbTalent" runat="server" Text="Talent" /></div>
            <div style="float:left;display:inline  ;padding-right:3px"><asp:CheckBox ID="ocbMentor" runat="server" Text="Mentor" /></div>
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel25" Text="Other:" ToolTip="Other"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtOther" runat="server" CssClass="adminInput" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel26" Text="Notes:" ToolTip="Address Line 2"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData" colspan="3">
            <asp:TextBox ID="txtHigherEduNotes" runat="server" CssClass="adminInput" TextMode="MultiLine" />
        </td>
    </tr>
</table>
<table class="adminContent" id="Organization" style="display: none"> 
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel18" Text="Name Of Company:"
                ToolTip="Name Of Company" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtNameofComp" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel19" Text="Address Line 1:" ToolTip="Address Line 1"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtAddOFcol1" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel20" Text="Address Line 2:" ToolTip="Address Line 2"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtAddOFcol2" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel21" Text="Address Line 3:" ToolTip="Address Line 3"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtAddOFcol3" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel23" Text="Start Date:" ToolTip="Start Date"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:DatePicker ID="txtCoStartDate" runat="server" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel22" Text="Position Title:" ToolTip="Position Title"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
        <asp:TextBox ID="txtPositionTitle" runat="server" CssClass="adminInput" />
        </td>
    </tr>
</table>


            
