<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SponsorGrant.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.SponsorGrantControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ddlSelector" Src="ddlSelector.ascx" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('#<%=btnNewGrant.ClientID%>').click(function (e) {
            if ($('<%=ddlTypeOfPayment.ClientID%>').val() < '1') {
                alert('Please select a valid payment interval');
                $('<%=ddlTypeOfPayment.ClientID%>').focus();
                e.preventDefault();
            }
        });
    });
</script>

<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Edit" />
        Sponsor Grants : <asp:Label runat="server" ID="lblTitle" />
        <a href="Sponsors.aspx" title="back to sponsor list"> - (back to sponsor list)</a>
    </div>
    <div class="options">
    </div>
</div>

<table width="100%">
    <tr>
        <td>
<asp:Panel runat="server" ID="pnlData">
    <asp:UpdatePanel ID="upGrants" runat="server">
        <ContentTemplate>
            <asp:Panel runat="server" ID="pnlError" EnableViewState="false" Visible="false" class="messageBox messageBoxError">
                <asp:Literal runat="server" ID="lErrorTitle" EnableViewState="false" />
            </asp:Panel>
                        <asp:GridView ID="gvGrants" runat="server" AutoGenerateColumns="false" OnRowCommand="gvGrants_RowCommand"
                             OnRowDataBound="gvGrants_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Agreed Grant Amount(USD):">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfSponsorGrantId" runat="server" />
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
                <asp:TemplateField HeaderText="Begin Date:">
                    <ItemTemplate>
                        <SmarTik:DatePicker ID="ctrlBeginDate" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="End Date:">
                    <ItemTemplate>
                        <SmarTik:DatePicker ID="ctrlEndDate" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Beneficiaries"
                    ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" ID="hlGrantBeneficiaries"  Text="View/Edit values"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Payments"
                    ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" ID="hlPayments"  Text="View/Edit values"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Update" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
                    ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Button ID="btnUpdate" runat="server" CssClass="adminButton" Text="Update" ValidationGroup="SponsorGrant"
                            CommandName="UpdateSponsorGrant" ToolTip="Update the sponsor grant info" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
                        <div class="section-header">
                            <div class="title">
                                Add New Sponsor Grant
                            </div>
                        </div>
                        <table class="adminContent">
                            <tr>
                                <td class="adminTitle">
                                    <SmarTik:ToolTipLabel runat="server" ID="lblMatchAmountAgreed" Text="Agreed Grant Amount(USD):"
                                        ToolTip="Agreed Grant Amount" ToolTipImage="~/Common/ico-help.gif" />
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
                                    <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Begin Date:"
                                        ToolTip="Payment Year" ToolTipImage="~/Common/ico-help.gif" />
                                </td>
                                <td class="adminData">
                                    <SmarTik:DatePicker ID="ctrlBeginDate" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="adminTitle">
                                    <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="End Date:"
                                        ToolTip="Payment Year" ToolTipImage="~/Common/ico-help.gif" />
                                </td>
                                <td class="adminData">
                                    <SmarTik:DatePicker ID="ctrlEndDate" runat="server" />
                                </td>
                            </tr>
                            <tr>
                            <td colspan="2" align="left">
                                <asp:Button runat="server" ID="btnNewGrant" CssClass="adminButtonBlue" Text="Save New grant"
                                    ValidationGroup="NewGrant" OnClick="btnNewGrant_Click" ToolTip="Create New Grant" />
                            </td>
                </tr>
                        </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="up1" runat="server" AssociatedUpdatePanelID="upGrants">
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