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
    Partial Public Class LogoutPage
        Inherits BaseSTKAdministrationPage
        Protected Sub Page_Load(sender As Object, e As EventArgs)
            CommonHelper.SetResponseNoCache(Response)

            'HttpContext.Current.Session.Abandon()
            If HttpContext.Current IsNot Nothing AndAlso HttpContext.Current.Session IsNot Nothing Then
                HttpContext.Current.Session.Abandon()
            End If
            FormsAuthentication.SignOut()

            Dim url As String = SEOHelper.GetLoginPageUrl
            Response.Redirect(url)
        End Sub

        'Protected Overrides ReadOnly Property AdministratorSecurityValidationEnabled() As Boolean
        '    Get
        '        Return False
        '    End Get
        'End Property

        'Protected Overrides ReadOnly Property IPAddressValidationEnabled() As Boolean
        '    Get
        '        Return False
        '    End Get
        'End Property
    End Class
End Namespace
