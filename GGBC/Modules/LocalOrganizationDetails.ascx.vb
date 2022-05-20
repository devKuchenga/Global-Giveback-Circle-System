Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class LocalOrganizationDetailsControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Save()
            ctrlLocalOrgInfo.Save()
        End Sub


        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        End Sub

        Protected Sub SaveButton_Click(sender As Object, e As System.EventArgs)
            Save()
            Response.Redirect("LocalOrgs.aspx")
        End Sub

        Protected Sub SaveAndStayButton_Click(sender As Object, e As System.EventArgs)
            Save()

            Response.Redirect("LocalOrgDetails.aspx?LocalOrgId=" & Me.LocalOrgId)
        End Sub

        Protected Sub DeleteButton_Click(sender As Object, e As System.EventArgs)

        End Sub
        Public ReadOnly Property LocalOrgName() As String
            Get
                Try
                    Return ctrlLocalOrgInfo.LocalOrgName
                Catch ex As Exception
                    Throw ex
                End Try
            End Get
        End Property
        Public ReadOnly Property LocalOrgId() As Integer
            Get
                Return CommonHelper.QueryStringInt("LocalOrgId")
            End Get
        End Property
    End Class
End Namespace