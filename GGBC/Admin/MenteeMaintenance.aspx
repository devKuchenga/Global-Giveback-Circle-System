﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MenteeMaintenance.aspx.vb" Inherits="GGBC.Smartik.Administration.Admin.MenteeMaintenancePage" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <h2 title="Mentor Maintenance">
        DROPDOWNS</h2>
    <h2 title="Mentor Maintenance">
    <asp:Label ID="lblErrorMsgs" runat="server" ForeColor="Red" Font-Bold="True" 
            Font-Size="Large"></asp:Label>
    <asp:Label ID="lblMsgs" runat="server" Font-Bold="True" Font-Size="Large" 
            ForeColor="#00CC00"></asp:Label>
    </h2>
    <br />

    <table class="style33">
        <tr>
            <td class="style34">
                Select DropDown To Modify</td>
            <td>
                <ajaxToolkit:Combobox ID="cmbGroupname" runat="server" AutoPostBack="True"
     CaseSensitive="False"  OnSelectedIndexChanged="cmbGroupname_SelectedIndexChanged"   
     AppendDataBoundItems="True" RenderMode="Block" Width="250px">
                </ajaxToolkit:Combobox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            <asp:GridView ID="GridView1" runat="server" Width="665px" AutoGenerateColumns="False"
        AlternatingRowStyle-BackColor="#C2D69B" HeaderStyle-BackColor="green"  AutoGenerateDeleteButton="true" AutoGenerateEditButton="true" onrowcancelingedit="gvDetails_RowCancelingEdit" 
             onrowdeleting="gvDetails_RowDeleting" onrowediting="gvDetails_RowEditing"
                        onrowupdating="gvDetails_RowUpdating" datakeysnames="ColumnId"
        ShowFooter="True" Height="144px" EnableViewState="False" EnableModelValidation="True">
        <Columns>
        <asp:TemplateField HeaderText="ColumnId" InsertVisible="False" SortExpression="Id">
                   <ItemTemplate>
                          <asp:Label ID="ColID" runat="server"
Text='<%# Eval("ColumnId") %>'></asp:Label>
                      </ItemTemplate>        
                  </asp:TemplateField>                

          <asp:TemplateField HeaderText="Field Name" SortExpression="Field Name">
            <EditItemTemplate><asp:TextBox ID="txtFieldname" runat="server" 
                 Text='<%# Eval("Fieldname")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate><asp:Label ID="Label2" runat="server"
 Text='<%# Eval("FieldName")%>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtFieldname" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Select Value" SortExpression="Select Value">
            <EditItemTemplate><asp:TextBox ID="txtselectvalue" runat="server" 
                 Text='<%# Eval("selectvalue")%>'></asp:TextBox>
                </EditItemTemplate>
            <ItemTemplate><asp:Label ID="Label3" runat="server"
 Text='<%# Eval("SelectValue")%>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtSelectValue" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Group ID">
                <ItemTemplate>
                    <%# Eval("GroupID")%>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtgroupID" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>

                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Add" CommandName = "Footer" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <AlternatingRowStyle BackColor="#C2D69B" />
        <EmptyDataTemplate>
            <tr style="background-color: #038346">
                <th scope="col">
                    Field Name
                </th>
                <th scope="col">
                    Select Value
                </th>
                <th scope="col">
                    Group ID
                </th>
                <th scope="col">
                    
                </th>
            </tr>
          
            <tr>
                <td>
                    <asp:TextBox ID="txtFieldname" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="txtSelectValue" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="txtGroupID" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Add" CommandName = "EmptyDataTemplate" />
                </td>
            </tr>
        </EmptyDataTemplate>

<HeaderStyle BackColor="Green"></HeaderStyle>
    </asp:GridView>
                &nbsp;</td>
        </tr>
   </table>

</asp:Content>
