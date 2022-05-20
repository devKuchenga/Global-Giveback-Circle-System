<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MentorPaymentDetails.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MentorPaymentDetailsControl" %>

<%@ Register TagPrefix="SmarTik" TagName="DecimalTextBox" Src="DecimalTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>

<div>
<div>
                <asp:GridView ID="gvRaiseMentorInvoice" runat="server" AutoGenerateColumns="false"
                            DataKeyNames="ProductVariantAttributeId" OnRowDataBound="gvRaiseMentorInvoice_RowDataBound" 
                            OnRowCommand="gvRaiseMentorInvoice_RowCommand"
                            Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="Date Of Payments"
                                    ItemStyle-Width="20%">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtDateOfPayment" runat="server" Value='<%# Eval("TextPrompt") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount Received"
                                    ItemStyle-Width="10%">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtAmountReceived" runat="server" Value='<%# Eval("TextPrompt") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Balance"
                                    HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtBalance" runat="server" Value='<%# Eval("TextPrompt") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Update"
                                    HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Button ID="btnUpdate" runat="server" CssClass="adminButton" Text="Update"
                                            ValidationGroup="RaiseMentorInvoice" CommandName="UpdateProductVariantAttribute"
                                            ToolTip="Update Mentor Payment" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        </div>
                        <div>
                            <br />
                            <strong>
                                Make Payment
                            </strong>
                    </div>
        
        <table class="adminContent">
                        <tr>
                            <td class="adminTitle">
                                <SmarTik:ToolTipLabel runat="server" ID="lblPaymentDate" Text="Payment Date:"
                                    ToolTip="Payment Date"
                                    ToolTipImage="~/Common/ico-help.gif" />
                            </td>
                            <td class="adminData">
                                <SmarTik:DatePicker runat="server" ID="ctrlPaymentDatePicker" />
                            </td>
                        </tr>
                        <tr>
                            <td class="adminTitle">
                                <SmarTik:ToolTipLabel runat="server" ID="lblAmountReceived" Text="Amount Received:"
                                    ToolTip="Amount received"
                                    ToolTipImage="~/Common/ico-help.gif" />
                            </td>
                            <td class="adminData">
                                <asp:TextBox runat="server" CssClass="adminInput" ID="txtNewTextPrompt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="left">
                                <asp:Button runat="server" ID="btnNewPayment" CssClass="adminButton"
                                    Text="Add Payment"
                                    ValidationGroup="NewPayment" OnClick="btnNewPayment_Click"
                                    ToolTip="Add New Payment" />
                            </td>
                        </tr>
                    </table>
</div>