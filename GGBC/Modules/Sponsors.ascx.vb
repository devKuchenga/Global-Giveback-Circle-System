Imports System.Data
Imports Smartik.Ecom.Common.Utils
Imports GGBC.Smartik.BLL

Namespace Smartik.Administration.Modules
    Partial Public Class SponsorsControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                FillDropDowns()
                BindGrid()
            End If
        End Sub

        Protected Sub gvSponsors_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvSponsors.PageIndexChanging
            Me.gvSponsors.PageIndex = e.NewPageIndex
            BindGrid()
        End Sub

        Protected Sub SearchButton_Click(sender As Object, e As System.EventArgs) Handles SearchButton.Click

        End Sub

        Protected Sub gvSponsorships_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
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
            End If
        End Sub

        Protected Sub gvSponsors_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSponsors.RowDataBound
            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim sponsor As DataRowView = DirectCast(e.Row.DataItem, DataRowView)

                Dim pnlSponsorships As Panel = TryCast(e.Row.FindControl("pnlSponsorships"), Panel)
                Dim pnlStatistics As Panel = TryCast(e.Row.FindControl("pnlStatistics"), Panel)

            End If
        End Sub

        Protected Sub gvStatistics_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
            If e.Row.RowType = DataControlRowType.DataRow Then
                Dim _statistics As DataRowView = TryCast(e.Row.DataItem, DataRowView)

                Dim lStat As New Literal()
                Dim statInfo As String = _statistics.Item("SponsorStatistics")
                If Not String.IsNullOrEmpty(statInfo) Then
                    lStat.Text = _statistics.Item("SponsorStatistics")
                Else
                    lStat.Text = "<P>No meeting info found</p>"
                End If


                Dim phStatistics As PlaceHolder = TryCast(e.Row.FindControl("phStatistics"), PlaceHolder)

                If phStatistics IsNot Nothing Then
                    phStatistics.Controls.Add(lStat)
                End If
            End If
        End Sub


        Protected Sub FillDropDowns()

        End Sub

        Protected Sub BindGrid()
            Dim dtSponsors As DataTable = Me.DataAccessManager.GGBCGetData("sp_Getpartners")

            If dtSponsors.Rows.Count > 0 Then
                Me.gvSponsors.Visible = True
                Me.lblNoRecords.Visible = False
                Me.gvSponsors.DataSource = dtSponsors
                Me.gvSponsors.DataBind()
            Else
                Me.gvSponsors.Visible = False
                Me.lblNoRecords.Visible = True
            End If
        End Sub

        Protected Overrides Sub OnPreRender(e As EventArgs)
            BindJQuery()
            MyBase.OnPreRender(e)
        End Sub

    End Class
End Namespace