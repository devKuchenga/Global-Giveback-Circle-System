Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Public Class Countries
    Inherits System.Web.UI.Page
    Public conStr As String = ConfigurationManager.ConnectionStrings("ConnStringGGBC").ConnectionString
    Public sqlConn As SqlClient.SqlConnection = New SqlClient.SqlConnection(conStr)
    Public IsAdd As Integer = 0
    Public IsEdit As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       
        sqlConn.Open()
        If Not IsPostBack Then
            Me.BindData()
        End If
    End Sub

    Private Sub BindData()
        Dim dt As DataTable = New DataTable
        Dim strQuery As String = "SELECT * FROM t_Countries"
        Using cmd As SqlCommand = New SqlCommand(strQuery)
            Dim sda As SqlDataAdapter = New SqlDataAdapter
            cmd.Connection = sqlConn
            'sqlConn.Open()
            sda.SelectCommand = cmd
            sda.Fill(dt)
            GridView1.DataSource = dt
            GridView1.DataBind()
        End Using
    End Sub

    Protected Sub Add(ByVal sender As Object, ByVal e As EventArgs)
        Dim control As Control = Nothing
        If (Not (GridView1.FooterRow) Is Nothing) Then
            control = GridView1.FooterRow
        Else
            control = GridView1.Controls(0).Controls(0)
        End If
        Dim country As String = CType(control.FindControl("txtCountry"), TextBox).Text
        Using cmd As SqlCommand = New SqlCommand
            cmd.Connection = sqlConn
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "INSERT INTO [t_Countries] Values (@Country)"
            cmd.Parameters.AddWithValue("@Country", country)
            'sqlConn.Open()
            cmd.ExecuteNonQuery()
            sqlConn.Close()
            Response.Redirect(Request.Url.AbsoluteUri)
        End Using

    End Sub

End Class