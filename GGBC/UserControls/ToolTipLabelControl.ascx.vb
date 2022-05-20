Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace Smartik.Ecom.Web.Administration.Modules
	Public Partial Class ToolTipLabelControl
        Inherits BaseSTKAdministrationUserControl
		Public Property Text() As String
			Get
				Return lblValue.Text
			End Get
			Set
				lblValue.Text = value
			End Set
		End Property

		Public Property ToolTip() As String
			Get
				Return lblValue.ToolTip
			End Get
			Set
				lblValue.ToolTip = value
				imgToolTip.ToolTip = value
			End Set
		End Property

		Public Property ToolTipImage() As String
			Get
				Return imgToolTip.ImageUrl
			End Get
			Set
				imgToolTip.ImageUrl = value
			End Set
		End Property


		Public Property Width() As Unit
			Get
				Return lblValue.Width
			End Get
			Set
				lblValue.Width = value
			End Set
		End Property

		Public Property CssClass() As String
			Get
				Return lblValue.CssClass
			End Get
			Set
				lblValue.CssClass = value
			End Set
		End Property



	End Class
End Namespace
