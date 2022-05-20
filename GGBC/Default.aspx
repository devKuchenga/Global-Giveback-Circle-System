<%@ Page Title="Home Page" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="GGBC.Smartik.Administration._DefaultPage" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
        <div style="width:100%; min-height: 100px;"></div>
        <div style="position:absolute; top: -999; font-size: 19px; width:100%; ">
              <%--  <% If (HttpContext.Current.User.Identity.IsAuthenticated) Then%>
                        <div style="width: 70%; float:left; text-align:center; display:inline "><span style="background-color: #FFE1C4;"> Welcome to GGBC DATABASE!&nbsp;&nbsp;Please choose a menu item to continue.</span></div>
                 <% Else%>
                        <div style="width: 70%; float:left; text-align:center; display:inline "><span style="background-color: #FFE1C4;"> Welcome to GGBC DATABASE!&nbsp;&nbsp;Please Login to continue.</span></div>
                 <%End If%>--%>

              <%--<div style=" display:inline;background-color: #FFE1C4; width:40%; float:right; text-align:left">&nbsp;</div>--%>
        </div>
</asp:Content>