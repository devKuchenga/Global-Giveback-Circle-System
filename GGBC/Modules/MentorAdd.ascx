<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MentorAdd.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MentorAddControl" %>

<%@ Register TagPrefix="SmarTik" TagName="MentorInfo" Src="MentorInfo.ascx"  %>

<script type="text/javascript">
    $(document).ready(function () {
        var req = "<div title='required field' class='required'>*</div>"
        var txtFName = $("[id*=txtFName]").eq(0);
        var txtLname = $("[id*=txtLname]").eq(0);
        var txtMobilePhone = $("[id*=txtMobilePhone]").eq(0);
        var ddlMentorAffiliation = $("[id*=ddlMentorAffiliation]").eq(0);
        var dtDateJoinedGGBC = $("[id*=dtDateJoinedGGBC]");

        $('#<%=SaveAndStayButton.ClientID%>, #<%=SaveButton.ClientID%>').click(function (e) {
            if (txtFName.val() == '') {
                alert('Please enter first name on the mentor info tab');
                txtFName.focus();
                e.preventDefault();
            } else if (txtLname.val() == '') {
                alert('Please enter last name on the mentor info tab');
                $(txtLname).focus();
                e.preventDefault();
            } else if (txtMobilePhone.val() == '') {
                alert('Please enter the mentor mobile phone number on the mentor info tab');
                $(txtMobilePhone).focus();
                e.preventDefault();
            } else if (ddlMentorAffiliation.val() == '-1') {
                alert('Please select the mentor affiliation on the mentor info tab.');
                $(ddlMentorAffiliation).focus();
                e.preventDefault();
            }

            $(dtDateJoinedGGBC).each(function (event) {
                if ($(this).val() == "0") {
                    alert('Please select a valid date joined GGBC from the Mentor Info tab.');
                    e.preventDefault();
                    event.preventDefault();
                }
            });
        });

    });
</script>

<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Add" />
        Add New Mentor - <asp:Label runat="server" ID="lblTitle" />
        <a href="Mentors.aspx" title="back to sponsor list">(Cancel)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" CssClass="adminButtonBlue" Text="Save"
            OnClick="SaveButton_Click" ToolTip="Saves edited sponsor info" />
        <asp:Button ID="SaveAndStayButton" runat="server" CssClass="adminButtonBlue" Text="Save and Stay"
            OnClick="SaveAndStayButton_Click" />
    </div>
</div>

<SmarTik:MentorInfo ID="ctrlMentorInfo" runat="server" />
