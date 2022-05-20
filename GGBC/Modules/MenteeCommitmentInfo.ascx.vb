Imports Smartik.Ecom.Common.Utils
Imports Smartik.Ecom.Controls

Namespace Smartik.Administration.Modules
    Partial Public Class MenteeCommitmentInfoControl
        Inherits BaseSTKAdministrationUserControl

        Dim dtCommitment As DataTable = Nothing
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                Try
                    BindGrid()
                    FillDlls()
                Catch ex As Exception
                    ProcessException(ex)
                End Try
            End If
        End Sub

        Protected Sub FillDlls()
            Try
                ddlCommitmentCategory.GroupId = StaticDataEnum.CommittmentCategory
                ddlOtherContributions.GroupId = StaticDataEnum.OtherContibutionsMade
                ddlProgressReportStatus.GroupId = StaticDataEnum.ProgressReportStatus

                ddlCommitmentCategory.BindData()
                ddlOtherContributions.BindData()
                ddlProgressReportStatus.BindData()

            Catch ex As Exception
                Throw ex
            End Try
        End Sub


        Protected Sub gvCommintmentInfo_RowCommand(sender As Object, e As GridViewCommandEventArgs)
            Try
                If e.CommandName = "UpdateCommitmentInfo" Then
                    Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                    Dim commitmentRow As GridViewRow = gvCommintmentInfo.Rows(index)
                    Dim gvMoreInfo As GridView = TryCast(commitmentRow.FindControl("gvMoreInfo"), GridView)
                    Dim moreInfoRow As GridViewRow = Nothing
                    If gvMoreInfo IsNot Nothing Then
                        moreInfoRow = gvMoreInfo.Rows(0)
                    End If

                    If moreInfoRow Is Nothing Then
                        Throw New ArgumentException("Data error")
                    End If

                    Dim btnUpdate As Button = TryCast(commitmentRow.FindControl("btnUpdate"), Button)

                    Dim ddlCommitmentCategory As ddlSelectorControl = TryCast(commitmentRow.FindControl("ddlCommitmentCategory"), ddlSelectorControl)
                    Dim hfCommitmentInfoId As HiddenField = TryCast(commitmentRow.FindControl("hfCommitmentInfoId"), HiddenField)
                    Dim hfGGBCRegNo As HiddenField = TryCast(commitmentRow.FindControl("hfGGBCRegNo"), HiddenField)
                    Dim dtYearRegistered As STKDatePicker = TryCast(commitmentRow.FindControl("dtYearRegistered"), STKDatePicker)
                    Dim dtAnnRenewalDate As STKDatePicker = TryCast(commitmentRow.FindControl("dtAnnRenewalDate"), STKDatePicker)
                    Dim ddlProgressReportStatus As ddlSelectorControl = TryCast(commitmentRow.FindControl("ddlProgressReportStatus"), ddlSelectorControl)
                    Dim txtOrganizationName As TextBox = TryCast(commitmentRow.FindControl("txtOrganizationName"), TextBox)
                    'More info

                    Dim txtContactFirstName As TextBox = TryCast(moreInfoRow.FindControl("txtContactFirstName"), TextBox)
                    Dim txtContactLastName As TextBox = TryCast(moreInfoRow.FindControl("txtContactLastName"), TextBox)
                    Dim txtContactPhoneNumber As TextBox = TryCast(moreInfoRow.FindControl("txtContactPhoneNumber"), TextBox)
                    Dim txtContactsEmail As EmailTextBox = TryCast(moreInfoRow.FindControl("txtContactsEmail"), EmailTextBox)
                    Dim txtDirectImpacts As STKNumericTextBox = TryCast(moreInfoRow.FindControl("txtDirectImpacts"), STKNumericTextBox)
                    Dim txtIndirectImpacts As STKNumericTextBox = TryCast(moreInfoRow.FindControl("txtIndirectImpacts"), STKNumericTextBox)
                    Dim txtCommitmentDescription As TextBox = TryCast(moreInfoRow.FindControl("txtCommitmentDescription"), TextBox)
                    Dim ddlOtherContributions As ddlSelectorControl = TryCast(moreInfoRow.FindControl("ddlOtherContributions"), ddlSelectorControl)
                    Dim txtCommitmentDetails As TextBox = TryCast(moreInfoRow.FindControl("txtCommitmentDetails"), TextBox)

                    GGBCRegNo = hfGGBCRegNo.Value.Trim
                    commitmentId = CInt(hfCommitmentInfoId.Value.Trim)
                    ComittmentCategory = ddlCommitmentCategory.SelectedItemId
                    ProgressReportCompleted = ddlProgressReportStatus.SelectedItemId

                    If IsNumeric(dtYearRegistered.YearValue) Then
                        'YearRegistered = CDate(dtYearRegistered.SelectedDate)
                        Dim dt As String = "1 Jan " + dtYearRegistered.YearValue
                        YearRegistered = CDate(dt)
                    Else
                        YearRegistered = CDate("1 Jan 1900")
                    End If

                    If dtAnnRenewalDate.SelectedDate.HasValue Then
                        annualrenewaldate = dtAnnRenewalDate.SelectedDate
                    Else
                        annualrenewaldate = CDate("1 Jan 1900")
                    End If

                    OrgName = txtOrganizationName.Text.Trim
                    ContactpersonFname = txtContactFirstName.Text.Trim
                    ContactPersonLname = txtContactLastName.Text.Trim
                    ContactPersonPhoneno = txtContactPhoneNumber.Text.Trim
                    Contactpersonemail = txtContactsEmail.Text.Trim
                    Commitmentdescription = txtCommitmentDescription.Text.Trim
                    OtherContributions = ddlOtherContributions.SelectedItemId
                    Other = txtCommitmentDetails.Text.Trim
                    Noimpacteddirectly = txtDirectImpacts.Value
                    noimpactedindirectly = txtIndirectImpacts.Value

                    Dim intIdentity As Integer = Me.Save(True)

                End If
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Private Function GetCurrent(oldValue As String, txtVal As String) As String
            Try
                Dim strCorrectValue As String = ""
                oldValue = oldValue.Trim
                txtVal = txtVal.Trim

                'StaticDataEnum.com
                Dim strReplace As String = oldValue & ","

                strCorrectValue = txtVal.Replace(strReplace, "")

                Return strCorrectValue
            Catch ex As Exception
                Throw ex
            End Try
        End Function

        Private Sub BindGrid()
            Try
                dtCommitment = Me.DataAccessManager.GGBCGetData("sp_GetCommitDets", "@GGBCRegID", Me.MenteeId)
                gvCommintmentInfo.DataSource = dtCommitment
                gvCommintmentInfo.DataBind()
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Protected Sub gvCommintmentInfo_RowDataBound(sender As Object, e As GridViewRowEventArgs)
            Try
                If e.Row.RowType = DataControlRowType.DataRow Then
                    Dim CommitmentInfo As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                    Dim btnUpdate As Button = TryCast(e.Row.FindControl("btnUpdate"), Button)
                    Dim ddlCommitmentCategory As ddlSelectorControl = TryCast(e.Row.FindControl("ddlCommitmentCategory"), ddlSelectorControl)
                    Dim hfCommitmentInfoId As HiddenField = TryCast(e.Row.FindControl("hfCommitmentInfoId"), HiddenField)
                    Dim hfGGBCRegNo As HiddenField = TryCast(e.Row.FindControl("hfGGBCRegNo"), HiddenField)
                    Dim dtYearRegistered As STKDatePicker = TryCast(e.Row.FindControl("dtYearRegistered"), STKDatePicker)
                    Dim dtAnnRenewalDate As STKDatePicker = TryCast(e.Row.FindControl("dtAnnRenewalDate"), STKDatePicker)
                    Dim ddlProgressReportStatus As ddlSelectorControl = TryCast(e.Row.FindControl("ddlProgressReportStatus"), ddlSelectorControl)
                    Dim txtOrganizationName As TextBox = TryCast(e.Row.FindControl("txtOrganizationName"), TextBox)



                    If btnUpdate IsNot Nothing Then
                        btnUpdate.CommandArgument = e.Row.RowIndex.ToString()
                    End If

                    With CommitmentInfo
                        ddlCommitmentCategory.GroupId = StaticDataEnum.CommittmentCategory
                        ddlCommitmentCategory.SelectedItemId = .Item("ComittmentCategory")
                        ddlCommitmentCategory.BindData()
                        'hfCommitmentInfoId.Value = .Item("CommitmentInfoID")
                        'hfGGBCRegNo.Value = .Item("GGBCRegNo")
                        If CDate(.Item("YearRegistered")) > CDate("1 Jan 1900") Then
                            dtYearRegistered.YearText = CDate(.Item("YearRegistered")).Year.ToString
                        End If

                        If CDate(.Item("Annualrenewaldate")) > CDate("1 Jan 1900") Then
                            dtAnnRenewalDate.SelectedDate = CDate(.Item("Annualrenewaldate"))
                        End If

                        ddlProgressReportStatus.GroupId = StaticDataEnum.ProgressReportStatus
                        ddlProgressReportStatus.SelectedItemId = .Item("ProgressReportCompleted")
                        ddlProgressReportStatus.BindData()

                        txtOrganizationName.Text = .Item("OrgName")
                    End With



                    Dim CommitmentInfoId As Integer = CInt(hfCommitmentInfoId.Value)
                    Dim gvMoreInfo As GridView = TryCast(e.Row.FindControl("gvMoreInfo"), GridView)


                    dtCommitment.DefaultView.RowFilter = "CommitmentInfoId = " & CommitmentInfoId
                    If gvMoreInfo IsNot Nothing AndAlso CommitmentInfoId > 0 Then
                        gvMoreInfo.DataSource = dtCommitment
                        gvMoreInfo.DataBind()
                    End If

                    dtCommitment.DefaultView.RowFilter = ""

                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Protected Sub gvMoreInfo_RowDataBound(sender As Object, e As GridViewRowEventArgs)
            Try
                If e.Row.RowType = DataControlRowType.DataRow Then
                    Dim CommitmentInfo As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                    Dim txtContactFirstName As TextBox = TryCast(e.Row.FindControl("txtContactFirstName"), TextBox)
                    Dim txtContactLastName As TextBox = TryCast(e.Row.FindControl("txtContactLastName"), TextBox)
                    Dim txtContactPhoneNumber As TextBox = TryCast(e.Row.FindControl("txtContactPhoneNumber"), TextBox)
                    Dim txtContactsEmail As EmailTextBox = TryCast(e.Row.FindControl("txtContactsEmail"), EmailTextBox)
                    Dim txtDirectImpacts As STKNumericTextBox = TryCast(e.Row.FindControl("txtDirectImpacts"), STKNumericTextBox)
                    Dim txtIndirectImpacts As STKNumericTextBox = TryCast(e.Row.FindControl("txtIndirectImpacts"), STKNumericTextBox)
                    Dim txtCommitmentDescription As TextBox = TryCast(e.Row.FindControl("txtCommitmentDescription"), TextBox)
                    Dim ddlOtherContributions As ddlSelectorControl = TryCast(e.Row.FindControl("ddlOtherContributions"), ddlSelectorControl)
                    Dim txtCommitmentDetails As TextBox = TryCast(e.Row.FindControl("txtCommitmentDetails"), TextBox)

                    txtContactFirstName.Text = CommitmentInfo("ContactpersonFname")
                    txtContactLastName.Text = CommitmentInfo("ContactPersonLname")
                    txtContactPhoneNumber.Text = CommitmentInfo("ContactPersonPhoneno")
                    txtContactsEmail.Text = CommitmentInfo("Contactpersonemail")
                    txtDirectImpacts.Value = CommitmentInfo("Noimpacteddirectly")
                    txtIndirectImpacts.Value = CommitmentInfo("Noimpactedindirectly")
                    txtCommitmentDescription.Text = CommitmentInfo("Commitmentdescription")
                    ddlOtherContributions.GroupId = StaticDataEnum.OtherContibutionsMade
                    ddlOtherContributions.SelectedItemId = CommitmentInfo("OtherContributions")
                    ddlOtherContributions.BindData()
                    txtCommitmentDetails.Text = CommitmentInfo("Other")

                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Protected Sub btnNewCommitment_Click(sender As Object, e As EventArgs)
            Try

                GGBCRegNo = Me.MenteeId
                ComittmentCategory = ddlCommitmentCategory.SelectedItemId
                ProgressReportCompleted = ddlProgressReportStatus.SelectedItemId
                If IsNumeric(dtYearRegistered.YearValue) Then
                    Dim dt As String = "1 Jan " + dtYearRegistered.YearValue
                    YearRegistered = CDate(dt)
                Else
                    YearRegistered = CDate("1 Jan 1900")
                End If

                If dtAnnRenewalDate.SelectedDate.HasValue Then
                    annualrenewaldate = dtAnnRenewalDate.SelectedDate
                Else
                    annualrenewaldate = CDate("1 Jan 1900")
                End If

                OrgName = txtOrganizationName.Text.Trim
                ContactpersonFname = txtContactsFName.Text.Trim
                ContactPersonLname = txtContactsLName.Text.Trim
                ContactPersonPhoneno = txtContactsPhoneNo.Text.Trim
                Contactpersonemail = txtContactsEmail.Text.Trim
                Commitmentdescription = txtCommitmentDescription.Text.Trim
                OtherContributions = ddlOtherContributions.SelectedItemId
                Other = txtContributionDetails.Text.Trim
                Noimpacteddirectly = txtDirectImpacts.Value
                noimpactedindirectly = txtIndirectImpacts.Value

                Dim intIdentity As Integer = Me.Save(False)

            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Private Sub ClearFields()
            Try
                ddlCommitmentCategory.SelectedItemId = 0
                ddlProgressReportStatus.SelectedItemId = 0
                ddlOtherContributions.SelectedItemId = 0
                dtYearRegistered.SelectedDate = Nothing
                dtAnnRenewalDate.SelectedDate = Nothing
                txtOrganizationName.Text = ""
                txtContactsFName.Text = ""
                txtContactsLName.Text = ""
                txtContactsPhoneNo.Text = ""
                txtContactsEmail.Text = ""
                txtCommitmentDescription.Text = ""
                txtContributionDetails.Text = ""
                txtDirectImpacts.Value = 0
                txtIndirectImpacts.Value = 0

                ddlCommitmentCategory.BindData()
                ddlProgressReportStatus.BindData()
                ddlOtherContributions.BindData()
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Private Sub ResetFieldValues()
            Try
                GGBCRegNo = ""
                commitmentId = 0
                ComittmentCategory = 0
                ProgressReportCompleted = 0
                YearRegistered = Nothing
                annualrenewaldate = Nothing
                OrgName = ""
                ContactpersonFname = ""
                ContactPersonLname = ""
                ContactPersonPhoneno = ""
                Contactpersonemail = ""
                Commitmentdescription = ""
                OtherContributions = 0
                Other = ""
                Noimpacteddirectly = 0
                noimpactedindirectly = 0
                IsEdit = 0
            Catch ex As Exception
                Throw ex
            End Try
        End Sub


        Private Function Save(blnEdit As Integer) As Integer
            Try
                Dim sqlCmdSaveRecs As New SqlClient.SqlCommand

                If blnEdit Then
                    IsEdit = 1
                Else
                    IsEdit = 0
                End If

                sqlCmdSaveRecs.Parameters.AddWithValue("@GGBCRegNo", GGBCRegNo)
                sqlCmdSaveRecs.Parameters.AddWithValue("@CommitID", commitmentId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ComittmentCategory", ComittmentCategory)
                sqlCmdSaveRecs.Parameters.AddWithValue("@YearRegistered", YearRegistered)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ProgressReportCompleted", ProgressReportCompleted)
                sqlCmdSaveRecs.Parameters.AddWithValue("@OrgName", OrgName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@annualrenewaldate", annualrenewaldate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ContactpersonFname", ContactpersonFname)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ContactPersonLname", ContactPersonLname)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ContactPersonPhoneno", ContactPersonPhoneno)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Contactpersonemail", Contactpersonemail)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Commitmentdescription", Commitmentdescription)
                sqlCmdSaveRecs.Parameters.AddWithValue("@OtherContributions", OtherContributions)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Other", Other)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Noimpacteddirectly", Noimpacteddirectly)
                sqlCmdSaveRecs.Parameters.AddWithValue("@noimpactedindirectly", noimpactedindirectly)
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsEdit", IsEdit)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_AddEditCommitmentInfo", sqlCmdSaveRecs)

                ResetFieldValues()
                If IsEdit = 0 Then
                    ClearFields()
                End If
                BindGrid()
                Return intIdentity
            Catch ex As Exception
                Throw ex
            End Try
        End Function

#Region "Fields"

        Dim GGBCRegNo As String = ""
        Dim commitmentId As Integer
        Dim ComittmentCategory As Integer
        Dim ProgressReportCompleted As Integer
        Dim YearRegistered, annualrenewaldate As Date
        Dim OrgName As String = ""
        Dim ContactpersonFname As String = ""
        Dim ContactPersonLname As String = ""
        Dim ContactPersonPhoneno As String = ""
        Dim Contactpersonemail As String = ""
        Dim Commitmentdescription As String = ""
        Dim OtherContributions As Integer
        Dim Other As String = ""
        Dim Noimpacteddirectly As Integer
        Dim noimpactedindirectly As Integer
        Dim IsEdit As Integer

#End Region
        Public ReadOnly Property MenteeId As Integer
            Get
                Return CommonHelper.QueryStringInt("MenteeId")
            End Get
        End Property

    End Class
End Namespace