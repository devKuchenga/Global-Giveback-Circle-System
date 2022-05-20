<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="LocalOrgs.aspx.vb" Inherits="GGBC.Smartik.Administration.LocalOrgsPage" %>

<%@ Register TagPrefix="SmarTik" TagName="LocalOrgs" Src="~/Modules/LocalOrganizations.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:LocalOrgs ID="ctrlLocalOrgs" runat="server" />
</asp:Content>