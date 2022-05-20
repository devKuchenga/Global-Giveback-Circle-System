<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MenteeWorkshop.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MenteeWorkshopControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>


<script type="text/javascript">
    $(document).ready(function () {
        var rowCount = $("#<%=gvWorkshop.ClientID%> > tbody > tr").length;
        $("#<%=gvWorkshop.ClientID%> > tbody > tr").each(function (e) {
            var colIndex = 0;
            var CurrentRow = $(this);
            var row = $(CurrentRow).clone(true);

            var buttonsField = $(CurrentRow).children("td:first").siblings(":last").prev("td").html();
            buttonsField = buttonsField + $(CurrentRow).children("td:first").siblings(":last").html();

            $("td", row).html("");
            $("td", row).text();
            $("select option:selected", row).attr("selected", false);

            colIndex = 0;
            $("td:gt(1)", row).remove();

            $("td", row).eq(0).css({ width: '95%' })
            $("td", row).eq(1).css({ width: '5%' })

            var tblGrid = "<table class='adminContent'>";
            var insertIndex = 0;
            var newContent = "";
            var colName = "";
            var tdContent = "";

            $(CurrentRow).find("td").each(function () {
                switch (colIndex) {
                    case 2:
                        tdContent = "<td class='adminData'>" + $(CurrentRow).siblings(":first").find("th").eq(colIndex).html() + $(CurrentRow).children("td").eq(colIndex).html() + "</td>";
                        newContent = newContent + tdContent;
                        insertIndex++;
                        break;
                    case 0:
                    case 1:
                    case 3:
                        colName = "<td class='nestedAdminTitle'>" + $(CurrentRow).siblings(":first").find("th").eq(colIndex).html() + "</td>";
                        tdContent = "<td class='adminData'>" + $(CurrentRow).children("td").eq(colIndex).html() + "</td>";
                        newContent = newContent + colName + tdContent;

                        if (insertIndex == 3) {
                            tblGrid = tblGrid + "<tr>" + newContent + "</tr>";
                            newContent = "";
                            insertIndex = 0;

                        } else {
                            //                            colName = "<td class='nestedAdminTitle'>" + $(CurrentRow).siblings(":first").find("th").eq(colIndex).html() + "</td>";
                            //                            tdContent = "<td class='adminData'>" + $(CurrentRow).children("td").eq(colIndex).html() + "</td>";
                            //                            newContent = newContent + colName + tdContent;

                            insertIndex++;
                        }
                }

                colIndex++;
            });

            if (colIndex > 0) {
                tblGrid = tblGrid + "<tr>" + newContent + "</tr>";
            }

            tblGrid = tblGrid + "</table>";
            $("td:last", row).html(buttonsField);
            $("td", row).eq(0).html(tblGrid);

            $("td:last", row).removeClass().addClass("commandButton-column");

            row.insertAfter($(CurrentRow));
            if (e == rowCount - 1) {
                $(CurrentRow).siblings(":first").remove();
            }

            $(CurrentRow).remove();

        });
    });
    </script>

<asp:GridView ID="gvWorkshop" runat="server" AutoGenerateColumns="false" OnRowCommand="gvWorkshop_RowCommand"
    SkinID="NestedGridTable" DataKeyNames="MenteeWorkshopID" OnRowDataBound="gvWorkshop_RowDataBound">
    <Columns>
        <asp:TemplateField HeaderText="WorkShop:">
            <ItemTemplate>
                <asp:DropDownList ID="ddlWorkshopTitle" runat="server" CssClass="nestedAdminInput" />
                <asp:HiddenField ID="hfMenteeWorkshopId" runat="server" Value='<%# Eval("MenteeWorkshopID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Date:">
            <ItemTemplate>
                <SmarTik:DatePicker ID="dtWorkshopDate" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Attended?:">
            <ItemTemplate>
                <asp:CheckBox ID="cbAttended" runat="server" CssClass="nestedAdminInput" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Reason not attended:">
            <ItemTemplate>
                <asp:TextBox ID="txtNoAttendReason" runat="server" CssClass="nestedAdminInput" TextMode="MultiLine" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Update" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
            ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Button ID="btnUpdate" runat="server" CssClass="adminButton" Text="Update" ValidationGroup="WorkshopInfo"
                    CommandName="UpdateWorkshop" ToolTip="Update the workshop info" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
            ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Button ID="btnDelete" runat="server" CssClass="adminButton" Text="Delete" CausesValidation="false"
                    CommandName="Delete" ToolTip="Delete this workshop" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<div class="section-header">
    <div class="title">
        Add New Workshop info
    </div>
</div>
<table class="adminContent">
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="lblWorkshop" Text="Workshop Title:" ToolTip="Workshop Title"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:DropDownList ID="ddlWorkshopTitle" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Workshop Date:" ToolTip="Workshop Date"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:DatePicker ID="dtWorkshopDate" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
        <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="Workshop Date:" ToolTip="Workshop Date"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:CheckBox ID="cbAttended" runat="server" Text="Was workshop attended?" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel3" Text="Reason not attended:" ToolTip="Reason not attended"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtNoAttendReason" runat="server" CssClass="nestedAdminInput" TextMode="MultiLine" />
        </td>
    </tr>
                 <tr>
                    <td colspan="2" align="left">
                        <asp:Button runat="server" ID="btnNewWorkshopInfo" CssClass="adminButtonBlue" Text="Save New Workshop Info"
                            ValidationGroup="NewWorkshopInfo" OnClick="btnNewWorkshopInfo_Click" ToolTip="Create New Workshop info" />
                    </td>
                </tr>
</table>
