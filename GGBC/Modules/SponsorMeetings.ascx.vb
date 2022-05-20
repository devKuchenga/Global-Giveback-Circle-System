Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class SponsorMeetingsControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindGrid()
            End If
        End Sub

        Private Sub BindGrid()
            ddlMeetingOutcome.GroupId = StaticDataEnum.MeetingOutcome
            ddlMeetingOutcome.BindData()

            ctrlMeetingDate.SelectedDate = DateTime.UtcNow
            ctrlNewFulfilmentDate.SelectedDate = DateTime.UtcNow

            gvSponsorMeetings.DataSource = Me.DataAccessManager.GGBCGetData("sp_findpartnermeeting", "@PartnerId", Me.SponsorId)
            gvSponsorMeetings.DataBind()
        End Sub

        Protected Sub gvSponsorMeetings_RowDatabound(sender As Object, e As GridViewRowEventArgs)
            If e.Row.RowType = DataControlRowType.DataRow Then
                Dim Meeting As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                Dim btnUpdate As Button = TryCast(e.Row.FindControl("btnUpdate"), Button)
                Dim ctrlMeetingDate As DatePicker = TryCast(e.Row.FindControl("ctrlMeetingDate"), DatePicker)
                Dim hfMeetingId As HiddenField = TryCast(e.Row.FindControl("hfMeetingId"), HiddenField)
                Dim ddlMeetingOutcome As ddlSelectorControl = TryCast(e.Row.FindControl("ddlMeetingOutcome"), ddlSelectorControl)
                Dim txtAttendees As TextBox = TryCast(e.Row.FindControl("txtAttendees"), TextBox)
                Dim txtNotes As TextBox = TryCast(e.Row.FindControl("txtNotes"), TextBox)
                Dim ctrlFulfilmentDate As DatePicker = TryCast(e.Row.FindControl("ctrlFulfilmentDate"), DatePicker)

                If btnUpdate IsNot Nothing Then
                    btnUpdate.CommandArgument = e.Row.RowIndex.ToString()
                End If

                If ctrlMeetingDate IsNot Nothing Then
                    ctrlMeetingDate.SelectedDate = Meeting.Item("MeetingDate")
                End If

                If hfMeetingId IsNot Nothing Then
                    hfMeetingId.Value = Meeting.Item("MeetingID")
                End If

                If ddlMeetingOutcome IsNot Nothing Then
                    ddlMeetingOutcome.GroupId = StaticDataEnum.MeetingOutcome

                    ddlMeetingOutcome.SelectedItemId = Meeting.Item("MeetingOutcome")
                    ddlMeetingOutcome.BindData()
                End If

                If txtAttendees IsNot Nothing Then
                    txtAttendees.Text = Meeting.Item("Attendees")
                End If

                If txtNotes IsNot Nothing Then
                    txtNotes.Text = Meeting.Item("MeetingNotes")
                End If

                If ctrlFulfilmentDate IsNot Nothing Then
                    ctrlFulfilmentDate.SelectedDate = Meeting.Item("DateofFulfillment")
                End If

            End If
        End Sub

        Protected Sub gvSponsorMeetings_RowCommand(sender As Object, e As GridViewCommandEventArgs)
            If e.CommandName = "UpdateMeeting" Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                Dim row As GridViewRow = gvSponsorMeetings.Rows(index)

                Dim btnUpdate As Button = TryCast(row.FindControl("btnUpdate"), Button)
                Dim ctrlMeetingDate As DatePicker = TryCast(row.FindControl("ctrlMeetingDate"), DatePicker)
                Dim hfMeetingId As HiddenField = TryCast(row.FindControl("hfMeetingId"), HiddenField)
                Dim ddlMeetingOutcome As ddlSelectorControl = TryCast(row.FindControl("ddlMeetingOutcome"), ddlSelectorControl)
                Dim txtAttendees As TextBox = TryCast(row.FindControl("txtAttendees"), TextBox)
                Dim txtNotes As TextBox = TryCast(row.FindControl("txtNotes"), TextBox)
                Dim ctrlFulfilmentDate As DatePicker = TryCast(row.FindControl("ctrlFulfilmentDate"), DatePicker)

                Dim MeetingId As Integer = Integer.Parse(hfMeetingId.Value)
                Dim MeetingDate As Date = Date.Parse(ctrlMeetingDate.SelectedDate)
                Dim MeetingOutcome As Integer = ddlMeetingOutcome.SelectedItemId.ToString
                Dim Attendees As String = txtAttendees.Text.Trim
                Dim MeetingNotes As String = txtNotes.Text.Trim
                Dim FulfilmentDate As Date = Date.Parse(ctrlFulfilmentDate.SelectedDate)

                Dim sqlCmdSaveRecs As New SqlClient.SqlCommand

                Dim isEdit As Integer = 0

                sqlCmdSaveRecs.Parameters.AddWithValue("@MeetingID", MeetingId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@PartnerID", Me.SponsorId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MeetingDate", MeetingDate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MeetingOutcome", MeetingOutcome)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateofFulfillment", FulfilmentDate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Attendees", Attendees)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MeetingNotes", MeetingNotes)
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsEdit", 1)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_AddEditMeetings", sqlCmdSaveRecs)

                BindGrid()
            End If
        End Sub

        Protected Sub gvSponsorMeetings_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)

        End Sub

        Protected Sub gvSponsorMeetings_PageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
            Me.gvSponsorMeetings.PageIndex = e.NewPageIndex
            BindGrid()
        End Sub

        Protected Sub btnNewMeeting_Click(sender As Object, e As EventArgs)
            Try
                Dim MeetingDate As Nullable(Of Date) = ctrlMeetingDate.SelectedDate
                Dim MeetingOutcome As Integer = ddlMeetingOutcome.SelectedItemId.ToString
                Dim Attendees As String = txtAttendees.Text.Trim
                Dim MeetingNotes As String = txtNotes.Text.Trim
                Dim FulfilmentDate As Nullable(Of DateTime) = Date.Parse(ctrlNewFulfilmentDate.SelectedDate)

                Dim sqlCmdSaveRecs As New SqlClient.SqlCommand

                Dim isEdit As Integer = 0

                sqlCmdSaveRecs.Parameters.AddWithValue("@MeetingID", 0)
                sqlCmdSaveRecs.Parameters.AddWithValue("@PartnerID", Me.SponsorId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MeetingDate", MeetingDate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MeetingOutcome", MeetingOutcome)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateofFulfillment", FulfilmentDate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Attendees", Attendees)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MeetingNotes", MeetingNotes)
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsEdit", 0)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_AddEditMeetings", sqlCmdSaveRecs)

                ClearFields()

                BindGrid()
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Private Sub ClearFields()
            txtAttendees.Text = ""
            txtNotes.Text = ""
        End Sub

        Public ReadOnly Property SponsorId() As Integer
            Get
                Return CommonHelper.QueryStringInt("SponsorId")
            End Get
        End Property
    End Class
End Namespace