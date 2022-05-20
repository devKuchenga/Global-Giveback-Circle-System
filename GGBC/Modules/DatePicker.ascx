<%@ Control Language="VB" AutoEventWireup="true" CodeBehind ="DatePicker.ascx.vb" Inherits="GGBC.Smartik.Administration.Modules.DatePicker" %>

<asp:TextBox runat="server" ID="txtDateTime" />
<asp:ImageButton runat="Server" ID="btnCalendar" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Show Calendar" />
<br />
<ajaxToolkit:CalendarExtender runat="server" ID="ajaxCalendar" TargetControlID="txtDateTime" PopupButtonID="btnCalendar" /> 