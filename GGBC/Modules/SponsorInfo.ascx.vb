Imports System.Data
Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class SponsorInfoControl
        Inherits BaseSTKAdministrationUserControl

        Protected Overrides Sub OnInit(e As System.EventArgs)
            dtDateJoinedGGBC.Format = "dd MMM yyyy"
            MyBase.OnInit(e)
        End Sub

        Private Sub BindData()
            ddlFirstContactTitle.GroupId = StaticDataEnum.ProfessionTitle
            ddlSecondContactTitle.GroupId = StaticDataEnum.ProfessionTitle

            Dim dtSponsor As DataTable = Me.DataAccessManager.GGBCGetData("sp_FindPartner", "@PartnerID", Me.SponsorId)

            If dtSponsor.Rows.Count > 0 Then
                With dtSponsor.Rows(0)
                    txtCompanyName.Text = .Item("Companyname")
                    txtCompanyAddressLn1.Text = .Item("compaddressln1")
                    txtCompanyAddressLn2.Text = .Item("compaddressln2")
                    txtCompanyAddressLn3.Text = .Item("compaddressln3")
                    txtPriContactFname.Text = .Item("pricontactfname")
                    txtPriContactLname.Text = .Item("pricontactlname")
                    txtPriContactPhoneno.Text = .Item("pricontactphoneno")
                    txtPriContactEmail.Text = .Item("pricontactemail")
                    txtSecContactFname.Text = .Item("seccontactfname")
                    txtSecContactLname.Text = .Item("seccontactlname")
                    txtSecContactPhoneno.Text = .Item("seccontactphoneno")
                    txtSecContactEmail.Text = .Item("seccontactemail")
                    If Not (DateTime.Parse(.Item("datejoinedggbc")) = DateTime.Parse("1 Jan 1900")) Then
                        dtDateJoinedGGBC.SelectedDate = .Item("datejoinedggbc")
                    End If
                    ddlFirstContactTitle.SelectedItemId = .Item(("pricontacttitle"))
                    ddlSecondContactTitle.SelectedItemId = .Item(("seccontacttitle"))

                    ddlFirstContactTitle.BindData()
                    ddlSecondContactTitle.BindData()
                End With

            Else
                ddlFirstContactTitle.SelectedItemId = -1
                ddlSecondContactTitle.SelectedItemId = -1

                ddlFirstContactTitle.BindData()
                ddlSecondContactTitle.BindData()
            End If
        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindData()
            End If
        End Sub

        Public Function Save() As Integer
            Dim sqlCmdSaveRecs As New SqlClient.SqlCommand

            Dim isEdit As Integer = 0

            If Me.SponsorId > 0 Then
                isEdit = 1
            End If

            Dim CompanyName As String = Me.txtCompanyName.Text.Trim
            Dim CompAddressLn1 As String = Me.lblCompanyaddressLine1.Text
            Dim CompAddressLn2 As String = Me.txtCompanyAddressLn2.Text
            Dim CompAddressLn3 As String = Me.txtCompanyAddressLn3.Text
            Dim PriContactFName As String = Me.txtPriContactFname.Text
            Dim PriContactLName As String = Me.txtPriContactLname.Text
            Dim priContactTitle As String = ddlFirstContactTitle.SelectedItemId.ToString
            Dim PriContactPhoneNo As String = Me.txtSecContactFname.Text.Trim
            Dim PriContactemail As String = Me.txtPriContactEmail.Text.Trim
            Dim SecContactFName As String = Me.txtSecContactFname.Text.Trim
            Dim SecContactLName As String = Me.txtPriContactLname.Text.Trim
            Dim SeccontactTitle As String = ddlSecondContactTitle.SelectedItemId.ToString
            Dim secContactPhoneNo As String = Me.txtSecContactPhoneno.Text.Trim
            Dim seccontactemail As String = Me.txtSecContactEmail.Text.Trim
            Dim datejoinedGGBC As Nullable(Of Date)
            If dtDateJoinedGGBC.SelectedDate.HasValue Then
                If Not (DateTime.Parse(dtDateJoinedGGBC.SelectedDate) = DateTime.Parse("1 Jan 1900")) Then
                    datejoinedGGBC = dtDateJoinedGGBC.SelectedDate
                Else
                    datejoinedGGBC = DateTime.Parse("1 Jan 1900")
                End If
            End If



            sqlCmdSaveRecs.Parameters.AddWithValue("@PartnerID", Me.SponsorId)
            sqlCmdSaveRecs.Parameters.AddWithValue("@CompanyName", CompanyName)
            sqlCmdSaveRecs.Parameters.AddWithValue("@TypeOfPartner", ctrlTypoPartner.SelectedPartners)
            sqlCmdSaveRecs.Parameters.AddWithValue("@Typeofpartnerspecific", ctrlTypoPartnerSpecific.SelectedPartners)
            sqlCmdSaveRecs.Parameters.AddWithValue("@CompAddressLn1", CompAddressLn1)
            sqlCmdSaveRecs.Parameters.AddWithValue("@CompAddressLn2", CompAddressLn2)
            sqlCmdSaveRecs.Parameters.AddWithValue("@CompAddressLn3", CompAddressLn3)
            sqlCmdSaveRecs.Parameters.AddWithValue("@PriContactFName", PriContactFName)
            sqlCmdSaveRecs.Parameters.AddWithValue("@PriContactLName", PriContactLName)
            sqlCmdSaveRecs.Parameters.AddWithValue("@priContactTitle", priContactTitle)
            sqlCmdSaveRecs.Parameters.AddWithValue("@PriContactPhoneNo", PriContactPhoneNo)
            sqlCmdSaveRecs.Parameters.AddWithValue("@PriContactemail", PriContactemail)
            sqlCmdSaveRecs.Parameters.AddWithValue("@SecContactFName", SecContactFName)
            sqlCmdSaveRecs.Parameters.AddWithValue("@SecContactLName", SecContactLName)
            sqlCmdSaveRecs.Parameters.AddWithValue("@SeccontactTitle", SeccontactTitle)
            sqlCmdSaveRecs.Parameters.AddWithValue("@secContactPhoneNo", secContactPhoneNo)
            sqlCmdSaveRecs.Parameters.AddWithValue("@seccontactemail", seccontactemail)
            sqlCmdSaveRecs.Parameters.AddWithValue("@datejoinedGGBC", datejoinedGGBC)
            sqlCmdSaveRecs.Parameters.AddWithValue("@IsEdit", isEdit)

            Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_AddEditPartners", sqlCmdSaveRecs)

            Return intIdentity

        End Function

        Public ReadOnly Property SponsorId() As Integer
            Get
                Return CommonHelper.QueryStringInt("SponsorId")
            End Get
        End Property

    End Class
End Namespace