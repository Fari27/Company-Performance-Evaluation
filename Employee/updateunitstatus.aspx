<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.master" AutoEventWireup="true" CodeFile="updateunitstatus.aspx.cs" Inherits="Employee_Default" %>


<asp:Content ID="Content3" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <h3 class="page-header text-center "><strong> UNIT WORK</strong> </h3>

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

                        <a href="updateunitstatus.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Success! Updated</strong> Successfully.

                    </div>
                    
                    
                    
                    <%

    }
    else
    {%>
                    
                    
           <div class="alert alert-danger alert-dismissable">

                        <a href="updateunitstatus.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Failed! </strong>Please try again.

                    </div>          
                    
                    <%


                            }
                        }



     %>


                </div>


      <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Project" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList2" runat="server"  AutoPostBack="True" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="work_name" DataValueField="work_id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="select  distinct work_request.work_id, work_request.work_name FROM work_request INNER JOIN unit ON work_request.work_id = unit.wid INNER JOIN task_allot ON unit.unitid = task_allot.unitid WHERE (task_allot.emp_id = @empid) and work_request.Status=@status" >
                         <SelectParameters>
                         <asp:Parameter DefaultValue="allocated" Name="status" Type="String" />
                             <asp:SessionParameter Name="empid" SessionField="user" />
                         </SelectParameters>
                     </asp:SqlDataSource>
              </div>
          </div>
                       
     
     <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Work" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList1" runat="server"  
                         DataSourceID="SqlDataSource1"  DataTextField="unitname" DataValueField="unitid" 
                         AutoPostBack="True" CssClass="form-control" 
                         onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT  distinct unit.unitid,unit.unitname FROM work_request INNER JOIN unit ON work_request.work_id = unit.wid INNER JOIN task_allot ON unit.unitid = task_allot.unitid WHERE (task_allot.emp_id = @empid) and unit.wid=@wid and unit.status<100">
                         <SelectParameters>
                             <asp:SessionParameter Name="empid" SessionField="user" />
                             <asp:ControlParameter ControlID="DropDownList2" Name="wid" PropertyName="SelectedValue" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </div>
               </div>
                 <div class="form-group">
                 
                    <asp:Label ID="Label1" runat="server" Text="Task" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList3" runat="server"  DataSourceID="SqlDataSource3"  DataTextField="task" DataValueField="TW_id" AutoPostBack="True" CssClass="form-control">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
   

                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT  task_status.TW_id,task_status.task FROM task_status INNER JOIN unit ON task_status.T_id = unit.unitid WHERE task_status.T_id=@tid and task_status.status='0'">
                         <SelectParameters>
                           
                             <asp:ControlParameter ControlID="DropDownList1" Name="tid" PropertyName="SelectedValue" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </div>
               </div>
               <div class="form-group">

                    <div class="col-md-3 col-md-offset-3">
                        <asp:Button ID="Button1" CssClass="btn btn-info form-control" runat="server" 
                            Text="update work status" onclick="Button1_Click1" />
                     
                        </div>

                    </div>
                



                    


                       
                       
                      

                       </div>

</asp:Content>

