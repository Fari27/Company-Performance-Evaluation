<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h3 class="page-header text-center"><strong>FEEDBACKS</strong></h3>

    
     

            <div class="form-horizontal">
                <div class="jumbotron">

                <div class="form-group">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-responsive" Width="1050px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand1" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                        <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No data is available now....!</b></center>
 </EmptyDataTemplate>
                        <Columns>
                          <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name" />
                            <asp:BoundField DataField="user" HeaderText="MAILID" SortExpression="userid" />
                            <asp:BoundField DataField="sub" HeaderText="SUBJECT" SortExpression="subject" />
                            <asp:BoundField DataField="feedback" HeaderText="FEEDBACK" SortExpression="feedback" />
                            <asp:BoundField DataField="date" HeaderText="DATE" SortExpression="date"   DataFormatString="{0:MM/dd/yyyy}"/>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" Font-Size="16px"/>
                        <HeaderStyle BackColor="#5bc0de" Font-Bold="True" ForeColor="White"  Font-Size="14px"/>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle  Font-Size="12px"/>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
               
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT registration.name,feedback.user,feedback.sub,feedback.feedback,feedback.date FROM registration INNER JOIN feedback ON registration.email =feedback.user"></asp:SqlDataSource>
               
                     </div>
                </div>
                
         
            </div>
       </div>
                        

</asp:Content>

