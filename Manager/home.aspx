<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <h3 class="page-header text-center"><strong> WORK DETAILS</strong> </h3>

    
     

            <div class="form-horizontal">
                <div class="jumbotron">

                  <div class="form-group">
                      <asp:Label ID="Label1" runat="server"  CssClass="control-label col-md-11 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-1 ">
                        <asp:Image ID="Image1" runat="server" CssClass="img-circle" Width="52px" />
                       

                    </div>
                    </br>

                     <div class="form-group">
                      <div class="col-md-3 col-md-offset-10">
                          <asp:LinkButton ID="LinkButton1" runat="server" Visible="false" 
                              CssClass="btn-info btn-link" font-size="16px" ForeColor="#0099FF" 
                              style="font-family: Arial; font-weight: bold; color: #FF0000;" 
                              OnClick="LinkButton1_Click">New notifications!!</asp:LinkButton>
               
                 </div>
               
                <div class="form-group">
                      <div class="col-md-3 col-md-offset-10">
                          <asp:LinkButton ID="LinkButton2" runat="server" Visible="false" 
                              CssClass="btn-info btn-link" font-size="16px" ForeColor="#0099FF" 
                              style="font-family: Arial; font-weight: bold; color: #FF0000;" 
                              OnClick="LinkButton2_Click">New warnings!!</asp:LinkButton>
               
                 </div>
               

            
         
         </br>
         

                <div class="form-group">

                 <div class="col-md-10 col-md-offset-1">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-responsive" Width="1000px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" >
                       
                        <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No data is available now....!</b></center>
 </EmptyDataTemplate>

                         <Columns>
                         <asp:BoundField DataField="service" HeaderText="Service" SortExpression="service" />
                            <asp:BoundField DataField="work_name" HeaderText="Work" SortExpression="work_name" />
                            <asp:BoundField DataField="requirements" HeaderText="Requirements" SortExpression="work_name" />
                              <asp:BoundField DataField="square_feet" HeaderText="Square feets" SortExpression="square_feet" />
                            <asp:BoundField DataField="alloted_date" HeaderText="Alloted Date" SortExpression="alloted_date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="complete_date" HeaderText="Completion Date" SortExpression="complete_date" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT work_request.service,work_request.work_name, workallot.alloted_date, workallot.complete_date,work_request.requirements,work_request.square_feet FROM work_request INNER JOIN workallot ON work_request.work_id = workallot.w_id where workallot.manager_id=@plid  ORDER BY workallot.Wa_id DESC" OnSelecting="SqlDataSource1_Selecting">
                        <SelectParameters>
                            <asp:SessionParameter Name="plid" SessionField="user" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                   </div>
                    </div>
                </div>
         </div>
   
</asp:Content>

