<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptPartSchoolsSummary.aspx.vb" Inherits="GGBC.Smartik.Administration.rptPartSchoolsSummaryPage" %>

<%@ Register TagPrefix="SmarTik" TagName="SummPartSchools" Src="~/Reports/SummParticipatingSchools.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:SummPartSchools ID="ctrlSummPartSchools" runat="server" />
</asp:Content>