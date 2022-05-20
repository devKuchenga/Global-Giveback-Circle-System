<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="login.aspx.vb" Inherits="GGBC.Smartik.Administration.loginPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-page">
        <%--<div class="page-title">
            <h3>
                Welcome to the GGBC System</h3>
        </div>--%>
        <div class="clear">
        </div>
        <div class="wrapper">
            <div class="returning-wrapper">
                <span class="login-title">Please login to continue </span>
                <asp:Panel ID="pnlLogin" runat="server" DefaultButton="LoginForm$LoginButton" CssClass="login-block">
                    <asp:Login ID="LoginForm" TitleText="" OnLoggedIn="OnLoggedIn" OnLoggingIn="OnLoggingIn"
                        runat="server" DestinationPageUrl="~/Default.aspx" OnLoginError="OnLoginError"
                        RememberMeSet="True" FailureText="User name or password incorrect.Please try again">
                        <LayoutTemplate>
                            <table class="login-table-container">
                                <tbody>
                                    <tr class="row">
                                        <td class="item-name">
                                            <asp:Label runat="server" ID="lblUsernameOrEmail" Text="User Name" AssociatedControlID="UserName" />:
                                        </td>
                                        <td class="item-value">
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameOrEmailRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="Username is required." ForeColor="Red" ToolTip="Username is required." ValidationGroup="LoginForm">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">
                                            <asp:Label runat="server" ID="lblPassword" Text="Password:" AssociatedControlID="Password" />:
                                        </td>
                                        <td class="item-value">
                                            <asp:TextBox ID="Password" TextMode="Password" runat="server" MaxLength="50"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                ErrorMessage="Please enter your password" ToolTip="Please enter your password"
                                                ValidationGroup="LoginForm">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-value" colspan="2">
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me?"></asp:CheckBox>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="message-error" colspan="2">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <%--<tr class="row">
                                    <td class="forgot-password" colspan="2">
                                        <asp:HyperLink ID="hlForgotPassword" runat="server" NavigateUrl="~/passwordrecovery.aspx"
                                            Text="<% $STKResources:Login.ForgotPassword %>"></asp:HyperLink>
                                    </td>
                                </tr>--%>
                                    <tr class="row">
                                        <td colspan="2">
                                            <%--<SmarTik:Captcha ID="CaptchaCtrl" runat="server" />--%>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td colspan="2">
                                            <div class="buttons">
                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Login" ValidationGroup="LoginForm"
                                                    CssClass="loginbutton" />
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                    </asp:Login>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
