<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="LocalOrganizationAdd.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.LocalOrganizationAddControl" %>

<%@ Register TagPrefix="SmarTik" TagName="LocalOrgInfo" Src="~/Modules/LocalOrganizationInfo.ascx" %>

<script type="text/javascript">

    $(document).ready(function () {
        $('#divGeneralPartners').css('display', 'none');
        $('#divSpecificPartners').css('float', 'left');
    });
</script>

<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Edit" />
        Add New Local Org - <asp:Label runat="server" ID="lblTitle" />
        <a href="LocalOrgs.aspx" title="back to sponsor list">(back to local orgs list)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" CssClass="adminButtonBlue" Text="Save"
            OnClick="SaveButton_Click" ToolTip="Saves edited sponsor info" />
        <asp:Button ID="SaveAndStayButton" runat="server" CssClass="adminButtonBlue" Text="Save and Stay"
            OnClick="SaveAndStayButton_Click" />
        <asp:Button ID="DeleteButton" runat="server" CssClass="adminButtonBlue" Text="Delete"
            OnClick="DeleteButton_Click" CausesValidation="false" />
    </div>
</div>

<SmarTik:LocalOrgInfo ID="ctrlLocalOrgInfo" runat="server" />
