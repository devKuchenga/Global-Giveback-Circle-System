

Namespace Smartik.Administration.Modules
    Partial Public Class SchoolAddControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        End Sub


        Protected Sub SaveButton_Click(sender As Object, e As System.EventArgs)
            Dim SchoolId As Integer = Save()
            Response.Redirect("Schools.aspx")
        End Sub

        Protected Sub SaveAndStayButton_Click(sender As Object, e As System.EventArgs)
            Dim SchoolId As Integer = Save()
            Response.Redirect("SchoolDetails.aspx?SchoolId=" & SchoolId)
        End Sub

        Protected Function Save() As Integer
            Dim SchoolId As Integer = ctrlSchoolInfo.Save()

            Return SchoolId
        End Function

    End Class
End Namespace