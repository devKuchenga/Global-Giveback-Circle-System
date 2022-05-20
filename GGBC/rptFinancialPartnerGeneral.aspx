<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptFinancialPartnerGeneral.aspx.vb" Inherits="GGBC.Smartik.Administration.rptFinancialPartnerGeneralPage" %>

<%@ Register TagPrefix="SmarTik" TagName="FinancialPartnerGeneral" Src="~/Reports/FinancialPartnersGeneral.ascx" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:FinancialPartnerGeneral ID="ctrlFinancialPartnerGeneral" runat="server" />
</asp:Content>