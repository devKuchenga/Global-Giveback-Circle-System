<%@ Control Language="VB" AutoEventWireup="true"
    Inherits="GGBC.Smartik.Administration.Modules.DecimalTextBox" CodeBehind ="DecimalTextBox.ascx.vb" %>
 
<asp:TextBox ID="txtValue" runat="server"></asp:TextBox>
<ajaxToolkit:FilteredTextBoxExtender ID="ftbeValue" runat="server" TargetControlID="txtValue"
    FilterType="Custom, Numbers" ValidChars="-." />
<asp:RequiredFieldValidator ID="rfvValue" ControlToValidate="txtValue" Font-Names="verdana"
    Font-Size="9pt" runat="server" Display="None"></asp:RequiredFieldValidator>
<asp:RangeValidator ID="rvValue" runat="server" ControlToValidate="txtValue" Type="Double"
    Display="None"></asp:RangeValidator>
<ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="rfvValueE" TargetControlID="rfvValue"
    HighlightCssClass="validatorCalloutHighlight" />
<ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="rvValueE" TargetControlID="rvValue"
    HighlightCssClass="validatorCalloutHighlight" />
