Imports Smartik.Ecom.Common.Utils
Imports System.Data

Namespace Smartik.Administration.Modules
    Partial Public Class SponsorDetailsControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Save()
            ctrlSponsorInfo.Save()
        End Sub


        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Protected Sub SaveButton_Click(sender As Object, e As System.EventArgs)
            Save()

            Response.Redirect("Sponsors.aspx")
        End Sub

        Protected Sub SaveAndStayButton_Click(sender As Object, e As System.EventArgs)
            Save()

            Response.Redirect("SponsorDetails.aspx?SponsorId=" & Me.SponsorId)
        End Sub

        Protected Sub DeleteButton_Click(sender As Object, e As System.EventArgs)

        End Sub

        Public ReadOnly Property SponsorName() As String
            Get
                Try
                    Dim strSponsorName As String = String.Empty
                    Dim dtSponsor As DataTable = Me.DataAccessManager.GGBCGetData("sp_FindPartner", "@PartnerID", Me.SponsorId)
                    If dtSponsor.Rows.Count > 0 Then
                        strSponsorName = dtSponsor.Rows(0).Item("Companyname").ToString
                    End If
                    Return strSponsorName
                Catch ex As Exception
                    Throw ex
                End Try
            End Get
        End Property
            
        Public ReadOnly Property SponsorId() As Integer
            Get
                Return CommonHelper.QueryStringInt("SponsorId")
            End Get
        End Property


    End Class
End Namespace