Imports System.ComponentModel
Imports System.Globalization
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace Smartik.Administration.Modules
    Partial Public Class ConfirmationBox
        Inherits BaseSTKAdministrationUserControl
        Protected Sub Page_Load(sender As Object, e As EventArgs)
        End Sub

        Protected Overrides Sub OnPreRender(e As EventArgs)
            MyBase.OnPreRender(e)

            lConfirmText.Text = Me.ConfirmText
        End Sub

        <DefaultValue("Are you sure?")> _
        Public Property ConfirmText() As String
            Get
                Dim obj2 As Object = Me.ViewState("ConfirmText")
                If obj2 IsNot Nothing Then
                    Return DirectCast(obj2, String)
                Else
                    Return String.Empty
                End If
            End Get
            Set(value As String)
                Me.ViewState("ConfirmText") = Value
            End Set
        End Property

        Public Property YesText() As String
            Get
                Return btnYES.Text
            End Get
            Set(value As String)
                btnYES.Text = Value
            End Set
        End Property

        Public Property NoText() As String
            Get
                Return btnNO.Text
            End Get
            Set(value As String)
                btnNO.Text = Value
            End Set
        End Property

        Public Property TargetControlID() As String
            Get
                Return cbe.TargetControlID
            End Get
            Set(value As String)
                cbe.TargetControlID = Value
                mpe.TargetControlID = Value
            End Set
        End Property
    End Class
End Namespace
