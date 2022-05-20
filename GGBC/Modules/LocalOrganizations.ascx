<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="LocalOrganizations.ascx.vb" Inherits="GGBC.Smartik.Administration.Controls.LocalOrganizationsControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>

<script type="text/javascript">

    $(document).ready(function () {
        $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
        $('#<%=SearchButton.ClientID%>').click(function (e) {
            $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
            var lnkText = $('#<%=txtLocalOrgName.ClientID%>').val().toLowerCase();

            var iCounter = 0;
            var depth = 0;
            $("#<%=gvLocalOrgs.ClientID%> tr:has(td)").each(function () {
                var cell = $(this).find("td:eq(1)").text().toLowerCase();
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
        <img src="Common/ico-sponsor.png" alt="School" />
        Manage Local Organizations
    </div>
    <div class="options">
        <input type="button" onclick="location.href='LocalOrgAdd.aspx'" value="Add New" id="btnAddNew"
            class="adminButtonBlue" title="Add new local org" />
    </div>
</div>

<table width="50%">
    <tr>
        <td class="adminData">
                <SmarTik:ToolTipLabel runat="server" ID="lblLocalOrgName" Text="Local Org Name:" ToolTip="Local Org Name"
                ToolTipImage="~/Common/ico-help.gif" />
            <asp:TextBox ID="txtLocalOrgName" CssClass="adminInput" runat="server"></asp:TextBox>
            <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="adminButtonBlue"
                ToolTip="Click to search for Local orgs" />
        </td>
        
    </tr>
</table>
<p>
</p>

<asp:GridView runat="server" ID="gvLocalOrgs" AutoGenerateColumns="false" Width="100%">
    <Columns>
        <asp:BoundField HeaderText="Local Org ID" DataField="LRorgID" ItemStyle-Width="10%" />
        <asp:BoundField HeaderText="Local Org Name" DataField="LRorgName" HeaderStyle-HorizontalAlign="Left" />
        <asp:TemplateField HeaderText="Contact person #" HeaderStyle-HorizontalAlign="Left"
            ItemStyle-Width="25%" ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
                <%#Server.HtmlEncode(Eval("ContactPhoneNo").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%"
            ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="LocalOrgDetails.aspx?LocalOrgId=<%#Eval("LRorgID")%>" title="Click to edit Local Org details">
                    Edit </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:Label ID="lblNoRecords" Text="No Local Org to display" runat="server" ForeColor="red"></asp:Label>