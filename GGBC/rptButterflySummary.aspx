<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptButterflySummary.aspx.vb" Inherits="GGBC.Smartik.Administration.rptButterflySummaryPage" %>

<%@ Register TagPrefix="SmarTik" TagName="SummButterfly" Src="~/Reports/SummaryButterfly.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:SummButterfly ID="ctrlSummButterfly" runat="server" />
</asp:Content>