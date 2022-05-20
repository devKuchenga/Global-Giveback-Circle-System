<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="SponsorDetails.aspx.vb" Inherits="GGBC.Smartik.Administration.SponsorDetailsPage" %>

<%@ Register TagPrefix="SmarTik" TagName="SponsorDetails" Src="~/Modules/SponsorDetails.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
        <SmarTik:SponsorDetails ID="ctrlSponsorDetails" runat="server" />
</asp:Content>