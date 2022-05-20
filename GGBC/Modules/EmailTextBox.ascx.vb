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

Namespace Smartik.Administration.Modules
    Partial Public Class EmailTextBox
        Inherits BaseSTKAdministrationUserControl
        Public Property Text() As String
            Get
                Return txtValue.Text
            End Get
            Set(value As String)
                txtValue.Text = Value
            End Set
        End Property

        Public Property Width() As Unit
            Get
                Return txtValue.Width
            End Get
            Set(value As Unit)
                txtValue.Width = Value
            End Set
        End Property

        Public Property Required As Boolean
            Get
                Return rfvValue.Enabled
            End Get
            Set(value As Boolean)
                rfvValue.Enabled = value
            End Set
        End Property

        Public Property ValidationGroup() As String
            Get
                Return rfvValue.ValidationGroup
            End Get
            Set(value As String)
                txtValue.ValidationGroup = Value
                rfvValue.ValidationGroup = Value
                revValue.ValidationGroup = Value
            End Set
        End Property

        Public Property CssClass() As String
            Get
                Return txtValue.CssClass
            End Get
            Set(value As String)
                txtValue.CssClass = Value
            End Set
        End Property
    End Class
End Namespace
