Imports Smartik.Ecom.Controls
Imports Smartik.Ecom.Common.Utils
Imports System.Data.SqlClient

Namespace Smartik.Administration.Modules
    Partial Public Class RaiseMentorInvoiceControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                Me.BindData()
            End If
        End Sub

        Protected Sub BindData()
            Try
                txtMatchAmountAgreed.Value = 0
                ddlTypeOfPayment.GroupId = StaticDataEnum.PeriodFrequency
                ddlSubscriptionMethod.GroupId = StaticDataEnum.Methodofsubscription
                ddlTypeOfPayment.BindData()
                ddlSubscriptionMethod.BindData()
                ctrlPaymentYear.SelectedDate = DateTime.UtcNow
                txtOtherNotes.Text = ""
                lblTitle.Text = Me.DataAccessManager.MentorHeader(Me.MentorId)
                gvInvoices.DataSource = Me.DataAccessManager.GGBCGetData("sp_FindMentorInvoice", "@MentorId", Me.MentorId)
                Me.gvInvoices.DataBind()
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        

        Protected Sub gvInvoices_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
            Try
                If e.CommandName = "UpdateMentorInvoice" Then
                    Dim index As Integer = Convert.ToInt32(e.CommandArgument)

                    Dim InvoiceRow As GridViewRow = gvInvoices.Rows(index)

                    Dim txtMatchAmountAgreed As STKDecimalTextBox = TryCast(InvoiceRow.FindControl("txtMatchAmountAgreed"), STKDecimalTextBox)
                    Dim ddlTypeOfPayment As ddlSelectorControl = TryCast(InvoiceRow.FindControl("ddlTypeOfPayment"), ddlSelectorControl)
                    Dim ddlSubscriptionMethod As ddlSelectorControl = TryCast(InvoiceRow.FindControl("ddlSubscriptionMethod"), ddlSelectorControl)
                    Dim ctrlPaymentYear As STKDatePicker = TryCast(InvoiceRow.FindControl("ctrlPaymentYear"), STKDatePicker)
                    Dim txtOtherNotes As TextBox = TryCast(InvoiceRow.FindControl("txtOtherNotes"), TextBox)
                    Dim hlInvoicePayments As HyperLink = TryCast(InvoiceRow.FindControl("hlInvoicePayments"), HyperLink)
                    Dim hfInvoiceId As HiddenField = TryCast(InvoiceRow.FindControl("hfInvoiceId"), HiddenField)


                    intInvoiceId = CInt(hfInvoiceId.Value.Trim)
                    dblMatchAmountAgreed = txtMatchAmountAgreed.Value
                    intPaymentInterval = ddlTypeOfPayment.SelectedItemId
                    intPaymentMethod = ddlSubscriptionMethod.SelectedItemId
                    intPaymentYear = ctrlPaymentYear.YearValue
                    strOtherNotes = txtOtherNotes.Text.Trim

                    Dim intSave As Integer = Me.Save(True)

                End If
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Protected Sub gvInvoices_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
            If e.Row.RowType = DataControlRowType.DataRow Then
                Try
                    Dim InvoiceInfo As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                    Dim btnUpdate As Button = TryCast(e.Row.FindControl("btnUpdate"), Button)
                    Dim txtMatchAmountAgreed As STKDecimalTextBox = TryCast(e.Row.FindControl("txtMatchAmountAgreed"), STKDecimalTextBox)
                    Dim lblAmountBalance As Label = TryCast(e.Row.FindControl("lblAmountBalance"), Label)
                    Dim ddlTypeOfPayment As ddlSelectorControl = TryCast(e.Row.FindControl("ddlTypeOfPayment"), ddlSelectorControl)
                    Dim ddlSubscriptionMethod As ddlSelectorControl = TryCast(e.Row.FindControl("ddlSubscriptionMethod"), ddlSelectorControl)
                    Dim ctrlPaymentYear As STKDatePicker = TryCast(e.Row.FindControl("ctrlPaymentYear"), STKDatePicker)
                    Dim txtOtherNotes As TextBox = TryCast(e.Row.FindControl("txtOtherNotes"), TextBox)
                    Dim hlInvoicePayments As HyperLink = TryCast(e.Row.FindControl("hlInvoicePayments"), HyperLink)
                    Dim hfInvoiceId As HiddenField = TryCast(e.Row.FindControl("hfInvoiceId"), HiddenField)

                    If btnUpdate IsNot Nothing Then
                        btnUpdate.CommandArgument = e.Row.RowIndex.ToString()
                    End If
                    ddlTypeOfPayment.GroupId = StaticDataEnum.PeriodFrequency
                    ddlSubscriptionMethod.GroupId = StaticDataEnum.Methodofsubscription

                    txtMatchAmountAgreed.Value = FormatNumber(InvoiceInfo("Matchamtagreed"), 2)
                    lblAmountBalance.Text = FormatNumber(InvoiceInfo("AmountBalance"), 2)
                    ddlTypeOfPayment.SelectedItemId = InvoiceInfo("PaymentInterval")
                    ddlSubscriptionMethod.SelectedItemId = InvoiceInfo("PaymentMethod")
                    If InvoiceInfo("InvoiceYear") > 1900 Then
                        ctrlPaymentYear.YearValue = InvoiceInfo("InvoiceYear").ToString
                    Else
                        ctrlPaymentYear.YearValue = 0
                    End If
                    ddlTypeOfPayment.BindData()
                    ddlSubscriptionMethod.BindData()
                    txtOtherNotes.Text = InvoiceInfo("Notes")
                    hfInvoiceId.Value = InvoiceInfo("InvoiceID")
                    hlInvoicePayments.NavigateUrl = String.Format("{0}RaiseMentorInvoiceValues.aspx?InvoiceId={1}", CommonHelper.GetSiteLocation(), hfInvoiceId.Value)
                    hlInvoicePayments.Text = "View/Make Payments"

                Catch ex As Exception
                    Throw ex
                End Try
            End If
        End Sub

        Protected Sub btnNewInvoice_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try
                dblMatchAmountAgreed = txtMatchAmountAgreed.Value
                intPaymentInterval = ddlTypeOfPayment.SelectedItemId
                intPaymentMethod = ddlSubscriptionMethod.SelectedItemId
                If IsNumeric(ctrlPaymentYear.YearValue) Then
                    intPaymentYear = CInt(ctrlPaymentYear.YearValue)
                Else
                    intPaymentYear = 1900
                End If
                strOtherNotes = txtOtherNotes.Text.Trim
                Dim intSave As Integer = Me.Save(False)

            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub


        Private Function Save(ByVal blnIsEdit As Boolean) As Integer

            Dim sqlCmdSaveRecs As New SqlCommand

            Dim intEdit As Integer = 0

            If blnIsEdit Then
                intEdit = 1
            End If

            Try
                sqlCmdSaveRecs.Parameters.AddWithValue("@InvoiceId", intInvoiceId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@MentorID", Me.MentorId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Notes", strOtherNotes)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Matchamtagreed", dblMatchAmountAgreed)
                sqlCmdSaveRecs.Parameters.AddWithValue("@InvoiceYear", intPaymentYear)
                sqlCmdSaveRecs.Parameters.AddWithValue("@PaymentInterval", intPaymentInterval)
                sqlCmdSaveRecs.Parameters.AddWithValue("@PaymentMethod", intPaymentMethod)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateCreated", DateTime.UtcNow)
                sqlCmdSaveRecs.Parameters.AddWithValue("@CreatedBy", CommonHelper.AppUser)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateModified", DateTime.UtcNow)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ModifiedBy", CommonHelper.AppUser)
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsEdit", intEdit)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_AddEditMentorInvoice", sqlCmdSaveRecs)

                BindData()

                Return intIdentity

            Catch ex As Exception
                Throw ex
            End Try
        End Function


#Region "Field variables"

        Dim intInvoiceId As Integer
        Dim dblMatchAmountAgreed As Double
        Dim intPaymentInterval As Integer
        Dim intPaymentMethod As Integer
        Dim intPaymentYear As Integer
        Dim strOtherNotes As String = ""
#End Region

        Public ReadOnly Property MentorId As String
            Get
                Return CommonHelper.QueryString("MentorId")
            End Get
        End Property
    End Class
End Namespace