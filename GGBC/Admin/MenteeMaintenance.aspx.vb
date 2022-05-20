Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient

Namespace Smartik.Administration.Admin
    Partial Public Class MenteeMaintenancePage
        Inherits BaseSTKAdministrationPage
        Public conStr As String = ConfigurationManager.ConnectionStrings("ConnStringGGBC").ConnectionString
        Public sqlConn As SqlClient.SqlConnection = New SqlClient.SqlConnection(conStr)
        Public IsAdd As Integer = 0
        Public IsEdit As Integer = 0

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

            sqlConn.Open()

            If Not IsPostBack Then
                LoadGroups()
            End If
            BindData()
        End Sub

        Private Sub BindData()
            Dim dt As DataTable = New DataTable

            Dim strQuery As String = "SELECT * FROM t_static Where GroupID='" & cmbGroupname.SelectedValue & "'"

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
            Dim FieldName As String = CType(control.FindControl("txtFieldName"), TextBox).Text
            Dim selectvalue As String = CType(control.FindControl("txtSelectValue"), TextBox).Text
            Dim GroupID As String = CType(control.FindControl("txtGroupID"), TextBox).Text
            Using cmd As SqlCommand = New SqlCommand
                cmd.Connection = sqlConn
                cmd.CommandType = CommandType.Text
                cmd.CommandText = "INSERT INTO [t_Static] (fieldname,selectvalue,GroupID)VALUES(@FieldName, @SelectValue,@Groupid)"
                cmd.Parameters.AddWithValue("@FieldName", FieldName)
                cmd.Parameters.AddWithValue("@Selectvalue", selectvalue)
                cmd.Parameters.AddWithValue("@GroupID", GroupID)
                '   sqlConn.Open()
                cmd.ExecuteNonQuery()
                '  sqlConn.Close()
                Response.Redirect(Request.Url.AbsoluteUri)
            End Using

        End Sub
        Private Sub LoadGroups()
            Dim drData As SqlClient.SqlDataReader
            Dim sqlCmdGetPartners As SqlClient.SqlCommand = New SqlClient.SqlCommand("sp_ListGroups")
            sqlCmdGetPartners.Connection = sqlConn
            drData = sqlCmdGetPartners.ExecuteReader
            cmbGroupname.Items.Clear()
            With cmbGroupname
                .DataSource = drData
                .DataValueField = ("GroupID")
                .DataTextField = ("GroupName")
                .DataBind()
            End With
            drData.Close()
        End Sub

        Protected Sub cmbGroupname_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles cmbGroupname.SelectedIndexChanged

            Response.Write(cmbGroupname.SelectedValue)
            lblMsgs.Text = ""

        End Sub
        ' This event is used to cancel the edit mode
        Protected Sub gvDetails_RowCancelingEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
            GridView1.EditIndex = -1
            BindData()
        End Sub
        ' This event is used to make our girdivew editable
        Protected Sub gvDetails_RowEditing(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
            GridView1.EditIndex = e.NewEditIndex
            BindData()
        End Sub
        ' This event is used to update gridview data
        Protected Sub gvDetails_RowUpdating(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)
            Using cmd As SqlCommand = New SqlCommand
                cmd.Connection = sqlConn
                cmd.CommandType = CommandType.Text
                ' Retrieve the row being edited.
                Dim index As Integer = GridView1.EditIndex
                Dim row As GridViewRow = GridView1.Rows(index)
                Dim t1 As TextBox = TryCast(row.FindControl("txtfieldname"), TextBox)
                Dim t2 As TextBox = TryCast(row.FindControl("txtselectvalue"), TextBox)
                Dim ColId As Label = TryCast(row.FindControl("ColID"), Label)

                GridView1.EditIndex = -1
                cmd.CommandText = "update  t_static set FieldName='" + t1.Text + "' , SelectValue='" + t2.Text + "' where ColumnID=" + ColId.Text + ""
                cmd.ExecuteNonQuery()

                Dim t3 As String = ColId.Text

                lblMsgs.Text = "Updated record " + t1.Text + "," + t2.Text + "Value From Bound Field" + t3

                BindData()

            End Using

        End Sub


        Protected Sub gvDetails_RowDeleting(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)
            Dim ID As Integer = CInt(GridView1.DataKeys(e.RowIndex).Value)
            ' Query the database and get the values based on the ID and delete it.
            lblMsgs.Text = "Deleted Record Id" + ID.ToString()
        End Sub


        Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.SelectedIndexChanged

        End Sub
    End Class

End Namespace