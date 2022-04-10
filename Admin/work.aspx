<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="work.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <h3 class="page-header text-center"><strong> WORK DETAILS</strong> </h3>

    
     

            <div class="form-horizontal">
                <div class="jumbotron">

                <div class="form-group">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-responsive" Width="1000px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" >
                       
                        <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No data is available now....!</b></center>
 </EmptyDataTemplate>

                         <Columns>
                          <asp:BoundField DataField="fname" HeaderText="NAME" SortExpression="name" />
                            <asp:BoundField DataField="manager_id" HeaderText="EMAILID" SortExpression="emailid" />
                            <asp:BoundField DataField="service" HeaderText="SERVICE" SortExpression="service" />
                            <asp:BoundField DataField="work_name" HeaderText="PROJECT TITLE" SortExpression="work_name" />
                            <asp:BoundField DataField="alloted_date" HeaderText="ALLOTED DATE" SortExpression="alloted_date"  DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="completion_date" HeaderText="SUBMISSION DATE" SortExpression="completion_date"  DataFormatString="{0:MM/dd/yyyy}" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#5bc0de" Font-Bold="True" ForeColor="White"  Font-Size="14px"/>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle  Font-Size="12px"/>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT  work_request.work_name,staffregisters.fname,workallot.manager_id,workallot.alloted_date, work_request.completion_date,work_request.service FROM  work_request INNER JOIN workallot ON work_request.work_id = workallot.W_id INNER JOIN staffregisters ON workallot.manager_id=staffregisters.email"></asp:SqlDataSource>
                   </div>
                    </div>
                </div>
         </div>
   
</asp:Content>

