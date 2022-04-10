<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="complaintreply.aspx.cs" Inherits="Client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <h3 class="page-header text-center"><strong>COMPLAINTS</strong></h3>

    
     

            <div class="form-horizontal">
                <div class="jumbotron">

                <div class="form-group">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-responsive col-md-offset-1" Width="900px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"  >
                        <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large"> If you have sent any complaints we will reply it you soon!</b></center>
 </EmptyDataTemplate>

                         <Columns>
                            <asp:BoundField DataField="date" HeaderText="COMPLAINT DATE" SortExpression="date" />
                            <asp:BoundField DataField="subject" HeaderText="COMPLAINT" SortExpression="subject" />
                            <asp:BoundField DataField="complaint" HeaderText="DETAILS" SortExpression="complaint"/>
                            <asp:BoundField DataField="reply" HeaderText="REPLY" SortExpression="reply"/>
                            <asp:BoundField DataField="replydate" DataFormatString="{0:d}" HeaderText="REPLY DATE" SortExpression="replydate" />
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
               
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT date, subject,complaint,reply,replydate FROM complaint WHERE ((status = 'replied') or (status='viewed')) AND (uid = @uid)">
                         <SelectParameters>
                             <asp:SessionParameter Name="uid" SessionField="user" />
                         </SelectParameters>
                    </asp:SqlDataSource>
               
                     </div>
                </div>
                </div></div>
    
</asp:Content>

