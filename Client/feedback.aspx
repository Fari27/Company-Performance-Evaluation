<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="Client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <h3 class="page-header text-center "><strong> FEEDBACK</strong> </h3>

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
                        <strong>Success! </strong>Feedback send Successfully.

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
                    <asp:Label ID="Label1" runat="server" Text="Subject" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtsub" CssClass="form-control" runat="server" required="required"  placeholder="Enter subject"></asp:TextBox>

                    </div>

                </div>


                  
                
                       <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Feedback" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtfeed" CssClass="form-control" runat="server" required="required"  placeholder="Enter feedback"></asp:TextBox>

                    </div>

                </div>


                <div class="form-group">

                    <div class="col-md-6 col-md-offset-3">
                        <asp:Button ID="Button1" CssClass="btn btn-info form-control" runat="server" Text="Add" OnClick="Button1_Click" style="margin-bottom: 0" />

                    </div>




                </div>

                    </div>
 <div class="form-group">
               
             <div class="col-md-6 col-md-offset-3">
                 <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn-info btn-link" 
                     font-size="16px" ForeColor="#0099FF" 
                     style="font-family: Arial; font-weight: bold" OnClick="LinkButton1_Click">Sent Feedback</asp:LinkButton>
          
                  </div>

                </div>

            

                </div>
            </div>
         

               

         </div>
    


</asp:Content>

