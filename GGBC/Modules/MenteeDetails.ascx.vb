Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class MenteeDetailsControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Protected Sub SaveButton_Click(sender As Object, e As System.EventArgs)
            Try
                Dim Id As Integer = Save()
                Response.Redirect("Mentees.aspx")
            Catch ex As Exception
                ProcessException(ex)
            End Try
            
        End Sub

        Protected Sub SaveAndStayButton_Click(sender As Object, e As System.EventArgs)
            Try
                Dim Id As Integer = Save()
                Response.Redirect("MenteeDetails.aspx?MenteeId=" & Me.MenteeId)
            Catch ex As Exception
                ProcessException(ex)
            End Try
            
        End Sub

        Protected Function Save() As Integer
            Try
                Dim MenteeId As Integer = ctrlMenteeInfo.Save(True, ctrlMenteeSchool.Save, ctrlButterflyInfo.Save, ctrlMenteeSocietalLaunch.Save)
                'MenteeId = ctrlMenteeSchool.Save(True)
                'MenteeId = ctrlMenteeSocietalLaunch.Save
                'MenteeId=ctrlButterflyInfo.Save
                'MenteeId = ctrlMenteeSocietalLaunch.Save
                Return MenteeId
            Catch ex As Exception
                Throw ex
            End Try
        End Function

        Protected Sub DeleteButton_Click(sender As Object, e As System.EventArgs)

        End Sub

        Public ReadOnly Property MenteeName() As String
            Get
                Try
                    Return ctrlMenteeInfo.MenteeName

                Catch ex As Exception
                    Throw ex
                End Try
            End Get
        End Property



        Public ReadOnly Property MenteeId As Integer
            Get
                Return CommonHelper.QueryStringInt("MenteeId")
            End Get
        End Property


    End Class
End Namespace