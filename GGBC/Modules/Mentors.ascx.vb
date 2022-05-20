Imports GGBC.Smartik.BLL

Namespace Smartik.Administration.Modules
    Partial Public Class MentorsControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                FillDropDowns()
                BindGrid()
            End If
        End Sub

        Protected Sub gvMentors_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvMentors.PageIndexChanging

        End Sub

        Protected Sub SearchButton_Click(sender As Object, e As System.EventArgs) Handles SearchButton.Click

        End Sub

        'Protected Sub btnDelete_Click(sender As Object, e As System.EventArgs) Handles SearchButton.Click

        'End Sub

        Protected Sub gvMentors_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMentors.RowDataBound

        End Sub

        Protected Sub FillDropDowns()

        End Sub

        Protected Sub BindGrid()
            Dim dsMentors As DataTable = Me.DataAccessManager.GGBCGetData("sp_GetMentors")

            If dsMentors.Rows.Count > 0 Then
                Me.gvMentors.Visible = True
                Me.lblNoMentorsFound.Visible = False
                Me.gvMentors.DataSource = dsMentors
                Me.gvMentors.DataBind()
            Else
                Me.gvMentors.Visible = False
                Me.lblNoMentorsFound.Visible = True
            End If
        End Sub

        Protected Overrides Sub OnPreRender(e As EventArgs)
            BindJQuery()
            MyBase.OnPreRender(e)
        End Sub

    End Class
End Namespace