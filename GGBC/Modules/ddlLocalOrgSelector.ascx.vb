Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules

    Partial Public Class ddlLocalOrgSelectorControl
        Inherits BaseSTKAdministrationUserControl

        Private m_selectedLocalOrgId As Integer


        Public Sub BindData()
            ddlLocalOrgSelector.Items.Clear()

            Dim dtItems As DataTable = Me.DataAccessManager.GGBCGetData("sp_Getlocalorg")

            For Each row As DataRow In dtItems.Rows
                Dim LocalOrgFullName As String = row.Item("LRorgName")
                Dim LocalOrgId As Integer = row.Item("LRorgID")

                Dim listItem As New ListItem(LocalOrgFullName, LocalOrgId.ToString())
                Me.ddlLocalOrgSelector.Items.Add(listItem)

                If LocalOrgId = Me.m_selectedLocalOrgId Then
                    listItem.Selected = True
                End If
            Next

            Me.ddlLocalOrgSelector.DataBind()
        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        End Sub

        Public Property CssClass() As String
            Get
                Return ddlLocalOrgSelector.CssClass
            End Get
            Set(value As String)
                ddlLocalOrgSelector.CssClass = value
            End Set
        End Property

        Public Property SelectedLocalOrgId() As Integer
            Get
                Return Integer.Parse(Me.ddlLocalOrgSelector.SelectedItem.Value)
            End Get
            Set(value As Integer)
                Me.m_selectedLocalOrgId = value
            End Set
        End Property

    End Class
End Namespace