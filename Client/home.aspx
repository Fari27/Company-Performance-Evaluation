<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container">
        <h3 class="page-header text-center"><strong>YOUR PROJECTS</strong></h3>

    
     

            <div class="form-horizontal">
                <div class="jumbotron">
                 <div class="form-group">
                
                 <%

    string msg = Request.QueryString["id"];
    if(msg!=null)
    {
        msg = msg.Trim();
        if(msg=="R")
        {
%>
                    <div class="alert alert-success alert-dismissable">

                        <a href="home.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Success! </strong>Requirements Submitted  Successfully.

                    </div>
                    
                    
                    
                    <%

    }
    else 
    {%>
                    
                    
           <div class="alert alert-danger alert-dismissable">

                        <a href="home.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Failed! </strong>Please try again.

                    </div>          
                    
                    <%


                            }
                        }



     %>


</div>
 





                <div class="form-group">
                      <asp:Label ID="Label1" runat="server"  CssClass="control-label col-md-11 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-1 ">
                        <asp:Image ID="Image1" runat="server" CssClass="img-circle" Width="52px" />
                       

                    </div>

                </div>

                <div class="form-group">
                      <div class="col-md-3 col-md-offset-10">
                          <asp:LinkButton ID="LinkButton1" runat="server" Visible="false" 
                              CssClass="btn-info btn-link" font-size="16px" ForeColor="#0099FF" 
                              style="font-family: Arial; font-weight: bold; color: #FF0000;" 
                              OnClick="LinkButton1_Click">New complaint replies!!</asp:LinkButton>
               
                 </div>
                 </div>
                     
                       <div class="form-group">

                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal"   Width="1064px" DataKeyNames="work_id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" >
                       <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No data is available now....!</b></center>
 </EmptyDataTemplate>

                         <Columns>
                           <asp:BoundField DataField="Service" HeaderText="SERVICE" SortExpression="Service" />
                            <asp:BoundField DataField="work_name" HeaderText="PROJECT TITLE" SortExpression="work_name" />
                            <asp:BoundField DataField="requirements" HeaderText="REQUIREMENTS" SortExpression="requirements" />

                            <asp:BoundField DataField="req_date" DataFormatString="{0:d}" HeaderText="REQUESTED DATE" SortExpression="req_date" />
                            <asp:BoundField DataField="completion_date" DataFormatString="{0:d}" HeaderText="COMPLETION DATE" SortExpression="completion_date" />
                         <asp:BoundField DataField="status" HeaderText="STATUS" SortExpression="Status" />
                        
                        </Columns>
                        <EditRowStyle Font-Size="16px"/>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" Font-Size="16px"/>
                        <HeaderStyle BackColor="#5bc0de" Font-Bold="True" ForeColor="White" Font-Size="14px" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle Font-Size="12px"/>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT registration.name,work_request.service, work_request.work_name, work_request.requirements, work_request.req_date, work_request.completion_date, work_request.client_id, registration.phone, work_request.work_id,work_request.status FROM registration INNER JOIN work_request ON registration.email = work_request.client_id WHERE work_request.client_id=@clientid ORDER BY work_request.work_id DESC ">
                    
                    <SelectParameters>
                            
                            <asp:SessionParameter Name="clientid" SessionField="user" />
                        </SelectParameters>
                   
                    
                    </asp:SqlDataSource>
                   
                    </div>


            </div>
         </div>
                  
     </div>

   
</asp:Content>

