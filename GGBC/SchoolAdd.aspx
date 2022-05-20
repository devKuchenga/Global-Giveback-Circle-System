<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SchoolAdd.aspx.vb" Inherits="GGBC.Smartik.Administration.SchoolAddPage" %>

<%@ Register TagPrefix="SmarTik" TagName="SchoolAdd" Src="~/Modules/SchoolAdd.ascx" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="MainContent">
       <SmarTik:SchoolAdd ID="ctrlSchoolAdd" runat="server" />
</asp:Content>