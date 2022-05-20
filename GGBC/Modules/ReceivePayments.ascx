<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ReceivePayments.ascx.vb"
    Inherits="GGBC.Smartik.Administration.Modules.ReceivePaymentsControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ConfirmationBox" Src="ConfirmationBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>

<script type="text/javascript">

    $(document).ready(function () {
        $('#htxtReceivedAmount').val('0');

        $('#<%=PostPayment.ClientID%>').click(function (e) {
            if ($('#htxtReceivedAmount').val() < '1') {
                alert('Please enter valid amount received');
                $('#htxtReceivedAmount').focus();
                e.preventDefault();
            }
        });

        $('#htxtReceivedAmount').blur(function () {
            if ($('#htxtReceivedAmount').val() == '') {
                alert('Please enter valid amount received');
                $('#htxtReceivedAmount').focus();
                e.preventDefault();
            }

            var amountReceived = $('#htxtReceivedAmount').val();

            $('#<%=hfPaymentAmount.ClientID%>').val(amountReceived);

            var balance = $('#<%=lblExistingBalance.ClientID%>').html().toLowerCase();
            balance = balance.replace(",", "");
            var newBalance = balance - amountReceived;
            $('#<%=lblNewBalance.ClientID%>').html(newBalance);
            $('#<%=hfNewBalance.ClientID%>').val(newBalance);

            if (newBalance > 0) {
                $('#trNewBalance').css('display', '');
            }
        });
    });

        

</script>

<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Edit" />
        Payment details for:  <%= Server.HtmlEncode(Me.SponsorName)%> -
        <asp:HyperLink ID="hlExit" runat="server" Text="(Back to grants)" />
    </div>
    <div class="options">

    </div>
</div>

<div>
    <table width="50%">
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblAgreedPaymentAmount" Text="Match Agreed Amount(USD):"
                    ToolTip="Agreed Payment Amount" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:Label ID="lblMatchAgreedAmount" runat="server" CssClass="adminInput" />
                <asp:HiddenField ID="hfSponsorName" runat="server" />
                <asp:HiddenField ID="hfSponsorId" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblBalanceTooltip" Text="Existing balance(USD):" ToolTip="Existing Balance"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:Label ID="lblExistingBalance" runat="server" CssClass="adminInput" />
            </td>
        </tr>
        <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="New Payment Date:" ToolTip="New Payment Date"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:DatePicker ID="ctrlNewPaymentDate" runat="server" />
        </td>
    </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblAmountReceived" Text="Payment Amount (USD):"
                    ToolTip="Amount to receive" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:HiddenField ID="hfPaymentAmount" runat="server"/>
                <input type="text" id="htxtReceivedAmount" value="0" class="adminInput" />
            </td>
        </tr>
        <tr id="trNewBalance">
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="labelNewBalance" Text="New Balance:" ToolTip="New Balance"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:Label ID="lblNewBalance" Width="50px" runat="server" CssClass="adminInput" />
                <asp:HiddenField ID="hfNewBalance" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="PostPayment" runat="server" Text="Post Payment" OnClick="PostPayment_Click"
                    CssClass="adminButtonBlue" ToolTip="Click to post payment" />
            </td>
            <td>
            </td>
        </tr>
    </table>
    <div>
        <br />
        <strong>Payment History </strong>
    </div>
    <div>
        <asp:GridView ID="gvGrantPayments" runat="server" AutoGenerateColumns="false" DataKeyNames="GrantPaymentID"
            OnRowDataBound="gvGrantPayments_RowDataBound"
            Width="100%">
            <Columns>
                <asp:TemplateField HeaderText="Transaction Date" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
                    <ItemTemplate>
                        <asp:Label ID="lblDatePosted" runat="server" CssClass="NestedAdminInput" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Received" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" > 
                    <ItemTemplate>
                        <asp:Label ID="lblDateOfPayment" runat="server" CssClass="NestedAdminInput" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Amount Received (USD)" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
                    <ItemTemplate>
                        <asp:Label ID="lblAmountReceived" runat="server" CssClass="NestedAdminInput" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Balance (USD)" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%"
                    ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblBalance" runat="server" CssClass="NestedAdminInput"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Posted By" HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblPostedBy" runat="server" CssClass="NestedAdminInput" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</div>
