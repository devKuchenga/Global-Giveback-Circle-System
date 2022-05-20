Imports System.Data
Imports System.Data.OleDb
Imports System.IO
Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Reports
    Partial Public Class FinancialPartnersGeneralControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Protected Sub rptExcelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Try
                Dim fileName As String = [String].Format("FinancialPartnerGeneral_{0}_{1}.xlsx", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"), CommonHelper.GenerateRandomDigitCode(4))
                Dim filePath As String = [String].Format("{0}files\Reports\{1}", HttpContext.Current.Request.PhysicalApplicationPath, fileName)
                Dim conStr As String = ""

                ExcelHelper.GeneralFPartnerXls(Me.DataAccessManager.GGBCGetData("rpt_PartnerMaster"), filePath)
                CommonHelper.WriteResponseXls(filePath, fileName)
            Catch exc As Exception
                ProcessException(exc)
            End Try
        End Sub

    End Class
End Namespace