<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="PostSponsorPayment.aspx.vb" Inherits="GGBC.Smartik.Administration.PostSponsorPaymentPage" %>

<%@ Register TagPrefix="SmarTik" TagName="ReceiveSponsorPayment" Src="~/Modules/ReceivePayments.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
     <SmarTik:ReceiveSponsorPayment ID="ctrlPostSponsorPayments" runat="server" />
</asp:Content>