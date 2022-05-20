<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptGeneralMentee.aspx.vb" Inherits="GGBC.Smartik.Administration.rptGeneralMenteePage" %>

<%@ Register TagPrefix="SmarTik" TagName="MenteesGeneral" Src="~/Reports/MenteesGeneral.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <SmarTik:MenteesGeneral ID="ctrlMenteesGeneral" runat="server" />
</asp:Content>
