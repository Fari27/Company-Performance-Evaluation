<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.master" AutoEventWireup="true" CodeFile="allocatemodule.aspx.cs" Inherits="Projectleader_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container">
        <h3 class="page-header text-center "><strong> UNIT ALLOCATION</strong> </h3>

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

                        <a href="allocatemodule.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
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
                     <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="work_name" DataValueField="work_id" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged1"> <asp:ListItem Value="0">--Select--</asp:ListItem></asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList3" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT work_request.work_id, work_request.work_name FROM workallot INNER JOIN work_request ON workallot.w_id = work_request.work_id where workallot.manager_id=@plid">
                         <SelectParameters>
                             <asp:SessionParameter Name="plid" SessionField="user" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     
                </div>
               </div>

                     <div class="form-group">
                    
  <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Unit" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4" DataTextField="unitname" DataValueField="unitid" AutoPostBack="True" CssClass="form-control">
                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList4" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT unitid, unitname FROM unit  WHERE (wid = @wid) and alloc_status='0'">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="DropDownList3" Name="wid" PropertyName="SelectedValue" Type="Int32" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     
                </div>
               </div>

     <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Departments" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Dept_name" DataValueField="dept_id" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"> <asp:ListItem Value="0">--Select--</asp:ListItem></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT dept_id, Dept_name FROM department"></asp:SqlDataSource>
                </div>
               </div>

                       
 <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Staff" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="fname" DataValueField="email" CssClass="form-control"> <asp:ListItem Value="0">--Select--</asp:ListItem></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList2" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT staffregisters.fname, staffregisters.email FROM staffregisters INNER JOIN position ON staffregisters.pid = position.pid INNER JOIN department ON position.did = department.dept_id WHERE (position.position_name ='Unit Manager') AND (department.dept_id = @did)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="DropDownList1" Name="did" PropertyName="SelectedValue" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </div>
               </div>




                    <div class="form-group">

                    <div class="col-md-6">

                    </div>
                       


                        </div>
                         <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Completion date" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtcomplete"  CssClass="form-control" type="date" required="required" runat="server"></asp:TextBox>

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
</asp:Content>

