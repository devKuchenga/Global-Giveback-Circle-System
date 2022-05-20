<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptFinpartnerperiodic.aspx.vb" Inherits="GGBC.Smartik.Administration.rptFinpartnerperiodicPage" %>

<%@ Register TagPrefix="SmarTik" TagName="FinancialPeriodic" Src="~/Reports/FinancialPartnerPeriodic.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
   <SmarTik:FinancialPeriodic ID="ctrlFinancialPeriodic" runat="server" />
</asp:Content>