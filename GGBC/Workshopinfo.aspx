<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Workshopinfo.aspx.vb" inherits="GGBC.WorkshopInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">


        .style6
        {
        }
        
        .style16
        {
            width: 203px;
        }
        .style18
        {
            width: 295px;
        }
        .style19
        {
            width: 157px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <h2 title="Mentor Maintenance">
    Workshop&nbsp; Information</h2>
<p title="Mentor Maintenance">
    <asp:Label ID="lblErrorMsgs" runat="server" ForeColor="Red" Font-Bold="True" 
            Font-Size="Large"></asp:Label>
    <asp:Label ID="lblMsgs" runat="server" Font-Bold="True" Font-Size="Large" 
            ForeColor="#00CC00"></asp:Label>
</p>
<br />
<table style="width:98%;">
    <tr>
        <td class="style16">
            GGBC Reg No:</td>
        <td class="style18">
            <ajaxToolkit:Combobox 
                    ID="ddMentee" runat="server" FilterType="Contains" 
                    Width="200px" style="top: 0px; left: 0px" 
                AutoCompleteMode="SuggestAppend">
                </ajaxToolkit:Combobox>
&nbsp;<asp:Textbox ID="txtGGBCREGNo" runat="server" style="top: 0px; left: 0px" 
                    Visible="False"></asp:Textbox>
                <asp:Button ID="btnFindRec" runat="server" Text="Load Mentee Details" 
                    Enabled="False" />
        </td>
        <td class="style19">
            &nbsp;</td>
        <td class="style20">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            First Name</td>
        <td class="style18">
            <asp:Label ID="lblFName" runat="server" style="font-weight: 700"></asp:Label>
        </td>
        <td class="style19">
            Middle Name</td>
        <td class="style20">
            <asp:Label ID="lblMName" runat="server" style="font-weight: 700"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style16">
            Last Name:</td>
        <td class="style18">
            <asp:Label ID="lblLName" runat="server" style="font-weight: 700"></asp:Label>
        </td>
        <td class="style19">
            &nbsp;</td>
        <td class="style20">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            Annual Renewal </td>
        <td class="style18">
            
            <ASP:TextBox runat="server" ID="txtAnnualRenewaldate"></ASP:TextBox>
            <asp:ImageButton runat="Server" ID="Image1" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" />
            <ajaxToolkit:CalendarExtender ID="clannualrenewaldate" runat="server" TargetControlID="txtannualrenewaldate" 
            PopupButtonID="Image1" />
            <script type="text/javascript">
                
        </script>
            <asp:checkbox ID="ocbAnnualrenewal" runat="server" Text="Attended" 
                style="top: 37px; left: 1px">
            </asp:checkbox>
        </td>
        <td class="style19">
            Reason Not Attended</td>
        <td class="style6">
            <asp:Textbox ID="txtAnnualrenewalreason" runat="server" Rows="3" 
                style="top: 0px; left: 0px; width: 182px" TextMode="MultiLine" 
                Width="180px"></asp:Textbox>
        </td>
    </tr>
    <tr>
        <td class="style16">
            Financial Literacy I </td>
        <td class="style18">
            <ASP:TextBox runat="server" ID="txtFinLitIDate"></ASP:TextBox>
            <asp:ImageButton runat="Server" ID="Image2" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" />
            <ajaxToolkit:CalendarExtender ID="clfinlitIdate" runat="server" TargetControlID="txtFinlitIdate" 
            PopupButtonID="Image2" />
            <asp:checkbox ID="ocbFinLit1" runat="server" Text="Attended">
            </asp:checkbox>
        </td>
        <td class="style19">
            Reason Not Attended</td>
        <td class="style6">
            <asp:Textbox ID="txtFinLitIReason" runat="server" Rows="3" 
                style="top: 0px; left: 0px; width: 182px" TextMode="MultiLine" Width="180px"></asp:Textbox>
        </td>
    </tr>
    <tr>
        <td class="style16">
            Financial Literacy II </td>
        <td class="style18">
            <ASP:TextBox runat="server" ID="txtFinLitIIDate"></ASP:TextBox>
            <asp:ImageButton runat="Server" ID="Image3" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" />
            <ajaxToolkit:CalendarExtender ID="clFinlitIIdate" runat="server" TargetControlID="txtFinLitIIdate" 
            PopupButtonID="Image3" />
            <asp:checkbox ID="ocbFinLit2" runat="server" Text="Attended">
            </asp:checkbox>
        &nbsp;
            </td>
        <td class="style19">
            Reason Not Attended</td>
        <td class="style6">
            <asp:Textbox ID="txtFinLitIIReason" runat="server" Rows="3" 
                style="top: -1px; left: -1px; width: 182px" TextMode="MultiLine" Width="180px"></asp:Textbox>
        </td>
    </tr>
    <tr>
        <td class="style16">
            Reprductive Health I</td>
        <td class="style18">
            <ASP:TextBox runat="server" ID="txtReproductiveHealthIDate"></ASP:TextBox>
            <asp:ImageButton runat="Server" ID="Image4" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" />
            <ajaxToolkit:CalendarExtender ID="clReproductivehealthIdate" runat="server" TargetControlID="txtReproductivehealthIdate" 
            PopupButtonID="Image4" />
            <asp:checkbox ID="ocbRepHealth1" runat="server" Text="Attended">
            </asp:checkbox>
        &nbsp;
            </td>
        <td class="style19">
            Reason Not Attended</td>
        <td class="style6">
            <asp:Textbox ID="txtReproHealthIReason" runat="server" Rows="3" 
                style="top: 0px; left: 0px; width: 182px" TextMode="MultiLine" Width="180px"></asp:Textbox>
        </td>
    </tr>
    <tr>
        <td class="style16">
            Reproductive Health II</td>
        <td class="style18">
            <ASP:TextBox runat="server" ID="txtReproductiveHealthIIDate"></ASP:TextBox>
            <asp:ImageButton runat="Server" ID="Image5" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" />
            <ajaxToolkit:CalendarExtender ID="clreperoductivehealthIIdate" runat="server" TargetControlID="txtReproductivehealthIIdate" 
            PopupButtonID="Image5" />
            <asp:checkbox ID="ocbRepHealth2" runat="server" Text="Attended" 
                style="top: 39px; left: 1px">
            </asp:checkbox>
        &nbsp;
            </td>
        <td class="style19">
            Reason Not Attended</td>
        <td class="style6">
            <asp:Textbox ID="txtReproHealthIIReason" runat="server" Rows="3" 
                style="top: 0px; left: 0px; width: 182px" TextMode="MultiLine" Width="180px"></asp:Textbox>
        </td>
    </tr>
    <tr>
        <td class="style16">
            Substance Abuse</td>

        <td class="style18">
            <ASP:TextBox runat="server" ID="txtSubstanceAbuseIDate"></ASP:TextBox>
            <asp:ImageButton runat="Server" ID="Image6" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" />
            <ajaxToolkit:CalendarExtender ID="clSubstanceabuseIdate" runat="server" TargetControlID="txtSubstanceabuseIdate" 
            PopupButtonID="Image6" />
            <asp:checkbox ID="ocbSAbuse" runat="server" Text="Attended">
            </asp:checkbox>
        &nbsp;
            </td>
        <td class="style19">
            Reason Not Attended</td>
        <td class="style6">
            <asp:Textbox ID="txtSubstanceabuseIReason" runat="server" Rows="3" 
                style="top: 0px; left: 0px; width: 182px" TextMode="MultiLine" Width="180px"></asp:Textbox>
        </td>
    </tr>
    <tr>
        <td class="style16">
            Leadership</td>
        <td class="style18">
            <ASP:TextBox runat="server" ID="txtLeadershipDate"></ASP:TextBox>
            <asp:ImageButton runat="Server" ID="Image7" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" />
            <ajaxToolkit:CalendarExtender ID="clLeadershipdate" runat="server" TargetControlID="txtLeadershipdate" 
            PopupButtonID="Image7" />
            <asp:checkbox ID="ocbLeadership" runat="server" Text="Attended">
            </asp:checkbox>
        &nbsp;
            </td>
        <td class="style19">
            Reason Not Attended</td>
        <td class="style6">
            <asp:Textbox ID="txtLeadershipReason" runat="server" Rows="3" 
                style="top: 0px; left: 0px; width: 182px" TextMode="MultiLine" Width="180px"></asp:Textbox>
        </td>
    </tr>
    <tr>
        <td class="style16">
            Social Media Savvy</td>
        <td class="style18">
            <ASP:TextBox runat="server" ID="txtSocialMediaSavvyDate"></ASP:TextBox>
            <asp:ImageButton runat="Server" ID="Image8" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" />
            <ajaxToolkit:CalendarExtender ID="clSocialmediasavvydate" runat="server" TargetControlID="txtsocialmediasavvydate" 
            PopupButtonID="Image8" />
            <asp:checkbox ID="ocbSMS" runat="server" Text="Attended">
            </asp:checkbox>
        &nbsp;
            </td>
        <td class="style19">
            Reason Not Attended</td>
        <td class="style6">
            <asp:Textbox ID="txtSocialMediaSavvyReason" runat="server" Rows="3" 
                style="top: 0px; left: 0px; width: 182px" TextMode="MultiLine" Width="180px"></asp:Textbox>
        </td>
    </tr>
    <tr>
        <td class="style16">
            Communication skills</td>
        <td class="style18">
           <ASP:TextBox runat="server" ID="txtCommunicationSkillsDate"></ASP:TextBox>
            <asp:ImageButton runat="Server" ID="Image9" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" />
            <ajaxToolkit:CalendarExtender ID="clcommunicationskillsdate" runat="server" TargetControlID="txtCommunicationskillsdate" 
            PopupButtonID="Image9" />
            <asp:checkbox ID="ocbCS" runat="server" Text="Attended">
            </asp:checkbox>
        &nbsp;
            </td>
        <td class="style19">
            Reason Not Attended</td>
        <td class="style6">
            <asp:Textbox ID="txtCommunicationSkillsReason" runat="server" Rows="3" 
                style="top: 0px; left: 0px; width: 182px" TextMode="MultiLine" Width="180px"></asp:Textbox>
        </td>
    </tr>
    <tr>
        <td class="style16">
            Work Readiness</td>
        <td class="style18">
            <ASP:TextBox runat="server" ID="txtWorkReadyDate"></ASP:TextBox>
            <asp:ImageButton runat="Server" ID="Image10" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" />
            <ajaxToolkit:CalendarExtender ID="clworkreadydate" runat="server" TargetControlID="txtWorkreadydate" 
            PopupButtonID="Image10" />
        &nbsp;
            <asp:checkbox ID="ocbWr" runat="server" Text="Attended">
            </asp:checkbox>
            </td>
        <td class="style19">
            Reason Not Attended</td>
        <td class="style6">
            <asp:Textbox ID="txtWorkReadyreason" runat="server" Rows="3" 
                style="top: 0px; left: 0px; width: 182px" TextMode="MultiLine" Width="180px"></asp:Textbox>
        </td>
    </tr>
    <tr>
        <td class="style16">
            Career/Transitional </td>
        <td class="style18">
            <ASP:TextBox runat="server" ID="txtCareerTransDate"></ASP:TextBox>
            <asp:ImageButton runat="Server" ID="Image11" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" />
            <ajaxToolkit:CalendarExtender ID="clcareertransdate" runat="server" TargetControlID="txtcareertransdate" 
            PopupButtonID="Image11" />
            <asp:checkbox ID="ocbCareer" runat="server" Text="Attended">
            </asp:checkbox>
        &nbsp;
            </td>
        <td class="style19">
            Reason Not Attended</td>
        <td class="style6">
            <asp:Textbox ID="txtCareerTransResaon" runat="server" Rows="3" 
                style="top: 0px; left: 0px; width: 182px" TextMode="MultiLine" Width="180px"></asp:Textbox>
        </td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td class="style18">
            <asp:Button ID="btnEdit" runat="server" Text="Edit Record" />
        </td>
        <td class="style19">
            <asp:Button ID="btnSaveRecord" runat="server" Text="Save Record" 
                        Enabled="False" />
        </td>
        <td class="style6">
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
        </td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td class="style18">
            &nbsp;</td>
        <td class="style19">
            &nbsp;</td>
        <td class="style20">
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
