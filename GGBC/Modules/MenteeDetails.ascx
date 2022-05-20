<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MenteeDetails.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MenteeDetailsControl" %>

<%@ Register TagPrefix="SmarTik" TagName="MenteeInfo" Src="MenteeInfo.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="Internship" Src="MenteeInternshipInfo.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="Commitment" Src="MenteeCommitmentInfo.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="MenteeSchool" Src="MenteeSchool.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="SocietalLaunch" Src="MenteeSocietalLaunch.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ButterflyInfo" Src="MenteeButterflyInfo.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="WorkshopInfo" Src="MenteeWorkshop.ascx" %>


<script type="text/javascript">
    $(document).ready(function () {
        var txtFName = $("[id*=txtFName]").eq(0);
        var txtLname = $("[id*=txtLname]").eq(0);
        var ddSecSchool = $("[id*=ddSecSchool]").eq(0);
        var ddKCSEscore = $("[id*=ddKCSEscore]").eq(0);
        var dtDOB = $("[id*=dtDOB]");
        var dtDateJoinedGGBC = $("[id*=dtDateJoinedGGBC]");

        $('#<%=SaveAndStayButton.ClientID%>, #<%=SaveButton.ClientID%> ').click(function (e) {
            if (txtFName.val() == '') {
                alert('Please enter first name in mentee info tab');
                //$(txtFName).css({ "border-left-color": "red" });
                txtFName.focus();
                e.preventDefault();
            } else if (txtLname.val() == '') {
                alert('Please enter last name in mentee info tab');
                $(txtLname).focus();
                e.preventDefault();
            } else if (ddSecSchool.val() == '-1') {
                alert('Please select the secondary school name in school info tab');
                $(ddSecSchool).focus();
                e.preventDefault();
            } else if (ddKCSEscore.val() == '-1') {
                alert('Please select KCSE grade in school info tab');
                $(ddKCSEscore).focus();
                e.preventDefault();
            }

            $(dtDOB).each(function (event) {
                if ($(this).val() == "0") {
                    alert('Please select a valid date of birth from the Mentee Info tab.');
                    e.preventDefault();
                    event.preventDefault();
                }
            });

            $(dtDateJoinedGGBC).each(function (event) {
                if ($(this).val() == "0") {
                    alert('Please select a valid date joined GGBC from the Mentee Info tab.');
                    e.preventDefault();
                    event.preventDefault();
                }
            });
        });

    });


</script>

<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Edit" />
        Edit <%= Server.HtmlEncode(Me.MenteeName)%>  Details - <asp:Label runat="server" ID="lblTitle" />
        <a href="Mentees.aspx" title="back to mentee list">(back to mentee list)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" CssClass="adminButtonBlue" Text="Save" 
            OnClick="SaveButton_Click" ValidationGroup="EditMentee" ToolTip="Saves edited sponsor info" />
        <asp:Button ID="SaveAndStayButton" runat="server" CssClass="adminButtonBlue" Text="Save and Stay"
            OnClick="SaveAndStayButton_Click" ValidationGroup="EditMentee" />
    </div>
</div>

<ajaxToolkit:TabContainer runat="server" ID="MenteeTabs" ActiveTabIndex="0">
    <ajaxToolkit:TabPanel runat="server" ID="pnlMenteeInfo" HeaderText="Mentee Info">
        <ContentTemplate>
            <SmarTik:MenteeInfo ID="ctrlMenteeInfo" runat="server" />      
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    <ajaxToolkit:TabPanel runat="server" ID="pnlSchoolInfo" HeaderText="School Info">
        <ContentTemplate>
            <SmarTik:MenteeSchool ID="ctrlMenteeSchool" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    <ajaxToolkit:TabPanel runat="server" ID="pnlCommitmentInfo" HeaderText="Commitment Info">
        <ContentTemplate>
            <SmarTik:Commitment ID="ctrlCommitmentInfo" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    <ajaxToolkit:TabPanel runat="server" ID="pnlInternshipInfo" HeaderText="Internship Info">
        <ContentTemplate>
            <SmarTik:Internship ID="ctrlInternshipInfo" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    <ajaxToolkit:TabPanel runat="server" ID="pnlWorkshopInfo" HeaderText="Workshop Info">
        <ContentTemplate>
            <SmarTik:WorkshopInfo ID="ctrlWorkshopInfo" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    <ajaxToolkit:TabPanel runat="server" ID="pnlButterflyInfo" HeaderText="Butterfly Info">
        <ContentTemplate>
            <SmarTik:ButterflyInfo ID="ctrlButterflyInfo" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    <ajaxToolkit:TabPanel runat="server" ID="pnlSocietalLaunch" HeaderText="Societal Launch">
        <ContentTemplate>
            <SmarTik:SocietalLaunch ID="ctrlMenteeSocietalLaunch" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
</ajaxToolkit:TabContainer>

