<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptFinancialPartnerSummary.aspx.vb" Inherits="GGBC.Smartik.Administration.rptFinancialPartnerSummaryPage" %>

<%@ Register TagPrefix="SmarTik" TagName="SummFPartner" Src="~/Reports/SummaryFPartner.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:SummFPartner ID="ctrlSummFPartner" runat="server" />
</asp:Content>