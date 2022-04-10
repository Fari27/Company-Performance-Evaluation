<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="warnings.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <h3 class="page-header text-center "><strong>WARNING</strong> </h3>

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

                        <a href="warnings.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Success! </strong>Warning send Successfully.

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
                      
                             <asp:Label ID="lbldpt" runat="server" Text="Departments" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                    <div class="col-md-6">
                         <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="dept_name" DataValueField="dept_id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"><asp:ListItem Value="0">--Select--</asp:ListItem></asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                         </div>

                </div>


                 
                 <div class="form-group">
                             <asp:Label ID="Labe2" runat="server" Text="Positions" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                    <div class="col-md-6">
                         <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="position_name" DataValueField="pid" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"><asp:ListItem Value="0">--Select--</asp:ListItem></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT pid, position_name FROM position  WHERE ( did = @did)">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="DropDownList1" Name="did" PropertyName="SelectedValue" Type="Int32" />
                             </SelectParameters>
                         </asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT dept_id,  Dept_name FROM  department">
                         </asp:SqlDataSource>
                    </div>

                </div>

                <div class="form-group">
                             <asp:Label ID="Label2" runat="server" Text="Staffs" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                    <div class="col-md-6">

                  <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="fname" DataValueField="email"><asp:ListItem Value="0">--Select--</asp:ListItem></asp:DropDownList>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList3" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator> <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT fname, email FROM staffregisters WHERE (did = @did) AND (pid = @pid)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="did" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DropDownList2" Name="pid" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                  </div>
                    </div>
          
                          
                       <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Subject" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtsub" CssClass="form-control" runat="server" required="required" placeholder="Enter subject" reqired="required"></asp:TextBox>

                    </div>

                </div>


                  
                
                       <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Details" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtdet" CssClass="form-control" runat="server" placeholder="Enter details" required="required"></asp:TextBox>

                    </div>

                </div>


                <div class="form-group">

                    <div class="col-md-6 col-md-offset-3">
                        <asp:Button ID="Button1" CssClass="btn btn-info form-control" runat="server" Text="Send" OnClick="Button1_Click" style="margin-bottom: 0" />

                    </div>




                </div>
                 <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                          <asp:LinkButton ID="LinkButton1" Visible="false" runat="server" CssClass="btn-info btn-link" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold" OnClick="LinkButton1_Click">Sent Warnings</asp:LinkButton>
               <asp:HyperLink ID="HyperLink1" font-size="16px" ForeColor="#0099FF" CssClass="btn-info btn-link"  runat="server" NavigateUrl="~/Admin/warning.aspx">Sent Warnings</asp:HyperLink>
            

                </div>
            </div>
         

    


     </div>
</div>
     </div>
</asp:Content>

