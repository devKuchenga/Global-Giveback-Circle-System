Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class MentorDetailsControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Protected Sub SaveButton_Click(sender As Object, e As System.EventArgs)
            Dim Id As Integer = Save()
            Response.Redirect("Mentors.aspx")
        End Sub

        Protected Sub SaveAndStayButton_Click(sender As Object, e As System.EventArgs)
            Dim Id As Integer = Save()
            Response.Redirect("MentorDetails.aspx?MentorId=" & Me.MentorId)
        End Sub

        Protected Function Save() As Integer
            Dim m_MentorId As Integer = ctrlMentorInfo.Save()

            Return m_MentorId
        End Function

        Protected Sub DeleteButton_Click(sender As Object, e As System.EventArgs)

        End Sub

        Public ReadOnly Property MentorName() As String
            Get
                Try
                    Return ctrlMentorInfo.MentorName
                Catch ex As Exception
                    Throw ex
                End Try
            End Get
        End Property


        Public ReadOnly Property MentorId As Integer
            Get
                Return CommonHelper.QueryStringInt("MentorId")
            End Get
        End Property

    End Class
End Namespace