<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="GrantBeneficiary.ascx.vb"
    Inherits="GGBC.Smartik.Administration.Modules.GrantBeneficiaryControl" %>
<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>

<script type="text/javascript">

    $(document).ready(function () {
        $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
        $('#<%=SearchButton.ClientID%>').click(function (e) {
            $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
            var lnkText = $('#<%=txtGGBCRegNo.ClientID%>').val().toLowerCase();

            var iCounter = 0;
            $("#<%=gvGrantBeneficiary.ClientID%> > tbody > tr:has(td)").each(function () {
                var cell = $(this).find("td:eq(1)").text().toLowerCase();
                if (lnkText != '') {
                    if (cell.indexOf(lnkText) != 0)
                        $(this).css('display', 'none');
                    else {
                        $(this).css('display', '');
                        iCounter++;
                    }
                }
                else {
                    $(this).css('display', '');
                    iCounter++;
                }
            });
            if (iCounter == 0) {
                $('#<%=lblNoRecords.ClientID%>').css('display', '');
            }
            e.preventDefault();
        });
</script>
    <%--<div style="padding-bottom:10px">
        <input type="button" id="btnUnmap" value="Back to beneficiaries" onclick="fxdefaultView();"  />
        
        <input type="button" id="btnNewMap" value="Map New beneficiaries" onclick="newMapView();"/>
    </div>--%>

<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Edit" />
        <asp:HiddenField ID="hfSponsorId" runat="server" />
        Grant Beneficiaries for :  <%= Server.HtmlEncode(Me.SponsorName)%> -
        <asp:HyperLink ID="hlReturn" runat="server" Text="(Back to grants)" />
    </div>
    <div class="options">

    </div>
</div>

        <table>
            <tr>
                <td class="adminTitle">
                    <SmarTik:ToolTipLabel runat="server" ID="lblGGBCRegNo" Text="GGBC Reg No:" ToolTip="GGBCRegNo"
                        ToolTipImage="~/Common/ico-help.gif" />
                </td>
                <td class="adminData">
                    <asp:TextBox ID="txtGGBCRegNo" CssClass="adminInput" runat="server"></asp:TextBox>
                    <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="adminButtonBlue"
                         ToolTip="Click to search for beneficiaries" />
                         
                </td>
            </tr>
            <%--<tr>
                <td></td>
                <td>
                    <asp:CheckBox ID="cbSelectedOnly" runat="server" Text="Show selected only"/>
                </td>
            </tr>--%>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="gvGrantBeneficiary" runat="server" AutoGenerateColumns="false"
                        Width="100%" OnPageIndexChanging="gvGrantBeneficiary_PageIndexChanging" AllowPaging="false">
                        <Columns>
                            <asp:TemplateField HeaderText="Select" ItemStyle-Width="5%">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbGrantBeneficiary" runat="server" Checked='<%# Eval("IsMapped") %>' ToolTip="Check/uncheck to add/remove grant beneficiary" />
                                    <asp:HiddenField ID="hfGGBCRegNo" runat="server" Value='<%# Eval("GGBCRegNo") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Beneficiary Names" DataField="GrantBeneficiaryName" ItemStyle-Width="45%" />
                            <asp:BoundField HeaderText="Reg No" DataField="RegNo" ItemStyle-Width="20%" />
                            <%--<asp:BoundField HeaderText="GGBC Reg No" DataField="GGBCRegNo" ItemStyle-Width="50%" />--%>
                        </Columns>
                        <PagerSettings PageButtonCount="50" Position="TopAndBottom" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblNoRecords" Text="No records to display" runat="server" ForeColor="red"></asp:Label>
                </td>
            </tr>
        </table>
<br />
<div id="dvSavebutton">
    <asp:Button ID="btnSave" runat="server" CssClass="adminButton" Text="Save" ToolTip="Edit Beneficiary List"
    OnClick="btnSave_Click" />
</div>

<br />
