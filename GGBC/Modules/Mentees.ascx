<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Mentees.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MenteesControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ConfirmationBox" Src="ConfirmationBox.ascx" %>

<script type="text/javascript">

    $(document).ready(function () {
        $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
        $("#<%=gvMentees.ClientID%> > tbody tr:gt(20)").each(function () {
            $(this).css('display', 'none');
        });
        $('#<%=SearchButton.ClientID%>').click(function (e) {
            $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
            var lnkText = $('#<%=txtMenteeName.ClientID%>').val().toLowerCase();

            var iCounter = 0;
            var depth = 0;
            $("#<%=gvMentees.ClientID%> > tbody > tr:not(:first)").each(function () {
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
        <img src="Common/ico-sponsor.png" alt="Sponsor" />
        Manage Mentees
    </div>
    <div class="options"> 
        <input type="button" onclick="location.href='MenteeAdd.aspx'" value="Add New"
            id="btnAddNew" class="adminButtonBlue" title="Add new Mentee" />
    </div>
</div>

<table width="100%">
    <tr>
        <td class="adminData"  style=" width:50%">
            <SmarTik:ToolTipLabel runat="server" ID="lblMenteeID" Text="Mentee Name:"
                ToolTip="Mentee Name" ToolTipImage="~/Common/ico-help.gif" />
            <asp:TextBox ID="txtMenteeName" CssClass="adminInput" runat="server"></asp:TextBox>
            <asp:Button ID="SearchButton" runat="server" Text="Search"
            CssClass="adminButtonBlue" ToolTip="Click to search for Mentee" />
        </td>
        <td>
        </td>
    </tr>
</table>
<p></p>

<asp:GridView ID="gvMentees" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="false" PageSize="15">
    
    <Columns>
        <asp:BoundField HeaderText="Reg No" DataField="RegNo" />
        <asp:BoundField HeaderText="Name" DataField="MenteeName" />
        <asp:BoundField HeaderText="Cell Phone #" DataField="CellPhone" />
        <asp:BoundField HeaderText="Email" DataField="Email" />
        <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="MenteeDetails.aspx?MenteeId=<%#Eval("GGBCRegNo")%>" title="Click to edit mentee details">
                   Edit
                </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerSettings PageButtonCount="50" Position="TopAndBottom" />
</asp:GridView>
<br />
<asp:Label ID="lblNoRecords" Text="No Mentee to display" runat="server" ForeColor="red"></asp:Label>
