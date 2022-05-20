<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Mentors.aspx.vb" Inherits="GGBC.Smartik.Administration.MentorsPage" %>

<%@ Register TagPrefix="SmarTik" TagName="Mentors" Src="~/Modules/Mentors.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID ="MainContent">
    <SmarTik:Mentors ID="ctrlMentors" runat="server" />
</asp:Content>