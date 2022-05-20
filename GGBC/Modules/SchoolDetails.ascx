<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SchoolDetails.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.SchoolDetailsControl" %>

<%@ Register TagPrefix="SmarTik" TagName="SchoolInfo" Src="~/Modules/SchoolInfo.ascx" %>

<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Edit" />
        Edit : <%= Server.HtmlEncode(Me.SchoolName)%> Details - <asp:Label runat="server" ID="lblTitle" />
        <a href="Schools.aspx" title="back to sponsor list">(back to schools list)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" CssClass="adminButtonBlue" Text="Save"
            OnClick="SaveButton_Click" ToolTip="Saves edited sponsor info" />
        <asp:Button ID="SaveAndStayButton" runat="server" CssClass="adminButtonBlue" Text="Save and Stay"
            OnClick="SaveAndStayButton_Click" />
    </div>
</div>
<SmarTik:SchoolInfo ID="ctrlSchoolInfo" runat="server" />
