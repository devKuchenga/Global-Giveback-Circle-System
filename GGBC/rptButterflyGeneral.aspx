<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptButterflyGeneral.aspx.vb" Inherits="GGBC.Smartik.Administration.rptButterflyGeneralPage" %>

<%@ Register TagPrefix="SmarTik" TagName="ButterflyGeneral" Src="~/Reports/ButterfliesGeneral.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:ButterflyGeneral ID="ctrlButteflyGeneral" runat="server" />
</asp:Content>