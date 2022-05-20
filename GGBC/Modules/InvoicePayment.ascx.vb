Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class InvoicePaymentControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindData()
            End If
        End Sub

        Private Sub BindData()
            Try
                setInvoiceHeader()
                gvInvoicePayments.DataSource = Me.DataAccessManager.GGBCGetData("sp_GetMentorInvPayments", "@InvoiceID", Me.InvoiceId)
                gvInvoicePayments.DataBind()
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Private Sub setInvoiceHeader()
            Try
                ctrlNewPaymentDate.SelectedDate = DateTime.UtcNow
                Dim dtInvoiceHeader As DataTable = Me.DataAccessManager.GGBCGetData("sp_GetInvoiceHeader", "@InvoiceID", Me.InvoiceId)
                If dtInvoiceHeader.Rows.Count > 0 Then
                    With dtInvoiceHeader(0)
                        hfMentorId.Value = .Item("MentorID")
                        hfMentorName.Value = .Item("MentorFullName") & " ID: " & hfMentorId.Value
                        lblMatchAgreedAmount.Text = FormatNumber(.Item("MatchAgreedAmount"), 2)
                        lblExistingBalance.Text = FormatNumber(.Item("CurrentBalance"), 2)
                        lblNewBalance.Text = FormatNumber(.Item("CurrentBalance"), 2)
                        hlExit.NavigateUrl = Me.InvoicesURL
                    End With
                End If

            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Protected Sub gvInvoicePayments_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
            If e.Row.RowType = DataControlRowType.DataRow Then
                Dim invoicePayment As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                Dim lblDatePosted As Label = TryCast(e.Row.FindControl("lblDatePosted"), Label)
                Dim lblDateOfPayment As Label = TryCast(e.Row.FindControl("lblDateOfPayment"), Label)
                Dim lblAmountReceived As Label = TryCast(e.Row.FindControl("lblAmountReceived"), Label)
                Dim lblBalance As Label = TryCast(e.Row.FindControl("lblBalance"), Label)
                Dim lblPostedBy As Label = TryCast(e.Row.FindControl("lblPostedBy"), Label)

                lblDatePosted.Text = String.Format("{0: dd MMM yyyy HH:mm}", invoicePayment.Item("DatePosted"))
                lblDateOfPayment.Text = String.Format("{0: dd MMM yyyy}", invoicePayment.Item("DateReceived"))
                lblAmountReceived.Text = FormatNumber(invoicePayment("AmountReceived"), 2)
                lblBalance.Text = FormatNumber(invoicePayment("Balance"), 2)
                lblPostedBy.Text = invoicePayment("PostedBy")
            End If
        End Sub

        Protected Sub gvInvoicePayments_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)

        End Sub

        Protected Sub PostPayment_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try
                Me.Save()
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Private Sub Save()
            Try
                Dim sqlCmdSaveRecs As New SqlClient.SqlCommand

                sqlCmdSaveRecs.Parameters.AddWithValue("@InvoiceID", Me.InvoiceId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateReceived", ctrlNewPaymentDate.SelectedDate.Value)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AmountReceived", CDbl(hfPaymentAmount.Value.Trim))
                sqlCmdSaveRecs.Parameters.AddWithValue("@DatePosted", DateTime.UtcNow.ToLongTimeString)
                sqlCmdSaveRecs.Parameters.AddWithValue("@PostedBy", CommonHelper.AppUser)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_PostMentorPayment", sqlCmdSaveRecs)

                'Return to invoices
                Response.Redirect(InvoicesURL)

            Catch ex As Exception
                Throw ex
            End Try
        End Sub

#Region "Field Variables"

#End Region

        Private ReadOnly Property InvoicesURL As String
            Get
                Return CommonHelper.GetSiteLocation & "RaiseMentorInvoice.aspx?MentorId=" & hfMentorId.Value.Trim
            End Get
        End Property

        Public ReadOnly Property InvoiceId As Integer
            Get
                Return CommonHelper.QueryStringInt("InvoiceId")
            End Get
        End Property

        Public ReadOnly Property MentorName As String
            Get
                Return hfMentorName.Value.Trim
            End Get
        End Property

    End Class
End Namespace