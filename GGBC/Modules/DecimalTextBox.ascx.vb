Imports System.Globalization
Imports System.Web.UI.WebControls

Namespace Smartik.Administration.Modules
    Partial Public Class DecimalTextBox
        Inherits BaseSTKAdministrationUserControl
        Protected Overrides Sub OnInit(e As EventArgs)
            Dim validChars As String = NumberFormatInfo.CurrentInfo.NegativeSign
            validChars += NumberFormatInfo.CurrentInfo.NumberDecimalSeparator
            ftbeValue.ValidChars = validChars
            MyBase.OnInit(e)
        End Sub

        Protected Sub Page_Load(sender As Object, e As EventArgs)
        End Sub

        Public Property Value() As Decimal
            Get
                Return Decimal.Parse(txtValue.Text)
            End Get
            Set(value As Decimal)
                txtValue.Text = Value.ToString("G29")
            End Set
        End Property


        Public Property RequiredErrorMessage() As String
            Get
                Return rfvValue.ErrorMessage
            End Get
            Set(value As String)
                rfvValue.ErrorMessage = Value
            End Set
        End Property

        Public Property RangeErrorMessage() As String
            Get
                Return rvValue.ErrorMessage
            End Get
            Set(value As String)
                rvValue.ErrorMessage = Value
            End Set
        End Property

        Public Property MinimumValue() As String
            Get
                Return rvValue.MinimumValue
            End Get
            Set(value As String)
                rvValue.MinimumValue = Value
            End Set
        End Property

        Public Property MaximumValue() As String
            Get
                Return rvValue.MaximumValue
            End Get
            Set(value As String)
                rvValue.MaximumValue = Value
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

        Public Property ValidationGroup() As String
            Get
                Return rfvValue.ValidationGroup
            End Get
            Set(value As String)
                txtValue.ValidationGroup = Value
                rfvValue.ValidationGroup = Value
                rvValue.ValidationGroup = Value
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
