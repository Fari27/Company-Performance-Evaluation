<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="allocatework.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <h3 class="page-header text-center "><strong> WORK ASSIGNMENT</strong> </h3>

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

                        <a href="allocatework.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Success! </strong>Work allocation Completed Successfully.

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
                    
  <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Projects" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="work_name" DataValueField="work_id" AutoPostBack="True" CssClass="form-control">
                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList3" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT work_id, work_name FROM work_request where status='accepted'"></asp:SqlDataSource>
                     
                </div>
               </div>

     <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Departments" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Dept_name" DataValueField="dept_id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control">
                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>"  SelectCommand="SELECT dept_id, dept_name FROM department"></asp:SqlDataSource>
                </div>
               </div>

                       
 <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Managers" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="fname" DataValueField="email" CssClass="form-control">
                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList2" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>"  SelectCommand="SELECT staffregisters.fname, staffregisters.email FROM position INNER JOIN staffregisters ON position.pid = staffregisters.pid WHERE (position.position_name = 'Project Manager') AND (position.did = @did)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="DropDownList1" Name="did" PropertyName="SelectedValue" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </div>
               </div>




                    <div class="form-group">

                  

                    
                        <div class="col-md-6 col-md-offset-3">
                        <asp:Button ID="Button2" CssClass="btn btn-info form-control" runat="server" Text="Assign" OnClick="Button2_Click" />

                    </div>

                     </div>

                        </div>
                    </div>
                </div>
            </div>
         </div>
</asp:Content>


