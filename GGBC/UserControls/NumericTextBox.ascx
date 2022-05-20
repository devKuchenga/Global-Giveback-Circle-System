<%@ Control Language="VB" AutoEventWireup="true"
    Inherits="Smartik.Ecom.Web.Administration.Modules.NumericTextBox" CodeBehind ="NumericTextBox.ascx.vb" %>
 
<asp:TextBox ID="txtValue" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvValue" ControlToValidate="txtValue"
    Font-Name="verdana" Font-Size="9pt" runat="server" Display="None"></asp:RequiredFieldValidator>
<asp:RangeValidator ID="rvValue" runat="server" ControlToValidate="txtValue"
    Type="Integer" Display="None"></asp:RangeValidator>
<asp:ValidatorCalloutExtender runat="Server" ID="rfvValueE" TargetControlID="rfvValue"
    HighlightCssClass="validatorCalloutHighlight" />
<asp:ValidatorCalloutExtender runat="Server" ID="rvValueE" TargetControlID="rvValue"
    HighlightCssClass="validatorCalloutHighlight" />
