Imports System.Data
Imports System.ComponentModel
Imports System.Web.UI.WebControls

Namespace Smartik.Administrator.Modules
    Partial Public Class CountrySelectorControl
        Inherits BaseSTKAdministrationUserControl

        Private m_selecteCountryId As Integer

        Public Sub BindData()
            ddlCountry.Items.Clear()

            Dim dtItems As DataTable = Me.DataAccessManager.GGBCGetData("sp_GetCountries")

            For Each row As DataRow In dtItems.Rows
                Dim FieldName As String = row.Item("Country")
                Dim SelectValue As Integer = row.Item("ColumnID")

                Dim item As New ListItem(FieldName, SelectValue.ToString())
                Me.ddlCountry.Items.Add(item)

                If SelectValue = Me.m_selecteCountryId Then
                    item.Selected = True
                End If
            Next

            Me.ddlCountry.DataBind()
        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Public Property CssClass() As String
            Get
                Return ddlCountry.CssClass
            End Get
            Set(value As String)
                ddlCountry.CssClass = value
            End Set
        End Property

        Public Property SelectedCountryId() As Integer
            Get
                Return Integer.Parse(Me.ddlCountry.SelectedItem.Value)
            End Get
            Set(value As Integer)
                Me.m_selecteCountryId = value
            End Set
        End Property

    End Class
End Namespace