<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="LocalOrgDetails.aspx.vb" Inherits="GGBC.Smartik.Administration.LocalOrganizationDetailsPage" %>

<%@ Register TagPrefix="SmarTik" TagName="LocalOrgDetails" Src="~/Modules/LocalOrganizationDetails.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:LocalOrgDetails ID="ctrlLocalOrgDetails" runat="server" />
</asp:Content>