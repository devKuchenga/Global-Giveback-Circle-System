<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptParticipatingSchoolsGeneral.aspx.vb" Inherits="GGBC.Smartik.Administration.rptParticipatingSchoolsGeneralPage" %>

<%@ Register TagPrefix="SmarTik" TagName="PartSchools" Src="~/Reports/PartSchoolsGeneral.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:PartSchools ID="ctrlPartSchools" runat="server" />
</asp:Content>