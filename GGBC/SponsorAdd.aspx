<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SponsorAdd.aspx.vb" MasterPageFile="~/Site.master" Inherits="GGBC.Smartik.Administration.SponsorAddPage" %>

<%@ Register TagPrefix="SmarTik" TagName="SponsorAdd" Src="~/Modules/SponsorAdd.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:SponsorAdd ID="ctrlSponsorAdd" runat="server" />
</asp:Content>