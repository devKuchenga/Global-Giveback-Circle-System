<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SponsorAdd.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.SponsorAddControl" %>

<%@ Register TagPrefix="SmarTik" TagName="SponsorInfo" Src="SponsorInfo.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="TypeOfPartner" Src="TypeOfPartner.ascx" %>


<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Add" />
        Add New Sponsor - <asp:Label runat="server" ID="lblTitle" />
        <a href="Sponsors.aspx" title="back to sponsor list">(back to Sponsors list)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" CssClass="adminButtonBlue" Text="Save"
            OnClick="SaveButton_Click" ToolTip="Saves edited sponsor info" />
        <asp:Button ID="SaveAndStayButton" runat="server" CssClass="adminButtonBlue" Text="Save and Stay"
            OnClick="SaveAndStayButton_Click" />
    </div>
</div>

<ajaxToolkit:TabContainer runat="server" ID="SponsorTabs" ActiveTabIndex="0">
    <ajaxToolkit:TabPanel runat="server" ID="pnlSponsorInfo" HeaderText="Sponsor Info">
        <ContentTemplate>
            <SmarTik:SponsorInfo ID="ctrlSponsorInfo" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    <ajaxToolkit:TabPanel runat="server" ID="pnlPartnerType" HeaderText="Partner Type">
        <ContentTemplate>
            <SmarTik:TypeOfPartner ID="ctrlTypeOfPartner" runat="server" ModuleId="5"  />            
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
</ajaxToolkit:TabContainer>