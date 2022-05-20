Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class ddlMentorSelectorControl
        Inherits BaseSTKAdministrationUserControl

        Private m_selectedMentorId As String


        Public Sub BindData()
            ddlMentorSelector.Items.Clear()

            Dim dtItems As DataTable = Me.DataAccessManager.GGBCGetData("sp_ReturnMenteeName")

            For Each row As DataRow In dtItems.Rows
                Dim MentorFullName As String = row.Item("FullName")
                Dim MentorId As String = row.Item("MentorID").ToString.Trim

                Dim listItem As New ListItem(MentorFullName, MentorId.ToString())
                Me.ddlMentorSelector.Items.Add(listItem)

                If MentorId = Me.m_selectedMentorId Then
                    listItem.Selected = True
                End If
            Next

            Me.ddlMentorSelector.DataBind()
        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        End Sub

        Public Property CssClass() As String
            Get
                Return ddlMentorSelector.CssClass
            End Get
            Set(value As String)
                ddlMentorSelector.CssClass = value
            End Set
        End Property

        Public Property SelectedMentorId() As String
            Get
                Return Me.ddlMentorSelector.SelectedItem.Value
            End Get
            Set(value As String)
                Me.m_selectedMentorId = value
            End Set
        End Property

    End Class
End Namespace