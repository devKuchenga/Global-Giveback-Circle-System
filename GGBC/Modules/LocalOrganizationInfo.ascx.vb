Imports System.Data
Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class LocalOrganizationInfoControl
        Inherits BaseSTKAdministrationUserControl

        Dim orgName As String = String.Empty
        Dim targetnumber As Integer
        Dim DatejoinedGGBC As DateTime
        Dim OrgAddressLn1 As String = String.Empty
        Dim OrgAddressLn2 As String = String.Empty
        Dim ContactFname As String = String.Empty
        Dim ContactLname As String = String.Empty
        Dim ContactPhoneNo As String = String.Empty
        Dim Contactemail As String = String.Empty
        Dim Recruitmentstartdate As DateTime
        Dim Recruitmentenddate As DateTime
        Dim Recruitmentnotes As String = String.Empty
        Dim reportingtype As Integer
        Dim Actualtargetnumber As Integer

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindData()
            End If
        End Sub

        Protected Sub BindData()
            Try
                Dim dtLocalOrg As DataTable = Me.DataAccessManager.GGBCGetData("sp_Findlocalorg", "@LocalOrgID", Me.LocalOrgId)

                ddlReportingType.GroupId = StaticDataEnum.PeriodFrequency

                If dtLocalOrg.Rows.Count > 0 Then
                    With dtLocalOrg.Rows(0)
                        txtLROrgName.Text = .Item("orgName").ToString.Trim
                        hfLOrgName.Value = .Item("orgName").ToString.Trim
                        txtLRTargetNumber1.Value = .Item("targetnumber")
                        If IsDBNull(.Item("DatejoinedGGBC")) Then
                            ctrlDateJoinedGGBC.SelectedDate = Nothing
                        Else
                            ctrlDateJoinedGGBC.SelectedDate = String.Format("{0: dd MMM yyyy }", .Item("DatejoinedGGBC"))
                        End If

                        txtOrgAddressLn1.Text = .Item("OrgAddressLn1").ToString.Trim
                        txtOrgAddressLn2.Text = .Item("OrgAddressLn2").ToString.Trim
                        txtContactFname.Text = .Item("ContactFname").ToString.Trim
                        txtContactLname.Text = .Item("ContactLname").ToString.Trim
                        txtContactPhoneno.Text = .Item("ContactPhoneNo").ToString.Trim
                        txtcContactEmail.Text = .Item("Contactemail").ToString.Trim

                        If .Item("Recruitmentstartdate") = "1/1/1900" Then
                            ctrlRecruitmentStartDate.SelectedDate = Nothing
                        Else
                            ctrlRecruitmentStartDate.SelectedDate = String.Format("{0: dd MMM yyyy }", .Item("Recruitmentstartdate"))
                        End If

                        If .Item("Recruitmentenddate") = "1/1/1900" Then
                            ctrlRecruitmentEndDate.SelectedDate = Nothing
                        Else
                            ctrlRecruitmentEndDate.SelectedDate = String.Format("{0: dd MMM yyyy }", .Item("Recruitmentenddate"))
                        End If
                        txtNotes.Text = .Item("Recruitmentnotes").ToString.Trim
                        txtActualTargetNo.Value = .Item("Actualtargetnumber")
                        ddlReportingType.SelectedItemId = .Item("reportingtype")
                        ddlReportingType.BindData()
                    End With

                Else
                    ddlReportingType.BindData()
                End If

            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        Public Function Save() As Integer
            Try
                Dim sqlCmdSaveRecs As New SqlClient.SqlCommand
                Dim isEdit As Integer = 0

                If Me.LocalOrgId > 0 Then
                    isEdit = 1
                End If

                If ctrlDateJoinedGGBC.SelectedDate Is Nothing Then
                    DatejoinedGGBC = "1 Jan 1900"
                Else
                    DatejoinedGGBC = ctrlDateJoinedGGBC.SelectedDate
                End If

                If ctrlRecruitmentStartDate.SelectedDate Is Nothing Then
                    Recruitmentstartdate = "1 Jan 1900"
                Else
                    Recruitmentstartdate = ctrlRecruitmentStartDate.SelectedDate
                End If

                If ctrlRecruitmentEndDate.SelectedDate Is Nothing Then
                    Recruitmentenddate = "1 Jan 1900"
                Else
                    Recruitmentenddate = ctrlRecruitmentEndDate.SelectedDate
                End If

                sqlCmdSaveRecs.Parameters.AddWithValue("@lRorgID", Me.LocalOrgId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TypeOfPartnerSpecific", Me.ctrlTypoPartnerSpecific.SelectedPartners)
                sqlCmdSaveRecs.Parameters.AddWithValue("@LRorgname", txtLROrgName.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DatejoinedGGBC", DatejoinedGGBC)
                sqlCmdSaveRecs.Parameters.AddWithValue("@LRtargetnumber", txtLRTargetNumber1.Value)
                sqlCmdSaveRecs.Parameters.AddWithValue("@contactFname", txtContactFname.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@contactLname", txtContactLname.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@contactphoneno", txtContactPhoneno.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@contactemail", txtcContactEmail.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@OrgAddressln1", txtOrgAddressLn1.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@orgaddressln2", txtOrgAddressLn2.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Recrutimentstartdate", Recruitmentstartdate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Recruitmentenddate", Recruitmentenddate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Recruitmentnotes", txtNotes.Text.Trim)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Reportingtype", ddlReportingType.SelectedItemId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Actualtargetnumber", txtActualTargetNo.Value)
                sqlCmdSaveRecs.Parameters.AddWithValue("@IsEdit", isEdit)

                Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_AddEditLocalOrg", sqlCmdSaveRecs)

                Return intIdentity

            Catch ex As Exception
                Throw ex
            End Try
        End Function

        Public ReadOnly Property LocalOrgId As Integer
            Get
                Return CommonHelper.QueryStringInt("LocalOrgId")
            End Get
        End Property

        Public ReadOnly Property LocalOrgName As String
            Get
                Return hfLOrgName.Value.Trim
            End Get
        End Property
    End Class
End Namespace