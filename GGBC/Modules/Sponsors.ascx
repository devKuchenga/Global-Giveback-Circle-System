<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Sponsors.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.SponsorsControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ConfirmationBox" Src="ConfirmationBox.ascx" %>


<script type="text/javascript">

    $(document).ready(function () {
        $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
        $("#<%=gvSponsors.ClientID%> > tbody tr:gt(20)").each(function () {
            $(this).css('display', 'none');
        });
        $('#<%=SearchButton.ClientID%>').click(function (e) {
            $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
            var lnkText = $('#<%=txtSponsorName.ClientID%>').val().toLowerCase();

            var iCounter = 0;
            var depth = 0;
            $("#<%=gvSponsors.ClientID%> > tbody > tr:not(:first)").each(function () {
                var cell = $(this).find("td:eq(0)").text().toLowerCase();
                if (lnkText != '') {
                    if ((cell.indexOf(lnkText) != 0))
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
    });
</script>

<div class="section-header">
    <div class="title">
        <img src="Common/ico-sponsor.png" alt="Sponsor" />
        Manage Sponsors
    </div>
    <div class="options">
        <input type="button" onclick="location.href='SponsorAdd.aspx'" value="Add New"
            id="btnAddNew" class="adminButtonBlue" title="Add new sponsor" />
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


</script>

<table width="100%">
    <tr>
        <td class="adminData" style=" width:50%" >
            <SmarTik:ToolTipLabel runat="server" ID="lblSponsorID" Text="Sponsor Name:"
                ToolTip="Sponsor's Name" ToolTipImage="~/Common/ico-help.gif" />
            <asp:TextBox ID="txtSponsorName" CssClass="adminInput" runat="server"></asp:TextBox>
            <asp:Button ID="SearchButton" runat="server" Text="Search"
            CssClass="adminButtonBlue" ToolTip="Click to search for sponsors" />
        </td>
        <td>
            
        </td>
    </tr>
</table>
<p></p>

<asp:GridView ID="gvSponsors" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvSponsors_PageIndexChanging" AllowPaging="false" Visible="false"
    OnRowDataBound="gvSponsors_RowDataBound">
    <Columns>
        <asp:BoundField HeaderText="Name" DataField="CompanyName" ItemStyle-Width="45%" />
        <asp:TemplateField HeaderText="Grants" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="SponsorGrants.aspx?SponsorId=<%#Eval("PartnerId")%>" title="Click to view/edit sponsor grant details">
                   View/Edit
                </a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="SponsorDetails.aspx?SponsorId=<%#Eval("PartnerId")%>" title="Click to edit sponsor details">
                   Edit
                </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerSettings PageButtonCount="50" Position="TopAndBottom" />
</asp:GridView>
<br />
<asp:Label ID="lblNoRecords" Text="No Sponsor to display" runat="server" ForeColor="red"></asp:Label>
