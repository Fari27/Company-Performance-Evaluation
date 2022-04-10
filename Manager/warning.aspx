<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.master" AutoEventWireup="true" CodeFile="warning.aspx.cs" Inherits="Projectleader_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="container">
        <h3 class="page-header text-center"><strong>WARNINGS</strong></h3>

    
     

            <div class="form-horizontal">
                <div class="jumbotron">

                <div class="form-group">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-responsive  col-md-offset-1" Width="900px" AutoGenerateColumns="False"  CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"  >
                        <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No data is available now....!</b></center>
 </EmptyDataTemplate>
                         <Columns>
                            <asp:BoundField DataField="title" HeaderText="SUBJECT" SortExpression="tile" />
                            <asp:BoundField DataField="details" HeaderText="DETAILS" SortExpression="details" />
                            <asp:BoundField DataField="date" HeaderText="DATE" SortExpression="date"   DataFormatString="{0:MM/dd/yyyy}"/>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#5bc0de" Font-Bold="True" ForeColor="White"  Font-Size="14px"/>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle Font-Size="12px"/>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT title, details, date FROM warning WHERE (staff_id = @staff_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="staff_id" SessionField="user" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </div>
                    </div>
                </div>

     </div>

                
                        
                    
                  

                
                        
                    
                  
                
                        
                    
                  

                
     
</asp:Content>

