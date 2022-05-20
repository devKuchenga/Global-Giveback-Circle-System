﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CreateUsers.aspx.vb" Inherits="GGBC.CreateUsers" %>

<Script runat="server">
    Public Sub Activatestep(ByVal sender As Object, ByVal e As System.EventArgs)
        ListBox1.DataSource = Roles.GetAllRoles()
        ListBox1.DataBind()
    End Sub
    Public Sub DeActivatestep(ByVal sender As Object, ByVal e As System.EventArgs)
        Roles.AddUserToRole(CreateUserWizard1.UserName, ListBox1.SelectedValue.ToString())
    End Sub
</Script>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <h2 title="Mentor Maintenance">
    CREATE USERS</h2>
<p title="Mentor Maintenance">
    <asp:Label ID="lblErrorMsgs" runat="server" ForeColor="Red" Font-Bold="True" 
            Font-Size="Large"></asp:Label>
    <asp:Label ID="lblMsgs" runat="server" Font-Bold="True" Font-Size="Large" 
            ForeColor="#00CC00"></asp:Label>
</p>
<table class="style13">
    <tr>
        <td class="style29">
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
                Width="454px" Height="329px" FinishDestinationPageUrl="~/Default.aspx" 
                LoginCreatedUser="False">
                <TitleTextStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server" Title="Create New Account" >
                    </asp:CreateUserWizardStep>
                    <asp:WizardStep runat="server" Title="Choose Role" OnActivate="Activatestep" OnDeactivate="Deactivatestep">
                        Choose a role for the user&nbsp;&nbsp;&nbsp;&nbsp; <asp:ListBox ID="ListBox1" runat="server" 
                            Width="151px"></asp:ListBox>
                    </asp:WizardStep>
                    <asp:CompleteWizardStep runat="server" >
                        <ContentTemplate>
                            <table style="font-size: 100%; height: 329px; width: 454px;">
                                <tr>
                                    <td align="center" valign="middle">
                                        Complete</td>
                                </tr>
                                <tr>
                                    <td>
                                        Your account has been successfully created.</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                            CommandName="Continue" Text="Close" ValidationGroup="CreateUserWizard1" 
                                            PostBackUrl="~/Admin/CreateUsers.aspx" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:CompleteWizardStep>
                </WizardSteps>
                <StartNavigationTemplate>
                    <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" 
                        Text="Next" />
                </StartNavigationTemplate>
                <StepStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:CreateUserWizard>
        </td>
    </tr>
    <tr>
        <td class="style29">
    <h2 title="Mentor Maintenance">
        CURRENT USERS</h2>
             <asp:GridView ID="gvDetails" runat="server" CssClass="Gridview" AutoGenerateColumns="false" 
             AutoGenerateDeleteButton="true" AutoGenerateEditButton="true" onrowcancelingedit="gvDetails_RowCancelingEdit" 
             onrowdeleting="gvDetails_RowDeleting" onrowediting="gvDetails_RowEditing"
                        onrowupdating="gvDetails_RowUpdating" Width="514px">
    <HeaderStyle BackColor="#df5015" />
<Columns>
<asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="true"/>
<asp:BoundField DataField="Email" HeaderText="Email" />
</Columns>
</asp:GridView>
 <asp:Label ID="lblResult" runat="server" Font-Bold="true"/>&nbsp;</td>
    </tr>
    </table>
</asp:Content>
