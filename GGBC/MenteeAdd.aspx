<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="MenteeAdd.aspx.vb" Inherits="GGBC.Smartik.Administration.MenteeAddPage" %>

<%@ Register TagPrefix="SmarTik" TagName="MenteeAdd" Src="~/Modules/MenteeAdd.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
     <SmarTik:MenteeAdd ID="ctrlMenteeAdd" runat="server" />         
</asp:Content>