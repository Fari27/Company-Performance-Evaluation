<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <h3 class="page-header text-center "><strong>CHANGE PASSWORD</strong></h3>

        <div class="jumbotron">

            <div class="form-horizontal">
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
                        <strong>Success! </strong>Changed password Successfully.

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
                   <asp:Label ID="Label4" runat="server" Text="" CssClass="control-label col-md-5"></asp:Label>  
                     <div class="col-md-6">
                         <asp:Image ID="Image1" runat="server" CssClass="img-circle" />
                         </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Current Passsword" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtcurrent" CssClass="form-control" required="required" runat="server" placeholder="Enter current password" TextMode="Password"></asp:TextBox>

                    </div>

                </div>
                 <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="New Password" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtnew" CssClass="form-control" required="required" placeholder="Enter  new password" runat="server" TextMode="Password" ValidationGroup="a"></asp:TextBox>

                    </div>

                </div>
                 <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Re-enter Password" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtrenter" CssClass="form-control" placeholder="Re enter password" required="required" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Not matching" ControlToCompare="txtnew" ControlToValidate="txtrenter" ForeColor="Red" ValidationGroup="a"></asp:CompareValidator>
                    </div>

                </div>




                  <div class="form-group">

                    <div class="col-md-6 col-md-offset-3">
                        <asp:Button ID="Button1" CssClass="btn btn-info form-control" runat="server" Text="Submit" OnClick="Button1_Click" ValidationGroup="a" />

                    </div>

                </div>

               
                </div>
            </div>
          </div>/

</asp:Content>

