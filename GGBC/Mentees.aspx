<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Mentees.aspx.vb" Inherits="GGBC.Smartik.Administration.MenteesPage" %>

<%@ Register TagPrefix="SmarTik" TagName="Mentees" Src="~/Modules/Mentees.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
      <SmarTik:Mentees ID="ctrlMentees" runat="server" />     
</asp:Content>
