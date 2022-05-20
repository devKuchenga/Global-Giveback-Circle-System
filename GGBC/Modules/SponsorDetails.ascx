<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SponsorDetails.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.SponsorDetailsControl" %>

<%@ Register TagPrefix="SmarTik" TagName="SponsorInfo" Src="SponsorInfo.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="Sponsorships" Src="Sponsorships.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="SponsorMeetings" Src="SponsorMeetings.ascx" %>

<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Edit" />
        Edit <%= Server.HtmlEncode(Me.SponsorName)%>  Details - <asp:Label runat="server" ID="lblTitle" />
        <a href="Sponsors.aspx" title="back to sponsor list">(back to sponsor list)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" CssClass="adminButtonBlue" Text="Save"
            OnClick="SaveButton_Click" ToolTip="Saves edited sponsor info" />
        <asp:Button ID="SaveAndStayButton" runat="server" CssClass="adminButtonBlue" Text="Save and Stay"
            OnClick="SaveAndStayButton_Click" />
    </div>
</div>

<ajaxToolkit:TabContainer runat="server" ID="SponsorTabs" ActiveTabIndex="0">
    <ajaxToolkit:TabPanel runat="server" ID="pnlSponsorInfo" HeaderText="Partner Info">
        <ContentTemplate>
            <SmarTik:SponsorInfo ID="ctrlSponsorInfo" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    <ajaxToolkit:TabPanel runat="server" ID="pnlPartnerMeetings" HeaderText="Partner Meetings">
        <ContentTemplate>
            <SmarTik:SponsorMeetings ID="ctrlSponsorMeetings" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
</ajaxToolkit:TabContainer>