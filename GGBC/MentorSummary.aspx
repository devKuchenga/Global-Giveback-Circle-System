<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MentorSummary.aspx.vb" Inherits="GGBC.Smartik.Administration.MentorSummaryPage" %>

<%@ Register TagPrefix="SmarTik" TagName="MentorSummary" Src="~/Reports/SummaryMentor.ascx" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:MentorSummary ID="ctrlMentorSummary" runat="server" />
</asp:Content>