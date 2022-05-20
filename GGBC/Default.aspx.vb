
Namespace Smartik.Administration
    Partial Public Class _DefaultPage
        Inherits BaseSTKAdministrationPage
        Public conStr As String = ConfigurationManager.ConnectionStrings("ConnStringGGBC").ConnectionString
        Public sqlConn As SqlClient.SqlConnection = New SqlClient.SqlConnection(conStr)
        Public IsLogedIn As Integer
        Public UserName As String



        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            'If Session("IsLogedIn") = "1" Then

            'Else
            '    Response.Redirect("login.aspx")
            'End If
            sqlConn.Open()


            'If IsLogedIn = 1 Then
            '    Session("IsLogedIn") = 1
            '    Response.Redirect("AddEditMentee.aspx")
            'Else
            '    Response.Redirect("Default.aspx")
            'End If
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
        '        Response.Redirect("Addeditmentee.aspx")

        '    End While






        'End Sub

    End Class
End Namespace