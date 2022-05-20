<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="Sponsors.aspx.vb" Inherits="GGBC.Smartik.Administration.SponsorsPage" %>

<%@ Register TagPrefix="SmarTik" TagName="SponsorsControl" Src="~/Modules/Sponsors.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:SponsorsControl ID="ctrlSponsors" runat="server" />
</asp:Content>