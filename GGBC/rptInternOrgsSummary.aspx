<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptInternOrgsSummary.aspx.vb" Inherits="GGBC.Smartik.Administration.rptInternOrgsSummaryPage" %>

<%@ Register TagPrefix="SmarTik" TagName="SummIntrnOrgs" Src="~/Reports/SummaryIntershipOrgz.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:SummIntrnOrgs ID="ctrlSummIntrnOrgs" runat="server" />
</asp:Content>