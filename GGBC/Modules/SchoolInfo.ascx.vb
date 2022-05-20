Imports System.Data
Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class SchoolInfoControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindData()
            End If
        End Sub

        Protected Sub BindData()

            Try
                Dim dtSchool As DataTable = Me.DataAccessManager.GGBCGetData("sp_FindSchools", "@SchoolID", Me.SchoolId)

                ddlContactTitle.GroupId = StaticDataEnum.ProfessionTitle

                If dtSchool.Rows.Count > 0 Then
                    With dtSchool.Rows(0)
                        hfSchoolName.Value = .Item("nameofschool").ToString.Trim
                        txtSchoolName.Text = .Item("nameofschool").ToString.Trim
                        txtSchoolAddressLn1.Text = .Item("SchoolAddressLn1")
                        txtSchoolAddressLn2.Text = .Item("SchoolAddressLn2")
                        txtSchoolAddressLn3.Text = .Item("SchoolAddressLn3")
                        txtContactFname.Text = .Item("ContactPersonFname")
                        txtContactLname.Text = .Item("ContactPersonLname")
                        Dim ContactTitle As String = .Item("ContactTitle").ToString.Trim
                        If String.IsNullOrEmpty(ContactTitle) Then
                            ddlContactTitle.SelectedItemId = -1
                        Else
                            ddlContactTitle.SelectedItemId = CInt(ContactTitle)
                        End If
                        'ddlContactTitle.SelectedItemId = IIf(String.IsNullOrEmpty(ContactTitle), -1, CInt(ContactTitle))
                        ddlCountry.SelectedCountryId = .Item("Country")
                        If IsDBNull(.Item("DatejoinedGGBC")) Then

                            ctrlDateJoinedGGBC.SelectedDate = String.Format("{0: dd MMM yyyy }", ("1 Jan 1900"))
                        Else
                            ctrlDateJoinedGGBC.SelectedDate = String.Format("{0: dd MMM yyyy }", .Item("DatejoinedGGBC"))
                        End If

                        txtContactPhoneno.Text = .Item("Contactpersonphone")
                        txtEmail.Text = .Item("ContactPersonemail")

                        txtNotes.Text = .Item("Notes")

                        ddlContactTitle.BindData()
                        ddlCountry.BindData()
                    End With
                Else
                    ddlContactTitle.BindData()
                    ddlCountry.BindData()
                End If

            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Public Function Save() As Integer
            Dim sqlCmdSaveRecs As New SqlClient.SqlCommand

            Try

                Dim isEdit As Integer = 0

                If Me.SchoolId > 0 Then
                    isEdit = 1
                End If

                sqlCmdSaveRecs.Parameters.AddWithValue("@SchoolID", Me.SchoolId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@NameOfSchool", txtSchoolName.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TypeOfSchool", ctrlTypoSchool.SelectedSchools)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TypeOfSchoolSpecific", ctrlTypoSchoolSpec.SelectedSchools)
                sqlCmdSaveRecs.Parameters.AddWithValue("@SchoolAddressLn1", txtSchoolAddressLn1.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@SchoolAddressLn2", txtSchoolAddressLn2.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@SchoolAddressLn3", txtSchoolAddressLn3.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ContactPersonFname", txtContactFname.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ContactPersonLname", txtContactLname.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ContactTitle", ddlContactTitle.SelectedItemId.ToString.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ContactPersonPhone", txtContactPhoneno.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ContactPersonEmail", txtEmail.Text.Trim)
                If ctrlDateJoinedGGBC.SelectedDate.HasValue Then
                    sqlCmdSaveRecs.Parameters.AddWithValue("@datejoinedggbc", ctrlDateJoinedGGBC.SelectedDate)
                End If
                sqlCmdSaveRecs.Parameters.AddWithValue("@Notes", txtNotes.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Country", ddlCountry.SelectedCountryId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsEdit", isEdit)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_AddEditSchools", sqlCmdSaveRecs)

                Return intIdentity

            Catch ex As Exception
                Throw ex
            End Try
        End Function

        Public ReadOnly Property SchoolName As String
            Get
                Return hfSchoolName.Value.Trim
            End Get
        End Property

        Public ReadOnly Property SchoolId As Integer
            Get
                Return CommonHelper.QueryStringInt("SchoolId")
            End Get
        End Property

    End Class
End Namespace