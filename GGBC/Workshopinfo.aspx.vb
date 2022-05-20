Public Class WorkshopInfo
    Inherits System.Web.UI.Page
    Public conStr As String = ConfigurationManager.ConnectionStrings("ConnStringGGBC").ConnectionString
    Public sqlConn As SqlClient.SqlConnection = New SqlClient.SqlConnection(conStr)
    Public IsAdd As Integer = 0
    Public IsEdit As Integer = 0
    Dim IsChecked As Integer = 1

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        sqlConn.Open()
        LoadMentees()
        LoadMenteeDetails()

    End Sub
    Private Sub clearcontrols()
        ddMentee.SelectedValue = -1
        txtGGBCREGNo.Text = ""
        lblFName.Text = ""
        lblMName.Text = ""
        lblLName.Text = ""
        txtAnnualRenewaldate.Text = ""
        txtAnnualrenewalreason.Text = ""
        ocbAnnualrenewal.Checked = False
        txtFinLitIDate.Text = ""
        txtFinLitIReason.Text = ""
        ocbFinLit1.Checked = False
        txtFinLitIIDate.Text = ""
        txtFinLitIIReason.Text = ""
        ocbFinLit2.Checked = False
        txtReproductiveHealthIDate.Text = ""
        txtReproHealthIReason.Text = ""
        ocbRepHealth1.Checked = False
        txtReproductiveHealthIIDate.Text = ""
        txtReproHealthIIReason.Text = ""
        ocbRepHealth2.Checked = False
        txtSubstanceAbuseIDate.Text = ""
        txtSubstanceabuseIReason.Text = ""
        ocbSAbuse.Checked = False
        txtLeadershipDate.Text = ""
        txtLeadershipReason.Text = ""
        ocbLeadership.Checked = False
        txtSocialMediaSavvyDate.Text = ""
        txtSocialMediaSavvyReason.Text = "'"
        ocbSMS.Checked = False
        txtCommunicationSkillsDate.Text = ""
        txtCommunicationSkillsReason.Text = ""
        ocbCS.Checked = False
        txtWorkReadyDate.Text = ""
        txtWorkReadyreason.Text = ""
        ocbWr.Checked = False
        txtCareerTransDate.Text = ""
        txtCareerTransResaon.Text = ""
        ocbCareer.Checked = False
    End Sub

    Private Sub encontrols()

        ddMentee.Enabled = True
        txtGGBCREGNo.Enabled = True
        lblFName.Enabled = True
        lblMName.Enabled = True
        lblLName.Enabled = True
        txtAnnualRenewaldate.Enabled = True
        txtAnnualrenewalreason.Enabled = True
        ocbAnnualrenewal.Enabled = True
        txtFinLitIDate.Enabled = True
        txtFinLitIReason.Enabled = True
        ocbFinLit1.Enabled = True
        txtFinLitIIDate.Enabled = True
        txtFinLitIIReason.Enabled = True
        ocbFinLit2.Enabled = True
        txtReproductiveHealthIDate.Enabled = True
        txtReproHealthIReason.Enabled = True
        ocbRepHealth1.Enabled = True
        txtReproductiveHealthIIDate.Enabled = True
        txtReproductiveHealthIIDate.Enabled = True
        ocbRepHealth2.Enabled = True
        txtSubstanceAbuseIDate.Enabled = True
        txtSubstanceabuseIReason.Enabled = True
        ocbSAbuse.Enabled = True
        txtLeadershipDate.Enabled = True
        txtLeadershipReason.Enabled = True
        ocbLeadership.Enabled = True
        txtSocialMediaSavvyDate.Enabled = True
        txtSocialMediaSavvyReason.Enabled = True
        ocbSMS.Enabled = True
        txtCommunicationSkillsDate.Enabled = True
        txtCommunicationSkillsReason.Enabled = True
        ocbCS.Enabled = True
        txtWorkReadyDate.Enabled = True
        txtWorkReadyreason.Enabled = True
        ocbWr.Enabled = True
        txtCareerTransDate.Enabled = True
        txtCareerTransResaon.Enabled = True
        ocbCareer.Enabled = True
    End Sub
    Protected Sub btnEdit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnEdit.Click
        lblMsgs.Text = "Please Select Mentee below."
        btnFindRec.Enabled = True
        btnCancel.Enabled = True
        btnEdit.Enabled = False
        clearcontrols()
    End Sub

    Private Sub LoadMentees()
        Dim drData As SqlClient.SqlDataReader
        Dim sqlCmdGetMentees As SqlClient.SqlCommand = New SqlClient.SqlCommand("sp_FindMentee")
        sqlCmdGetMentees.Connection = sqlConn
        drData = sqlCmdGetMentees.ExecuteReader
        ddMentee.Items.Clear()
        With ddMentee
            .DataSource = drData
            .DataValueField = ("GGBCRegNo")
            .DataTextField = ("FullNames")
            .DataBind()
        End With
        drData.Close()
    End Sub

    Private Sub LoadMenteeDetails()
        lblMsgs.Text = ""
        Dim drData As SqlClient.SqlDataReader
        Dim sqlCmdGetDets As SqlClient.SqlCommand = New SqlClient.SqlCommand("sp_GetWorkshopdets")
        sqlCmdGetDets.CommandType = CommandType.StoredProcedure

        sqlCmdGetDets.Connection = sqlConn
        If IsNumeric(ddMentee.SelectedValue) Then
            If (ddMentee.SelectedValue) > 0 Then
                sqlCmdGetDets.Parameters.AddWithValue("@GGBCRedID", ddMentee.SelectedValue)
                drData = sqlCmdGetDets.ExecuteReader
                If drData.HasRows Then
                    While drData.Read
                        btnSaveRecord.Enabled = True
                        txtGGBCREGNo.Text = drData("GGBCRegNo")
                        lblFName.Text = drData("FirstName")
                        lblLName.Text = drData("LastName")
                        lblMName.Text = drData("MiddleName")
                        txtAnnualRenewaldate.Text = drData("AnnualRenewalworkshopdate")
                        txtAnnualrenewalreason.Text = drData("AnnualRenewalworkshopReason")
                        ocbAnnualrenewal.Checked = drData("annualrenewalworkshop")
                        txtFinLitIDate.Text = drData("FinlitIdate")
                        txtFinLitIReason.Text = drData("FinLitIReason")
                        ocbFinLit1.Checked = drData("FinlitI")
                        txtFinLitIIDate.Text = drData("FinlitIIDate")
                        txtFinLitIIReason.Text = drData("FinlitIIReason")
                        ocbFinLit2.Checked = drData("FinlitII")
                        txtReproductiveHealthIDate.Text = drData("ReproHealthIDate")
                        txtReproHealthIReason.Text = drData("ReproHealthIReason")
                        ocbRepHealth1.Checked = drData("ReprohealthI")
                        txtReproductiveHealthIIDate.Text = drData("ReprohealthIIdate")
                        txtReproHealthIIReason.Text = drData("ReproHealthIIReason")
                        ocbRepHealth2.Checked = drData("ReprohealthII")
                        txtSubstanceAbuseIDate.Text = drData("SubstanceabuseIDate")
                        txtSubstanceabuseIReason.Text = drData("SubstanceabuseIReason")
                        ocbSAbuse.Checked = drData("SubstanceabuseI")
                        txtLeadershipDate.Text = drData("Leadershipdate")
                        txtLeadershipReason.Text = drData("Leadershipreason")
                        ocbLeadership.Checked = drData("Leadership")
                        txtSocialMediaSavvyDate.Text = drData("Socialmediasavvydate")
                        txtSocialMediaSavvyReason.Text = drData("SocialMediasavvyReason")
                        ocbSMS.Checked = drData("Socialmediasavvy")
                        txtCommunicationSkillsDate.Text = drData("Communicationskillsdate")
                        txtCommunicationSkillsReason.Text = drData("Communicationskillsreason")
                        ocbCS.Checked = drData("Communicationskills")
                        txtWorkReadyDate.Text = drData("Workreadydate")
                        txtWorkReadyreason.Text = drData("Workreadyreason")
                        ocbWr.Checked = drData("workready")
                        txtCareerTransDate.Text = drData("Careertransdate")
                        txtCareerTransResaon.Text = drData("Careertransreason")
                        ocbCareer.Checked = drData("Careertrans")

                    End While
                    btnEdit.Enabled = False
                Else
                    lblMsgs.Text = ""
                    lblErrorMsgs.Text = "Record not on database. Please re-enter the GGBC Registration Number"
                    lblMsgs.Text = ""
                    ddMentee.Focus()

                End If
                drData.Close()
            End If
        End If
    End Sub


    Private Sub btnSaveRecord_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveRecord.Click
        WriteRecordToDb()
        btnSaveRecord.Enabled = False
    End Sub
    Private Sub WriteRecordToDb()
        Dim drSaveRecs As SqlClient.SqlDataReader
        Dim sqlCmdSaveRecs As SqlClient.SqlCommand = New SqlClient.SqlCommand("sp_EditworkshopDetails")
        sqlCmdSaveRecs.CommandType = CommandType.StoredProcedure
        sqlCmdSaveRecs.Connection = sqlConn
        If Session("IsEdit") = "true" Then
            IsEdit = 1
        Else
            IsEdit = 0
        End If

        If ocbAnnualrenewal.Checked = True Then
            IsChecked = 1
        Else
            IsChecked = 0
        End If

        sqlCmdSaveRecs.Parameters.AddWithValue("@GGBCRegID", Me.txtGGBCREGNo.Text)
        sqlCmdSaveRecs.Parameters.AddWithValue("@Annualrenewalworkshopdate", Me.txtAnnualRenewaldate.Text)
        If ocbAnnualrenewal.Checked = True Then
            IsChecked = 1
            sqlCmdSaveRecs.Parameters.AddWithValue("@Annualrenewalworkshop", Me.IsChecked)
        Else
            IsChecked = 0
            sqlCmdSaveRecs.Parameters.AddWithValue("@Annualrenewalworkshop", Me.IsChecked)
        End If

        sqlCmdSaveRecs.Parameters.AddWithValue("@Annualrenewalworkshopreason", Me.txtAnnualrenewalreason.Text)
        sqlCmdSaveRecs.Parameters.AddWithValue("@FinlitIDate ", Me.txtFinLitIDate.Text)
        If ocbFinLit1.Checked = True Then
            IsChecked = 1
            sqlCmdSaveRecs.Parameters.AddWithValue("@FinLitI", Me.IsChecked)
        Else
            sqlCmdSaveRecs.Parameters.AddWithValue("@FinLitI", Me.IsChecked)
            IsChecked = 0
        End If
        sqlCmdSaveRecs.Parameters.AddWithValue("@FinLitIReason", Me.txtFinLitIReason.Text)
        sqlCmdSaveRecs.Parameters.AddWithValue("@FinlitIIDate ", Me.txtFinLitIIDate.Text)
        If ocbFinLit2.Checked = True Then
            IsChecked = 1
            sqlCmdSaveRecs.Parameters.AddWithValue("@FinLitII", Me.IsChecked)
        Else
            sqlCmdSaveRecs.Parameters.AddWithValue("@FinLitII", Me.IsChecked)
            IsChecked = 0
        End If
        sqlCmdSaveRecs.Parameters.AddWithValue("@FinLitIIReason", Me.txtFinLitIIReason.Text)
        sqlCmdSaveRecs.Parameters.AddWithValue("@ReprohealthIDate", Me.txtReproductiveHealthIDate.Text)
        If ocbRepHealth1.Checked = True Then
            IsChecked = 1
            sqlCmdSaveRecs.Parameters.AddWithValue("@ReproHealthI", Me.IsChecked)
        Else
            IsChecked = 0
            sqlCmdSaveRecs.Parameters.AddWithValue("@ReproHealthI", Me.IsChecked)
        End If

        sqlCmdSaveRecs.Parameters.AddWithValue("@ReproHealthReason", Me.txtReproHealthIIReason.Text)
        sqlCmdSaveRecs.Parameters.AddWithValue("@ReprohealthIIDate", Me.txtReproductiveHealthIIDate.Text)
        If ocbRepHealth2.Checked = True Then
            IsChecked = 1
            sqlCmdSaveRecs.Parameters.AddWithValue("@ReproHealthII", Me.IsChecked)
        Else
            IsChecked = 0
            sqlCmdSaveRecs.Parameters.AddWithValue("@ReproHealthII", Me.IsChecked)
        End If

        sqlCmdSaveRecs.Parameters.AddWithValue("@ReproHealthIIReason", Me.txtReproHealthIReason.Text)
        sqlCmdSaveRecs.Parameters.AddWithValue("@SubstanceabuseIDate", Me.txtSubstanceAbuseIDate.Text)
        If ocbSAbuse.Checked = True Then
            IsChecked = 1
            sqlCmdSaveRecs.Parameters.AddWithValue("@SubstanceAbuseI", Me.IsChecked)
        Else
            IsChecked = 0
            sqlCmdSaveRecs.Parameters.AddWithValue("@SubstanceAbuseI", Me.IsChecked)
        End If

        sqlCmdSaveRecs.Parameters.AddWithValue("@SubstanceAbuseIReason", Me.txtSubstanceabuseIReason.Text)
        sqlCmdSaveRecs.Parameters.AddWithValue("@LeadershipDate", Me.txtLeadershipDate.Text)
        If ocbLeadership.Checked = True Then
            IsChecked = 1
            sqlCmdSaveRecs.Parameters.AddWithValue("@Leadership", Me.IsChecked)
        Else
            IsChecked = 0
            sqlCmdSaveRecs.Parameters.AddWithValue("@Leadership", Me.IsChecked)
        End If

        sqlCmdSaveRecs.Parameters.AddWithValue("@LeadershipReason", Me.txtLeadershipReason.Text)
        sqlCmdSaveRecs.Parameters.AddWithValue("@SocialMediasavvyDate", Me.txtSocialMediaSavvyDate.Text)
        If ocbSMS.Checked = True Then
            IsChecked = 1
            sqlCmdSaveRecs.Parameters.AddWithValue("@SocialMediaSavvy ", Me.IsChecked)
        Else
            IsChecked = 0
            sqlCmdSaveRecs.Parameters.AddWithValue("@SocialMediaSavvy ", Me.IsChecked)
        End If

        sqlCmdSaveRecs.Parameters.AddWithValue("@SocialMediaReason", Me.txtSocialMediaSavvyReason.Text)
        sqlCmdSaveRecs.Parameters.AddWithValue("@CommunicationskillsDate ", Me.txtCommunicationSkillsDate.Text)
        If ocbCS.Checked = True Then
            IsChecked = 1
            sqlCmdSaveRecs.Parameters.AddWithValue("@CommunicationSkills", Me.IsChecked)
        Else
            IsChecked = 0
            sqlCmdSaveRecs.Parameters.AddWithValue("@CommunicationSkills", Me.IsChecked)
        End If

        sqlCmdSaveRecs.Parameters.AddWithValue("@CommunicationSkillsReason", Me.txtCommunicationSkillsReason.Text)
        sqlCmdSaveRecs.Parameters.AddWithValue("@WorkReadyDate", Me.txtWorkReadyDate.Text)
        If ocbWr.Checked = True Then
            IsChecked = 1
            sqlCmdSaveRecs.Parameters.AddWithValue("@WorkReady", Me.IsChecked)
        Else
            IsChecked = 0
            sqlCmdSaveRecs.Parameters.AddWithValue("@WorkReady", Me.IsChecked)
        End If

        sqlCmdSaveRecs.Parameters.AddWithValue("@WorkReadyReason", Me.txtWorkReadyreason.Text)
        sqlCmdSaveRecs.Parameters.AddWithValue("@careertransDate", Me.txtCareerTransDate.Text)
        If ocbCareer.Checked = True Then
            IsChecked = 1
            MsgBox(IsChecked.ToString)
            sqlCmdSaveRecs.Parameters.AddWithValue("@CareerTrans ", Me.IsChecked)
        Else
            IsChecked = 0
            sqlCmdSaveRecs.Parameters.AddWithValue("@CareerTrans ", Me.IsChecked)
        End If



        sqlCmdSaveRecs.Parameters.AddWithValue("@CareerTransReason", Me.txtCareerTransResaon.Text)
        drSaveRecs = sqlCmdSaveRecs.ExecuteReader
        lblMsgs.Text = "Success Mentee Information added to database."
        clearcontrols()
        btnEdit.Enabled = True
        btnSaveRecord.Enabled = False

    End Sub

    Private Sub btnCancel_Click(sender As Object, e As System.EventArgs) Handles btnCancel.Click
        clearcontrols()
        btnEdit.Enabled = True
        btnSaveRecord.Enabled = False
        lblErrorMsgs.Text = ""
        lblMsgs.Text = ""
    End Sub
End Class