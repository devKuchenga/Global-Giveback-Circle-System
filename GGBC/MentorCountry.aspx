<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MentorCountry.aspx.vb" Inherits="GGBC.Mentor_Reports" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer ID="MentorbyCountry" runat="server" Height="513px" 
    Width="934px" Font-Names="Verdana" Font-Size="8pt" 
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
        WaitMessageFont-Size="14pt" DocumentMapWidth="100%" PageCountMode="Actual" 
        PromptAreaCollapsed="True">
        <ServerReport ReportPath="http://localhost:8080/ReportServer?%2fGGBCReports%2fMentorByCountry" />
        <LocalReport ReportPath="Mentorcountry.rdlc" EnableExternalImages="True">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
            </DataSources>
        </LocalReport>
</rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetData" 
        TypeName="GGBC.GBCCDataSetTableAdapters.rpt_MentorsbyCountryTableAdapter">
    </asp:ObjectDataSource>
</asp:Content>
