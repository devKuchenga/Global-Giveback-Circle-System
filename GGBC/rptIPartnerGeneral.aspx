<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptIPartnerGeneral.aspx.vb" Inherits="GGBC.Smartik.Administration.rptIPartnerGeneralPage" %>

<%@ Register TagPrefix="SmarTik" TagName="iPartnerGeneral" Src="~/Reports/InternshipPartnerGeneral.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
   <SmarTik:iPartnerGeneral runat="server" ID="ctrlIPartnerGeneral" />
</asp:Content>