Imports System.Collections
Imports System.Configuration
Imports System.Data
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Xml.Linq
Namespace Smartik.Ecom.Web.Administration.Modules
	Public Partial Class SimpleTextBox
        Inherits BaseSTKAdministrationUserControl
		Public Property Text() As String
			Get
				Return txtValue.Text
			End Get
			Set
				txtValue.Text = value
			End Set
		End Property

		Public Property ErrorMessage() As String
			Get
				Return rfvValue.ErrorMessage
			End Get
			Set
				rfvValue.ErrorMessage = value
			End Set
		End Property

		Public Property Width() As Unit
			Get
				Return txtValue.Width
			End Get
			Set
				txtValue.Width = value
			End Set
		End Property

		Public Property CssClass() As String
			Get
				Return txtValue.CssClass
			End Get
			Set
				txtValue.CssClass = value
			End Set
		End Property

		Public Property ValidationGroup() As String
			Get
				Return rfvValue.ValidationGroup
			End Get
			Set
				txtValue.ValidationGroup = value
				rfvValue.ValidationGroup = value
			End Set
		End Property
	End Class
End Namespace
