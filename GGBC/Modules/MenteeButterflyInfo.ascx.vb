Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class MenteeButterflyInfoControl
        Inherits BaseSTKAdministrationUserControl

#Region "Field Variables"
        Dim dtDateadmittedtobs As Nullable(Of Date)
        Dim dtDatecompletedbs As Nullable(Of Date)
        Dim intDsposition As Integer
        Dim strComments As String

#End Region

#Region "Utilities"
        Private Sub LoadData()
            Try
                LoadFieldVariables(False)
                ddbsposition.SelectedItemId = intDsposition
                If dtDateadmittedtobs.HasValue AndAlso (Not dtDateadmittedtobs.Value.Date = DateTime.Parse("1 Jan 1900")) Then
                    txtdateadmittedtobs.SelectedDate = dtDateadmittedtobs
                End If

                If dtDatecompletedbs.HasValue AndAlso (Not dtDatecompletedbs.Value.Date = DateTime.Parse("1 Jan 1900")) Then
                    txtdatecompletedbs.SelectedDate = dtDatecompletedbs
                End If
                txtComments.Text = strComments
                ddbsposition.BindData()
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Private Sub LoadFieldVariables(blnEditMode As Boolean)

            Try
                If blnEditMode Then
                    intDsposition = ddbsposition.SelectedItemId
                    If txtdateadmittedtobs.SelectedDate.HasValue Then
                        dtDateadmittedtobs = txtdateadmittedtobs.SelectedDate
                    Else
                        dtDateadmittedtobs = DateTime.Parse("1 Jan 1900")
                    End If
                    If txtdatecompletedbs.SelectedDate.HasValue Then
                        dtDatecompletedbs = txtdatecompletedbs.SelectedDate
                    Else
                        dtDatecompletedbs = DateTime.Parse("1 Jan 1900")
                    End If
                    strComments = txtComments.Text.Trim

                Else 'Init fields
                    'init ddl
                    ddbsposition.GroupId = StaticDataEnum.SpecificPositionHeld
                    Dim dtButterfly As DataTable = Me.DataAccessManager.GGBCGetData("sp_FindbutterflyInfo", "@GBCCRegID", Me.MenteeId)

                    If dtButterfly.Rows.Count > 0 Then
                        With dtButterfly.Rows(0)
                            intDsposition = .Item("bsposition")
                            dtDateadmittedtobs = DateTime.Parse(.Item("Dateadmittedtobs"))
                            dtDatecompletedbs = DateTime.Parse(.Item("datecompletedbs"))
                            strComments = .Item("Comments")
                        End With
                    End If

                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        'Public Function Save(blnIsEdit As Boolean) As Integer
        Public Function Save() As SqlClient.SqlCommand
            Dim sqlCmdSaveRecs As New SqlClient.SqlCommand
            Try
                LoadFieldVariables(True)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Dateadmittedtobs", dtDateadmittedtobs)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Datecompletedbs", dtDatecompletedbs)
                sqlCmdSaveRecs.Parameters.AddWithValue("@bsposition", intDsposition)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Comments", strComments)

                Return sqlCmdSaveRecs
            Catch ex As Exception
                Throw ex
            End Try
        End Function

#End Region

#Region "Properties"
        Public ReadOnly Property MenteeId As Integer
            Get
                Return CommonHelper.QueryStringInt("MenteeId")
            End Get
        End Property
#End Region

        Private Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                LoadData()
            End If
        End Sub
    End Class
End Namespace