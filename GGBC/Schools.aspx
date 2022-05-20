<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Schools.aspx.vb" Inherits="GGBC.Smartik.Administration.SchoolsPage" %>

<%@ Register TagPrefix="SmarTik" TagName="Schools" Src="~/Modules/Schools.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:Schools ID="ctrlSchools" runat="server" />
</asp:Content>