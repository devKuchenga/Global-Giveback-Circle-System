Namespace Smartik.Administration
    Partial Public Class loginPage
        'Inherits BaseSTKAdministrationPage
        Inherits System.Web.UI.Page
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        End Sub

        Protected Sub OnLoggingIn(ByVal sender As Object, ByVal e As LoginCancelEventArgs)

        End Sub

        Protected Sub OnLoggedIn(ByVal sender As Object, ByVal e As EventArgs)

        End Sub

        Protected Sub OnLoginError(ByVal sender As Object, ByVal e As EventArgs)

        End Sub

        'Protected Sub btnlogin_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnlogin.Click
        '    Dim drLogin As SqlClient.SqlDataReader
        '    Dim sqlCmdLogin As SqlClient.SqlCommand = New SqlClient.SqlCommand("sp_Login")

        '    sqlCmdLogin.CommandType = CommandType.StoredProcedure
        '    sqlCmdLogin.Connection = sqlConn
        '    sqlCmdLogin.CommandTimeout = ConfigurationManager.AppSettings("CommandTimeOut")
        '    sqlCmdLogin.Parameters.AddWithValue("@USerName", txtUserName.Text)
        '    sqlCmdLogin.Parameters.AddWithValue("@Password", txtPassword.Text)

        '    drLogin = sqlCmdLogin.ExecuteReader

        '    While drLogin.Read
        '        UserName = drLogin("UserName")
        '        IsLogedIn = 1
        '        Session("IsLogedIn") = "1"
        '        LogedInUser = txtUsername.Text
        '        Session("LogedInUser") = LogedInUser
        '        Response.Redirect("Default.aspx")
        '    End While
        'End Sub

        'Protected Overrides Function ValidateAdministratorSecurity() As Boolean
        '    Return False
        'End Function

        'Protected Overrides Function ValidatePageSecurity() As Boolean
        '    Return False
        'End Function



    End Class
End Namespace