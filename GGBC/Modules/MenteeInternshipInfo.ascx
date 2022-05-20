<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MenteeInternshipInfo.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MenteeInternshipInfoControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="CompanySelector" Src="ddlCompanySelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="EmailTextBox" Src="EmailTextBox.ascx" %>


    <script type="text/javascript">
        $(document).ready(function () {
            var rowCount = $("[src*=expand]").length;
            $("[src*=expand]").each(function (e) {
                var colIndex = 0;
                var CurrentRow = $(this).closest("tr");
                var row = $(this).closest("tr").clone(true);

                var buttonsField = $(this).closest("tr").children("td:first").siblings(":last").prev("td").html();
                buttonsField = buttonsField + $(this).closest("tr").children("td:first").siblings(":last").html();

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
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                            if (insertIndex == 2) {
                                colName = "<td class='nestedAdminTitle'>" + $(CurrentRow).siblings(":first").find("th").eq(colIndex).html() + "</td>";
                                tdContent = "<td class='nestedAdminData'>" + $(CurrentRow).children("td").eq(colIndex).html() + "</td>";
                                newContent = newContent + colName + tdContent;

                                tblGrid = tblGrid + "<tr>" + newContent + "</tr>";
                                newContent = "";
                                insertIndex = 0;

                            } else {
                                colName = "<td class='nestedAdminTitle'>" + $(CurrentRow).siblings(":first").find("th").eq(colIndex).html() + "</td>";
                                tdContent = "<td class='nestedAdminData'>" + $(CurrentRow).children("td").eq(colIndex).html() + "</td>";
                                newContent = newContent + colName + tdContent;

                                insertIndex++;
                            }
                    }

                    colIndex++;
                });

                colIndex = 0;

                $(this).next().closest("div").find("table[id$=gvSupervisor]").find(".nestedRowstyle").find("td").each(function () {
                    if (insertIndex == 2) {
                        colName = "<td class='nestedAdminTitle'>" + $(this).closest("tr").siblings(":first").find("th").eq(colIndex).html() + "</td>";
                        tdContent = "<td class='nestedAdminData'>" + $(this).html() + "</td>";
                        newContent = newContent + colName + tdContent;

                        tblGrid = tblGrid + "<tr>" + newContent + "</tr>";
                        newContent = "";
                        insertIndex = 0;
                    } else {

                        colName = "<td class='nestedAdminTitle'>" + $(this).closest("tr").siblings(":first").find("th").eq(colIndex).html() + "</td>";
                        tdContent = "<td class='nestedAdminData'>" + $(this).html() + "</td>";
                        newContent = newContent + colName + tdContent;

                        insertIndex++;
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

     <asp:GridView ID="gvInternship" runat="server" AutoGenerateColumns="false" OnRowCommand="gvInternship_RowCommand" SkinID="NestedGridTable"
        DataKeyNames="InternshipId" OnRowDataBound="gvInternship_RowDataBound">
        <Columns>
            <asp:TemplateField ItemStyle-Width="5%" HeaderText="Supervisor">
                <ItemTemplate>
                    <img alt = "" style="cursor: pointer" src='<%#Page.ResolveUrl("~/images/expand.png") %>' />
                    <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                        <asp:GridView ID="gvSupervisor" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvSupervisor_RowDataBound" GridLines="None" Width="100%" SkinID="NestedGridTable" >
                            <Columns>
                                <asp:TemplateField HeaderText="Supervisor first Name:">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtSupFirstName" CssClass="nestedAdminInput" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Supervisor last Name:">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtSupLastName" CssClass="nestedAdminInput" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Supervisor Title:">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtSupTitle" CssClass="nestedAdminInput" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Supervisor phone No.:">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtSupPhoneNumber" CssClass="nestedAdminInput" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Supervisor Email:">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtSupEmail" CssClass="nestedAdminInput" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Internship Company:" ItemStyle-Width="20%">
                            <ItemTemplate>
                                <SmarTik:CompanySelector ID="ddlIntershipCompany" runat="server" CssClass="nestedAdminInput"/>
                                <asp:HiddenField ID="hfInternshipId" runat="server" Value='<%# Eval("InternshipId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Internship Duration(Months):" ItemStyle-Width="10%" >
                            <ItemTemplate>
                                <SmarTik:STKNumericTextBox ID="txtDuration" runat="server" CssClass="nestedAdminInput" Value="1" MinimumValue="1" MaximumValue="1200" RequiredErrorMessage="Please enter the internship duration." RangeErrorMessage="Value should be 1 to 1,200" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Paid?:" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbPaid" runat="server" CssClass="nestedAdminInput" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Internship Notes:" ItemStyle-Width="40%">
                            <ItemTemplate>
                                <asp:TextBox ID="txtNotes" runat="server" CssClass="nestedAdminInput" Rows="1"  TextMode="MultiLine"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Update" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CssClass="adminButton" Text="Update" ValidationGroup="InternshipInfo"
                                    CommandName="UpdateInternship" ToolTip="Update the internship info" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" CssClass="adminButton" Text="Delete" CausesValidation="false"
                                    CommandName="Delete" ToolTip="Delete this internship" />
                            </ItemTemplate>
                        </asp:TemplateField>
        </Columns>
    </asp:GridView>


    <div class="section-header">
                <div class="title">
                Add New Internship
            </div>
            </div>
            
            <table class="adminContent">
                <tr>
                    <td class="adminTitle">
                        <SmarTik:ToolTipLabel runat="server" ID="lblCompany" Text="Internship Company:" ToolTip="Internship Company"
                            ToolTipImage="~/Common/ico-help.gif" />
                    </td>
                    <td class="adminData">
                        <SmarTik:CompanySelector ID="ddlIntershipCompany" runat="server" CssClass="adminInput"/>
                    </td>
                    <td class="adminTitle">
                        <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel5" Text="Duration(Months):" ToolTip="Internship duration in months"
                            ToolTipImage="~/Common/ico-help.gif" />
                    </td>
                    <td class="adminData">
                        <SmarTik:STKNumericTextBox ID="txtDuration" runat="server" ValidationGroup="NewInternship" MinimumValue="1" MaximumValue="1200" CssClass="adminInput" />
                    </td>
                </tr>
                <tr>
                    <td class="adminTitle">
                        <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Paid?:" ToolTip="If internship was paid or unpaid"
                            ToolTipImage="~/Common/ico-help.gif" />
                    </td>
                    <td class="adminData">
                        <asp:CheckBox ID="cbPaid" runat="server" CssClass="adminInput" ValidationGroup="NewInternship" />
                    </td>
                    <td class="adminTitle">
                        <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="Supervisor First name:" ToolTip="Supervisor First name"
                            ToolTipImage="~/Common/ico-help.gif" />
                    </td>
                    <td class="adminData">
                        <asp:TextBox ID="txtSupFirstName" CssClass="adminInput" ValidationGroup="NewInternship" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="adminTitle">
                        <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel3" Text="Supervisor Last Name:" ToolTip="Supervisor Last Name"
                            ToolTipImage="~/Common/ico-help.gif" />
                    </td>
                    <td class="adminData">
                        <asp:TextBox ID="txtSupLastName" CssClass="adminInput" ValidationGroup="NewInternship" runat="server"></asp:TextBox>
                    </td>
                    <td class="adminTitle">
                        <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel4" Text="Supervisor Title:" ToolTip="Supervisor Title:"
                            ToolTipImage="~/Common/ico-help.gif" />
                    </td>
                    <td class="adminData">
                        <asp:TextBox ID="txtSupTitle" CssClass="adminInput" ValidationGroup="NewInternship" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="adminTitle">
                        <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel6" Text="Supervisor Phone No:" ToolTip="Supervisor Phone No"
                            ToolTipImage="~/Common/ico-help.gif" />
                    </td>
                    <td class="adminData">
                        <asp:TextBox ID="txtSupPhoneNumber" CssClass="adminInput" ValidationGroup="NewInternship" runat="server"></asp:TextBox>
                    </td>
                    <td class="adminTitle">
                        <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel7" Text="Supervisor Email:" ToolTip="Supervisor Email:"
                            ToolTipImage="~/Common/ico-help.gif" />
                    </td>
                    <td class="adminData">
                        <SmarTik:EmailTextBox ID="txtSupEmail" CssClass="adminInput" runat="server" Required="true" />
                    </td>
                </tr>
                <tr>
                    <td class="adminTitle">
                        <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel8" Text="Internship Notes:" ToolTip="Internship Notes"
                            ToolTipImage="~/Common/ico-help.gif" />
                    </td>
                    <td colspan="3" class="adminData">
                        <asp:TextBox ID="txtNotes" runat="server" CssClass="gridItem"  TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="left">
                        <asp:Button runat="server" ID="btnNewInternship" CssClass="adminButtonBlue" Text="Save New Internship"
                            ValidationGroup="NewInternship" OnClick="btnNewInternship_Click" ToolTip="Create New Internship" />
                    </td>
                </tr>
            </table>



