<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptGivebackGeneral.aspx.vb" Inherits="GGBC.Smartik.Administration.rptGivebackGeneralPage" %>

<%@ Register TagPrefix="SmarTik" TagName="Giveback" Src="~/Reports/MenteeGivebackGeneral.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:Giveback ID="ctrlGiveback" runat="server" />
</asp:Content>