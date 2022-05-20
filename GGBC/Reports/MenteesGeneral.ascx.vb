Imports Smartik.Ecom.Common.Utils
Imports System.Drawing

Namespace Smartik.Administration.Reports
    Partial Public Class MenteesGeneralControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Protected Sub rptPDFReport_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Try
                Dim fileName As String = [String].Format("menteeGeneral_{0}_{1}.pdf", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"), CommonHelper.GenerateRandomDigitCode(4))
                Dim filePath As String = [String].Format("{0}files\Reports\{1}", HttpContext.Current.Request.PhysicalApplicationPath, fileName)

                PDFHelper.GeneralMenteesPdf(Me.DataAccessManager.GGBCGetData("rpt_GeneralRptMentee"), filePath)

                CommonHelper.WriteResponsePdf(filePath, fileName)
            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Protected Sub rptExcelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Try
                Dim fileName As String = [String].Format("menteeGeneral_{0}_{1}.xlsx", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"), CommonHelper.GenerateRandomDigitCode(4))
                Dim filePath As String = [String].Format("{0}files\Reports\{1}", HttpContext.Current.Request.PhysicalApplicationPath, fileName)

                ExcelHelper.GeneralMenteesXls(Me.DataAccessManager.GGBCGetData("rpt_MenteeMaster"), filePath)
                CommonHelper.WriteResponseXls(filePath, fileName)
            Catch exc As Exception
                ProcessException(exc)
            End Try
        End Sub

    End Class
End Namespace