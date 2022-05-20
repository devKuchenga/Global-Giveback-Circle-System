Imports System.Collections
Imports System.Configuration
Imports System.Data
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration
    Partial Public Class popupMaster
        Inherits BaseSTKAdministrationMasterPage
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
