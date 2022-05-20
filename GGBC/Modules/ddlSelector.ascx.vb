Imports System.Data
Imports System.ComponentModel
Imports System.Web.UI.WebControls

Namespace Smartik.Administration.Modules
    Partial Public Class ddlSelectorControl
        Inherits BaseSTKAdministrationUserControl

        Private m_selectedItemId As Integer
        Private m_GroupId As Integer

        Public Sub BindData()
            ddlItems.Items.Clear()

            'ddlItems.Items.Add(New ListItem("--Select--", "-1"))
            Dim dtItems As DataTable = Me.DataAccessManager.GGBCGetData("sp_GetStaticData", "@GroupId", Me.GroupId)

            For Each row As DataRow In dtItems.Rows
                Dim FieldName As String = row.Item("FieldName")
                Dim SelectValue As Integer = row.Item("SelectValue")

                Dim item As New ListItem(FieldName, SelectValue.ToString())
                Me.ddlItems.Items.Add(item)

                If SelectValue = Me.m_selectedItemId Then
                    item.Selected = True
                End If
            Next

            Me.ddlItems.DataBind()
        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        End Sub

        Public Property CssClass() As String
            Get
                Return ddlItems.CssClass
            End Get
            Set(value As String)
                ddlItems.CssClass = value
            End Set
        End Property

        Public Property SelectedItemId() As Integer
            Get
                Return Integer.Parse(Me.ddlItems.SelectedItem.Value)
            End Get
            Set(value As Integer)
                Me.m_selectedItemId = value
            End Set
        End Property

        Public Property GroupId As Integer
            Get
                Return m_GroupId
            End Get
            Set(value As Integer)
                m_GroupId = value
            End Set
        End Property

    End Class
End Namespace