<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="staffregister.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div class="container">
        <h3 class="page-header text-center "><strong>REGISTRATION</strong> </h3>

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
                        <strong>Success! </strong>Registration Completed Successfully.

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
                    <asp:Label ID="Label12" runat="server" Text="Departments" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="ddldpt" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="dept_name" DataValueField="dept_id" AutoPostBack="True" OnSelectedIndexChanged="ddldpt_SelectedIndexChanged">
                     <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddldpt" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>"  SelectCommand="SELECT Dept_name, dept_id FROM department"></asp:SqlDataSource>
                </div>
               </div>

                 <div class="form-group">
                    <asp:Label ID="Label14" runat="server" Text="Positons" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="ddlpos" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="position_name" DataValueField="pid" AutoPostBack="True">
                     <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlpos" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                     
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server"  ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>"  SelectCommand="SELECT pid, position_name FROM position WHERE (did = @did)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="ddldpt" Name="did" PropertyName="SelectedValue" Type="Int32" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     
                </div>
               </div>


                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Name" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtname" CssClass="form-control" required="required"  placeholder="Enter Yourname" runat="server"></asp:TextBox>

                    </div>

                </div>
                 <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Gender" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                   <div class="col-md-6">                  
                    <asp:RadioButtonList ID="rblgender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">male</asp:ListItem>
                    <asp:ListItem>female</asp:ListItem>
                         </asp:RadioButtonList>
            </div>


           </div>
                 <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Date of Birth" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                   <div class="col-md-6">  
                       <asp:TextBox ID="txtdob" type="date" CssClass="form-control" runat="server"  required="required" ></asp:TextBox>
               
                        </div>


           </div>
                 <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Address" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                  
                     <div class="col-md-6">

                         <asp:TextBox ID="txtadd" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Enter address" required="required" ></asp:TextBox> </div>
        </div>
                  <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Place" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtplace" CssClass="form-control" runat="server" placeholder="Enter place" required="required" ></asp:TextBox>

                    </div>

                </div>

                 <div class="form-group">
            
                  <asp:Label ID="Label4" runat="server"  Text="Phone no" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                     <div class="col-md-6">

                         <asp:TextBox ID="txtphone"  runat="server" CssClass="form-control" placeholder="Enter phone number" required="required" type="text" MaxLength="10"  pattern="[0-9]{10}" ></asp:TextBox> </div>
         </div>

                  <div class="form-group">
            
                  <asp:Label ID="Label5" runat="server" Text="Email id" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                     <div class="col-md-6">

                         <asp:TextBox ID="txtemail" type="email" runat="server" CssClass="form-control" placeholder="Enter emailid" required="required" ></asp:TextBox> </div>
         </div>

                  <div class="form-group">
            
                  <asp:Label ID="Label6" runat="server" Text="Qualification" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                     <div class="col-md-6">

                         <asp:TextBox ID="txtq" runat="server" CssClass="form-control" placeholder="Enter qualification" required="required" ></asp:TextBox> </div>
         </div>
                  
                <div class="form-group">
            
                  <asp:Label ID="Label7" runat="server" Text="Experience" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                     <div class="col-md-6">

                         <asp:TextBox ID="txtexp" runat="server" CssClass="form-control" placeholder="Enter experience" required="required" ></asp:TextBox> </div>
         </div>
                <div class="form-group">
            
                  <asp:Label ID="Label11" runat="server" Text="Skills" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                     <div class="col-md-6">

                         <asp:TextBox ID="txtskills" runat="server" CssClass="form-control" placeholder="Enter skills" required="required" ></asp:TextBox> </div>
         </div>
                 <div class="form-group">
            
                  <asp:Label ID="Label8" runat="server" Text="Salary" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                     <div class="col-md-6">

                         <asp:TextBox ID="txtsalary" runat="server" CssClass="form-control" placeholder="Enter basic salary" required="required" ></asp:TextBox> </div>
         </div>
              &nbsp;<div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="Photo" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-4">
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="" required="required" />

                    </div>
                      <div class="col-md-2">
                  </div>

                </div>
                

                <div class="form-group">

                    <div class="col-md-6 col-md-offset-2">
                        <asp:Button ID="Button1" CssClass="btn btn-info form-control" runat="server" Text="Submit" OnClick="Button1_Click" />

                    </div>

                </div>

            </div>


        </div>

       
    </div>



</asp:Content>

