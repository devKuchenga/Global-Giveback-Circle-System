<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="RaiseMentorInvoice.ascx.vb"
    Inherits="GGBC.Smartik.Administration.Modules.RaiseMentorInvoiceControl" %>

<%@ Register TagPrefix="SmarTik" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ddlSelector" Src="ddlSelector.ascx" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('#<%=btnNewInvoice.ClientID%>').click(function (e) {
            if ($('<%=ddlTypeOfPayment.ClientID%>').val() < '1') {
                alert('Please select a valid payment interval');
                $('<%=ddlTypeOfPayment.ClientID%>').focus();
                e.preventDefault();
            } else if ($('<%=ddlSubscriptionMethod.ClientID%>').val() < '1') {
                alert('Please select a valid payment method');
                $('<%=ddlSubscriptionMethod.ClientID%>').focus();
                e.preventDefault();
            } else if ($('<%=ctrlPaymentYear.ClientID%>').val() == 'Year') {
                alert('Please select a valid payment year');
                $('<%=ctrlPaymentYear.ClientID%>').focus();
                e.preventDefault();
            }
        });
    });
</script>

<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Edit" />
        Raise Mentor invoice : <asp:Label runat="server" ID="lblTitle" />
        <a href="Mentors.aspx" title="back to mentor list"> - (back to mentor list)</a>
    </div>
    <div class="options">
    </div>
</div>

<table width="100%">
    <tr>
        <td>
<asp:Panel runat="server" ID="pnlData">
    <asp:UpdatePanel ID="upInvc" runat="server">
        <ContentTemplate>
            <asp:Panel runat="server" ID="pnlError" EnableViewState="false" Visible="false" class="messageBox messageBoxError">
                <asp:Literal runat="server" ID="lErrorTitle" EnableViewState="false" />
            </asp:Panel>
                        <asp:GridView ID="gvInvoices" runat="server" AutoGenerateColumns="false" OnRowCommand="gvInvoices_RowCommand"
                             OnRowDataBound="gvInvoices_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Match Amount Agreed(USD):">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfInvoiceId" runat="server" />
                        <SmarTik:STKDecimalTextBox  runat="server"  ID="txtMatchAmountAgreed"
                                        Value="1" RequiredErrorMessage="Please enter the agreed grant amount." MinimumValue="1"
                                        MaximumValue="100000000" RangeErrorMessage="Acceptable range is 1 - 100000000 " />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Balance(USD):">
                    <ItemTemplate>
                        <asp:Label ID="lblAmountBalance" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Payment interval:">
                    <ItemTemplate>
                        <SmarTik:ddlSelector ID="ddlTypeOfPayment" runat="server"  />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Payment Method:">
                    <ItemTemplate>
                        <SmarTik:ddlSelector ID="ddlSubscriptionMethod" runat="server"  />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Payment year:">
                    <ItemTemplate>
                        <SmarTik:STKDatePicker ID="ctrlPaymentYear" runat="server" HideDays="true" HideMonths="true"></SmarTik:STKDatePicker>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Other Notes:">
                    <ItemTemplate>
                        <asp:TextBox ID="txtOtherNotes" runat="server"  TextMode="MultiLine"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Payments"
                    ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" ID="hlInvoicePayments"  Text="View/Edit values"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Update" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
                    ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Button ID="btnUpdate" runat="server" CssClass="adminButton" Text="Update" ValidationGroup="MentorInvoice"
                            CommandName="UpdateMentorInvoice" ToolTip="Update the mentor invoice info" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
                        <div class="section-header">
                            <div class="title">
                                Add New Invoice Details
                            </div>
                        </div>
                        <table class="adminContent">
                            <tr>
                                <td class="adminTitle">
                                    <SmarTik:ToolTipLabel runat="server" ID="lblMatchAmountAgreed" Text="Match Amount Agreed(USD):"
                                        ToolTip="Match Amount Agreed" ToolTipImage="~/Common/ico-help.gif" />
                                </td>
                                <td class="adminData">
                                    <SmarTik:STKDecimalTextBox  runat="server" CssClass="adminInput" ID="txtMatchAmountAgreed"
                                        Value="1" RequiredErrorMessage="Please enter the agreed grant amount." MinimumValue="1"
                                        MaximumValue="100000000" RangeErrorMessage="Acceptable range is 1 - 100000000 " />
                                </td>
                            </tr>
                            <tr>
                                <td class="adminTitle">
                                    <SmarTik:ToolTipLabel runat="server" ID="lblPaymentType" Text="Payment Type:" ToolTip="Payment Type."
                                        ToolTipImage="~/Common/ico-help.gif" />
                                </td>
                                <td class="adminData">
                                    <SmarTik:ddlSelector ID="ddlTypeOfPayment" runat="server" CssClass="adminInput" />
                                </td>
                            </tr>
                            <tr>
                                <td class="adminTitle">
                                    <SmarTik:ToolTipLabel runat="server" ID="lblMethodOfSubscription" Text="Method of Subscription:"
                                        ToolTip="Method of Subscription" ToolTipImage="~/Common/ico-help.gif" />
                                </td>
                                <td class="adminData">
                                    <SmarTik:ddlSelector ID="ddlSubscriptionMethod" runat="server" CssClass="adminInput" />
                                </td>
                            </tr>
                            <tr>
                                <td class="adminTitle">
                                    <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Payment Year:"
                                        ToolTip="Payment Year" ToolTipImage="~/Common/ico-help.gif" />
                                </td>
                                <td class="adminData">
                                    <SmarTik:STKDatePicker ID="ctrlPaymentYear" runat="server" HideDays="true" HideMonths="true"></SmarTik:STKDatePicker>
                                </td>
                            </tr>
                            <tr>
                                <td class="adminTitle">
                                    <SmarTik:ToolTipLabel runat="server" ID="lblOtherNotes" Text="Other/Notes:" ToolTip="Any other notes."
                                        ToolTipImage="~/Common/ico-help.gif" />
                                </td>
                                <td class="adminData">
                                    <asp:TextBox ID="txtOtherNotes" runat="server" CssClass="adminInput" TextMode="MultiLine"
                                        Height="100"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                            <td colspan="2" align="left">
                                <asp:Button runat="server" ID="btnNewInvoice" CssClass="adminButtonBlue" Text="Save New Invoice"
                                    ValidationGroup="NewInvoice" OnClick="btnNewInvoice_Click" ToolTip="Create New Invoice" />
                            </td>
                </tr>
                        </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="up1" runat="server" AssociatedUpdatePanelID="upInvc">
    <ProgressTemplate>
        <div class="progress">
            <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/images/UpdateProgress.gif" AlternateText="update" />
                                Processing your request.Please wait...
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
</asp:Panel>
</td>
    </tr>
</table>