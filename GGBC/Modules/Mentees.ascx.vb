
Namespace Smartik.Administration.Modules
    Partial Public Class MenteesControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindGrid()
            End If
        End Sub

        Private Sub BindGrid()
            gvMentees.DataSource = Me.DataAccessManager.GGBCGetData("sp_GetMentees")
            gvMentees.DataBind()
        End Sub

        Protected Overrides Sub OnPreRender(e As EventArgs)
            BindJQuery()
            MyBase.OnPreRender(e)
        End Sub
    End Class
End Namespace