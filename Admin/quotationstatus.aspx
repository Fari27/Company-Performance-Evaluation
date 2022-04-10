<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="quotationstatus.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
        <h3 class="page-header text-center"><strong>PROJECT QUOTATIONS</strong></h3>

    
     

            <div class="form-horizontal">
                <div class="jumbotron">

    <div class="form-group">
                    
<%

    string msg = Request.QueryString["id"];
    if(msg!=null)
    {
        msg = msg.Trim();
        if(msg=="S")
        {
%>
                    <div class="alert alert-success alert-dismissable">

                        <a href="staffregister.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Success! </strong>Project quotation send  Successfully.

                    </div>
                    
                    
                    
                    <%

    }
    else
    {%>
                    
                    
           <div class="alert alert-danger alert-dismissable">

                        <a href="staffregister.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Failed! </strong>Please try again.

                    </div>          
                    
                    <%


                            }
                        }



     %>


                </div>
                   
             

                <div class="form-group">

                    <asp:GridView ID="GridView1" Width="100%" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal"  OnRowCommand="GridView1_RowCommand1" DataKeyNames="work_id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"  Class="customgrid">
                       <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No data is available now....!</b></center>
 </EmptyDataTemplate>

                         <Columns>
                             <asp:TemplateField>
  
                            <ItemTemplate>
                                   
                                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("work_id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
 
                           
                            <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name" />
                            <asp:BoundField DataField="work_name" HeaderText="PROJECT TITLE" SortExpression="work_name" />
                            <asp:BoundField DataField="requirements" HeaderText="FEATURES" SortExpression="requirements" />
                            <asp:BoundField DataField="req_date" DataFormatString="{0:d}" HeaderText="REQUESTED DATE" SortExpression="req_date" />
                            <asp:BoundField DataField="completion_date" DataFormatString="{0:d}" HeaderText="COMPLETION DATE" SortExpression="completion_date" />
                            <asp:BoundField DataField="client_id" HeaderText="CLIENT ID" SortExpression="client_id" />
                            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                           
                           </Columns>
                        <EditRowStyle/>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black"/>
                        <HeaderStyle BackColor="#5bc0de" Font-Bold="True" ForeColor="White"/>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT registration.name, work_request.work_name, work_request.requirements, work_request.req_date, work_request.completion_date, work_request.client_id, registration.phone, work_request.work_id,work_request.Status FROM registration INNER JOIN work_request ON registration.email = work_request.client_id WHERE ( work_request.Status='Accepted' or work_request.Status='Rejected' or work_request.Status='Approved' or work_request.Status='Resend'
                     )"></asp:SqlDataSource>
                   
                    </div>


            </div>
         </div>
                  
     </div>
</asp:Content>


