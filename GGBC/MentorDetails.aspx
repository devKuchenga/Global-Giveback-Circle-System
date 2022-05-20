<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MentorDetails.aspx.vb" Inherits="GGBC.Smartik.Administration.MentorDetailsPage" %>

<%@ Register TagPrefix="SmarTik" TagName="MentorDetails" Src="~/Modules/MentorDetails.ascx" %>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:MentorDetails ID="ctrlMentorDetails" runat="server" />
</asp:Content>