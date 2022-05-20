
Namespace Smartik.Administration.Controls
    Partial Public Class SchoolsControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindGrid()
            End If
        End Sub

        Private Sub BindGrid()
            gvSchools.DataSource = Me.DataAccessManager.GGBCGetData("sp_GetSchools")
            gvSchools.DataBind()
        End Sub

        Protected Overrides Sub OnPreRender(e As EventArgs)
            BindJQuery()
            MyBase.OnPreRender(e)
        End Sub
    End Class
End Namespace