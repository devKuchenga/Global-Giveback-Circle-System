<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="RaiseMentorInvoice.aspx.vb" Inherits="GGBC.Smartik.Administration.RaiseMentorInvoicePage" %>

<%@ Register TagPrefix="SmarTik" TagName="RaiseMentorInvoice" Src="~/Modules/RaiseMentorInvoice.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:RaiseMentorInvoice ID="ctrlRaiseMentorInvoice" runat="server" />
</asp:Content>