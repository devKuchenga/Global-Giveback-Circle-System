<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Mentors.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MentorsControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ConfirmationBox" Src="ConfirmationBox.ascx" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
        $("#<%=gvMentors.ClientID%> > tbody tr:gt(20)").each(function () {
            $(this).css('display', 'none');
        });
        $('#<%=SearchButton.ClientID%>').click(function (e) {
            $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
            var lnkText = $('#<%=txtMentorName.ClientID%>').val().toLowerCase();

            var iCounter = 0;
            var depth = 0;
            $("#<%=gvMentors.ClientID%> tr:not(:first)").each(function () {
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
        <img src="Common/ico-sponsor.png" alt="Mentor" />
        Manage Mentors
    </div>
    <div class="options">
        <input type="button" onclick="location.href='MentorAdd.aspx'" value="Add New"
            id="btnAddNew" class="adminButtonGreen" title="Add new mentor" />
        <%--<asp:Button runat="server" Text="Delete Selected"
            CssClass="adminButtonGreen" ID="btnDelete" OnClick="btnDelete_Click" />
        <SmarTik:ConfirmationBox runat="server" ID="cbDelete" TargetControlID="btnDelete"
            YesText="Yes" NoText="No"
            ConfirmText="Are you sure?" />--%>
    </div>
</div>

<table width="100%">
    <tr>
        <td class="adminTitle" style=" width:50%">
            <SmarTik:ToolTipLabel runat="server" ID="lblMentorName" Text="Mentor Name:"
                ToolTip="Mentor's Name" ToolTipImage="~/Common/ico-help.gif" />
            <asp:TextBox ID="txtMentorName" CssClass="adminInput" runat="server"></asp:TextBox>
            <asp:Button ID="SearchButton" runat="server" Text="Search"
            CssClass="adminButtonGreen" OnClick="SearchButton_Click" ToolTip="Click to search for mentors" />
        </td>
        <td class="adminData">
            
        </td>
    </tr>
</table>
<p></p>

<asp:GridView ID="gvMentors" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvMentors_PageIndexChanging" AllowPaging="false"
    OnRowDataBound="gvMentors_RowDataBound">
    <Columns>
        <asp:BoundField HeaderText="Mentor ID" DataField="MentorID" />
        <asp:BoundField HeaderText="Full Name" DataField="FullName" />
        <asp:BoundField HeaderText="Email" DataField="Email" />
        <asp:BoundField HeaderText="Mobile Phone" DataField="MobilePhone" />
        <asp:BoundField HeaderText="Address Lnine 1" DataField="AddressLn1" />
        <asp:TemplateField HeaderText="Mentor Invoice" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="RaiseMentorInvoice.aspx?MentorId=<%#Eval("MentorId")%>" title="Click to Raise mentor Invoice">
                   Raise Invoice
                </a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="MentorDetails.aspx?MentorId=<%#Eval("ColumnId")%>" title="Click to edit mentor details">
                   Edit
                </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerSettings PageButtonCount="50" Position="TopAndBottom" />
</asp:GridView>
<br />
<asp:Label runat="server" ID="lblNoMentorsFound" Text="No mentors found."
    Visible="false"></asp:Label>

<asp:Label ID="lblNoRecords" Text="No mentors to display" runat="server" ForeColor="red"></asp:Label>