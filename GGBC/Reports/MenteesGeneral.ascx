<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MenteesGeneral.ascx.vb" Inherits="GGBC.Smartik.Administration.Reports.MenteesGeneralControl" %>

<div>
    <div class="section-header">
        <div class="title">
            <img src="Common/ico-sponsor.png" alt="Report" />
            Mentee General Report
            <asp:Label runat="server" ID="Label1" />
        </div>
        <div class="options">
            <asp:Button ID="rptExcelButton" runat="server" CssClass="adminButtonBlue" Text="Excel "
                            OnClick="rptExcelButton_Click" ValidationGroup="rptMentorGeneral" />
            <asp:Panel runat="server" ID="pnlData">
                <asp:UpdatePanel ID="uprpt" runat="server">
                    <ContentTemplate>
                        
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="up1" runat="server" AssociatedUpdatePanelID="uprpt">
                    <ProgressTemplate>
                        <div class="progress">
                            <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/images/UpdateProgress.gif"
                                AlternateText="update" />
                                        Processing your request.Please wait...
                        </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </asp:Panel>
        </div>
    </div>
</div>
