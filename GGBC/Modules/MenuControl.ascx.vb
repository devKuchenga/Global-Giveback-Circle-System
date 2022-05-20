Imports System.Text
Imports System.Web
Imports System.Web.UI
Imports Smartik.Ecom.Common.Utils
Imports Smartik.Ecom.Common.Utils.Html

Namespace Smartik.Administration.Modules
    Partial Public Class MenuControl
        Inherits BaseSTKAdministrationUserControl
#Region "Handlers"
        Protected Overrides Sub OnPreRender(e As EventArgs)
            BindJQuery()

            Dim superFishMenu As String = CommonHelper.GetSiteLocation() & "Scripts/jquery.superfishmenu.js"
            Page.ClientScript.RegisterClientScriptInclude(superFishMenu, superFishMenu)
            Page.ClientScript.RegisterClientScriptBlock([GetType](), [String].Format("{0}_sfmenu", ClientID), [String].Format("$(document).ready(function(){{$('#{0}').superfish({{autoArrows:false,speed:'fast',delay:200}});}});", ClientID), True)
        End Sub

        Protected Sub Page_Load(sender As Object, e As EventArgs)
            If Not IsPostBack Then
                Dim siteMapProvider As SiteMapProvider = System.Web.SiteMap.Providers(SiteMapProviderName)
                If siteMapProvider Is Nothing Then
                    Visible = False
                Else
                    Dim sb As New StringBuilder()
                    sb.AppendFormat("<ul id=""{0}"" class=""sf-menu"">", ClientID)
                    For Each node As SiteMapNode In siteMapProvider.RootNode.ChildNodes
                        BuildMenuRecursive(sb, node)
                    Next
                    sb.Append("</ul>")
                    lblMenuContent.Text = sb.ToString()
                End If
            End If
        End Sub
#End Region

#Region "Utilities"
        Private Sub BuildMenuRecursive(sb As StringBuilder, node As SiteMapNode)
            Dim imgUrl As String = node("IconUrl")
            If Not [String].IsNullOrEmpty(imgUrl) AndAlso imgUrl.StartsWith("~/") Then
                imgUrl = imgUrl.Substring(2, imgUrl.Length - 2)
                imgUrl = CommonHelper.GetSiteLocation() & imgUrl
            End If

            Dim title As String = HttpUtility.HtmlEncode(If(Not [String].IsNullOrEmpty(node("STKResourceTitle")), node.Title, "Menu Title"))
            Dim descr As String = HttpUtility.HtmlEncode(If(Not [String].IsNullOrEmpty(node("STKResourceDescription")), node.Description, "Menu Description"))

            sb.Append("<li>")
            sb.AppendFormat("<a href=""{0}"" title=""{2}"">{3}{1}</a>", (If([String].IsNullOrEmpty(node.Url), "#", node.Url)), title, descr, (If(Not [String].IsNullOrEmpty(imgUrl), [String].Format("<img src=""{0}"" alt=""{1}"" /> ", imgUrl, title), [String].Empty)))
            If node.HasChildNodes Then
                sb.Append("<ul>")
                For Each childNode As SiteMapNode In node.ChildNodes
                    BuildMenuRecursive(sb, childNode)
                Next
                sb.Append("</ul>")
            End If
            sb.Append("</li>")
        End Sub
#End Region

#Region "Properties"
        Public Property SiteMapProviderName() As String
            Get
                Return Convert.ToString(ViewState("SiteMapProviderName"))
            End Get
            Set(value As String)
                ViewState("SiteMapProviderName") = Value
            End Set
        End Property
#End Region
    End Class
End Namespace
