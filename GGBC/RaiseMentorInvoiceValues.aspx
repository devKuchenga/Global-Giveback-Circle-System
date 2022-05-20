<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="RaiseMentorInvoiceValues.aspx.vb" Inherits="GGBC.Smartik.Administration.RaiseMentorInvoiceValuesPage" %>

<%@ Register TagPrefix="SmarTik" TagName="InvoicePayments" Src="~/Modules/InvoicePayment.ascx" %>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:InvoicePayments ID="ctrlInvoicePayments" runat="server" />
</asp:Content>