<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="GrantBeneficiary.aspx.vb" Inherits="GGBC.Smartik.Administration.GrantBeneficiaryPage" %>

<%@ Register TagPrefix="SmarTik" TagName="GrantBeneficiary" Src="~/Modules/GrantBeneficiary.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <SmarTik:GrantBeneficiary ID="ctrlGrantBeneficiary" runat="server" />
</asp:Content>