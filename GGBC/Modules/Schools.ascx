<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Schools.ascx.vb" Inherits="GGBC.Smartik.Administration.Controls.SchoolsControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>


<script type="text/javascript">
    $(document).ready(function () {
        $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
        $('#<%=SearchButton.ClientID%>').click(function (e) {
            $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
            var lnkText = $('#<%=txtSchoolName.ClientID%>').val().toLowerCase();

            var iCounter = 0;
            var depth = 0;
            $("#<%=gvSchools.ClientID%> tr:has(td)").each(function () {
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
        Manage Schools
    </div>
    <div class="options">
        <input type="button" onclick="location.href='SchoolAdd.aspx'" value="Add New" id="btnAddNew"
            class="adminButtonBlue" title="Add new sponsor" />
    </div>
</div>
<table width="50%">
    <tr>
        <td class="adminData">
            <SmarTik:ToolTipLabel runat="server" ID="lblSchoolName" Text="School ID:" ToolTip="School Name"
                ToolTipImage="~/Common/ico-help.gif" />
            <asp:TextBox ID="txtSchoolName" CssClass="adminInput" runat="server"></asp:TextBox>
            <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="adminButtonBlue"
                ToolTip="Click to search for schools" />
        </td>
    </tr>
</table>
<p>
</p>
<asp:GridView runat="server" ID="gvSchools" AutoGenerateColumns="false" Width="100%">
    <Columns>
        <asp:BoundField HeaderText="School ID" DataField="SchoolID" ItemStyle-Width="10%" />
        <asp:BoundField HeaderText="School Name" DataField="NameOfSchool"/>
        <asp:TemplateField HeaderText="Contact person #" HeaderStyle-HorizontalAlign="Left"
            ItemStyle-Width="25%" ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
                <%#Server.HtmlEncode(Eval("ContactPersonPhone").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%"
            ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="SchoolDetails.aspx?SchoolId=<%#Eval("SchoolID")%>" title="Click to edit school details">
                    Edit </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:Label ID="lblNoRecords" Text="No school to display" runat="server" ForeColor="red"></asp:Label>