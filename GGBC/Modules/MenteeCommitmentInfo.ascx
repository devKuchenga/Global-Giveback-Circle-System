<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MenteeCommitmentInfo.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MenteeCommitmentInfoControl" %>

<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="EmailTextBox" Src="EmailTextBox.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ddlSelector" Src="ddlSelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="CompanySelector" Src="ddlCompanySelector.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="DatePicker.ascx" %>

<script type="text/javascript">
    $(document).ready(function () {
        var rowCount = $("[src*=altExpand]").length;
        $("[src*=altExpand]").each(function (e) {
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
                    case 5:
                        if (insertIndex == 2) {
                            colName = "<td class='nestedAdminTitle'>" + $(CurrentRow).siblings(":first").find("th").eq(colIndex).html() + "</td>";
                            tdContent = "<td class='adminData'>" + $(CurrentRow).children("td").eq(colIndex).html() + "</td>";
                            newContent = newContent + colName + tdContent;

                            tblGrid = tblGrid + "<tr>" + newContent + "</tr>";
                            newContent = "";
                            insertIndex = 0;

                        } else {
                            colName = "<td class='nestedAdminTitle'>" + $(CurrentRow).siblings(":first").find("th").eq(colIndex).html() + "</td>";
                            tdContent = "<td class='adminData'>" + $(CurrentRow).children("td").eq(colIndex).html() + "</td>";
                            newContent = newContent + colName + tdContent;

                            insertIndex++;
                        }
                }

                colIndex++;
            });

            colIndex = 0;

            $(this).next().closest("div").find("table[id$=gvMoreInfo]").find(".nestedRowstyle").find("td").each(function () {
                if (insertIndex == 2) {
                    colName = "<td class='nestedAdminTitle'>" + $(this).closest("tr").siblings(":first").find("th").eq(colIndex).html() + "</td>";
                    tdContent = "<td class='adminData'>" + $(this).html() + "</td>";
                    newContent = newContent + colName + tdContent;

                    tblGrid = tblGrid + "<tr>" + newContent + "</tr>";
                    newContent = "";
                    insertIndex = 0;
                } else {

                    colName = "<td class='nestedAdminTitle'>" + $(this).closest("tr").siblings(":first").find("th").eq(colIndex).html() + "</td>";
                    tdContent = "<td class='adminData'>" + $(this).html() + "</td>";
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
            if (e == (rowCount - 1)) {
                $(CurrentRow).siblings(":first").remove();
            }

            $(CurrentRow).remove();

        });
    });
    </script>
    
<asp:GridView ID="gvCommintmentInfo" runat="server" AutoGenerateColumns="false" OnRowCommand="gvCommintmentInfo_RowCommand" SkinID="NestedGridTable"
     DataKeyNames="CommitmentInfoId" OnRowDataBound="gvCommintmentInfo_RowDataBound">
    <Columns>
        <asp:TemplateField ItemStyle-Width="5%" HeaderText="More">
            <ItemTemplate>
                <img alt="" style="cursor: pointer" src='<%#Page.ResolveUrl("~/images/altExpand.png") %>' />
                <asp:Panel ID="pnlMoreInfo" runat="server" Style="display: none">
                    <asp:GridView ID="gvMoreInfo" runat="server" AutoGenerateColumns="false" SkinID="NestedGridTable"
                        OnRowDataBound="gvMoreInfo_RowDataBound" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Contact's First Name:">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtContactFirstName" CssClass="nestedAdminInput" runat="server"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact's Last Name:">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtContactLastName" CssClass="nestedAdminInput" runat="server"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact's Phone #:">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtContactPhoneNumber" CssClass="nestedAdminInput" runat="server"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact's Email:">
                                <ItemTemplate>
                                    <SmarTik:EmailTextBox ID="txtContactsEmail" CssClass="nestedAdminInput" runat="server" Required="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="People directly Impacted:">
                                <ItemTemplate>
                                    <SmarTik:STKNumericTextBox runat="server" CssClass="nestedAdminInput" id="txtDirectImpacts"
                                            value="0" requirederrormessage="Please enter the number of people directly impacted"
                                            minimumvalue="0" maximumvalue="100000000" rangeerrormessage="Number should from 0 to 100,000,000 " />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="People indirectly Impacted:">
                                <ItemTemplate>
                                    <SmarTik:STKNumericTextBox runat="server" CssClass="nestedAdminInput" id="txtIndirectImpacts"
                                            value="0" requirederrormessage="Please enter the number of people indirectly impacted"
                                            minimumvalue="0" maximumvalue="100000000" rangeerrormessage="Number should from 0 to 100,000,000 " />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Other Contributions:">
                                <ItemTemplate>
                                    <SmarTik:ddlSelector ID="ddlOtherContributions" CssClass="nestedAdminInput" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Commitment Description:">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtCommitmentDescription" runat="server" CssClass="nestedAdminInput" TextMode="MultiLine"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Other Contributions Details:">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtCommitmentDetails" runat="server" CssClass="nestedAdminInput" TextMode="MultiLine"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Commitment Category:" ItemStyle-Width="20%">
            <ItemTemplate>
                <SmarTik:ddlSelector ID="ddlCommitmentCategory" runat="server" CssClass="nestedAdminInput" />
                <asp:HiddenField ID="hfCommitmentInfoId" runat="server" Value='<%# Eval("CommitmentInfoId") %>' />
                <asp:HiddenField ID="hfGGBCRegNo" runat="server" Value='<%# Eval("GGBCRegNo") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Year commitment Registered:">
            <ItemTemplate>
                <SmarTik:STKDatePicker ID="dtYearRegistered" HideDays="true" HideMonths="true" runat="server"/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Annual Renewal Date:">
            <ItemTemplate>
                <SmarTik:STKDatePicker ID="dtAnnRenewalDate" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Progress Report Status:">
            <ItemTemplate>
                <SmarTik:ddlSelector ID="ddlProgressReportStatus" runat="server" CssClass="nestedAdminInput" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Organization Name:">
            <ItemTemplate>
                <asp:TextBox ID="txtOrganizationName" runat="server" CssClass="nestedAdminInput"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Update" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
            ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Button ID="btnUpdate" runat="server" CssClass="adminButton" Text="Update" ValidationGroup="CommitmentInfo"
                    CommandName="UpdateCommitmentInfo" ToolTip="Update the Commitment Info" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
            ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Button ID="btnDelete" runat="server" CssClass="adminButton" Text="Delete" CausesValidation="false"
                    CommandName="Delete" ToolTip="Delete this commitment info record" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<div class="section-header">
    <div class="title">
        Add New Commitment Info
    </div>
</div>
<table class="adminContent">
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="lblCommitmentCategory" Text="Commitment Category:" ToolTip="Commitment Category"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddlCommitmentCategory" runat="server" CssClass="adminInput" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel5" Text="Annual giveback renewal date:"
                ToolTip="Annual giveback renewal date" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="dtAnnRenewalDate" runat="server"></SmarTik:STKDatePicker>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Commitment registration Year:" ToolTip="The year the commitment was registered"
                ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKDatePicker ID="dtYearRegistered" HideDays="true" HideMonths="true" runat="server"></SmarTik:STKDatePicker>
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="Progress Report Status:"
                ToolTip="Progress Report Status" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddlProgressReportStatus" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel3" Text="Organization Name:"
                ToolTip="Organization Name" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtOrganizationName" CssClass="adminInput" ValidationGroup="NewCommitment"
                runat="server"></asp:TextBox>
                <SmarTik:CompanySelector ID="ddlCommitmentCompany" runat="server" CssClass="adminInput"/>
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel4" Text="Contact Person First Name:"
                ToolTip="Contact Person First Name:" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtContactsFName" CssClass="adminInput" ValidationGroup="NewCommitment"
                runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel6" Text="Contact Person Last Name:"
                ToolTip="Contact Person Last Name" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtContactsLName" CssClass="adminInput" ValidationGroup="NewCommitment"
                runat="server"></asp:TextBox>
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel7" Text="Contact Person Phone #:"
                ToolTip="Contact Person's Phone #" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtContactsPhoneNo" CssClass="adminInput" ValidationGroup="NewCommitment"
                runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel9" Text="Contact Person Email:"
                ToolTip="Contact Person Email" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:EmailTextBox ID="txtContactsEmail" CssClass="adminInput" runat="server" Required="false" />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel10" Text="People impacted directly:"
                ToolTip="Number of people directly impacted" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKNumericTextBox runat="server" cssclass="adminInput" id="txtDirectImpacts"
                                            value="0" requirederrormessage="Please enter the number of people directly impacted"
                                            minimumvalue="0" maximumvalue="100000000" rangeerrormessage="Number should from 0 to 100,000,000 " />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel11" Text="People impacted indirectly:"
                ToolTip="People impacted indirectly" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:STKNumericTextBox runat="server" cssclass="adminInput" id="txtIndirectImpacts"
                                            value="0" requirederrormessage="Please enter the number of people indirectly impacted"
                                            minimumvalue="0" maximumvalue="100000000" rangeerrormessage="Number should from 0 to 100,000,000 " />
        </td>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel12" Text="Other Contributions/Impact made:"
                ToolTip="Other Contributions/Impact made" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <SmarTik:ddlSelector ID="ddlOtherContributions" runat="server" CssClass="adminInput" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel13" Text="Other Contribution Details:"
                ToolTip="Commitment Description" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td colspan="3" class="adminData">
            <asp:TextBox ID="txtContributionDetails" runat="server" CssClass="adminInput" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel8" Text="Commitment Description:"
                ToolTip="Commitment Description" ToolTipImage="~/Common/ico-help.gif" />
        </td>
        <td colspan="3" class="adminData">
            <asp:TextBox ID="txtCommitmentDescription" runat="server" CssClass="adminInput" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="left">
            <asp:Button runat="server" ID="btnNewCommitment" CssClass="adminButtonBlue" Text="Save New Commitment"
                ValidationGroup="NewCommitment" OnClick="btnNewCommitment_Click" ToolTip="Create New Commitment" />
        </td>
    </tr>
</table>
