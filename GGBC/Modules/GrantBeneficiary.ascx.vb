Imports System.Web.UI.WebControls
Imports Smartik.Ecom.Common.Utils
Namespace Smartik.Administration.Modules
    Partial Public Class GrantBeneficiaryControl
        Inherits BaseSTKAdministrationUserControl


        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                Try
                    BindGrid()
                    hlReturn.NavigateUrl = Me.GrantsURL
                    hfSponsorId.Value = Me.SponsorId
                Catch ex As Exception
                    ProcessException(ex)
                End Try
            End If
        End Sub

        Private Sub BindGrid()
            Try
                gvGrantBeneficiary.DataSource = Me.DataAccessManager.GGBCGetData("sp_GetGrantBeneficiary", "@SponsorGrantId", Me.SponsorGrantId, "@MappedOnly", False)
                gvGrantBeneficiary.DataBind()
            Catch ex As Exception
                Throw ex
            End Try
        End Sub



        Protected Sub SearchButton_Click(sender As Object, e As EventArgs)

        End Sub
        Protected Sub AddSelected_Click(sender As Object, e As EventArgs)

        End Sub
        Protected Sub RemoveUnselected_Click(sender As Object, e As EventArgs)

        End Sub

        Protected Sub btnSave_Click(sender As Object, e As EventArgs)
            Try
                Me.Save()
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Private Sub Save()
            Dim sqlCmdSaveRecs As New SqlClient.SqlCommand
            Try
                sqlCmdSaveRecs.Parameters.AddWithValue("@SponsorgrantID", Me.SponsorGrantId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Beneficiaries", Me.GrantBeneficiaries)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_EditGrantBeneficiaries", sqlCmdSaveRecs)
                BindGrid()
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Protected Sub gvGrantBeneficiary_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
            gvGrantBeneficiary.PageIndex = e.NewPageIndex
            BindGrid()
        End Sub

        Protected Overrides Sub OnPreRender(e As EventArgs)
            BindJQuery()
            BindJQueryIdTabs()

            MyBase.OnPreRender(e)
        End Sub

        Protected ReadOnly Property GrantBeneficiaries As String
            Get
                Dim sbBeneficiaries As New StringBuilder
                Try
                    For Each beneficiary As GridViewRow In gvGrantBeneficiary.Rows
                        Dim cbGrantBeneficiary As CheckBox = TryCast(beneficiary.FindControl("cbGrantBeneficiary"), CheckBox)
                        If cbGrantBeneficiary IsNot Nothing Then
                            If cbGrantBeneficiary.Checked Then
                                Dim hfGGBCRegNo As HiddenField = TryCast(beneficiary.FindControl("hfGGBCRegNo"), HiddenField)
                                If hfGGBCRegNo IsNot Nothing Then
                                    If sbBeneficiaries.Length > 0 Then
                                        sbBeneficiaries.Append("," & hfGGBCRegNo.Value.Trim)
                                    Else
                                        sbBeneficiaries.Append(hfGGBCRegNo.Value.Trim)
                                    End If
                                End If
                            End If
                        End If
                    Next

                    Return sbBeneficiaries.ToString.Trim

                Catch ex As Exception
                    Throw ex
                End Try
            End Get
        End Property

        Public ReadOnly Property SponsorGrantId As Integer
            Get
                Return CommonHelper.QueryStringInt("SponsorGrantId")
            End Get
        End Property
        Public ReadOnly Property SponsorId As Integer
            Get
                Return CommonHelper.QueryStringInt("SponsorId")
            End Get
        End Property

        Private ReadOnly Property GrantsURL As String
            Get
                Return CommonHelper.GetSiteLocation & "SponsorGrants.aspx?SponsorId=" & Me.SponsorId
            End Get
        End Property

        Public ReadOnly Property SponsorName As String
            Get
                Dim dt As DataTable = Me.DataAccessManager.GGBCGetData("sp_GetSponsorHeader", "@SponsorId", hfSponsorId.Value)
                Return dt(0).Item("SponsorHeader")
            End Get
        End Property



    End Class
End Namespace