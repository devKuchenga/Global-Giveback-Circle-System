<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MentorAdd.aspx.vb" Inherits="GGBC.Smartik.Administration.MentorAddPage" %>

<%@ Register TagPrefix="SmarTik" TagName="MentorAdd" Src="~/Modules/MentorAdd.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:MentorAdd ID="ctrlMentorAdd" runat="server" />
</asp:Content>

