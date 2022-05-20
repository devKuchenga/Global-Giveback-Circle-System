Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace Smartik.Administration.Modules
    Partial Public Class ToolTipLabelControl
        Inherits BaseSTKAdministrationUserControl
        Public Property Text() As String
            Get
                Return lblValue.Text
            End Get
            Set(value As String)
                lblValue.Text = value
            End Set
        End Property

        Public Property AssociatedControl() As String
            Get
                Return lblValue.AssociatedControlID
            End Get
            Set(value As String)
                lblValue.AssociatedControlID = value
            End Set
        End Property

        Public Property ToolTip() As String
            Get
                Return lblValue.ToolTip
            End Get
            Set(value As String)
                lblValue.ToolTip = value
                imgToolTip.ToolTip = value
            End Set
        End Property

        Public Property ToolTipImage() As String
            Get
                Return imgToolTip.ImageUrl
            End Get
            Set(value As String)
                'imgToolTip.ImageUrl = "/images/ico-help.gif"
                imgToolTip.ImageUrl = value
            End Set
        End Property


        Public Property Width() As Unit
            Get
                Return lblValue.Width
            End Get
            Set(value As Unit)
                lblValue.Width = value
            End Set
        End Property

        Public Property CssClass() As String
            Get
                Return lblValue.CssClass
            End Get
            Set(value As String)
                lblValue.CssClass = value
            End Set
        End Property



    End Class
End Namespace
