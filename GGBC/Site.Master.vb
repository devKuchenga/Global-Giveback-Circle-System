
Namespace Smartik.Administration
    Partial Public Class Site
        Inherits BaseSTKAdministrationMasterPage

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                ctrlMenu.Visible = True
                lCopyright.Text = "Copyright @ " & DateTime.UtcNow.Year.ToString
            End If

            If Not Me.isAuthenticated Or Session.SessionID Is Nothing Then
                ctrlMenu.Visible = False
            End If
        End Sub

        Private ReadOnly Property isAuthenticated As Boolean
            Get
                Return HttpContext.Current.User.Identity.IsAuthenticated

            End Get
        End Property


        Public Overrides Sub ShowMessage(ByVal message As String)
            pnlMessage.Visible = True
            pnlMessage.CssClass = "messageBox messageBoxSuccess"
            lMessage.Text = message
        End Sub

        Public Overrides Sub ShowError(ByVal message As String, ByVal completeMessage As String)
            pnlMessage.Visible = True
            pnlMessage.CssClass = "messageBox messageBoxError"
            lMessage.Text = message
            lMessageComplete.Text = completeMessage
        End Sub
    End Class
End Namespace