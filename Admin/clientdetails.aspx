<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="clientdetails.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
       <h3 class="page-header text-center"><strong>ADD WEBSITE CONTENT</strong></h3>

    
     

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
                        <strong>Success! </strong>Updated website Successfully.

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
                    <asp:Label ID="Label2" runat="server" Text="Location" CssClass="control-label col-md-3 col-md-offset-2" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6 col-md-offset-1">
                        <asp:TextBox ID="txtdept" CssClass="form-control" required="required" runat="server" placeholder="Enter location" Width="300px"></asp:TextBox>

                    </div>
                        </div>


                       
                   <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Photo" CssClass="control-label col-md-3 col-md-offset-2" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6 col-md-offset-1">
                          <asp:FileUpload ID="FileUpload1" runat="server" CssClass="" required="required" Width="300px" BorderColor="White" ForeColor="#000000" />

                    </div>
                        </div>
                
       


                
                           <div class="col-md-6 col-md-offset-5">
                        <asp:Button ID="Button1" CssClass="btn btn-info form-control" runat="server" BackColor="#0099ff" Text="Add" OnClick="Button1_Click" Width="200px" />

                    </div>

              
                    </div>
                    </div>

    




                
                
                


     




</asp:Content>

    