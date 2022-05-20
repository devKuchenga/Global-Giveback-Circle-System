Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class TypoSchoolSpecificControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindGrid()
            End If
        End Sub

        Private Sub BindGrid()
            Dim dtSchool As DataTable = Me.DataAccessManager.GGBCGetData("sp_GetSchoolStaticData", "@SchoolId", Me.SchoolId, "@GroupID", StaticDataEnum.TypeOfSchoolSpecific)

            For Each row As DataRow In dtSchool.Rows
                Dim SchoolName As String = row.Item("FieldName")
                Dim SchoolId As String = row.Item("SelectValue").ToString.Trim

                Dim listItem As New ListItem(SchoolName, SchoolId)

                Me.cblTypoSchoolSpecific.Items.Add(listItem)

                If row.Item("IsMapped") = 1 Then
                    listItem.Selected = True
                End If
            Next

            DataBind()
        End Sub

        Public ReadOnly Property SelectedSchools As String
            Get
                Dim sbChecked As New StringBuilder
                For Each school As ListItem In cblTypoSchoolSpecific.Items
                    If school.Selected Then
                        If sbChecked.Length > 0 Then
                            sbChecked.Append("," & school.Value.Trim)
                        Else
                            sbChecked.Append(school.Value.Trim)
                        End If
                    End If
                Next

                Return sbChecked.ToString
            End Get
        End Property

        Public Property CssClass() As String
            Get
                Return cblTypoSchoolSpecific.CssClass
            End Get
            Set(value As String)
                cblTypoSchoolSpecific.CssClass = value
            End Set
        End Property

        Protected ReadOnly Property SchoolId As Integer
            Get
                Return CommonHelper.QueryStringInt("SchoolId")
            End Get
        End Property
    End Class
End Namespace