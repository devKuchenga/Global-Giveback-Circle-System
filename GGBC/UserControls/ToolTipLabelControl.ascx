<%@ Control Language="VB" AutoEventWireup="true" CodeBehind ="ToolTipLabelControl.ascx.vb"Inherits="Smartik.Ecom.Web.Administration.Modules.ToolTipLabelControl" %>
<span class="STK-tooltip">
    <asp:Image runat="server" ID="imgToolTip" AlternateText="?" />
    <asp:Label runat="server" ID="lblValue" />
</span>