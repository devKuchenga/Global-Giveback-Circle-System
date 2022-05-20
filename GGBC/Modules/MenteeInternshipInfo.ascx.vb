Imports Smartik.Ecom.Common.Utils
Imports System.Web.UI.WebControls
Imports Smartik.Ecom.Controls

Namespace Smartik.Administration.Modules
    Partial Public Class MenteeInternshipInfoControl
        Inherits BaseSTKAdministrationUserControl

        Dim dtInternship As DataTable = Nothing
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
                ddlIntershipCompany.SelectedCompanyId = -1
                ddlIntershipCompany.BindData()
            Catch ex As Exception
                Throw ex
            End Try
        End Sub


        Protected Sub gvInternship_RowCommand(sender As Object, e As GridViewCommandEventArgs)
            Try
                If e.CommandName = "UpdateInternship" Then
                    Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                    Dim Internshiprow As GridViewRow = gvInternship.Rows(index)
                    Dim gvSupervisor As GridView = TryCast(Internshiprow.FindControl("gvSupervisor"), GridView)
                    Dim SupervisorRow As GridViewRow = Nothing
                    If gvSupervisor IsNot Nothing Then
                        SupervisorRow = gvSupervisor.Rows(0)
                    End If

                    If SupervisorRow Is Nothing Then
                        Throw New ArgumentException("Supervisor info error")
                    End If

                    Dim btnUpdate As Button = TryCast(Internshiprow.FindControl("btnUpdate"), Button)

                    Dim hfInternshipId As HiddenField = TryCast(Internshiprow.FindControl("hfInternshipId"), HiddenField)
                    Dim ddlIntershipCompany As ddlCompanySelectorControl = TryCast(Internshiprow.FindControl("ddlIntershipCompany"), ddlCompanySelectorControl)
                    Dim txtDuration As STKNumericTextBox = TryCast(Internshiprow.FindControl("txtDuration"), STKNumericTextBox)
                    Dim cbPaid As CheckBox = TryCast(Internshiprow.FindControl("cbPaid"), CheckBox)
                    Dim txtNotes As TextBox = TryCast(Internshiprow.FindControl("txtNotes"), TextBox)



                    Dim txtSupFirstName As TextBox = TryCast(SupervisorRow.FindControl("txtSupFirstName"), TextBox)
                    Dim txtSupLastName As TextBox = TryCast(SupervisorRow.FindControl("txtSupLastName"), TextBox)
                    Dim txtSupTitle As TextBox = TryCast(SupervisorRow.FindControl("txtSupTitle"), TextBox)
                    Dim txtSupPhoneNumber As TextBox = TryCast(SupervisorRow.FindControl("txtSupPhoneNumber"), TextBox)
                    Dim txtSupEmail As TextBox = TryCast(SupervisorRow.FindControl("txtSupEmail"), TextBox)


                    'Dim dtIntern As DataTable = Me.DataAccessManager.GGBCGetData("sp_FindInternshipById", "@InternshipId", CInt(hfInternshipId.Value))

                    'If dtIntern.Rows.Count > 0 Then
                    '    With dtIntern(0)
                    '        strSupFirstName = GetCurrent(.Item("SupervisorFname"), txtSupFirstName.Text.Trim)
                    '        strSupLastName = GetCurrent(.Item("SupervisorLname"), txtSupLastName.Text.Trim)
                    '        strSupTitle = GetCurrent(.Item("Title"), txtSupTitle.Text.Trim)
                    '        strSupPhoneNo = GetCurrent(.Item("Supervisorphoneno"), txtSupPhoneNumber.Text.Trim)
                    '        strSupEmail = GetCurrent(.Item("Supervisoremail"), txtSupEmail.Text.Trim)

                    '    End With
                    'End If
                    strSupFirstName = txtSupFirstName.Text.Trim
                    strSupLastName = txtSupLastName.Text.Trim
                    strSupTitle = txtSupTitle.Text.Trim
                    strSupPhoneNo = txtSupPhoneNumber.Text.Trim
                    strSupEmail = txtSupEmail.Text.Trim

                    intIntershipId = CInt(hfInternshipId.Value)
                    intInternshipCompany = ddlIntershipCompany.SelectedCompanyId
                    strDuration = txtDuration.Value.ToString.Trim
                    blnPaid = cbPaid.Checked
                    strInternshipNotes = txtNotes.Text.Trim

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
                dtInternship = Me.DataAccessManager.GGBCGetData("Sp_FindMenteeInternships", "@GGBCRegID", Me.MenteeId)
                gvInternship.DataSource = dtInternship
                gvInternship.DataBind()
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Protected Sub gvInternship_RowDataBound(sender As Object, e As GridViewRowEventArgs)
            Try
                If e.Row.RowType = DataControlRowType.DataRow Then
                    Dim InternshipInfo As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                    Dim btnUpdate As Button = TryCast(e.Row.FindControl("btnUpdate"), Button)
                    Dim ddlIntershipCompany As ddlCompanySelectorControl = TryCast(e.Row.FindControl("ddlIntershipCompany"), ddlCompanySelectorControl)
                    Dim txtDuration As STKNumericTextBox = TryCast(e.Row.FindControl("txtDuration"), STKNumericTextBox)
                    Dim txtNotes As TextBox = TryCast(e.Row.FindControl("txtNotes"), TextBox)
                    Dim cbPaid As CheckBox = TryCast(e.Row.FindControl("cbPaid"), CheckBox)

                    If ddlIntershipCompany IsNot Nothing Then
                        ddlIntershipCompany.SelectedCompanyId = InternshipInfo("InternshipCompany")
                        ddlIntershipCompany.BindData()

                    End If


                    If btnUpdate IsNot Nothing Then
                        btnUpdate.CommandArgument = e.Row.RowIndex.ToString()
                    End If

                    txtDuration.Value = InternshipInfo("Duration")
                    txtNotes.Text = InternshipInfo("InternNotes")


                    cbPaid.Checked = InternshipInfo("Paid")

                    Dim internshipId As Integer = InternshipInfo("InternshipId")
                    Dim gvSupervisor As GridView = TryCast(e.Row.FindControl("gvSupervisor"), GridView)

                    dtInternship.DefaultView.RowFilter = "InternshipId = " & internshipId
                    If gvSupervisor IsNot Nothing AndAlso internshipId > 0 Then
                        gvSupervisor.DataSource = dtInternship
                        gvSupervisor.DataBind()
                    End If

                    dtInternship.DefaultView.RowFilter = ""

                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Protected Sub gvSupervisor_RowDataBound(sender As Object, e As GridViewRowEventArgs)
            Try
                If e.Row.RowType = DataControlRowType.DataRow Then
                    Dim InternshipInfo As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                    Dim txtSupFirstName As TextBox = TryCast(e.Row.FindControl("txtSupFirstName"), TextBox)
                    Dim txtSupLastName As TextBox = TryCast(e.Row.FindControl("txtSupLastName"), TextBox)
                    Dim txtSupTitle As TextBox = TryCast(e.Row.FindControl("txtSupTitle"), TextBox)
                    Dim txtSupPhoneNumber As TextBox = TryCast(e.Row.FindControl("txtSupPhoneNumber"), TextBox)
                    Dim txtSupEmail As TextBox = TryCast(e.Row.FindControl("txtSupEmail"), TextBox)

                    txtSupFirstName.Text = InternshipInfo("SupervisorFname")
                    txtSupLastName.Text = InternshipInfo("SupervisorLname")
                    txtSupTitle.Text = InternshipInfo("Title")
                    txtSupPhoneNumber.Text = InternshipInfo("Supervisorphoneno")
                    txtSupEmail.Text = InternshipInfo("Supervisoremail")

                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Protected Sub btnNewInternship_Click(sender As Object, e As EventArgs)
            Try
                intInternshipCompany = ddlIntershipCompany.SelectedCompanyId
                strDuration = txtDuration.Value.ToString
                blnPaid = cbPaid.Checked
                strInternshipNotes = txtNotes.Text.Trim
                strSupFirstName = txtSupFirstName.Text.Trim
                strSupLastName = txtSupLastName.Text.Trim
                strSupTitle = txtSupTitle.Text.Trim
                strSupPhoneNo = txtSupPhoneNumber.Text.Trim
                strSupEmail = txtSupEmail.Text.Trim

                Dim intIdentity As Integer = Me.Save(False)
                ClearFields()

            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Private Sub ClearFields()
            ddlIntershipCompany.SelectedCompanyId = -1
            txtDuration.Value = 1
            cbPaid.Checked = False
            txtNotes.Text = String.Empty
            txtSupFirstName.Text = String.Empty
            txtSupLastName.Text = String.Empty
            txtSupPhoneNumber.Text = String.Empty
            txtSupEmail.Text = String.Empty
        End Sub

        Private Function Save(blnEdit As Integer) As Integer
            Try
                Dim sqlCmdSaveRecs As New SqlClient.SqlCommand


                Dim isEdit As Integer = 0
                If blnEdit Then
                    isEdit = 1
                End If

                sqlCmdSaveRecs.Parameters.AddWithValue("@internshipID", intIntershipId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@GGBCRegid", Me.MenteeId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@internshipCompany", intInternshipCompany)
                sqlCmdSaveRecs.Parameters.AddWithValue("@duration", strDuration)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Paid", blnPaid)
                sqlCmdSaveRecs.Parameters.AddWithValue("@InternNotes", strInternshipNotes)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Supervisorfname", strSupFirstName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@SupervisorLname", strSupLastName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Title", strSupTitle)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Supervisorphoneno", strSupPhoneNo)
                sqlCmdSaveRecs.Parameters.AddWithValue("@SupervisorEmail", strSupEmail)
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsEdit", isEdit)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_addEditinternshipinfo", sqlCmdSaveRecs)

                BindGrid()

                Return intIdentity
            Catch ex As Exception
                Throw ex
            End Try
        End Function

#Region "Fields"

        Dim intIntershipId As Integer
        Dim intInternshipCompany As Integer
        Dim strDuration As String = ""
        Dim blnPaid As Boolean
        Dim strInternshipNotes As String = ""
        Dim strSupFirstName As String = ""
        Dim strSupLastName As String = ""
        Dim strSupTitle As String = ""
        Dim strSupPhoneNo As String = ""
        Dim strSupEmail As String = ""
#End Region
        Public ReadOnly Property MenteeId As Integer
            Get
                Return CommonHelper.QueryStringInt("MenteeId")
            End Get
        End Property
    End Class
End Namespace