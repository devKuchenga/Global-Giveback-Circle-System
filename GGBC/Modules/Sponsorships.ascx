<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Sponsorships.ascx.vb"
    Inherits="GGBC.Smartik.Administration.Modules.SponsorshipsControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Sponsor" />
        Manage Sponsors
        <a href="Sponsors.aspx" title="Back to sponsors list">
            Back to sponsors list
        </a>
    </div>
    <div class="options">
        <input type="button" onclick="location.href='SponsorshipAdd.aspx'" value="Add New"
            id="btnAddNew" class="adminButtonBlue" title="Add New" />
    </div>
</div>
<script type="text/javascript">
    $(window).bind('load', function () {
        var cbHeader = $(".cbHeader input");
        var cbRowItem = $(".cbRowItem input");
        cbHeader.bind("click", function () {
            cbRowItem.each(function () { me.checked = cbHeader[0].checked; })
        });
        cbRowItem.bind("click", function () { if ($(this).checked == false) cbHeader[0].checked = false; });
    });

    function ChildBlock(objHide, trToggle, objShow) {
                if (objShow.style.display == 'none') {
                    objShow.style.display = '';
                }
                else {
                    objShow.style.display = '';
                }

                if (objHide.parentNode.style.display == '') {
                    objHide.parentNode.style.display = 'none';
                }
                else {
                    objHide.parentNode.style.display = 'none';
                }

                if (trToggle.style.display == 'none') {
                    trToggle.style.display = '';
                }
                else {
                    trToggle.style.display = 'none';
                }
            }

</script>
<asp:GridView runat="server" ID="gvSponsorships" AutoGenerateColumns="false" Width="100%"
    OnRowDataBound="gvSponsorships_RowDataBound">
    <Columns>
        <asp:TemplateField HeaderText="Period" ItemStyle-Width="35%">
            <ItemTemplate>
                <asp:Literal ID="lPeriod" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Beneficiaries" ItemStyle-Width="35%">
            <ItemTemplate>
                <table border="0px">
                    <tr id='trBen<%#Eval("SponsorgrantId") %>' style="display: none">
                        <td colspan="2">
                            <asp:GridView runat="server" ID="gvBeneficiaries" AutoGenerateColumns="false" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Beneficiaries" ItemStyle-Width="100%">
                                        <ItemTemplate>
                                            <%#Eval("GrantBeneficiaryName")%>"
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="adminTitle">
                            <div id='dvSBen<%#Eval("SponsorgrantId") %>' style="display: ''" ">
                                <input type="button"  id="btnShowBeneficiaries" class="adminButton"  value="Show Beneficiaries" onclick="ChildBlock(this,document.getElementById('trBen<%#Eval("SponsorgrantId") %>'),document.getElementById('dvHBen<%#Eval("SponsorgrantId") %>'));" />
                            </div>
                            <div id='dvHBen<%#Eval("SponsorgrantId") %>' style="display:none">
                                <input type="button"  id="btnHideBeneficiaries" class="adminButton" value="Hide Beneficiaries" onclick="ChildBlock(this,document.getElementById('trBen<%#Eval("SponsorgrantId") %>'),document.getElementById('dvSBen<%#Eval("SponsorgrantId") %>'));" />
                            </div>
                        </td>
                        
                        <td class="adminData">
                            <asp:Button ID="btnEditBeneficiariesList" CssClass="adminButton" runat="server" Text="Edit beneficiaries">
                            </asp:Button>
                            <asp:Button ID="btnRefreshBeneficiaries" runat="server" Style="display: none" CausesValidation="false"
                                        CssClass="adminButton" Text="Refresh" OnClick="btnRefreshBeneficiaries_Click" ToolTip="Refresh list" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Payments" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="25%"
            ItemStyle-HorizontalAlign="Right">
            <ItemTemplate>
                <div style=" float:left; font-weight:bold; padding-left:5px; ">
                    Agreed Amount (USD):
                <asp:Literal ID="lAgreedAmount" runat="server" />
                </div>
                <table border="0px" >
                    <tr id='trph<%#Eval("SponsorgrantId") %>' style="display: none">
                        <td colspan="2">
                            <asp:GridView runat="server" ID="gvPaymentHistory" AutoGenerateColumns="false" Width="100%"
                                OnRowDataBound="gvPaymentHistory_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="Payment Date" ItemStyle-Width="30%">
                                        <ItemTemplate>
                                            <asp:Literal ID="lPaymentDate" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Received(USD)" HeaderStyle-HorizontalAlign="Left"
                                        ItemStyle-Width="30%" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Literal ID="lAmountReceived" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bal(USD)" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="30%"
                                        ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Literal ID="lBalance" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%"
                                        ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:PlaceHolder ID="phEditPayment" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>       
                    <tr id="trBeneficiariesButtons">
                        <td class="adminTitle">
                           <div id='dvSph<%#Eval("SponsorgrantId") %>' style="display: ''">
                                <input type="button"  id="btnShowPaymentHistory" class="adminButton"  value="Show Payment History" onclick="ChildBlock(this,document.getElementById('trph<%#Eval("SponsorgrantId") %>'),document.getElementById('dvHph<%#Eval("SponsorgrantId") %>'));" />
                            </div>
                            <div id='dvHph<%#Eval("SponsorgrantId") %>' style="display: none">
                                <input type="button"  id="btnHidePaymentHistory" class="adminButton" value="Hide Payment History" onclick="ChildBlock(this,document.getElementById('trph<%#Eval("SponsorgrantId") %>'),document.getElementById('dvSph<%#Eval("SponsorgrantId") %>'));" />
                            </div>
                        </td>
                        <td class="adminData">
                            <asp:Button ID="btnReceivePayment" CssClass="adminButton" runat="server" Text="Receive Payment">
                            </asp:Button>
                            <asp:Button ID="btnRefreshPayments" runat="server" Style="display: none" CausesValidation="false"
                                        CssClass="adminButton" Text="Refresh" OnClick="btnRefreshPayments_Click" ToolTip="Refresh list" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%"
            ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="SponsorshipDetails.aspx?SponsorId=<%#Eval("PartnerId")%>" title="Click to edit sponsor details">
                    Edit </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
