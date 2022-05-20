Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class LocalOrganizationAddControl
        Inherits BaseSTKAdministrationUserControl

        Protected Function Save() As Integer
            Dim intIdentity As Integer = ctrlLocalOrgInfo.Save()
            Return intIdentity
        End Function

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        End Sub

        Protected Sub SaveButton_Click(sender As Object, e As System.EventArgs)
            Dim intIdentity As Integer = Save()

            Response.Redirect("LocalOrgs.aspx")
        End Sub

        Protected Sub SaveAndStayButton_Click(sender As Object, e As System.EventArgs)
            Dim intIdentity As Integer = Save()

            Response.Redirect("LocalOrgDetails.aspx?LocalOrgId=" & intIdentity)
        End Sub

        Protected Sub DeleteButton_Click(sender As Object, e As System.EventArgs)

        End Sub
    End Class
End Namespace