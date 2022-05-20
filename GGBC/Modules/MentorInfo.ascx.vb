Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class MentorInfoControl
        Inherits BaseSTKAdministrationUserControl

#Region "Field Variables"
        Dim strMentorId, strFirstName, strMiddleName, strLastName As String
        Dim strAddressLine1, strAddressLine2, strAddressLine3 As String
        Dim intMentorImage As Integer
        Dim strWorkPhone, strPersonalPhone, strMobilePhone As String
        Dim strPersonalEmail, strWorkEmail As String
        Dim strReferenceFirstName, strReferenceMiddleName, strReferenceLastName As String
        Dim strReferenceAddressLine1, strReferenceAddressLine2, strReferenceAddressLine3 As String
        Dim strReferenceEmail, strReferencePhoneNo As String
        Dim intMentorAffiliation, intSource, intNationality, intCountry, intMentorLevel, intTerminationReason, intPrevMenteeId As Integer
        Dim DateJoinedGGBC, DateAssignedMentee, DateTerminated As Date
        Dim strOccupation, strTerminationNotes As String
        Dim blnIsActive As Boolean
#End Region

        Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindData()
            End If
        End Sub

        Private Sub BindData()

            Try
                LoadFieldVariables(False)

                hfMentorId.Value = strMentorId
                hfMentorName.Value = strFirstName & " " & strMiddleName & " " & strLastName
                txtFName.Text = strFirstName
                txtMName.Text = strMiddleName
                txtLname.Text = strLastName

                txtAddressLn1.Text = strAddressLine1
                txtAddressLn2.Text = strAddressLine2
                txtAddressLn3.Text = strAddressLine3

                txtWorkPhone.Text = strWorkPhone
                txtPhonePersonal.Text = strPersonalPhone
                txtMobilePhone.Text = strMobilePhone

                txtPersonalEmail.Text = strPersonalEmail
                txtWorkEmail.Text = strWorkEmail

                txtRefFname.Text = strReferenceFirstName
                txtRefMname.Text = strReferenceMiddleName
                txtRefLname.Text = strReferenceLastName

                txtRefAddrLn1.Text = strReferenceAddressLine1
                txtRefAddrLN2.Text = strReferenceAddressLine2
                txtRefAddrLn3.Text = strReferenceAddressLine3

                txtRefEmail.Text = strReferenceEmail
                txtRefPhoneno.Text = strReferencePhoneNo

                txtPrevMenteeID.Text = intPrevMenteeId.ToString
                txtOccupation.Text = strOccupation
                txtTerminationNotes.Text = strTerminationNotes

                ddlMentorAffiliation.SelectedItemId = intMentorAffiliation
                ddlSource.SelectedItemId = intSource
                ddlNationality.SelectedItemId = intNationality
                ddlCountry.SelectedCountryId = intCountry
                ddlMentorLevel.SelectedItemId = intMentorLevel
                ddlTerminationReason.SelectedItemId = intTerminationReason


                If Not DateJoinedGGBC = Nothing Then
                    dtDateJoinedGGBC.SelectedDate = DateJoinedGGBC
                End If

                If Not DateAssignedMentee = Nothing Then
                    dtDateAssignedMentee.SelectedDate = DateAssignedMentee
                End If

                If Not DateTerminated = Nothing Then
                    dtDateTerminated.SelectedDate = DateTerminated
                End If
                cbIsActive.Checked = blnIsActive
                If intMentorImage < 1 Then intMentorImage = 1
                iMentorPicture.ImageUrl = PictureManager.GetPictureUrl(intMentorImage, 200)

                ddlMentorAffiliation.BindData()
                ddlSource.BindData()
                ddlNationality.BindData()
                ddlCountry.BindData()
                ddlMentorLevel.BindData()
                ddlTerminationReason.BindData()
            Catch ex As Exception
                Throw ex
            End Try


        End Sub

        Private Sub LoadFieldVariables(blnEditMode As Boolean)

            Try
                If blnEditMode Then
                    'Write to file
                    strMentorId = hfMentorId.Value.Trim
                    strFirstName = txtFName.Text.Trim
                    strMiddleName = txtMName.Text.Trim
                    strLastName = txtLname.Text.Trim

                    strAddressLine1 = txtAddressLn1.Text.Trim
                    strAddressLine2 = txtAddressLn2.Text.Trim
                    strAddressLine3 = txtAddressLn3.Text.Trim

                    strWorkPhone = txtWorkPhone.Text.Trim
                    strPersonalPhone = txtPhonePersonal.Text.Trim
                    strMobilePhone = txtMobilePhone.Text.Trim

                    strPersonalEmail = txtPersonalEmail.Text.Trim
                    strWorkEmail = txtWorkEmail.Text.Trim

                    strReferenceFirstName = txtRefFname.Text.Trim
                    strReferenceMiddleName = txtRefMname.Text.Trim
                    strReferenceLastName = txtRefLname.Text.Trim

                    strReferenceAddressLine1 = txtRefAddrLn1.Text.Trim
                    strReferenceAddressLine2 = txtRefAddrLN2.Text.Trim
                    strReferenceAddressLine3 = txtRefAddrLn3.Text.Trim

                    strReferenceEmail = txtRefEmail.Text.Trim
                    strReferencePhoneNo = txtRefPhoneno.Text.Trim

                    intPrevMenteeId = txtPrevMenteeID.Text.Trim
                    strOccupation = txtOccupation.Text.Trim
                    strTerminationNotes = txtTerminationNotes.Text.Trim

                    intMentorAffiliation = ddlMentorAffiliation.SelectedItemId
                    intSource = ddlSource.SelectedItemId
                    intNationality = ddlNationality.SelectedItemId
                    intCountry = ddlCountry.SelectedCountryId
                    intMentorLevel = ddlMentorLevel.SelectedItemId
                    intTerminationReason = ddlTerminationReason.SelectedItemId


                    If Not dtDateJoinedGGBC.SelectedDate Is Nothing Then
                        DateJoinedGGBC = dtDateJoinedGGBC.SelectedDate
                    Else
                        DateJoinedGGBC = CDate("1 Jan 1900")
                    End If

                    If Not dtDateAssignedMentee.SelectedDate Is Nothing Then
                        DateAssignedMentee = dtDateAssignedMentee.SelectedDate
                    Else
                        DateAssignedMentee = CDate("1 Jan 1900")
                    End If

                    If Not dtDateTerminated.SelectedDate Is Nothing Then
                        DateTerminated = dtDateTerminated.SelectedDate
                    Else
                        DateTerminated = CDate("1 Jan 1900")
                    End If

                    If fuMentorPicture.HasFile Then
                        If LoadedPicId > 1 Then
                            'Update existing image number
                            Dim picture As Picture = PictureManager.UpdatePicture(LoadedPicId, fuMentorPicture.FileBytes, fuMentorPicture.PostedFile.ContentType, True)
                            intMentorImage = picture.PictureId
                            PictureManager.DeletePicture(intMentorImage)
                        Else
                            'This is a new image
                            Dim picture As Picture = PictureManager.InsertPicture(fuMentorPicture.FileBytes, fuMentorPicture.PostedFile.ContentType, True)
                            intMentorImage = picture.PictureId
                        End If
                    Else
                        If LoadedPicId < 1 Then
                            intMentorImage = 1
                        Else
                            intMentorImage = LoadedPicId
                        End If
                    End If

                    LoadedPicId = intMentorImage

                    blnIsActive = cbIsActive.Checked

                Else 'We r loading page

                    ddlMentorAffiliation.GroupId = StaticDataEnum.MentorAffilliation
                    ddlSource.GroupId = StaticDataEnum.GBCCSource
                    ddlNationality.GroupId = StaticDataEnum.NationalityResidence
                    ddlMentorLevel.GroupId = StaticDataEnum.Mentorlevel
                    ddlTerminationReason.GroupId = StaticDataEnum.MentorTerminationReason

                    Dim dtMentor As DataTable = Me.DataAccessManager.GGBCGetData("sp_FindMentorById", "@MentorID", Me.MentorId)

                    If dtMentor.Rows.Count > 0 Then
                        With dtMentor.Rows(0)
                            strMentorId = .Item("MentorId").ToString.Trim
                            strFirstName = .Item("FirstName").ToString.Trim
                            strMiddleName = .Item("MiddleName").ToString.Trim
                            strLastName = .Item("LastName").ToString.Trim

                            strAddressLine1 = .Item("AddressLn1").ToString.Trim
                            strAddressLine2 = .Item("AddressLn2").ToString.Trim
                            strAddressLine3 = .Item("AddressLn3").ToString.Trim

                            strWorkPhone = .Item("Phone").ToString.Trim
                            strPersonalPhone = .Item("AltPhone").ToString.Trim
                            strMobilePhone = .Item("MobilePhone").ToString.Trim

                            strPersonalEmail = .Item("Email").ToString.Trim
                            strWorkEmail = .Item("WorkEmail").ToString.Trim

                            strReferenceFirstName = .Item("RefFname").ToString.Trim
                            strReferenceMiddleName = .Item("RefMname").ToString.Trim
                            strReferenceLastName = .Item("RefLname").ToString.Trim

                            strReferenceAddressLine1 = .Item("RefAddrLn1").ToString.Trim
                            strReferenceAddressLine2 = .Item("RefAddrLn2").ToString.Trim
                            strReferenceAddressLine3 = .Item("RefAddrLn3").ToString.Trim

                            strReferenceEmail = .Item("RefEmail").ToString.Trim
                            strReferencePhoneNo = .Item("RefPhoneNo").ToString.Trim

                            intMentorAffiliation = CInt(.Item("Affiliation"))
                            intSource = CInt(.Item("Source"))
                            intNationality = CInt(.Item("Nationalityresidence"))
                            intCountry = CInt(.Item("Country"))
                            intMentorLevel = CInt(.Item("MentorshipLevel"))
                            intTerminationReason = CInt(.Item("TerminationReason"))
                            intPrevMenteeId = CInt(.Item("PrevMenteeID"))

                            DateJoinedGGBC = IIf(CDate(.Item("DateJoinedGGBC")) = CDate("1 Jan 1900"), Nothing, String.Format("{0: dd MMM yyyy }", .Item("DateJoinedGGBC")))
                            DateAssignedMentee = IIf(CDate(.Item("DateAssignedMentee")) = CDate("1 Jan 1900"), Nothing, String.Format("{0: dd MMM yyyy }", .Item("DateAssignedMentee")))
                            DateTerminated = IIf(CDate(.Item("DateTerminated")) = CDate("1 Jan 1900"), Nothing, String.Format("{0: dd MMM yyyy }", .Item("DateTerminated")))

                            intMentorImage = .Item("MentorPic")
                            Me.LoadedPicId = intMentorImage

                            strOccupation = .Item("Occupation").ToString.Trim
                            strTerminationNotes = .Item("TerminationNotes").ToString.Trim

                            blnIsActive = CBool(.Item("IsActive"))

                        End With
                    End If

                End If
            Catch ex As Exception
                Throw ex
            End Try

        End Sub

        Public Function Save() As Integer

            Dim sqlCmdSaveRecs As New SqlClient.SqlCommand

            Dim isEdit As Integer = 0

            If Me.MentorId > 0 Then
                isEdit = 1
            End If

            Try
                LoadFieldVariables(True)

                sqlCmdSaveRecs.Parameters.AddWithValue("@Mentor", strMentorId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@FName", strFirstName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MName", strMiddleName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@LName", strLastName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@EMail", strPersonalEmail)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Affiliation", intMentorAffiliation)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Country", intCountry)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Phone", strWorkPhone)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MobilePhone", strMobilePhone)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AltPhone", strPersonalPhone)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MLevel", intMentorLevel)
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsActive", blnIsActive)
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsEdit", isEdit)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ColumnID", Me.MentorId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MImage", intMentorImage)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AddressLn1", strAddressLine1)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AddressLn2", strAddressLine2)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AddressLn3", strAddressLine3)
                sqlCmdSaveRecs.Parameters.AddWithValue("@WorkEmail", strWorkEmail)
                sqlCmdSaveRecs.Parameters.AddWithValue("@RefFname", strReferenceFirstName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@RefMname", strReferenceMiddleName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@RefLname", strReferenceLastName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@RefAddrLn1", strReferenceAddressLine1)
                sqlCmdSaveRecs.Parameters.AddWithValue("@RefAddrLn2", strReferenceAddressLine2)
                sqlCmdSaveRecs.Parameters.AddWithValue("@RefAddrLn3", strReferenceAddressLine3)
                sqlCmdSaveRecs.Parameters.AddWithValue("@RefEmail", strReferenceEmail)
                sqlCmdSaveRecs.Parameters.AddWithValue("@RefPhoneNo", strReferencePhoneNo)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Source", intSource)
                sqlCmdSaveRecs.Parameters.AddWithValue("@nationalityresidence", intNationality)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateJoinedGGBC", DateJoinedGGBC)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateAssignedMentee", DateAssignedMentee)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateTerminated", DateTerminated)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TerminationReason", intTerminationReason)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TerminationNotes", strTerminationNotes)
                sqlCmdSaveRecs.Parameters.AddWithValue("@PrevMenteeID", intPrevMenteeId.ToString)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Occupation", strOccupation)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Mentorevent", ctrlMentorEvent.SelectedEvents)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_AddEditMentors", sqlCmdSaveRecs)

                BindData()

                Return intIdentity
            Catch ex As Exception
                Throw ex
            End Try

        End Function

        Public ReadOnly Property MentorName As String
            Get
                Return hfMentorName.Value.Trim
            End Get
        End Property

        Public ReadOnly Property MentorId As Integer
            Get
                Return CommonHelper.QueryStringInt("MentorId")
            End Get
        End Property

        Protected Property LoadedPicId As Integer
            Get
                If Me.ViewState("LoadedPic") IsNot Nothing Then
                    Return CInt(Me.ViewState("LoadedPic"))
                End If
                Return Nothing
            End Get
            Set(value As Integer)
                Me.ViewState("LoadedPic") = value
            End Set
        End Property
    End Class
End Namespace