Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class SchoolDetailsControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Protected Sub SaveButton_Click(sender As Object, e As System.EventArgs)
            Dim Id As Integer = Save()
            Response.Redirect("Schools.aspx")
        End Sub

        Protected Sub SaveAndStayButton_Click(sender As Object, e As System.EventArgs)
            Dim Id As Integer = Save()
            Response.Redirect("SchoolDetails.aspx?SchoolId=" & Me.SchoolId)
        End Sub

        Protected Function Save() As Integer
            Dim SchoolId As Integer = ctrlSchoolInfo.Save()

            Return SchoolId
        End Function

        Public ReadOnly Property SchoolName As String
            Get
                Return ctrlSchoolInfo.SchoolName
            End Get
        End Property

        Public ReadOnly Property SchoolId As Integer
            Get
                Return CommonHelper.QueryStringInt("SchoolId")
            End Get
        End Property

    End Class
End Namespace