<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MentorEvent.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.MentorEventControl" %>


<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>

<asp:CheckBoxList ID="cblMentorEvent" runat="server" RepeatDirection="Vertical" />

       <%--<div>
        <asp:GridView ID="gvMentorEvent" runat="server" AutoGenerateColumns="false"
            Width="100%"  OnPageIndexChanging="gvMentorEvent_PageIndexChanging" AllowPaging="true"
            PageSize="20">
            <Columns>
                <asp:BoundField DataField="FieldName" Visible="false" />
                <asp:TemplateField HeaderText="Mentor Event"
                    ItemStyle-Width="100%">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbMentorEvent" runat="server" Text='<%#  Server.HtmlEncode(Eval("FieldName").ToString()) %>'
                            Checked ='<%# Eval("IsMapped") %>' ToolTip="Check/uncheck to add/remove mentor event" />
                        <asp:HiddenField ID="ColumnId" runat="server" Value='<%# Eval("ColumnId") %>' />
                        <asp:HiddenField ID="hfSelectValue" runat="server" Value='<%# Eval("SelectValue") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings PageButtonCount="50" Position="TopAndBottom" />
        </asp:GridView>
        </div>

--%>