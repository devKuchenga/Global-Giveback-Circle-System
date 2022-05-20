Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class MenteeSchoolControl


        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                LoadData()
            End If
        End Sub

#Region "Fields"
        Dim intMenteeId As Integer
        Dim dtActualGRadYear As Nullable(Of Date)
        Dim dtActualtertgraddate As Nullable(Of Date)
        Dim dtAnticipatedgradyear As Nullable(Of Date)
        Dim dtDateJoinedTert As Nullable(Of Date)
        Dim dtdateofICTcourse As Nullable(Of Date)
        Dim dtExpectedtertgraddate As Nullable(Of Date)
        Dim dblSecAmount As Double
        Dim dblTertSchAmount As Double
        Dim strSecSchoolSponsor As String
        Dim strTerSchsponsor As String
        Dim strTertSchar1 As String
        Dim strTertSchar2 As String
        Dim strTertSchar3 As String
        Dim intDegreeEarned As Integer
        Dim intCiscocertification As Integer
        Dim intCiscocertresults As Integer
        Dim intClass As Integer
        Dim intConcentration As Integer
        Dim intCourse As Integer
        Dim intICTCompleted As Integer
        Dim intICTTraining As Integer
        Dim intKCSEscore As Integer
        Dim intMScertification As Integer
        Dim intMScertresults As Integer
        Dim intSecSchool As Integer
        Dim intTertiarySchool As Integer
        Dim intTertiary As Integer

#End Region

#Region "Utilities"
        Private Sub LoadData()
            Try
                LoadFieldVariables(False)
                ddTertiarySchool.SelectedItemId = intTertiarySchool
                ddTertiary.SelectedSchoolId = intTertiary
                ddDegreeEarned.SelectedItemId = intDegreeEarned
                ddCiscocertification.SelectedItemId = intCiscocertification
                ddCiscocertresults.SelectedItemId = intCiscocertresults
                ddClass.SelectedItemId = intClass
                ddConcentration.SelectedItemId = intConcentration
                ddICTCompleted.SelectedItemId = intICTCompleted
                ddICTTraining.SelectedSchoolId = intICTTraining
                ddKCSEscore.SelectedItemId = intKCSEscore
                ddMScertification.SelectedItemId = intMScertification
                ddMScertresults.SelectedItemId = intMScertresults
                ddSecSchool.SelectedSchoolId = intSecSchool
                ddCourse.SelectedItemId = intCourse
                'Bind
                ddTertiarySchool.BindData()
                ddTertiary.BindData()
                ddDegreeEarned.BindData()
                ddCiscocertification.BindData()
                ddCiscocertresults.BindData()
                ddClass.BindData()
                ddConcentration.BindData()
                ddICTCompleted.BindData()
                ddICTTraining.BindData()
                ddKCSEscore.BindData()
                ddMScertification.BindData()
                ddMScertresults.BindData()
                ddSecSchool.BindData()
                ddCourse.BindData()

                txtSecSchoolSponsor.Text = strSecSchoolSponsor
                txtSecAmount1.Value = dblSecAmount
                
                If dtAnticipatedgradyear.HasValue AndAlso (Not dtAnticipatedgradyear.Value.Date = CDate("1 Jan 1900").Date) Then
                    txtAnticipatedgradyear.SelectedDate = dtAnticipatedgradyear
                End If
                If dtActualGRadYear.HasValue AndAlso (Not dtActualGRadYear.Value.Date = CDate("1 Jan 1900").Date) Then
                    txtActualGradYear.SelectedDate = dtActualGRadYear
                End If
                If dtdateofICTcourse.HasValue AndAlso (Not dtdateofICTcourse.Value.Date = CDate("1 Jan 1900").Date) Then
                    txtdateofICTcourse.SelectedDate = dtdateofICTcourse
                End If
                If dtDateJoinedTert.HasValue AndAlso (Not dtDateJoinedTert.Value.Date = CDate("1 Jan 1900").Date) Then
                    txtDateJoinedTert.SelectedDate = dtDateJoinedTert
                End If
                If dtExpectedtertgraddate.HasValue AndAlso (Not dtExpectedtertgraddate.Value.Date = CDate("1 Jan 1900").Date) Then
                    txtExpectedtertgraddate.SelectedDate = dtExpectedtertgraddate
                End If
                If dtActualtertgraddate.HasValue AndAlso (Not dtActualtertgraddate.Value.Date = CDate("1 Jan 1900").Date) Then
                    txtActualtertgraddate.SelectedDate = dtActualtertgraddate
                End If
                txtTertSchaddr1.Text = strTertSchar1
                txtTertSchaddr2.Text = strTertSchar2
                txtTertSchaddr3.Text = strTertSchar3
                txtTerSchsponsor.Text = strTerSchsponsor
                txtTertSchAmount.Value = dblTertSchAmount
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub
        Private Sub LoadFieldVariables(blnEditMode As Boolean)
            Try
                If blnEditMode Then 'write to db
                    strSecSchoolSponsor = txtSecSchoolSponsor.Text.Trim
                    dblSecAmount = txtSecAmount1.Value
                    If txtAnticipatedgradyear.SelectedDate.HasValue Then
                        dtAnticipatedgradyear = txtAnticipatedgradyear.SelectedDate
                    Else
                        dtAnticipatedgradyear = DateTime.Parse("1 Jan 1900")
                    End If
                    If txtActualGradYear.SelectedDate.HasValue Then
                        dtActualGRadYear = txtActualGradYear.SelectedDate
                    Else
                        dtActualGRadYear = "1 Jan 1900"
                    End If
                    If txtdateofICTcourse.SelectedDate.HasValue Then
                        dtdateofICTcourse = txtdateofICTcourse.SelectedDate
                    Else
                        dtdateofICTcourse = DateTime.Parse("1 Jan 1900")
                    End If
                    If txtDateJoinedTert.SelectedDate.HasValue Then
                        dtDateJoinedTert = txtDateJoinedTert.SelectedDate
                    Else
                        dtDateJoinedTert = DateTime.Parse("1 Jan 1900")
                    End If
                    If txtExpectedtertgraddate.SelectedDate.HasValue Then
                        dtExpectedtertgraddate = txtExpectedtertgraddate.SelectedDate
                    Else
                        dtExpectedtertgraddate = DateTime.Parse("1 Jan 1900")
                    End If
                    If txtActualtertgraddate.SelectedDate.HasValue Then
                        dtActualtertgraddate = txtActualtertgraddate.SelectedDate
                    Else
                        dtActualtertgraddate = DateTime.Parse("1 Jan 1900")
                    End If

                    strTertSchar1 = txtTertSchaddr1.Text.Trim
                    strTertSchar2 = txtTertSchaddr2.Text.Trim
                    strTertSchar3 = txtTertSchaddr3.Text.Trim
                    strTerSchsponsor = txtTerSchsponsor.Text.Trim
                    dblTertSchAmount = txtTertSchAmount.Value
                    intSecSchool = ddSecSchool.SelectedSchoolId
                    intClass = ddClass.SelectedItemId
                    intKCSEscore = ddKCSEscore.SelectedItemId
                    intICTTraining = ddICTTraining.SelectedSchoolId
                    intICTCompleted = ddICTCompleted.SelectedItemId
                    intMScertification = ddMScertification.SelectedItemId
                    intMScertresults = ddMScertresults.SelectedItemId
                    intCiscocertification = ddCiscocertification.SelectedItemId
                    intCiscocertresults = ddCiscocertresults.SelectedItemId
                    intTertiarySchool = ddTertiarySchool.SelectedItemId
                    intTertiary = ddTertiary.SelectedSchoolId
                    intConcentration = ddConcentration.SelectedItemId
                    intCourse = ddCourse.SelectedItemId
                    intDegreeEarned = ddDegreeEarned.SelectedItemId
                Else
                    'Init fields (ddls enums and dates)
                    ddTertiary.SchoolType = StaticDataSchoolValue.Tertiary
                    ddTertiarySchool.GroupId = StaticDataEnum.TertiarySchool
                    ddDegreeEarned.GroupId = StaticDataEnum.DegreeEarned
                    ddCiscocertification.GroupId = StaticDataEnum.Booleans
                    ddCiscocertresults.GroupId = StaticDataEnum.CertificationResults
                    ddClass.GroupId = StaticDataEnum.MenteeClass
                    ddConcentration.GroupId = StaticDataEnum.MSConcentration
                    ddICTTraining.SchoolType = StaticDataSchoolValue.ICTTraining
                    ddICTCompleted.GroupId = StaticDataEnum.Booleans
                    ddKCSEscore.GroupId = StaticDataEnum.KCSEScore
                    ddMScertification.GroupId = StaticDataEnum.Booleans
                    ddMScertresults.GroupId = StaticDataEnum.CertificationResults
                    ddSecSchool.SchoolType = StaticDataSchoolValue.Secondary
                    ddCourse.GroupId = StaticDataEnum.Actualcoursetype

                    Dim dtMentee As DataTable = Me.DataAccessManager.GGBCGetData("sp_FindMenteeSchoolInfo", "@GBCCRegID", Me.MenteeId)
                    If dtMentee.Rows.Count > 0 Then
                        With dtMentee.Rows(0)
                            strSecSchoolSponsor = .Item("IndividualSponsorName")
                            dblSecAmount = .Item("SecAmount")
                            If .IsNull("AnticipatedGradYear") Then
                                dtAnticipatedgradyear = DateTime.Parse(("1 Jan 1900"))
                            Else
                                dtAnticipatedgradyear = DateTime.Parse(.Item("AnticipatedGradYear"))
                            End If
                            dtActualGRadYear = DateTime.Parse(.Item("SecActualGradyear"))
                            dtdateofICTcourse = DateTime.Parse(.Item("dateofICTcourse"))
                            dtDateJoinedTert = DateTime.Parse(.Item("DateJoinedTert"))
                            dtExpectedtertgraddate = DateTime.Parse(.Item("ExpectedTertGradDate"))
                            dtActualtertgraddate = DateTime.Parse(.Item("ActualTertGraddate"))
                            strTertSchar1 = .Item("TertSchAddr1")
                            strTertSchar2 = .Item("TertSchAddr2")
                            strTertSchar3 = .Item("TertSchAddr3")
                            strTerSchsponsor = .Item("TertschoolSponsor")
                            dblTertSchAmount = .Item("TertSchamount")
                            intSecSchool = .Item("SecSchool")
                            intClass = .Item("Class")
                            intKCSEscore = .Item("KcseScore")
                            intICTTraining = .Item("ICTTraining")
                            intICTCompleted = .Item("ICTCompleted")
                            intMScertification = .Item("MsCertification")
                            intMScertresults = .Item("MsCertresults")
                            intCiscocertification = .Item("CiscoCertification")
                            intCiscocertresults = .Item("CiscoCertresults")
                            intTertiarySchool = .Item("TertiaryInstituition")
                            intTertiary = .Item("TertiarySchoolname")
                            intConcentration = .Item("Concentration")
                            intCourse = .Item("Course")
                            intDegreeEarned = .Item("Degree")

                        End With
                    End If

                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Sub
#End Region

        'Public Function Save(blnEdit) As Integer
        Public Function Save() As SqlClient.SqlCommand
            Dim sqlCmdSaveRecs As New SqlClient.SqlCommand

            Try
                LoadFieldVariables(True)

                'sqlCmdSaveRecs.Parameters.AddWithValue("GBCCRegNo", intMenteeId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@SecActualGradyear", dtActualGRadYear)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ActualTertGraddate", dtActualtertgraddate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AnticipatedGradYear", dtAnticipatedgradyear)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateJoinedTert", dtDateJoinedTert)
                sqlCmdSaveRecs.Parameters.AddWithValue("@dateofICTcourse", dtdateofICTcourse)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ExpectedTertGradDate", dtExpectedtertgraddate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@SecAmount", dblSecAmount)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TertSchamount", dblTertSchAmount)
                'sqlCmdSaveRecs.Parameters.AddWithValue("@TertschoolSponsor", strSecSchoolSponsor)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TertschoolSponsor", strTerSchsponsor)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TertSchAddr1", strTertSchar1)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TertSchAddr2", strTertSchar2)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TertSchAddr3", strTertSchar3)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Degree", intDegreeEarned)
                sqlCmdSaveRecs.Parameters.AddWithValue("@CiscoCertification", intCiscocertification)
                sqlCmdSaveRecs.Parameters.AddWithValue("@CiscoCertresults", intCiscocertresults)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Class", intClass)
                sqlCmdSaveRecs.Parameters.AddWithValue("@SchoolConcentration", intConcentration)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Course", intCourse)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ICTCompleted", intICTCompleted)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ICTTraining", intICTTraining)
                sqlCmdSaveRecs.Parameters.AddWithValue("@KcseScore", intKCSEscore)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MsCertification", intMScertification)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MsCertresults", intMScertresults)
                sqlCmdSaveRecs.Parameters.AddWithValue("@SecSchool", intSecSchool)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TertiaryInstituition", intTertiarySchool)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TertiarySchoolname", intTertiary)

                'Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_EditMentee", sqlCmdSaveRecs)

                'Return intIdentity
                Return sqlCmdSaveRecs
            Catch ex As Exception
                Throw ex
            End Try
        End Function

#Region "Properties"
        Public ReadOnly Property MenteeId As Integer
            Get
                Return CommonHelper.QueryStringInt("MenteeId")
            End Get
        End Property
#End Region

    End Class
End Namespace