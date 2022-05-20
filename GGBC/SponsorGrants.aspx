<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SponsorGrants.aspx.vb" Inherits="GGBC.Smartik.Administration.SponsorGrantsPage" %>

<%@ Register TagPrefix="SmarTik" TagName="SponsorGrants" Src="~/Modules/SponsorGrant.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
   <SmarTik:SponsorGrants ID="ctrlSponsorGrants" runat="server" />
</asp:Content>
