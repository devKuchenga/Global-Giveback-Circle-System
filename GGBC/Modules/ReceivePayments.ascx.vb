Imports System.Data
Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class ReceivePaymentsControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindData()
            End If
        End Sub

        Private Sub BindData()
            Try
                setGrantHeader()
                gvGrantPayments.DataSource = Me.DataAccessManager.GGBCGetData("sp_GetSponsorGrantPayment", "@SponsorgrantID", Me.SponsorGrantId)
                gvGrantPayments.DataBind()
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Private Sub setGrantHeader()
            Try
                ctrlNewPaymentDate.SelectedDate = DateTime.UtcNow
                Dim dtGrantHeader As DataTable = Me.DataAccessManager.GGBCGetData("sp_GetGrantHeader", "@SponsorgrantID", Me.SponsorGrantId)
                If dtGrantHeader.Rows.Count > 0 Then
                    With dtGrantHeader(0)
                        hfSponsorId.Value = .Item("SponsorID")
                        hfSponsorName.Value = .Item("SponsorFullName") & " ID: " & hfSponsorId.Value
                        lblMatchAgreedAmount.Text = FormatNumber(.Item("MatchAgreedAmount"), 2)
                        lblExistingBalance.Text = FormatNumber(.Item("CurrentBalance"), 2)
                        lblNewBalance.Text = FormatNumber(.Item("CurrentBalance"), 2)
                        hlExit.NavigateUrl = Me.GrantesURL
                    End With
                End If

            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Protected Sub gvGrantPayments_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
            If e.Row.RowType = DataControlRowType.DataRow Then
                Dim GrantPayment As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                Dim lblDatePosted As Label = TryCast(e.Row.FindControl("lblDatePosted"), Label)
                Dim lblDateOfPayment As Label = TryCast(e.Row.FindControl("lblDateOfPayment"), Label)
                Dim lblAmountReceived As Label = TryCast(e.Row.FindControl("lblAmountReceived"), Label)
                Dim lblBalance As Label = TryCast(e.Row.FindControl("lblBalance"), Label)
                Dim lblPostedBy As Label = TryCast(e.Row.FindControl("lblPostedBy"), Label)

                lblDatePosted.Text = String.Format("{0: dd MMM yyyy HH:mm}", GrantPayment.Item("DatePosted"))
                lblDateOfPayment.Text = String.Format("{0: dd MMM yyyy}", GrantPayment.Item("DateReceived"))
                lblAmountReceived.Text = FormatNumber(GrantPayment("AmountReceived"), 2)
                lblBalance.Text = FormatNumber(GrantPayment("Balance"), 2)
                lblPostedBy.Text = GrantPayment("PostedBy")
            End If
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

                sqlCmdSaveRecs.Parameters.AddWithValue("@SponsorGrantID", Me.SponsorGrantId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateReceived", ctrlNewPaymentDate.SelectedDate.Value)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AmountReceived", CDbl(hfPaymentAmount.Value.Trim))
                sqlCmdSaveRecs.Parameters.AddWithValue("@DatePosted", DateTime.UtcNow.ToLongTimeString)
                sqlCmdSaveRecs.Parameters.AddWithValue("@PostedBy", CommonHelper.AppUser)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_PostGrantPayment", sqlCmdSaveRecs)

                'Return to invoices
                Response.Redirect(GrantesURL)

            Catch ex As Exception
                Throw ex
            End Try
        End Sub

#Region "Field Variables"

#End Region

        Private ReadOnly Property GrantesURL As String
            Get
                Return CommonHelper.GetSiteLocation & "SponsorGrants.aspx?SponsorId=" & hfSponsorId.Value.Trim
            End Get
        End Property

        Public ReadOnly Property SponsorGrantId As Integer
            Get
                Return CommonHelper.QueryStringInt("SponsorGrantId")
            End Get
        End Property

        Public ReadOnly Property SponsorName As String
            Get
                Return hfSponsorName.Value.Trim
            End Get
        End Property
    End Class
End Namespace