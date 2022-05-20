
Namespace Smartik.Administration.Modules
    Partial Public Class DatePicker
        Inherits BaseSTKAdministrationUserControl
#Region "Properties"
        Public Property ShowTime() As Boolean
            Get
                Return Convert.ToBoolean(ViewState("ShowTime"))
            End Get
            Set(value As Boolean)
                ViewState("ShowTime") = value
            End Set
        End Property

        Public Property SelectedDate() As System.Nullable(Of DateTime)
            Get
                Dim inputDate As DateTime
                If Not DateTime.TryParse(txtDateTime.Text, inputDate) Then
                    Return Nothing
                End If
                Return inputDate
            End Get
            Set(value As System.Nullable(Of DateTime))
                ajaxCalendar.SelectedDate = value
            End Set
        End Property

        Protected Overrides Sub OnLoad(e As System.EventArgs)
            Me.Format = "dd MMM yyyy"
            MyBase.OnLoad(e)
        End Sub

        Public Property Format() As String
            Get
                Return ajaxCalendar.Format
            End Get
            Set(value As String)
                ajaxCalendar.Format = value
            End Set
        End Property
#End Region
    End Class
End Namespace
