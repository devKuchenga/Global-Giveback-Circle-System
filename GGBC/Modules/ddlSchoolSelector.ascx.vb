Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules

    Partial Public Class ddlSchoolSelectorControl
        Inherits BaseSTKAdministrationUserControl

        Private m_selectedSchoolId As Integer
        Private m_SchoolType As Integer

        Public Sub BindData()
            ddlSchool.Items.Clear()

            Dim defaultItem As New ListItem("Please Select", "-1")
            ddlSchool.Items.Add(defaultItem)

            Dim dtItems As DataTable = Me.DataAccessManager.GGBCGetData("sp_GetSchoolByType", "@SchoolType", Me.SchoolType)

            For Each row As DataRow In dtItems.Rows
                Dim NameOfSchool As String = row.Item("NameOfSchool")
                Dim SchoolID As Integer = row.Item("SchoolID")

                Dim item As New ListItem(NameOfSchool, SchoolID.ToString())
                Me.ddlSchool.Items.Add(item)

                If SchoolID = Me.m_selectedSchoolId Then
                    item.Selected = True
                End If
            Next

            If ddlSchool.SelectedItem Is Nothing Then
                ddlSchool.SelectedIndex = 0
            End If

            Me.ddlSchool.DataBind()
        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        End Sub

        Public Property CssClass() As String
            Get
                Return ddlSchool.CssClass
            End Get
            Set(value As String)
                ddlSchool.CssClass = value
            End Set
        End Property

        Public Property SelectedSchoolId() As Integer
            Get
                Return Integer.Parse(Me.ddlSchool.SelectedItem.Value)
            End Get
            Set(value As Integer)
                Me.m_selectedSchoolId = value
            End Set
        End Property

        Public Property SchoolType As Integer
            Get
                Return m_SchoolType
            End Get
            Set(value As Integer)
                m_SchoolType = value
            End Set
        End Property

    End Class
End Namespace