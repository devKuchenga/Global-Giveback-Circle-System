<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="BeneficiariesSummary.aspx.vb" Inherits="GGBC.Smartik.Administration.BeneficiariesSummaryPage" %>

<%@ Register TagPrefix="SmarTik" TagName="SummBeneficiaries" Src="~/Reports/SummaryBeneficiaries.ascx" %>

<asp:Content ID="Content1" runat ="server" ContentPlaceHolderID="MainContent">
    <SmarTik:SummBeneficiaries ID="ctrlSummBeneficiaries" runat="server" />    
</asp:Content>