Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules

    Partial Public Class ddlCompanySelectorControl
        Inherits BaseSTKAdministrationUserControl

        Private m_selectedCompanyId As String


        Public Sub BindData()
            ddlCompany.Items.Clear()

            Dim dtItems As DataTable = Me.DataAccessManager.GGBCGetData("sp_Getpartners")

            For Each row As DataRow In dtItems.Rows
                Dim CompanyFullName As String = row.Item("CompanyName")
                Dim CompanyId As String = row.Item("PartnerId").ToString.Trim

                Dim listItem As New ListItem(CompanyFullName, CompanyId.ToString())
                Me.ddlCompany.Items.Add(listItem)

                If CompanyId = Me.m_selectedCompanyId Then
                    listItem.Selected = True
                End If
            Next

            Me.ddlCompany.DataBind()
        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        End Sub

        Public Property CssClass() As String
            Get
                Return ddlCompany.CssClass
            End Get
            Set(value As String)
                ddlCompany.CssClass = value
            End Set
        End Property

        Public Property SelectedCompanyId() As String
            Get
                Return Integer.Parse(Me.ddlCompany.SelectedItem.Value)
            End Get
            Set(value As String)
                Me.m_selectedCompanyId = value
            End Set
        End Property

    End Class
End Namespace