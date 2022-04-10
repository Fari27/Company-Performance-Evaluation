<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Common.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Common_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h3 class="page-header text-center"><strong>LOGIN</strong></h3>
     
 
    
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

                        <a href="login.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Success! </strong>Registration successful!!You can login only after your verification.Please wait for mail.

                    </div>
                    
                    
                    
                    <%

    }
        
      else if(msg=="S")  
    {%>
                    
                    
           <div class="alert alert-success alert-dismissable">

                        <a href="login.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Success!!!</strong>Your password changed.

                    </div>          
                    
                    <%


                            }
  
            
                              
    else
    {%>
                    
                    
           <div class="alert alert-danger alert-dismissable">

                        <a href="login.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Failed! </strong>Please try again.

                    </div>          
                    
                    <%


                            }
                        }



     %>


                </div>


               

                     

                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Username" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                    &nbsp;<div class="col-md-6">
                        <asp:TextBox ID="txtusername" placeholder="Enter username" CssClass="form-control"  type="email" required="required" runat="server"></asp:TextBox>

                    </div>

                </div>
                 <div class="form-group">
                    <asp:Label ID="Label2" runat="server" placeholder="Enter password" Text="Password"  CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtpassword" placeholder="Enter password" CssClass="form-control"  runat="server"  TextMode="Password" OnTextChanged="txtpassword_TextChanged1"></asp:TextBox>

                    </div>

                </div>

                  
                 <div class="form-group">

                    <div class="col-md-6 col-md-offset-3">
                        <asp:Button ID="Button1"  CssClass="btn btn-info form-control" runat="server" Text="Login" OnClick="Button1_Click" style="margin-bottom: 0" />

            <asp:TextBox ID="txtResult" runat="server" Visible="False"></asp:TextBox>

                    </div>




               
                <div class="form-group">

                    <div class="col-md-6 col-md-offset-3">
                        <asp:LinkButton ID="LinkButton1" CssClass="btn-link btn-info form-control"  font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold" runat="server" OnClick="LinkButton1_Click1">Forgot Password</asp:LinkButton>

                    </div>



                

                </div>
                     <asp:Panel ID="Panel1" Visible="false" runat="server">
                     <div class="form-group">

                          <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="New Passsword" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtnew" CssClass="form-control" required="required" runat="server" placeholder="Enter new password" TextMode="Password" ValidationGroup="a"></asp:TextBox>

                    </div>

                </div>
                 <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Renter Password" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtreenter" CssClass="form-control" required="required" placeholder="Reenter password" runat="server" TextMode="Password" ValidationGroup="a"></asp:TextBox>
                          <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Not matching" ControlToCompare="txtnew" ControlToValidate="txtreenter" ForeColor="Red" ValidationGroup="a"></asp:CompareValidator>
                    </div>

                </div>
                 <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Verification code" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtrvcode" CssClass="form-control" placeholder="Enter verification code" required="required" runat="server" TextMode="Password"></asp:TextBox>
                      
                    </div>

                </div>




                  <div class="form-group">

                    <div class="col-md-6 col-md-offset-3">
                        <asp:Button ID="Button2" CssClass="btn btn-info form-control" runat="server" Text="Submit" OnClick="Button2_Click" ValidationGroup="a" />

                    </div>

                </div>

               


                     </div>
                     </asp:Panel>


         </div>
       


</div>
        </div>
        </div>
</asp:Content>


