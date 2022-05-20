<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SchoolDetails.aspx.vb" Inherits="GGBC.Smartik.Administration.SchoolDetailsPage" %>

<%@ Register TagPrefix="SmarTik" TagName="SchoolDetails" Src="~/Modules/SchoolDetails.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
        <SmarTik:SchoolDetails ID="ctrlSchoolDetails" runat="server" />
</asp:Content>