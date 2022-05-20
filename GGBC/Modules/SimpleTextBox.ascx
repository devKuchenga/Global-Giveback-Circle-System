<%@ Control Language="VB" AutoEventWireup="true"
    Inherits="GGBC.Smartik.Administration.Modules.SimpleTextBox" CodeBehind ="SimpleTextBox.ascx.vb" %>
 
<asp:TextBox ID="txtValue" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvValue" ControlToValidate="txtValue" Font-Name="verdana"
    Font-Size="9pt" runat="server" Display="None"></asp:RequiredFieldValidator>
<ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="rfvValueE" TargetControlID="rfvValue"
    HighlightCssClass="validatorCalloutHighlight" />
