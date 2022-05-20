<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="LocalOrgAdd.aspx.vb" Inherits="GGBC.Smartik.Administration.LocalOrgAddPage" %>

<%@ Register TagPrefix="SmarTik" TagName="LocalOrgAdd" Src="~/Modules/LocalOrganizationAdd.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:LocalOrgAdd ID="ctrlLocalOrgAdd" runat="server" />
</asp:Content>