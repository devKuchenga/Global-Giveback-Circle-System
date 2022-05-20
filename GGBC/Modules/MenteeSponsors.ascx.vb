Imports System.Data
Imports Smartik.Ecom.Common.Utils
Imports System.Web.UI.WebControls

Namespace Smartik.Administration.Modules
    Partial Public Class MenteeSponsorsControl
        Inherits BaseSTKAdministrationUserControl

        Private m_MappedOnly As Integer
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindData()
            End If
        End Sub

        Protected Sub BindData()
            Dim dtSponsors As DataTable = Me.DataAccessManager.GGBCGetData("sp_GetMenteeSponsors", "@GGBCRegNo", Me.MenteeId, "@MappedOnly", Me.MappedOnly)

            For Each row As DataRow In dtSponsors.Rows
                Dim SponsorName As String = row.Item("SponsorName")
                Dim SponsorId As String = row.Item("PartnerID").ToString.Trim

                Dim listItem As New ListItem(SponsorName, SponsorId)

                Me.cblMenteeSponsors.Items.Add(listItem)

                If row.Item("IsMapped") = 1 Then
                    listItem.Selected = True
                End If
            Next

            DataBind()
        End Sub

        Public ReadOnly Property SelectedSponsors As String
            Get
                Dim sbChecked As New StringBuilder
                For Each sponsor As ListItem In cblMenteeSponsors.Items
                    If sponsor.Selected Then
                        If sbChecked.Length > 0 Then
                            sbChecked.Append("," & sponsor.Value.Trim)
                        Else
                            sbChecked.Append(sponsor.Value.Trim)
                        End If
                    End If
                Next

                Return sbChecked.ToString
            End Get
        End Property

        Public Property CssClass() As String
            Get
                Return cblMenteeSponsors.CssClass
            End Get
            Set(value As String)
                cblMenteeSponsors.CssClass = value
            End Set
        End Property

        Public Property MappedOnly As Integer
            Get
                Return m_MappedOnly
            End Get
            Set(value As Integer)
                m_MappedOnly = value
            End Set
        End Property

        Protected ReadOnly Property MenteeId As Integer
            Get
                Return CommonHelper.QueryStringInt("MenteeId")
            End Get
        End Property

    End Class
End Namespace