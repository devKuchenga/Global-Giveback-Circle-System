<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rptMenteeInternshipGeneral.aspx.vb" Inherits="GGBC.Smartik.Administration.rptMenteeInternshipGeneralPage" %>

<%@ Register TagPrefix="SmarTik" TagName="mInternshipGen" Src="~/Reports/MentInternshipGeneral.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
        <SmarTik:mInternshipGen ID="ctrlMInternshipGen" runat="server" />
</asp:Content>