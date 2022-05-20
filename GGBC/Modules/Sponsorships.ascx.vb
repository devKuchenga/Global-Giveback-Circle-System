Imports System.Data
Imports System.Web.UI.WebControls
Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class SponsorshipsControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

            If Not Page.IsPostBack Then
                BindGrid()
            End If
        End Sub

        Private Sub BindGrid()
            Try
                Me.gvSponsorships.DataSource = Me.DataAccessManager.GGBCGetData("sp_GetsponsorgrantInfo", "@SponsorId", Me.SponsorId)
                gvSponsorships.DataBind()
            Catch ex As Exception
                Throw ex
            End Try
        End Sub
        Protected Sub btnRefreshPayments_Click(sender As Object, e As EventArgs)
            Me.BindGrid()
        End Sub

        Protected Sub btnRefreshBeneficiaries_Click(sender As Object, e As EventArgs)
            Me.BindGrid()
        End Sub

        Protected Sub gvSponsorships_RowDataBound(sender As Object, e As GridViewRowEventArgs)
            Try
                If e.Row.RowType = DataControlRowType.DataRow Then
                    Dim sponsorship As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                    Dim lPeriod As Literal = TryCast(e.Row.FindControl("lPeriod"), Literal)
                    Dim lAgreedAmount As Literal = TryCast(e.Row.FindControl("lAgreedAmount"), Literal)

                    If lAgreedAmount IsNot Nothing Then
                        Dim dblAgreedGrantAmount As Double = 0

                        If IsDBNull(sponsorship.Item("AgreedGrantAmount")) Then
                            dblAgreedGrantAmount = 0
                        Else
                            dblAgreedGrantAmount = sponsorship.Item("AgreedGrantAmount")
                        End If

                        If dblAgreedGrantAmount > 0 Then
                            lAgreedAmount.Text = FormatNumber(dblAgreedGrantAmount, 2)
                        Else
                            lAgreedAmount.Text = "N/A"
                        End If
                    End If

                    If lPeriod IsNot Nothing Then
                        Dim period As String = String.Format("{0: dd MMM yyyy }", sponsorship.Item("BeginDate"))
                        period += "-"
                        period += String.Format("{0: dd MMM yyyy }", sponsorship.Item("EndDate"))

                        If String.IsNullOrEmpty(period) Then
                            lPeriod.Text = "N/A"
                        Else
                            lPeriod.Text = period
                        End If

                    End If

                    'Beneficiaries
                    Dim gvBeneficiaries As GridView = TryCast(e.Row.FindControl("gvBeneficiaries"), GridView)
                    If gvBeneficiaries IsNot Nothing Then
                        gvBeneficiaries.DataSource = Me.DataAccessManager.GGBCGetData("sp_GetGrantBeneficiary", "@SponsorGrantId", sponsorship.Item("SponsorGrantId"), "@MappedOnly", True)
                        gvBeneficiaries.DataBind()
                    End If

                    'Payment History
                    Dim gvPaymentHistory As GridView = TryCast(e.Row.FindControl("gvPaymentHistory"), GridView)

                    If gvPaymentHistory IsNot Nothing Then
                        gvPaymentHistory.DataSource = Me.DataAccessManager.GGBCGetData("sp_GetSponsorGrantPayments", "@SponsorGrantId", sponsorship.Item("SponsorGrantId"))
                        gvPaymentHistory.DataBind()
                    End If

                    'Toggle buttons
                    'Dim btnShowBeneficiaries As Button = TryCast(e.Row.FindControl("btnShowBeneficiaries"), Button)
                    'Dim btnHideBeneficiaries As Button = TryCast(e.Row.FindControl("btnHideBeneficiaries"), Button)

                    Dim btnEditBeneficiariesList As Button = TryCast(e.Row.FindControl("btnEditBeneficiariesList"), Button)
                    Dim btnRefreshBeneficiaries As Button = TryCast(e.Row.FindControl("btnRefreshBeneficiaries"), Button)
                    If btnEditBeneficiariesList IsNot Nothing Then
                        btnEditBeneficiariesList.OnClientClick = String.Format("javascript:OpenWindow('GrantBeneficiary.aspx?SponsorGrantId={0}&BtnId={1}', 800, 600, true); return false;", sponsorship.Item("SponsorGrantId"), btnRefreshBeneficiaries.ClientID)
                    End If

                    Dim btnRefreshPayments As Button = TryCast(e.Row.FindControl("btnRefreshPayments"), Button)
                    Dim btnReceivePayment As Button = TryCast(e.Row.FindControl("btnReceivePayment"), Button)
                    If btnReceivePayment IsNot Nothing Then
                        btnReceivePayment.OnClientClick = String.Format("javascript:OpenWindow('PostSponsorPayment.aspx?SponsorGrantId={0}&BtnId={1}', 800, 600, true); return false;", sponsorship.Item("SponsorGrantId"), btnRefreshPayments.ClientID)
                    End If


                End If

            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        

        Protected Sub gvPaymentHistory_RowDataBound(sender As Object, e As GridViewRowEventArgs)
            Try
                If e.Row.RowType = DataControlRowType.DataRow Then
                    Dim paymentHistory As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                    Dim lPaymentDate As Literal = TryCast(e.Row.FindControl("lPaymentDate"), Literal)
                    Dim lAmountReceived As Literal = TryCast(e.Row.FindControl("lAmountReceived"), Literal)
                    Dim lBalance As Literal = TryCast(e.Row.FindControl("lBalance"), Literal)

                    If lPaymentDate IsNot Nothing Then
                        Dim paymentDate As String = String.Format("{0: dd MMM yyyy }", paymentHistory.Item("DateofPayment"))

                        If Not String.IsNullOrEmpty(paymentDate) Then
                            lPaymentDate.Text = paymentDate
                        Else
                            lPaymentDate.Text = "N/A"
                        End If
                    End If

                    If lAmountReceived IsNot Nothing Then

                        Dim dblAmountReceived As Double = 0

                        If IsDBNull(paymentHistory.Item("Amountreceived")) Then
                            dblAmountReceived = 0
                        Else
                            dblAmountReceived = paymentHistory.Item("Amountreceived")
                        End If

                        If dblAmountReceived > 0 Then
                            lAmountReceived.Text = FormatNumber(dblAmountReceived, 2)
                        Else
                            lAmountReceived.Text = "N/A"
                        End If

                    End If

                    If lBalance IsNot Nothing Then

                        Dim dblBalance As Double = 0

                        If IsDBNull(paymentHistory.Item("Balance")) Then
                            dblBalance = 0
                        Else
                            dblBalance = paymentHistory.Item("Balance")
                        End If

                        If dblBalance > 0 Then
                            lBalance.Text = FormatNumber(dblBalance, 2)
                        Else
                            lBalance.Text = "N/A"
                        End If

                    End If

                End If
            Catch ex As Exception

            End Try
        End Sub

        Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
            BindJQuery()
            MyBase.OnPreRender(e)
        End Sub


        Public ReadOnly Property SponsorId As Integer
            Get
                Return CommonHelper.QueryStringInt("SponsorId")
            End Get
        End Property

        Private ReadOnly Property BtnId() As String
            Get
                Return CommonHelper.QueryString("BtnId")
            End Get
        End Property

        Public ReadOnly Property SponsorGrantId As Integer
            Get
                Return CommonHelper.QueryStringInt("SponsorGrantId")
            End Get
        End Property
    End Class
End Namespace