
Namespace Smartik.Administration.Modules
    Partial Public Class MenteeAddControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Protected Sub SaveButton_Click(sender As Object, e As System.EventArgs)
            Dim MenteeId As Integer = Save()

            Response.Redirect("Mentees.aspx")
        End Sub

        Protected Sub SaveAndStayButton_Click(sender As Object, e As System.EventArgs)
            Dim MenteeId As Integer = Save()

            Response.Redirect("MenteeDetails.aspx?MenteeId=" & MenteeId.ToString)

        End Sub

        Protected Function Save() As Integer
            Dim MenteeId As Integer = ctrlMenteeInfo.Save(True, ctrlMenteeSchool.Save, ctrlButterflyInfo.Save, ctrlSocietalLaunch.Save)
            Return MenteeId
        End Function

    End Class
End Namespace