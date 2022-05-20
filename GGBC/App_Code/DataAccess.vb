Imports System.Data.SqlClient
Imports System.Data

Namespace Smartik.BLL
    'Public Class DataAccess

    '    Public Function GGBCGetData(ByVal spName As String, ByVal ParamArray parameters() As Object) As DataTable
    '        Dim daData As SqlDataAdapter = Nothing
    '        Dim dsData As DataSet = Nothing

    '        Dim sqlCmdData As SqlClient.SqlCommand = New SqlClient.SqlCommand(spName)
    '        sqlCmdData.Connection = Common.sqlConnect
    '        sqlCmdData.CommandType = CommandType.StoredProcedure

    '        If daData Is Nothing Then daData = New SqlDataAdapter

    '        daData.SelectCommand = sqlCmdData


    '        For Each obj As Object In parameters
    '            If obj.GetType.Equals(GetType(String)) Then
    '                If obj.ToString.StartsWith("@") Then
    '                    Dim param As String = obj.ToString
    '                    daData.SelectCommand.Parameters.AddWithValue(param.Substring(1, param.Length - 1), parameters.GetValue(Array.IndexOf(parameters, obj) + 1))
    '                End If
    '            End If

    '        Next


    '        If dsData Is Nothing Then dsData = New DataSet
    '        daData.Fill(dsData)

    '        Return dsData.Tables(0)
    '    End Function

    '    Public Function GGBCSaveData(ByVal spName As String, sqlCmdData As SqlCommand) As Integer
    '        Try
    '            Dim Identity As Object

    '            sqlCmdData.CommandText = spName
    '            sqlCmdData.Connection = Common.sqlConnect
    '            sqlCmdData.CommandType = CommandType.StoredProcedure

    '            Dim strcmd As String = String.Empty
    '            For Each param As SqlParameter In sqlCmdData.Parameters
    '                strcmd += param.ParameterName.ToString + " = " + param.Value.ToString
    '            Next

    '            Identity = sqlCmdData.ExecuteScalar
    '            If IsDBNull(Identity) Then
    '                Return 0
    '            Else
    '                Return CInt(Identity)
    '            End If
    '        Catch ex As Exception
    '            Throw ex
    '        End Try
    '    End Function


    'End Class
End Namespace