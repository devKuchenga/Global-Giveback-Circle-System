Imports System.Drawing
Imports System.Web.Security
Imports System.Web.UI.WebControls

Namespace Smartik.Administration.Admin
    Partial Public Class CreateUsersPage
        Inherits BaseSTKAdministrationPage
        Public conStr As String = ConfigurationManager.ConnectionStrings("ConnStringGGBC").ConnectionString
        Public sqlConn As SqlClient.SqlConnection = New SqlClient.SqlConnection(conStr)
        Private username As String
        Private email As String
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
            sqlConn.Open()
            If Not IsPostBack Then
                BindGridview()
            End If
        End Sub
        ' This Method is used to bind gridview
        Protected Sub BindGridview()
            gvDetails.DataSource = Membership.GetAllUsers()
            gvDetails.DataBind()
        End Sub
        ' This event is used to cancel the edit mode
        Protected Sub gvDetails_RowCancelingEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
            gvDetails.EditIndex = -1
            BindGridview()
        End Sub
        ' This event is used to make our girdivew editable
        Protected Sub gvDetails_RowEditing(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
            gvDetails.EditIndex = e.NewEditIndex
            BindGridview()
        End Sub
        ' This event is used to delete our gridview records
        Protected Sub gvDetails_RowDeleting(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)
            username = gvDetails.Rows(e.RowIndex).Cells(1).Text
            Membership.DeleteUser(username)
            lblResult.Text = String.Format("{0} Details deleted Successfully", username)
            lblResult.ForeColor = Color.Green
            BindGridview()
        End Sub
        ' This event is used to update gridview data
        Protected Sub gvDetails_RowUpdating(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)
            Dim index As Integer = gvDetails.EditIndex
            Dim gvrow As GridViewRow = gvDetails.Rows(index)
            username = gvDetails.Rows(e.RowIndex).Cells(1).Text
            email = DirectCast(gvrow.Cells(2).Controls(0), TextBox).Text
            Dim user As MembershipUser = Membership.GetUser(username)
            If user IsNot Nothing Then
                user.Email = email
                Membership.UpdateUser(user)
                lblResult.Text = String.Format("{0} Details updated Successfully", username)
                lblResult.ForeColor = Color.Green
            End If
            gvDetails.EditIndex = -1
            BindGridview()
        End Sub



    End Class
End Namespace