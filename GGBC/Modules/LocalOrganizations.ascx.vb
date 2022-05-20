
Namespace Smartik.Administration.Controls
    Partial Public Class LocalOrganizationsControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindGrid()
            End If
        End Sub

        Private Sub BindGrid()
            Try
                gvLocalOrgs.DataSource = Me.DataAccessManager.GGBCGetData("sp_GetLocalorg")
                gvLocalOrgs.DataBind()
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

    End Class
End Namespace