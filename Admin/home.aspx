<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <h3 class="page-header text-center"><strong>APPROVE CLIENT</strong></h3>

    
     

            <div class="form-horizontal">
                <div class="jumbotron">

                
                <div class="form-group">
                      <asp:Label ID="Label1" runat="server"  CssClass="control-label col-md-11 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-1 ">
                        <asp:Image ID="Image1" runat="server" CssClass="img-circle" Width="52px"/>
                       

                    </div>

                </div>

                <div class="form-group">
                      <div class="col-md-3 col-md-offset-10">
                          <asp:LinkButton ID="LinkButton3" runat="server" Visible="false" 
                              CssClass="btn-info btn-link" font-size="16px" ForeColor="#0099FF" 
                              style="font-family: Arial; font-weight: bold; color: #FF0000;" PostBackUrl="~/Admin/home.aspx" 
                             >New Cients!!</asp:LinkButton>
               
            

                </div>
           
            </div>
            <div class="form-group">
                      <div class="col-md-3 col-md-offset-10">
                          <asp:LinkButton ID="LinkButton4" runat="server" Visible="false" 
                              CssClass="btn-info btn-link" font-size="16px" ForeColor="#0099FF" 
                              style="font-family: Arial; font-weight: bold; color: #FF0000;" PostBackUrl="~/Admin/approveproject.aspx" 
                              >New Projects!!</asp:LinkButton>
               
            

                </div>
           
            </div>
            <div class="form-group">
                      <div class="col-md-3 col-md-offset-10">
                          <asp:LinkButton ID="LinkButton5" runat="server" Visible="false" 
                              CssClass="btn-info btn-link" font-size="16px" ForeColor="#0099FF" 
                              style="font-family: Arial; font-weight: bold; color: #FF0000;" PostBackUrl="~/Admin/allocatework.aspx" 
                             >New Work!!</asp:LinkButton>
               
            

                </div>
           
            </div>
         


                 <div class="form-group">
                      <div class="col-md-3 col-md-offset-10">
                          <asp:LinkButton ID="LinkButton1" runat="server" Visible="false" 
                              CssClass="btn-info btn-link" font-size="16px" ForeColor="#0099FF" 
                              style="font-family: Arial; font-weight: bold; color: #FF0000;" 
                              OnClick="LinkButton1_Click">New complaints!!</asp:LinkButton>
               
            

                </div>
            </div>
            <div class="form-group">
                      <div class="col-md-3 col-md-offset-10">
                          <asp:LinkButton ID="LinkButton2" runat="server" Visible="false" 
                              CssClass="btn-info btn-link" font-size="16px" ForeColor="#0099FF" 
                              style="font-family: Arial; font-weight: bold; color: #FF0000;" 
                              OnClick="LinkButton2_Click">New feedbacks!!</asp:LinkButton>
               
            

                </div>
                </div>
                 
         
         
         
         
         
               
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
                        <strong>Success! </strong>Permission status updated Successfully.

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
                    
<%

    string msgs = Request.QueryString["ids"];
    if(msgs!=null)
    {
        msgs = msgs.Trim();
        if(msgs=="T")
        {
%>
                    <div class="alert alert-success alert-dismissable">

                        <a href="staffregister.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Success! </strong>Rejected Client Successfully.

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
                        


                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-responsive" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowCommand="GridView1_RowCommand1" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <Columns>


                         <asp:TemplateField HeaderText="PHOTO" ItemStyle-Width="80">
                    
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Photo") %>' Height="80px" Width="80px"/>
                <ItemStyle Width="80px" />
                </ItemTemplate>
                    </asp:TemplateField>
                       

                            <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name"  />
                            <asp:BoundField DataField="address" HeaderText="ADDRESS" SortExpression="address" ItemStyle-Width="350"/>
                            <asp:BoundField DataField="place" HeaderText="PLACE" SortExpression="place" />
                            <asp:BoundField DataField="usernsme" HeaderText="EMAIL ID" SortExpression="usernsme" />
                            <asp:BoundField DataField="phone" HeaderText="PHONE NO" SortExpression="phoneno" />
                            <asp:BoundField DataField="status" HeaderText="STATUS" SortExpression="status" />
                             <asp:TemplateField HeaderText="AGREEMENT" ItemStyle-Width="200">
                         <ItemTemplate>
                            <a href ='..<%#Eval("agreement") %>'>View/Download</a>
                        </ItemTemplate>
                 </asp:TemplateField>
                    
                            <asp:ButtonField CommandName="apr" HeaderText="APPROVE" Text="Approve" FooterStyle-BackColor="#0099FF" ButtonType="Button" ControlStyle-BackColor="#0099ff" ControlStyle-CssClass="btn" ControlStyle-ForeColor="#ffffff" ControlStyle-Font-Size="14px" />
                            <asp:ButtonField CommandName="rej" HeaderText="REJECT" Text="Reject"  FooterStyle-BackColor="#0099FF" ButtonType="Button" ControlStyle-BackColor="#0099ff" ControlStyle-CssClass="btn" ControlStyle-ForeColor="#ffffff" ControlStyle-Font-Size="14px"/>
                        </Columns>
                        <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No data is available now....!</b></center>
 </EmptyDataTemplate>

                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#5bc0de" Font-Bold="True" ForeColor="White" Font-Size="14px" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle  Font-Size="12px"/>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>


                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT login.Photo,registration.name, registration.address, registration.place, login.usernsme, registration.phone,registration.status,registration.agreement FROM login INNER JOIN registration ON login.usernsme = registration.email ORDER BY registration.reg_id DESC"></asp:SqlDataSource>

                    </div>
                    </div>
                
         </div>
       </div>
</asp:Content>

