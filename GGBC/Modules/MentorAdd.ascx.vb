
Namespace Smartik.Administration.Modules
    Partial Public Class MentorAddControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Protected Sub SaveButton_Click(sender As Object, e As System.EventArgs)
            Dim SponsorId As Integer = Save()

            Response.Redirect("Mentors.aspx")
        End Sub

        Protected Sub SaveAndStayButton_Click(sender As Object, e As System.EventArgs)
            Dim SponsorId As Integer = Save()

            Response.Redirect("MentorDetails.aspx?MentorId=" & SponsorId.ToString)

        End Sub

        Protected Function Save() As Integer
            Dim MentorId As Integer = Me.ctrlMentorInfo.Save()
            Return MentorId
        End Function

    End Class
End Namespace