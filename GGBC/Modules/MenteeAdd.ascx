<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MenteeAdd.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MenteeAddControl" %>

<%@ Register TagPrefix="SmarTik" TagName="MenteeInfo" Src="MenteeInfo.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="MenteeSchool" Src="MenteeSchool.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ButterflyInfo" Src="MenteeButterflyInfo.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="SocietalLaunch" Src="MenteeSocietalLaunch.ascx" %>

<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Add" />
        Add New Mentee - <asp:Label runat="server" ID="lblTitle" />
        <a href="Mentees.aspx" title="back to mentees list">(Cancel)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" CssClass="adminButtonBlue" Text="Save" ValidationGroup="AddMentee"
            OnClick="SaveButton_Click" ToolTip="Saves mentee info" />
        <asp:Button ID="SaveAndStayButton" runat="server" CssClass="adminButtonBlue" Text="Save and Stay" ValidationGroup="AddMentee"
            OnClick="SaveAndStayButton_Click" />
    </div>
</div>

<ajaxToolkit:TabContainer runat="server" ID="MenteeTabs" ActiveTabIndex="0">
    <ajaxToolkit:TabPanel runat="server" ID="pnlMenteeInfo" HeaderText="Mentee Info">
        <ContentTemplate>
            <SmarTik:MenteeInfo ID="ctrlMenteeInfo" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    <ajaxToolkit:TabPanel runat="server" ID="pnlMenteeSchool" HeaderText="School Info">
        <ContentTemplate>
            <SmarTik:MenteeSchool ID="ctrlMenteeSchool" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    <ajaxToolkit:TabPanel runat="server" ID="pnlButterflyInfo" HeaderText="Butterfly Info">
        <ContentTemplate>
            <SmarTik:ButterflyInfo ID="ctrlButterflyInfo" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    <ajaxToolkit:TabPanel runat="server" ID="pnlSocietalLaunch" HeaderText="Societal Launch">
        <ContentTemplate>
            <SmarTik:SocietalLaunch ID="ctrlSocietalLaunch" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
</ajaxToolkit:TabContainer>