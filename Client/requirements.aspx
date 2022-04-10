<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="requirements.aspx.cs" Inherits="Client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <h3 class="page-header text-center "><strong> Project Requirements</strong> </h3>

        <div class="jumbotron">

               <div class="form-horizontal">
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

                        <a href="staffregister.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Success! </strong>Requirements Submitted  Successfully.

                    </div>
                    
                    
                    
                    <%

    }
    else if(msg=="")
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
                      
                             <asp:Label ID="lbldpt" runat="server" Text="Services" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                    <div class="col-md-6">
                         <asp:DropDownList ID="ddldpt"  runat="server" DataSourceID="SqlDataSource1" CssClass="form-control" DataTextField="dept_name" DataValueField="dept_id" AppendDataBoundItems="True" ><asp:ListItem Value="0">--Select--</asp:ListItem></asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddldpt" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                    
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT dept_id, Dept_name  FROM  services">
                         </asp:SqlDataSource>
                    </div>

                </div>

              
                 <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Project"  CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                   <div class="col-md-6">  
                       <asp:TextBox ID="txttitle"  CssClass="form-control" runat="server"  placeholder="Enter project title" required="required"></asp:TextBox>
               
                        </div>


               </div>
                   
                    <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Work location"  CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                   <div class="col-md-6">  
                       <asp:TextBox ID="TextBox1"  CssClass="form-control" runat="server"  placeholder="Enter work location " required="required"></asp:TextBox>
               
                        </div>


               </div>
                


                 <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Requirements"  CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                   <div class="col-md-6">  
                       <asp:TextBox ID="txtreq"  CssClass="form-control" runat="server" placeholder="Enter requirements" required="required" ></asp:TextBox>
               
                        </div>


               </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Square Feets"  CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                   <div class="col-md-6">  
                       <asp:TextBox ID="TextBox2"  CssClass="form-control" runat="server" placeholder="Enter requirements" required="required" ></asp:TextBox>
               
                        </div>


               </div>
             
             
                  <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Completion date" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                   <div class="col-md-6">  
                       <asp:TextBox ID="txtcom" type="date" CssClass="form-control" runat="server"></asp:TextBox>
               
                        </div>


           </div>
                
                               
                             
                
                      

                <div class="form-group">

                    <div class="col-md-6 col-md-offset-3">
                        <asp:Button ID="Button1" CssClass="btn btn-info form-control" runat="server" Text="send" OnClick="Button1_Click" style="margin-bottom: 0" />

                    </div>




                </div>
                        


               
            

                </div>
            </div>
         

                  
        </div>
         </div>


</asp:Content>

