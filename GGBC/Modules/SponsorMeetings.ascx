<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SponsorMeetings.ascx.vb"
    Inherits="GGBC.Smartik.Administration.Modules.SponsorMeetingsControl" %>

<%@ Register TagPrefix="SmarTik" TagName="DatePicker" Src="~/Modules/DatePicker.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="SmarTik" TagName="ddlSelector" Src="~/Modules/ddlSelector.ascx" %>


<asp:Panel runat="server" ID="pnlData">
    
            <asp:Panel runat="server" ID="pnlError" EnableViewState="false" Visible="false" CssClass="messageBox messageBoxError">
                <asp:Literal runat="server" ID="lErrorTitle" EnableViewState="false" />
            </asp:Panel>
            <div>
                <asp:GridView ID="gvSponsorMeetings" runat="server" DataKeyNames="MeetingId" OnRowDeleting="gvSponsorMeetings_RowDeleting"
                    OnRowDataBound="gvSponsorMeetings_RowDatabound" OnRowCommand="gvSponsorMeetings_RowCommand"
                    OnPageIndexChanging="gvSponsorMeetings_PageIndexChanging" AllowPaging="true"
                    PageSize="15" Width="90%" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Meeting Date">
                            <ItemTemplate>
                                <SmarTik:DatePicker ID="ctrlMeetingDate" runat="server" />
                                <asp:HiddenField ID="hfMeetingId" runat="server" Value='<%# Eval("MeetingId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Outcome" ItemStyle-VerticalAlign="Top" >
                            <ItemTemplate>
                                <SmarTik:ddlSelector ID="ddlMeetingOutcome" runat="server" CssClass="sponsorMeeting" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fulfilment Date">
                            <ItemTemplate>
                                <SmarTik:DatePicker ID="ctrlFulfilmentDate" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Attendees">
                            <ItemTemplate>
                                <asp:TextBox ID="txtAttendees" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Meeting Notes">
                            <ItemTemplate>
                                <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Update" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CssClass="adminButton" Text="Update" ValidationGroup="SponsorMeeting"
                                    CommandName="UpdateMeeting" ToolTip="Update the meeting details" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" CssClass="adminButton" Text="Delete" CausesValidation="false"
                                    CommandName="Delete" ToolTip="Delete this meeting" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="section-header">
                <div class="title">
                    <img src="Common/ico-sponsor.png" alt="Meeting" />
                            Add New Partner meeting
                </div>
                <div class="options">
                        <asp:Button runat="server" ID="btnNewSponsorMeeting" CssClass="adminButtonBlue" Text="Save New Meeting"
                            ValidationGroup="NewMeeting" OnClick="btnNewMeeting_Click" ToolTip="Create New Meeting" />
                </div>
            </div>
    <table class="adminContent">
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="lblMeetingDate" Text="Meeting Date:" ToolTip="Meeting Date"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:DatePicker ID="ctrlMeetingDate" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel2" Text="Meeting outcome:" ToolTip="Meeting outcome"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:ddlSelector ID="ddlMeetingOutcome" CssClass="adminInput" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel1" Text="Fulfilment Date:" ToolTip="Fulfilment Date"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <SmarTik:DatePicker ID="ctrlNewFulfilmentDate" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel3" Text="Meeting Attendees:"
                    ToolTip="Meeting Attendees" ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox ID="txtAttendees" runat="server" Rows="8" CssClass="adminInput" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="adminTitle">
                <SmarTik:ToolTipLabel runat="server" ID="ToolTipLabel4" Text="Meeting Notes:" ToolTip="Meeting Notes"
                    ToolTipImage="~/Common/ico-help.gif" />
            </td>
            <td class="adminData">
                <asp:TextBox ID="txtNotes" runat="server" Rows="5" CssClass="adminInput" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Panel>
