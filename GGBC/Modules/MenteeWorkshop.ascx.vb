Imports Smartik.Ecom.Common.Utils
Imports System.Web.UI.WebControls
Imports Smartik.Ecom.Controls

Namespace Smartik.Administration.Modules
    Partial Public Class MenteeWorkshopControl
        Inherits BaseSTKAdministrationUserControl

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
                ddlWorkshopTitle = SEOHelper.LoadWorkshops(ddlWorkshopTitle, -1)
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Private Sub BindGrid()
            Try
                gvWorkshop.DataSource = Me.DataAccessManager.GGBCGetData("sp_FindMenteeWorkshop", "@GBBCRegNo", Me.MenteeId)
                gvWorkshop.DataBind()
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Protected Sub gvWorkshop_RowCommand(sender As Object, e As GridViewCommandEventArgs)
            Try
                If e.CommandName = "UpdateWorkshop" Then
                    Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                    Dim WorkshopInfo As GridViewRow = gvWorkshop.Rows(index)
                    Dim hfMenteeWorkshopId As HiddenField = TryCast(WorkshopInfo.FindControl("hfMenteeWorkshopId"), HiddenField)
                    Dim ddlWorkshopTitle As DropDownList = TryCast(WorkshopInfo.FindControl("ddlWorkshopTitle"), DropDownList)
                    Dim dtWorkshopDate As DatePicker = TryCast(WorkshopInfo.FindControl("dtWorkshopDate"), DatePicker)
                    Dim cbAttended As CheckBox = TryCast(WorkshopInfo.FindControl("cbAttended"), CheckBox)
                    Dim txtNoAttendReason As TextBox = TryCast(WorkshopInfo.FindControl("txtNoAttendReason"), TextBox)

                    intMenteeWorkshopId = CInt(hfMenteeWorkshopId.Value)
                    intWorkShopId = CInt(ddlWorkshopTitle.SelectedValue)
                    strWorkshopName = ddlWorkshopTitle.SelectedItem.Text
                    dWorkshopDate = dtWorkshopDate.SelectedDate
                    blnAttended = cbAttended.Checked
                    strReasonNotAtteded = txtNoAttendReason.Text.Trim

                    Save(True)


                End If
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Protected Sub gvWorkshop_RowDataBound(sender As Object, e As GridViewRowEventArgs)
            Try
                If e.Row.RowType = DataControlRowType.DataRow Then
                    Dim WorkshopInfo As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                    Dim btnUpdate As Button = TryCast(e.Row.FindControl("btnUpdate"), Button)
                    Dim ddlWorkshopTitle As DropDownList = TryCast(e.Row.FindControl("ddlWorkshopTitle"), DropDownList)
                    Dim dtWorkshopDate As DatePicker = TryCast(e.Row.FindControl("dtWorkshopDate"), DatePicker)
                    Dim cbAttended As CheckBox = TryCast(e.Row.FindControl("cbAttended"), CheckBox)
                    Dim txtNoAttendReason As TextBox = TryCast(e.Row.FindControl("txtNoAttendReason"), TextBox)

                    If btnUpdate IsNot Nothing Then
                        btnUpdate.CommandArgument = e.Row.RowIndex.ToString()
                    End If

                    Dim intSelectedWorkshop As Integer = CInt(WorkshopInfo("WorkshopId"))
                    ddlWorkshopTitle = SEOHelper.LoadWorkshops(ddlWorkshopTitle, intSelectedWorkshop)
                    dtWorkshopDate.SelectedDate = WorkshopInfo("WorkshopDate")
                    cbAttended.Checked = WorkshopInfo("Attended")
                    txtNoAttendReason.Text = WorkshopInfo("ReasonNotAttended")
                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Protected Sub btnNewWorkshopInfo_Click(sender As Object, e As EventArgs)
            Try
                If ddlWorkshopTitle.SelectedItem Is Nothing Then
                    Throw New ArgumentException("Please select a workshop Title")
                End If
                If Not dtWorkshopDate.SelectedDate.HasValue Then
                    Throw New ArgumentException("Please select workshop date")
                End If

                intWorkShopId = CInt(ddlWorkshopTitle.SelectedValue)
                strWorkshopName = ddlWorkshopTitle.SelectedItem.Text.Trim
                dWorkshopDate = dtWorkshopDate.SelectedDate
                blnAttended = cbAttended.Checked
                strReasonNotAtteded = txtNoAttendReason.Text.Trim

                Save(False)
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Private Sub Save(blnEdit As Integer)
            Try
                Dim sqlCmdSaveRecs As New SqlClient.SqlCommand


                Dim isEdit As Integer = 0
                If blnEdit Then
                    isEdit = 1
                Else

                End If

                sqlCmdSaveRecs.Parameters.AddWithValue("@GBBCRegNo", Me.MenteeId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MenteeWorkshopId", intMenteeWorkshopId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@WorkshopId", intWorkShopId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@WorkshopTitle", strWorkshopName)
                sqlCmdSaveRecs.Parameters.AddWithValue("@WorkshopDate", dWorkshopDate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Attended", blnAttended)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ReasonNotAttended", strReasonNotAtteded)
                If Not blnEdit Then
                    sqlCmdSaveRecs.Parameters.AddWithValue("@CreateDate", Date.UtcNow.Date)
                    sqlCmdSaveRecs.Parameters.AddWithValue("@CreatedBy", HttpContext.Current.User.Identity.Name)
                Else
                    sqlCmdSaveRecs.Parameters.AddWithValue("@AmendBy", HttpContext.Current.User.Identity.Name)
                    sqlCmdSaveRecs.Parameters.AddWithValue("@AmendDate", Date.UtcNow.Date)
                End If
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsEdit", isEdit)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_AddEditMenteeWorkshop", sqlCmdSaveRecs)

                BindGrid()
                If Not blnEdit Then
                    ClearFields()
                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        'Private Sub ValidateEntry(b

#Region "Fields"
        Public Sub ClearFields()
            ddlWorkshopTitle = SEOHelper.LoadWorkshops(ddlWorkshopTitle, -1)
            cbAttended.Checked = False
            txtNoAttendReason.Text = ""
            dtWorkshopDate.SelectedDate = Nothing
        End Sub

        Dim intMenteeWorkshopId As Integer
        Dim intWorkShopId As Integer
        Dim strWorkshopName As String = ""
        Dim dWorkshopDate As Date
        Dim blnAttended As Boolean
        Dim strReasonNotAtteded As String = ""

#End Region
        Public ReadOnly Property MenteeId As Integer
            Get
                Return CommonHelper.QueryStringInt("MenteeId")
            End Get
        End Property
    End Class
End Namespace