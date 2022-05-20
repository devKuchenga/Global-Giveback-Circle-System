Imports Smartik.Ecom.Controls
Imports Smartik.Ecom.Common.Utils
Imports System.Security.Policy

Namespace Smartik
    Partial Public Class BaseSTKAdministrationPage
        Inherits STKAdministrationPage


        Protected Overrides Sub OnPreInit(e As EventArgs)
            If (Not ValidatePageSecurity()) Then
                Dim url As String = SEOHelper.GetLoginPageUrl()
                Response.Redirect(url)
            End If
            If Not ValidateAdministratorSecurity() Then
                Dim url As String = SEOHelper.GetLoginPageUrl()
                Response.Redirect(url)
            End If
            'MyBase.OnPreInit(e)
        End Sub

        Protected Overrides Function ValidateAdministratorSecurity() As Boolean
            If HttpContext.Current Is Nothing Or HttpContext.Current.User Is Nothing Or HttpContext.Current.User.Identity.IsAuthenticated = False Then
                Return False
            End If
            Return HttpContext.Current.User.IsInRole("Admin")
        End Function

        Protected Overrides Function ValidatePageSecurity() As Boolean
            Return True
        End Function






    End Class
End Namespace