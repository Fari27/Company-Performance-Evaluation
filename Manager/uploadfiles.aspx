<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.master" AutoEventWireup="true" CodeFile="uploadfiles.aspx.cs" Inherits="Client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
         <h3 class="page-header text-center"> <strong>UPLOAD PROJECT FILES </strong></h3>
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
                        <strong>Success! </strong>File send  Successfully.

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
                    <asp:Label ID="Label2" runat="server" Text="To" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                    <div class="col-md-6">
                 <asp:textbox runat="server"  ID="txttoadd" CssClass="form-control" placeholder="Enter to address" required="required" type="email"></asp:textbox>
                      

                    </div>

                </div> 

                     <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Select Project" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                    <div class="col-md-6">
                         <asp:DropDownList ID="DropDownList1" runat="server"  DataSourceID="SqlDataSource1" DataTextField="work_name" CssClass="form-control" DataValueField="work_id">
                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                </asp:DropDownList>

                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="Red" InitialValue="0" ValidationGroup="a"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT work_request.work_id, work_request.work_name FROM work_request INNER JOIN workallot ON work_request.work_id = workallot.w_id WHERE (work_request.status = @status) AND workallot.manager_id=@clid">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="allocated" Name="status" Type="String" />
                        <asp:SessionParameter DefaultValue="" Name="clid" SessionField="user" />
                    </SelectParameters>
                </asp:SqlDataSource>

                    </div>

                </div> 
                                     <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Enter Message" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                    <div class="col-md-6">
                 <asp:textbox runat="server" CssClass="form-control"  ID="txtmessage" placeholder="Enter message" required="required"></asp:textbox>
                      

                    </div>

                </div>    

                       
                     <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Upload file" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>
              
                  <div class="col-md-6">
                  <asp:fileupload id="FileUpload1" runat="server" CssClass="form-control"></asp:fileupload>
                  </div>

            </div>
                   <div class="form-group">
                       <div class="col-md-6 col-md-offset-3">
                           <asp:Button ID="Button1" CssClass="form-control btn-info" runat="server" Text="Upload" OnClick="Button1_Click" ValidationGroup="a" />
                       </div>
                   </div>



<div class="form-group">
               
             <div class="col-md-6 col-md-offset-3">
                 <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn-info btn-link" 
                     font-size="16px" ForeColor="#0099FF" 
                     style="font-family: Arial; font-weight: bold" OnClick="LinkButton1_Click">Sent Files</asp:LinkButton>
          
                  </div>

                </div>

                 <asp:HiddenField ID="HiddenField1" runat="server" />
              <asp:HiddenField ID="HiddenField2" runat="server" />
            </div>
        </div>


    </div>
    

</asp:Content>

