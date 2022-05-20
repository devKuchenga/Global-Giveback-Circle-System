<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptGenmentor.aspx.vb" Inherits="GGBC.Smartik.Administration.rptGenmentorPage" %>

<%@ Register TagPrefix="SmarTik" TagName="GeneralMentors" Src="~/Reports/MentorGeneral.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       <SmarTik:GeneralMentors ID="ctrlGeneralMentors" runat="server" />
</asp:Content>
