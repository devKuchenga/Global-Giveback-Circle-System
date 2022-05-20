Imports System.Data.SqlClient
Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class MenteeInfoControl
        Inherits BaseSTKAdministrationUserControl

#Region "Field Variables"
        Dim strGGBCRegNo, strFirstName, strMiddleName, strLastName, strFullNames As String
        Dim strAddressLine1, strAddressLine2, strAddressLine3 As String
        Dim intMenteeImage As Integer
        Dim strHomePhone, strMobilePhone As String
        Dim strPersonalEmail As String
        Dim strHistory As String
        Dim strNOKFirstName, strNOKMiddleName, strNOKLastName, strMentor, strNOKAffiliation As String
        Dim strNOKEmail, strNOKPhoneNo As String
        Dim intButterflySquad, intTerminationReason, intLocalOrg, intSponsorshipDuration As Integer
        Dim strIndividualSponsorName, strSponsor As String
        Dim strAmmendedBy As String
        Dim DateJoinedGGBC, DateTerminated, DOB, ammendmentDate As Nullable(Of Date)
        Dim intExitYearGGBC As Integer
        Dim strTerminationNotes As String
        Dim blnIsActive As Boolean
#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                LoadData()
            End If
        End Sub

        Private Sub LoadData()
            Try
                LoadFieldVariables(False)
                hfMenteeFullName.Value = strFullNames
                txtFName.Text = strFirstName
                txtMName.Text = strMiddleName
                txtLname.Text = strLastName
                txtSponsorshipDuration.Value = intSponsorshipDuration
                txtAddressLn1.Text = strAddressLine1
                txtAddressLn2.Text = strAddressLine2
                txtAddressLn3.Text = strAddressLine3
                txtPhoneHome.Text = strHomePhone
                txtMobilePhone.Text = strMobilePhone
                If DOB.HasValue AndAlso (Not DOB.Value.Date = CDate("1 Jan 1900").Date) Then
                    dtDOB.SelectedDate = DOB
                End If
                If DateJoinedGGBC.HasValue AndAlso (Not DateJoinedGGBC.Value.Date = CDate("1 Jan 1900").Date) Then
                    dtDateJoinedGGBC.SelectedDate = DateJoinedGGBC
                End If
                If DateTerminated.HasValue AndAlso (Not DateTerminated.Value.Date = CDate("1 Jan 1900").Date) Then
                    dtDateTerminated.SelectedDate = DateTerminated
                End If
                If Not intexitYearGGBC = 1900 Then
                    dtexitYearGGBC.YearText = intExitYearGGBC.ToString
                End If

                    txtNextOfKinFName.Text = strNOKFirstName
                    txtNOfKinLName.Text = strNOKLastName
                    txtNOKPhone.Text = strNOKPhoneNo
                    txtNOKEmail.Text = strNOKEmail
                    ddlNOKAffiliation.SelectedItemId = CInt(strNOKAffiliation)

                If intMenteeImage < 1 Then
                    intMenteeImage = 1
                End If
                iMenteePicture.ImageUrl = PictureManager.GetPictureUrl(intMenteeImage, 200)

                    cbIsActive.Checked = blnIsActive
                    ddlMentorSelector.SelectedMentorId = strMentor
                    ddlLocalOrgSelector.SelectedLocalOrgId = intLocalOrg
                    ddlTerminationReason.SelectedItemId = intTerminationReason
                    ddlButterflySquad.SelectedItemId = intButterflySquad

                    txtHistory.Text = strHistory
                    txtTerminationNotes.Text = strTerminationNotes

                    ddlMentorSelector.BindData()
                    ddlLocalOrgSelector.BindData()
                    ddlTerminationReason.BindData()
                    ddlButterflySquad.BindData()
                    ddlNOKAffiliation.BindData()
            Catch exc As Exception
                ProcessException(exc)
            End Try
        End Sub

        Public ReadOnly Property MenteeName As String
            Get
                Return hfMenteeFullName.Value
            End Get
        End Property

        Public ReadOnly Property MenteeId As Integer
            Get
                Return CommonHelper.QueryStringInt("MenteeId")
            End Get
        End Property

        Private Sub LoadFieldVariables(blnEditMode As Boolean)

            Try
                If blnEditMode Then 'write to db
                    strFirstName = txtFName.Text.Trim
                    strLastName = txtLname.Text.Trim
                    strMiddleName = txtLname.Text.Trim
                    strFullNames = hfMenteeFullName.Value.Trim
                    strAddressLine1 = txtAddressLn1.Text.Trim
                    strAddressLine2 = txtAddressLn2.Text.Trim
                    strAddressLine3 = txtAddressLn3.Text.Trim
                    strHomePhone = txtPhoneHome.Text.Trim
                    strMobilePhone = txtMobilePhone.Text.Trim
                    strPersonalEmail = txtPersonalEmail.Text.Trim
                    'strSponsor =
                    'strSponsorshipDuration =
                    intSponsorshipDuration = txtSponsorshipDuration.Value
                    intButterflySquad = ddlButterflySquad.SelectedItemId
                    strHistory = txtHistory.Text.Trim
                    strNOKFirstName = txtNextOfKinFName.Text.Trim
                    strNOKLastName = txtNOfKinLName.Text.Trim
                    strNOKPhoneNo = txtNOKPhone.Text.Trim
                    strNOKEmail = txtNOKEmail.Text.Trim
                    strNOKAffiliation = ddlNOKAffiliation.SelectedItemId.ToString
                    blnIsActive = cbIsActive.Checked
                    strMentor = ddlMentorSelector.SelectedMentorId.ToString
                    'strIndividualSponsorName =
                    DOB = dtDOB.SelectedDate
                    DateJoinedGGBC = dtDateJoinedGGBC.SelectedDate
                    If dtDateTerminated.SelectedDate.HasValue Then
                        DateTerminated = dtDateTerminated.SelectedDate
                    Else
                        DateTerminated = DateTime.Parse("1 Jan 1900")
                    End If
                    intTerminationReason = ddlTerminationReason.SelectedItemId
                    strTerminationNotes = txtTerminationNotes.Text.Trim
                    If IsNumeric(dtexitYearGGBC.YearText) Then
                        intExitYearGGBC = CInt(dtexitYearGGBC.YearValue)
                    End If
                    strAmmendedBy = ""
                    ammendmentDate = DateTime.UtcNow

                    If fuMenteePicture.HasFile Then
                        If LoadedPicId > 1 Then
                            'Update existing image number
                            Dim picture As Picture = PictureManager.UpdatePicture(LoadedPicId, fuMenteePicture.FileBytes, fuMenteePicture.PostedFile.ContentType, True)
                            intMenteeImage = picture.PictureId
                            PictureManager.DeletePicture(intMenteeImage)
                        Else
                            'This is a new image
                            Dim picture As Picture = PictureManager.InsertPicture(fuMenteePicture.FileBytes, fuMenteePicture.PostedFile.ContentType, True)
                            intMenteeImage = picture.PictureId
                        End If
                    Else
                        If LoadedPicId < 1 Then
                            intMenteeImage = 1
                        Else
                            intMenteeImage = LoadedPicId
                        End If
                    End If

                    LoadedPicId = intMenteeImage

                    intLocalOrg = ddlLocalOrgSelector.SelectedLocalOrgId

                Else
                    'Init fields
                    ddlNOKAffiliation.GroupId = StaticDataEnum.NextOfKin
                    ddlTerminationReason.GroupId = StaticDataEnum.MenteeTerminationReason
                    ddlButterflySquad.GroupId = StaticDataEnum.Booleans

                    Dim dtMentee As DataTable = Me.DataAccessManager.GGBCGetData("sp_FindMentee", "@GBCCRegID", Me.MenteeId)

                    If dtMentee.Rows.Count > 0 Then
                        With dtMentee.Rows(0)
                            strFirstName = .Item("FirstName").ToString.Trim()
                            strLastName = .Item("LastName").ToString.Trim()
                            strLastName = .Item("MiddleName").ToString.Trim()
                            strFullNames = .Item("FullNames").ToString.Trim()
                            DOB = DateTime.Parse(.Item("DOB"))
                            strAddressLine1 = .Item("AddrL1").ToString.Trim()
                            strAddressLine2 = .Item("AddrL2").ToString.Trim()
                            strAddressLine3 = .Item("AddrL3").ToString.Trim()
                            strHomePhone = .Item("HomePhone").ToString.Trim()
                            strMobilePhone = .Item("CellPhone").ToString.Trim()
                            strPersonalEmail = .Item("Email").ToString.Trim()
                            DateJoinedGGBC = DateTime.Parse(.Item("DateJoined"))
                            strSponsor = .Item("sponsor")
                            intSponsorshipDuration = CInt(.Item("sponsorshipduration"))
                            intButterflySquad = .Item("Butterflysquad")
                            strHistory = .Item("History").ToString.Trim()
                            strNOKFirstName = .Item("NOKFName").ToString.Trim()
                            strNOKLastName = .Item("NOKLName").ToString.Trim()
                            strNOKPhoneNo = .Item("NOKPhone").ToString.Trim()
                            strNOKEmail = .Item("NOKEmail").ToString.Trim()
                            strNOKAffiliation = .Item("NOKAffiliation")
                            blnIsActive = .Item("IsActive")
                            strMentor = .Item("Mentor")
                            strIndividualSponsorName = .Item("IndividualSponsorName").ToString.Trim()
                            DateTerminated = DateTime.Parse(.Item("TerminationDate"))
                            intTerminationReason = .Item("ReasonForTermination")
                            strTerminationNotes = .Item("TerminationNotes").ToString.Trim()
                            intExitYearGGBC = Integer.Parse(.Item("exityearggbc"))
                            'strAmmendedBy = .Item("AmendedBy").ToString.Trim()
                            'ammendmentDate = .Item("AmendDate")
                            intMenteeImage = .Item("MenteeImage")
                            Me.LoadedPicId = intMenteeImage
                            intLocalOrg = .Item("LocalOrg")

                        End With
                    End If

                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Public Function Save(blnIsEdit As Boolean, ByVal sqlcmdSchoolInfo As SqlCommand, ByVal sqlcmdButterflyInfo As SqlCommand, ByVal sqlcmdSocietalLaunch As SqlCommand) As Integer

            Dim sqlCmdSaveRecs As New SqlCommand

            Dim intEdit As Integer = 0

            If blnIsEdit Then
                intEdit = 1
            End If

            Try

                LoadFieldVariables(True)

                sqlCmdSaveRecs.Parameters.AddWithValue("@GBCCRegNo", Me.MenteeId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@FName", strFirstName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MName", strMiddleName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@LName", strLastName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AddrLn1", strAddressLine1)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AddrLn2", strAddressLine2)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AddrLn3", strAddressLine3)
                sqlCmdSaveRecs.Parameters.AddWithValue("@HPhone", strHomePhone)
                sqlCmdSaveRecs.Parameters.AddWithValue("@CPhone", strMobilePhone)
                sqlCmdSaveRecs.Parameters.AddWithValue("@EMail", strPersonalEmail)
                sqlCmdSaveRecs.Parameters.AddWithValue("@NextOfKFName", strNOKFirstName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@NOKLName", strNOKLastName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@NOKPNumber", strNOKPhoneNo)
                sqlCmdSaveRecs.Parameters.AddWithValue("@NOKEMailAddress", strNOKEmail)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateJoinedGBCC", DateJoinedGGBC)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Sponsor", ctrlMenteeSponsors.SelectedSponsors)
                sqlCmdSaveRecs.Parameters.AddWithValue("@sponsorshipduration", intSponsorshipDuration)
                'sqlCmdSaveRecs.Parameters.AddWithValue("@ISponsor", )

                sqlCmdSaveRecs.Parameters.AddWithValue("@ButterflySquad", intButterflySquad)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DescriptiveHis", strHistory)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateTerminated", DateTerminated)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ReasonForTermination", intTerminationReason)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ExtraNotes", strTerminationNotes)
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsEdit", intEdit)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MentorID", strMentor)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DOB", DOB)
                sqlCmdSaveRecs.Parameters.AddWithValue("@exityearggbc", intExitYearGGBC)
                sqlCmdSaveRecs.Parameters.AddWithValue("@NOKAffiliation", CInt(strNOKAffiliation))
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsActive", blnIsActive)

                If blnIsEdit Then
                    strAmmendedBy = CommonHelper.AppUser
                    ammendmentDate = DateTime.UtcNow
                    sqlCmdSaveRecs.Parameters.AddWithValue("@AmendBy", strAmmendedBy)
                    sqlCmdSaveRecs.Parameters.AddWithValue("@AmendDate", ammendmentDate)
                End If

                sqlCmdSaveRecs.Parameters.AddWithValue("@MenteePic", intMenteeImage)
                sqlCmdSaveRecs.Parameters.AddWithValue("@localorg", intLocalOrg)

                'Insert other commands
                JoinParams(sqlcmdSchoolInfo, sqlCmdSaveRecs)
                JoinParams(sqlcmdButterflyInfo, sqlCmdSaveRecs)
                JoinParams(sqlcmdSocietalLaunch, sqlCmdSaveRecs)

                Dim sbNothing As New StringBuilder
                For Each p As SqlParameter In sqlCmdSaveRecs.Parameters
                    If IsNothing(p.Value) Then
                        sbNothing.Append(p.ParameterName)
                    End If
                Next

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_AddEditMenteeInfo", sqlCmdSaveRecs)

                'iMenteePicture.ImageUrl = PictureManager.GetPictureUrl(intMenteeImage, 250)
                LoadData()

                Return intIdentity
            Catch ex As Exception
                Throw ex
            End Try
        End Function

        Private Sub JoinParams(ByVal sqlSource As SqlCommand, ByVal sqlDest As SqlCommand)
            Try
                For Each p As SqlParameter In sqlSource.Parameters
                    sqlDest.Parameters.AddWithValue(p.ParameterName, p.Value)
                Next
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Protected Property LoadedPicId As Integer
            Get
                If Me.ViewState("LoadedPic") IsNot Nothing Then
                    Return CInt(Me.ViewState("LoadedPic"))
                End If
                Return 0
            End Get
            Set(value As Integer)
                Me.ViewState("LoadedPic") = value
            End Set
        End Property



    End Class
End Namespace