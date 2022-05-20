Imports Smartik.Ecom.Controls
Imports Smartik.Ecom.Common.Utils
Imports System.Data.SqlClient

Namespace Smartik.Administration.Modules
    Partial Public Class SponsorGrantControl
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
                ddlTypeOfPayment.BindData()
                ctrlBeginDate.SelectedDate = DateTime.UtcNow
                ctrlEndDate.SelectedDate = DateTime.UtcNow
                lblTitle.Text = Me.DataAccessManager.SponsorHeader(Me.SponsorId)
                gvGrants.DataSource = Me.DataAccessManager.GGBCGetData("sp_Getsponsorgrants", "@SponsorId", Me.SponsorId)
                Me.gvGrants.DataBind()
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Protected Sub gvGrants_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
            Try
                If e.CommandName = "UpdateSponsorGrant" Then
                    Dim index As Integer = Convert.ToInt32(e.CommandArgument)

                    Dim SponsorGrant As GridViewRow = gvGrants.Rows(index)

                    Dim hfSponsorGrantId As HiddenField = TryCast(SponsorGrant.FindControl("hfSponsorGrantId"), HiddenField)
                    Dim txtMatchAmountAgreed As STKDecimalTextBox = TryCast(SponsorGrant.FindControl("txtMatchAmountAgreed"), STKDecimalTextBox)
                    Dim lblAmountBalance As Label = TryCast(SponsorGrant.FindControl("lblAmountBalance"), Label)
                    Dim ddlTypeOfPayment As ddlSelectorControl = TryCast(SponsorGrant.FindControl("ddlTypeOfPayment"), ddlSelectorControl)
                    Dim ctrlBeginDate As DatePicker = TryCast(SponsorGrant.FindControl("ctrlBeginDate"), DatePicker)
                    Dim ctrlEndDate As DatePicker = TryCast(SponsorGrant.FindControl("ctrlEndDate"), DatePicker)
                    Dim hlGrantBeneficiaries As HyperLink = TryCast(SponsorGrant.FindControl("hlGrantBeneficiaries"), HyperLink)
                    Dim hlGrantPayments As HyperLink = TryCast(SponsorGrant.FindControl("hlGrantPayments"), HyperLink)


                    dblAgreedgrantAmount = txtMatchAmountAgreed.Value
                    intPaymentInterval = ddlTypeOfPayment.SelectedItemId
                    dtBeginDate = ctrlBeginDate.SelectedDate.Value
                    dtEndDate = ctrlEndDate.SelectedDate.Value
                    Dim intSave As Integer = Me.Save(True)

                End If
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Protected Sub gvGrants_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
            If e.Row.RowType = DataControlRowType.DataRow Then
                Try
                    Dim SponsorGrant As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                    Dim btnUpdate As Button = TryCast(e.Row.FindControl("btnUpdate"), Button)
                    Dim hfSponsorGrantId As HiddenField = TryCast(e.Row.FindControl("hfSponsorGrantId"), HiddenField)
                    Dim txtMatchAmountAgreed As STKDecimalTextBox = TryCast(e.Row.FindControl("txtMatchAmountAgreed"), STKDecimalTextBox)
                    Dim lblAmountBalance As Label = TryCast(e.Row.FindControl("lblAmountBalance"), Label)
                    Dim ddlTypeOfPayment As ddlSelectorControl = TryCast(e.Row.FindControl("ddlTypeOfPayment"), ddlSelectorControl)
                    Dim ctrlBeginDate As DatePicker = TryCast(e.Row.FindControl("ctrlBeginDate"), DatePicker)
                    Dim ctrlEndDate As DatePicker = TryCast(e.Row.FindControl("ctrlEndDate"), DatePicker)
                    Dim hlGrantBeneficiaries As HyperLink = TryCast(e.Row.FindControl("hlGrantBeneficiaries"), HyperLink)
                    Dim hlPayments As HyperLink = TryCast(e.Row.FindControl("hlPayments"), HyperLink)

                    If btnUpdate IsNot Nothing Then
                        btnUpdate.CommandArgument = e.Row.RowIndex.ToString()
                    End If
                    ddlTypeOfPayment.GroupId = StaticDataEnum.PeriodFrequency

                    hfSponsorGrantId.Value = SponsorGrant("SponsorgrantID")
                    txtMatchAmountAgreed.Value = SponsorGrant("AgreedGrantAmount")
                    lblAmountBalance.Text = FormatNumber(SponsorGrant("AmountBalance"), 2)
                    ddlTypeOfPayment.SelectedItemId = SponsorGrant("Typeofpayment")
                    ctrlBeginDate.SelectedDate = SponsorGrant("BeginDate")
                    ctrlEndDate.SelectedDate = SponsorGrant("EndDate")
                    hlGrantBeneficiaries.NavigateUrl = String.Format("{0}GrantBeneficiary.aspx?SponsorGrantId={1}&SponsorId={2}", CommonHelper.GetSiteLocation(), hfSponsorGrantId.Value, Me.SponsorId)
                    hlPayments.NavigateUrl = String.Format("{0}PostSponsorPayment.aspx?SponsorGrantId={1}", CommonHelper.GetSiteLocation(), hfSponsorGrantId.Value)

                    ddlTypeOfPayment.BindData()
                Catch ex As Exception
                    Throw ex
                End Try
            End If
        End Sub
        Protected Sub btnNewGrant_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try
                dblAgreedgrantAmount = txtMatchAmountAgreed.Value
                intPaymentInterval = ddlTypeOfPayment.SelectedItemId
                dtBeginDate = ctrlBeginDate.SelectedDate.Value
                dtEndDate = ctrlEndDate.SelectedDate.Value
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
                sqlCmdSaveRecs.Parameters.AddWithValue("@SponsorgrantID", intSponsorgrantId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@SponsorID", Me.SponsorId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AgreedgrantAmount", dblAgreedgrantAmount)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Typeofpayment", intPaymentInterval)
                sqlCmdSaveRecs.Parameters.AddWithValue("@BeginDate", dtBeginDate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@EndDate", dtEndDate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateCreated", DateTime.UtcNow)
                sqlCmdSaveRecs.Parameters.AddWithValue("@CreatedBy", CommonHelper.AppUser)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DateModified", DateTime.UtcNow)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ModifiedBy", CommonHelper.AppUser)
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsEdit", intEdit)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_AddEditSponsorGrantInfo", sqlCmdSaveRecs)

                BindData()

                Return intIdentity

            Catch ex As Exception
                Throw ex
            End Try
        End Function

#Region "Field variables"

        Dim intSponsorgrantId As Integer
        Dim dblAgreedgrantAmount As Double
        Dim intPaymentInterval As Integer
        Dim dtBeginDate As DateTime
        Dim dtEndDate As DateTime
#End Region

        Public ReadOnly Property SponsorId As Integer
            Get
                Return CommonHelper.QueryString("SponsorId")
            End Get
        End Property
    End Class
End Namespace