Imports Smartik.Ecom.Common.Utils

Namespace Smartik.Administration.Modules
    Partial Public Class MenteeSocietalLaunchControl
        Inherits BaseSTKAdministrationUserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If Not Page.IsPostBack Then
                LoadData()
            End If
        End Sub

#Region "Declarations"
        'int
        Dim intActualcoursetype As Integer
        Dim intPlacementAfterGrad As Integer
        Dim intPlacementType As Integer
        Dim intDegreeProgram As Integer
        Dim intConcentration As Integer
        Dim intDegreeEarned As Integer

        'booleans
        Dim blnCash As Boolean
        Dim blnTime As Boolean
        Dim blnTalent As Boolean
        Dim blnMentor As Boolean

        'Dates
        Dim intActualYOCompletion As Integer
        Dim dtStartDate As Nullable(Of Date)
        Dim dtCoStartDate As Nullable(Of Date)
        Dim dtExpectedGraddate As Nullable(Of Date)
        Dim dtActualGraddate As Nullable(Of Date)

        'Numeric txtbox
        Dim strDegreeEarnedtodate As String
        Dim strActualCertDegreeearned As String

        'Decimal txtbox
        Dim decTotalScholarshipAmount As Decimal
        Dim decHighereduamount As Decimal

        'Text
        Dim strNameofinst As String
        Dim strAOFinstL1 As String
        Dim strAOFInstL2 As String
        Dim strAOFInstL3 As String
        Dim strNameofComp As String
        Dim strAddOFinstL1 As String
        Dim strAddOFInstL2 As String
        Dim strAddOFInstL3 As String
        Dim strOther As String
        Dim strHigherEduNotes As String
        Dim strPositionTitle As String

#End Region

        Private Sub LoadData()
            Try
                LoadFieldVariables(False)

                ddPlacementAfterGrad.SelectedItemId = intPlacementAfterGrad
                ddPlacementType.SelectedItemId = intPlacementType
                ddActualcoursetype.SelectedItemId = intActualcoursetype
                ddDegreeProgram.SelectedItemId = intDegreeProgram
                ddConcentration.SelectedItemId = intConcentration
                ddDegreeEarned.SelectedItemId = intDegreeEarned

                If intActualYOCompletion > 1900 Then
                    txtActualYOCompletion.YearText = intActualYOCompletion.ToString
                Else
                    txtActualYOCompletion.YearText = "Year"
                End If

                If dtStartDate.HasValue AndAlso (Not dtStartDate.Value.Date = CDate("1 Jan 1900").Date) Then
                    txtStartDate.SelectedDate = dtStartDate
                End If
                If dtExpectedGraddate.HasValue AndAlso (Not dtExpectedGraddate.Value.Date = CDate("1 Jan 1900").Date) Then
                    txtExpectedGraddate.SelectedDate = dtExpectedGraddate
                End If
                If dtActualGraddate.HasValue AndAlso (Not dtActualGraddate.Value.Date = CDate("1 Jan 1900").Date) Then
                    txtActualGraddate.SelectedDate = dtActualGraddate
                End If
                If dtCoStartDate.HasValue AndAlso (Not dtCoStartDate.Value.Date = CDate("1 Jan 1900").Date) Then
                    txtCoStartDate.SelectedDate = dtCoStartDate
                End If
                
                txtDegreeEarnedtodate.Text = strDegreeEarnedtodate
                txtActualCertDegreeearned.Text = strActualCertDegreeearned
                txtHighereduamount.Value = decHighereduamount
                txtNameofinst.Text = strNameofinst
                txtAddOFinstL1.Text = strAddOFinstL1
                txtAddOFInstL2.Text = strAddOFInstL2
                txtAddOFInstL3.Text = strAddOFInstL3
                txtNameofComp.Text = strNameofComp
                txtAddOFcol1.Text = strAOFinstL1
                txtAddOFcol2.Text = strAOFInstL2
                txtAddOFcol3.Text = strAOFInstL3
                txtPositionTitle.Text = strPositionTitle
                txtOther.Text = strOther
                txtHigherEduNotes.Text = strHigherEduNotes
                txtTotalScholarshipAmount.Value = decTotalScholarshipAmount
                ddPlacementAfterGrad.BindData()
                ddPlacementType.BindData()
                ddActualcoursetype.BindData()
                ddDegreeProgram.BindData()
                ddConcentration.BindData()
                ddDegreeEarned.BindData()

            Catch ex As Exception
                ProcessException(ex)
            End Try
        End Sub

        Private Sub LoadFieldVariables(blnEditMode As Boolean)
            Try
                If blnEditMode Then
                    'read from ui
                    strDegreeEarnedtodate = txtDegreeEarnedtodate.Text.Trim
                    strActualCertDegreeearned = txtActualCertDegreeearned.Text.Trim
                    intActualcoursetype = ddActualcoursetype.SelectedItemId
                    decHighereduamount = txtHighereduamount.Value
                    intPlacementAfterGrad = ddPlacementAfterGrad.SelectedItemId
                    intPlacementType = ddPlacementType.SelectedItemId
                    strNameofinst = txtNameofinst.Text
                    strAddOFinstL1 = txtAddOFinstL1.Text
                    strAddOFInstL2 = txtAddOFInstL2.Text
                    strAddOFInstL3 = txtAddOFInstL3.Text
                    intDegreeProgram = ddDegreeProgram.SelectedItemId
                    intConcentration = ddConcentration.SelectedItemId
                    intDegreeEarned = ddDegreeEarned.SelectedItemId
                    If txtActualYOCompletion.YearValue > 0 Then
                        intActualYOCompletion = txtActualYOCompletion.YearValue
                    Else
                        intActualYOCompletion = 1900
                    End If

                    If txtStartDate.SelectedDate.HasValue Then
                        dtStartDate = txtStartDate.SelectedDate
                    Else
                        dtStartDate = DateTime.Parse("1 Jan 1900")
                    End If
                    If txtExpectedGraddate.SelectedDate.HasValue Then
                        dtExpectedGraddate = txtExpectedGraddate.SelectedDate
                    Else
                        dtExpectedGraddate = DateTime.Parse("1 Jan 1900")
                    End If
                    If txtActualGraddate.SelectedDate.HasValue Then
                        dtActualGraddate = txtActualGraddate.SelectedDate
                    Else
                        dtActualGraddate = DateTime.Parse("1 Jan 1900")
                    End If

                    If txtCoStartDate.SelectedDate.HasValue Then
                        dtCoStartDate = txtCoStartDate.SelectedDate
                    Else
                        dtCoStartDate = DateTime.Parse("1 Jan 1900")
                    End If

                    strNameofComp = txtNameofComp.Text.Trim
                    strAOFinstL1 = txtAddOFcol1.Text.Trim
                    strAOFInstL2 = txtAddOFcol2.Text.Trim
                    strAOFInstL3 = txtAddOFcol3.Text.Trim
                    strPositionTitle = txtPositionTitle.Text.Trim.Trim
                    strOther = txtOther.Text.Trim
                    strHigherEduNotes = txtHigherEduNotes.Text.Trim
                    decTotalScholarshipAmount = txtTotalScholarshipAmount.Value
                Else
                    'Init fields
                    ddActualcoursetype.GroupId = StaticDataEnum.Actualcoursetype
                    ddPlacementAfterGrad.GroupId = StaticDataEnum.Booleans
                    ddPlacementType.GroupId = StaticDataEnum.PlacementType
                    ddDegreeProgram.GroupId = StaticDataEnum.DegreeEarned
                    ddConcentration.GroupId = StaticDataEnum.MSConcentration
                    ddDegreeEarned.GroupId = StaticDataEnum.DegreeEarned

                    'read from db
                    Dim dtMentee As DataTable = Me.DataAccessManager.GGBCGetData("sp_GetSocietalDets", "@GGBCRegNo", Me.MenteeId)
                    If dtMentee.Rows.Count > 0 Then
                        With dtMentee.Rows(0)
                            strDegreeEarnedtodate = .Item("DegreeEarnedtodate")
                            strActualCertDegreeearned = .Item("ActualCertdegreeearned")
                            intActualcoursetype = .Item("ActualCoursetype")
                            intConcentration = .Item("Concentration")
                            intDegreeEarned = .Item("DegreeEarned")
                            intDegreeProgram = .Item("DegreeProgram")
                            intPlacementAfterGrad = .Item("PlacementAfterGrad")
                            intPlacementType = .Item("Placementtype")
                            decHighereduamount = .Item("HigherEduAmount")
                            intActualYOCompletion = .Item("ActualYOCompletion")
                            strNameofinst = .Item("NameOfInst")
                            strAddOFinstL1 = .Item("AddrOfInstL1")
                            strAddOFInstL2 = .Item("AddrOfInstL2")
                            strAddOFInstL3 = .Item("AddrOfInstL3")
                            dtStartDate = DateTime.Parse(.Item("StartDate"))
                            dtExpectedGraddate = DateTime.Parse(.Item("ExpectedGradDate"))
                            dtActualGraddate = DateTime.Parse(.Item("ActualGradDate"))
                            strNameofComp = .Item("NameOfcomp")
                            strAOFinstL1 = .Item("AddrOfCoL1")
                            strAOFInstL2 = .Item("AddrOfcoL2")
                            strAOFInstL3 = .Item("AddrOfcoL3")
                            dtCoStartDate = DateTime.Parse(.Item("CoStartDate"))
                            strPositionTitle = .Item("PositionTitle")
                            strOther = .Item("GiveBackOptOther")
                            strHigherEduNotes = .Item("HigherEduNotes")
                            decTotalScholarshipAmount = .Item("TotalScholarshipamount")
                        End With
                    End If
                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Sub

        'Public Function Save() As Integer
        Public Function Save() As SqlClient.SqlCommand

            Dim sqlCmdSaveRecs As New SqlClient.SqlCommand
            Try
                LoadFieldVariables(True)
                'sqlCmdSaveRecs.Parameters.AddWithValue("@GGBCRegID", Me.MenteeId)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DegreeEarnedToDate", strDegreeEarnedtodate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ActualCoursetype", intActualcoursetype)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ActualCertdegreeearned", strActualCertDegreeearned)
                sqlCmdSaveRecs.Parameters.AddWithValue("@HigherEduAmount", decHighereduamount)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ActualYOCompleteion", intActualYOCompletion)
                sqlCmdSaveRecs.Parameters.AddWithValue("@PlacementAfterGrad", intPlacementAfterGrad)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Placementtype", intPlacementType)
                sqlCmdSaveRecs.Parameters.AddWithValue("@CareerPostGrad", intPlacementType)
                sqlCmdSaveRecs.Parameters.AddWithValue("@NameOfInst", strNameofinst)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AddrOfInstL1", strAddOFinstL1)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AddrOfInstL2", strAddOFInstL2)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AddrOfInstL3", strAddOFInstL3)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DegreeProgram", intDegreeProgram)
                sqlCmdSaveRecs.Parameters.AddWithValue("@DegreeEarned", intDegreeEarned)
                sqlCmdSaveRecs.Parameters.AddWithValue("@StartDate", dtStartDate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@HigherEduConcentration", intConcentration)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ExpectedGradDate", dtExpectedGraddate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@ActualGradDate", dtActualGraddate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@NameOfComp", strNameofComp)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AddrOfCoL1", strAddOFinstL1)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AddrOfCoL2", strAddOFInstL2)
                sqlCmdSaveRecs.Parameters.AddWithValue("@AddrOfCoL3", strAddOFInstL3)
                sqlCmdSaveRecs.Parameters.AddWithValue("@CoStartDate", dtCoStartDate)
                sqlCmdSaveRecs.Parameters.AddWithValue("@PositionTitle", strPositionTitle)
                sqlCmdSaveRecs.Parameters.AddWithValue("@HigherEduNotes", strHigherEduNotes)
                sqlCmdSaveRecs.Parameters.AddWithValue("@TotalScholarshipamount", decTotalScholarshipAmount)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Cash", blnCash)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Time", blnTime)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Talent", blnTalent)
                sqlCmdSaveRecs.Parameters.AddWithValue("@Mentor", blnMentor)
                sqlCmdSaveRecs.Parameters.AddWithValue("@GiveBackOptOther", strOther)

                'Dim intIdentity As Integer = Me.DataAccessManager.GGBCSaveData("sp_EditSocietalDetails", sqlCmdSaveRecs)
                'Return intIdentity
                Return sqlCmdSaveRecs
            Catch ex As Exception
                Throw ex
            End Try

        End Function
        Protected Overrides Sub OnPreRender(e As System.EventArgs)
            BindJQuery()
            MyBase.OnPreRender(e)
        End Sub



        Public ReadOnly Property MenteeId As Integer
            Get
                Return CommonHelper.QueryStringInt("MenteeId")
            End Get
        End Property
    End Class
End Namespace