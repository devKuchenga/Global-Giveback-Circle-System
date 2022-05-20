<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TestPage.aspx.vb" Inherits="GGBC.Smartik.Administration.TestPage"
     MasterPageFile="~/Site.Master"
    %>

<%@ Register Src="~/Modules/Mentees.ascx" TagPrefix="uc1" TagName="Mentees" %>

<asp:Content ID="contenti" runat="server" ContentPlaceHolderID="MainContent">
        <div>
            This is just a test page
            <uc1:Mentees runat="server" ID="Mentees" />
           
        </div>
</asp:Content>

