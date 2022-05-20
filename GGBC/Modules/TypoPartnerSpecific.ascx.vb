Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Data.SqlClient
Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class TypoPartnerSpecificControl
        Inherits BaseSTKAdministrationUserControl

        Private m_moduleId As Integer
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindGrid()
            End If
        End Sub

        Private Sub BindGrid()
            Dim dtPartners As DataTable = Nothing
            If Me.ModuleId = 5 Then
                dtPartners = Me.DataAccessManager.GGBCGetData("sp_GetPartnerStaticData", "@PartnerId", Me.SponsorId, "@GroupID", StaticDataEnum.TypeOfPartnerSpecific)
            ElseIf Me.ModuleId = 10 Then
                dtPartners = Me.DataAccessManager.GGBCGetData("sp_GetPartnerStaticData", "@LocalOrgId", Me.LocalOrgId, "@GroupID", StaticDataEnum.TypeOfPartnerSpecific)
            End If

            If dtPartners IsNot Nothing Then
                For Each row As DataRow In dtPartners.Rows
                    Dim PartnerName As String = row.Item("FieldName")
                    Dim PartnerId As String = row.Item("SelectValue").ToString.Trim

                    Dim listItem As New ListItem(PartnerName, PartnerId)

                    Me.cblTypoPartnerSpecific.Items.Add(listItem)

                    If row.Item("IsMapped") = 1 Then
                        listItem.Selected = True
                    End If
                Next

                DataBind()
            End If
        End Sub

        Public ReadOnly Property SelectedPartners As String
            Get
                Dim sbChecked As New StringBuilder
                For Each partner As ListItem In cblTypoPartnerSpecific.Items
                    If partner.Selected Then
                        If sbChecked.Length > 0 Then
                            sbChecked.Append("," & partner.Value.Trim)
                        Else
                            sbChecked.Append(partner.Value.Trim)
                        End If
                    End If
                Next

                Return sbChecked.ToString
            End Get
        End Property

        Public Property Skin() As String
            Get
                Return cblTypoPartnerSpecific.SkinID
            End Get
            Set(value As String)
                cblTypoPartnerSpecific.SkinID = value
            End Set
        End Property

        Protected ReadOnly Property SponsorId As Integer
            Get
                Return CommonHelper.QueryStringInt("SponsorId")
            End Get
        End Property

        Public ReadOnly Property LocalOrgId As Integer
            Get
                Return CommonHelper.QueryStringInt("LocalOrgId")
            End Get
        End Property

        Public Property ModuleId As Integer
            Get
                Return m_moduleId
            End Get
            Set(value As Integer)
                m_moduleId = value
            End Set
        End Property

    End Class
End Namespace