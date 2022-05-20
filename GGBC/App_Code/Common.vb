Imports System.Configuration
Imports System.Web.Configuration
Imports System.Xml
Imports System.Data
Imports System.Data.SqlClient

Namespace Smartik.BLL
    Module Common

        Private _connectionString As String = String.Empty
        Private _initialized As Boolean

        'Private Function conString() As String
        '    If String.IsNullOrEmpty(_connectionString) Then
        '        ConnectionString = ConfigurationManager.ConnectionStrings("ConnStringGGBC").ConnectionString
        '    End If
        '    Return ConnectionString
        'End Function

        Function sqlConnect() As SqlConnection

            Dim sqlConnection As SqlConnection = New SqlConnection(ConnectionString)
            If sqlConnection.State = ConnectionState.Closed Then
                sqlConnection.Open()
            End If

            Return sqlConnection
        End Function

        Private ReadOnly Property ConnectionString() As String
            Get
                If String.IsNullOrEmpty(_connectionString) Then
                    _connectionString = ConfigurationManager.ConnectionStrings("ConnStringGGBC").ConnectionString
                End If
                Return _connectionString
            End Get
        End Property
    End Module
End Namespace

'Namespace Smartik.Administration
'    Public Enum StaticDataEnum As Integer

'        Booleans = 1 'N/A,Yes, No
'        Mentorlevel = 2 'Level 1,level 2
'        MenteeTerminationReason = 3
'        MenteeClass = 4 'N/A,Form1, Form2, Form3.....
'        KCSEScore = 5 'Grade
'        CertificationResults = 6 'N/A,Passed, Not done
'        TypeOfSchool = 7 'N/A, Secondary, Tertiary, ICTTraining etc : Multiple=True
'        TypeOfSchoolSpecific = 8 'N/A, Secondary, High School, Academy etc : Multiple=True
'        MSConcentration = 9 'N/A,Business, Econ etc
'        ProfessionTitle = 11 'N/A, HR, IT Manager
'        GBCCSource = 14 'N/A, Website, mentor event
'        TypeOfPartner = 15 'N/A, Financial, inkind, IT etc : Multiple=True
'        TypeOfPartnerSpecific = 16 'N/A, Foundation, Governmental, Individual etc : Multiple=True
'        MeetingOutcome = 17 'N/A, Sponsorship, Mentorship, Internship etc
'        MentorAffilliation = 21 'Affiliation institituion e.g Daystar
'        NextOfKin = 23
'        DegreeEarned = 24 'N/A,BSC bla bla
'        PlacementType = 26 'N/A, Yes, No
'        CommittmentCategory = 27 'N/A, Education, Energy and climate, Poverty eradication etc
'        OtherContibutionsMade = 28 'N/A, Facilitated other bla bla etc
'        Actualcoursetype = 29 'N/A, Certificate, diploma etc
'        TertiarySchool = 30 'N/A, College, uni etc
'        PeriodFrequency = 31 'N/A,Monthly, Quartely, Half Yearly, Annually
'        Methodofsubscription = 32 ' N/A, Cash, Cheque, WireTransfer etc
'        SpecificPositionHeld = 33 'N/A, Leader, Supervisor, Team Member
'        MentorTerminationReason = 34 'N/A, No communication, by choice etc
'        NationalityResidence = 35 ' N/A, Kenyan etc
'        MentorEventAttended = 36 'N/A, Quart 1, Quart 2.. 'Multiple = True
'    End Enum
'End Namespace
