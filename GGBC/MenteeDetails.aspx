<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MenteeDetails.aspx.vb" Inherits="GGBC.Smartik.Administration.MenteeDetailsPage" %>

<%@ Register TagPrefix="SmarTik" TagName="MenteeDetails" Src="~/Modules/MenteeDetails.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
        <SmarTik:MenteeDetails ID="ctrlMenteeDetails" runat="server" />
</asp:Content>