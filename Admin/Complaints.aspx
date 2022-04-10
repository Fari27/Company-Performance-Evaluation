<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Complaints.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div class="container">
        <h3 class="page-header text-center"><strong>COMPLAINTS</strong></h3>

        
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

                        <a href="Complaints.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Success! </strong>Reply to  complaint sent  Successfully.

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
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-responsive" Width="1050px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" >
                       <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No complaint received now....!</b></center>
 </EmptyDataTemplate>
                         <Columns>
                             <asp:TemplateField>
                                <ItemTemplate>
                                    
                                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("cid") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name" />
                            <asp:BoundField DataField="email" HeaderText="EMAIL" SortExpression="email" />
                            <asp:BoundField DataField="date" HeaderText="DATE" SortExpression="date"/>
                            <asp:BoundField DataField="subject" HeaderText="COMPLAINT" SortExpression="complaint"/>
                            <asp:BoundField DataField="complaint" HeaderText="DETAILS" SortExpression="details" />
                            <asp:ButtonField CommandName="rpl" Text="Reply" FooterStyle-BackColor="#0099FF" ButtonType="Button" ControlStyle-BackColor="#0099ff" ControlStyle-CssClass="btn" ControlStyle-ForeColor="#ffffff" ControlStyle-Font-Size="14px" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" Font-Size="16px"/>
                        <HeaderStyle BackColor="#5bc0de" Font-Bold="True" ForeColor="White"  Font-Size="18px"/>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle  Font-Size="16px"/>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
               
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT complaint.cid,registration.name, registration.email, complaint.date, complaint.subject, complaint.complaint FROM registration INNER JOIN complaint ON registration.email = complaint.uid where complaint.status='got' "></asp:SqlDataSource>
               
                     </div>

                      <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                          <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn-info btn-link" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold" OnClick="LinkButton1_Click">Sent Replies</asp:LinkButton>
               
            

                </div>
            </div>
         
               
                 <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Reply" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold" Visible="False"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtreply" CssClass="form-control" runat="server" Visible="False"></asp:TextBox>

                    </div>

                </div>

                 <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Mailid" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold" Visible="False"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Visible="False"></asp:TextBox>

                    </div>

                </div>
                
                 <div class="form-group">
                  <div class="col-md-6 col-md-offset-3">
                  <asp:Button ID="Button1" CssClass="btn btn-info form-control" runat="server" Text="Send" OnClick="Button1_Click" style="margin-bottom: 0" Visible="False" />
                    </div>
                       </div>                           
                                
                 
         
         
            </div>
      </div>
          
       </div>
                        

</asp:Content>

