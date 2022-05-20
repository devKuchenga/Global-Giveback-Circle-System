
Namespace Smartik.Administration.Modules
    Partial Public Class SponsorAddControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Protected Sub SaveButton_Click(sender As Object, e As System.EventArgs)
            Dim SponsorId As Integer = Save()

            Response.Redirect("Sponsors.aspx")
        End Sub

        Protected Sub SaveAndStayButton_Click(sender As Object, e As System.EventArgs)
            Dim SponsorId As Integer = Save()

            Response.Redirect("SponsorDetails.aspx?SponsorId=" & SponsorId.ToString)

        End Sub

        Protected Function Save() As Integer
            Dim SponsorId As Integer = ctrlSponsorInfo.Save()
            'ctrlTypeOfPartner.save(SponsorId)
            Return SponsorId
        End Function
    End Class
End Namespace