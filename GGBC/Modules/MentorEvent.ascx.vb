Imports Smartik.Ecom.Common.Utils
Imports System.Web.UI.WebControls
Namespace Smartik.Administration.Modules
    Partial Public Class MentorEventControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                BindData()
            End If
        End Sub

        Protected Sub BindData()
            Dim dtSponsors As DataTable = Me.DataAccessManager.GGBCGetData("sp_GetMentorEventsMap", "@MentorId", Me.MentorId, "@GroupID", StaticDataEnum.MentorEventAttended)

            For Each row As DataRow In dtSponsors.Rows
                Dim EventName As String = row.Item("FieldName")
                Dim EventId As String = row.Item("SelectValue").ToString.Trim

                Dim listItem As New ListItem(EventName, EventId)

                Me.cblMentorEvent.Items.Add(listItem)

                If row.Item("IsMapped") = 1 Then
                    listItem.Selected = True
                End If
            Next

            DataBind()
        End Sub

        Public ReadOnly Property SelectedEvents As String
            Get
                Dim sbChecked As New StringBuilder
                For Each evt As ListItem In cblMentorEvent.Items
                    If evt.Selected Then
                        If sbChecked.Length > 0 Then
                            sbChecked.Append("," & evt.Value.Trim)
                        Else
                            sbChecked.Append(evt.Value.Trim)
                        End If
                    End If
                Next

                Return sbChecked.ToString
            End Get
        End Property

        Public Property CssClass() As String
            Get
                Return cblMentorEvent.CssClass
            End Get
            Set(value As String)
                cblMentorEvent.CssClass = value
            End Set
        End Property

        Public ReadOnly Property MentorId As Integer
            Get
                Return CommonHelper.QueryStringInt("MentorId")
            End Get
        End Property
        'Private Sub BindGrid()

        '    gvMentorEvent.DataSource = Me.DataAccessManager.GGBCGetData("sp_GetMentorEventsMap", "@MentorId", Me.MentorId, "@GroupID", StaticDataEnum.MentorEventAttended)
        '    gvMentorEvent.DataBind()
        'End Sub


        'Protected Sub gvMentorEvent_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        '    gvMentorEvent.PageIndex = e.NewPageIndex
        '    BindGrid()
        'End Sub


        'Public ReadOnly Property MentorEventMap As String
        '    Get
        '        Dim sbMentorEvent As New StringBuilder
        '        For Each mEvt As GridViewRow In gvMentorEvent.Rows
        '            Dim cbMentorEvent As CheckBox = TryCast(mEvt.FindControl("cbMentorEvent"), CheckBox)

        '            If cbMentorEvent IsNot Nothing Then
        '                If cbMentorEvent.Checked Then
        '                    Dim hfSelectValue As HiddenField = TryCast(mEvt.FindControl("hfSelectValue"), HiddenField)
        '                    If hfSelectValue IsNot Nothing Then
        '                        If sbMentorEvent.Length > 0 Then
        '                            sbMentorEvent.Append("," & hfSelectValue.Value.Trim)
        '                        Else
        '                            sbMentorEvent.Append(hfSelectValue.Value.Trim)
        '                        End If
        '                    End If
        '                End If
        '            End If
        '        Next

        '        Return sbMentorEvent.ToString.Trim
        '    End Get
        'End Property

    End Class
End Namespace