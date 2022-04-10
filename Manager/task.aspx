<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.master" AutoEventWireup="true" CodeFile="task.aspx.cs" Inherits="Manager_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container">
        <h3 class="page-header text-center "><strong> TASKS</strong> </h3>

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
                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT unitid, unitname FROM unit  WHERE (wid = @wid)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="DropDownList3" Name="wid" PropertyName="SelectedValue" Type="Int32" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     
                </div>
               </div>

                       
                <div class="form-group">
                 <div class="col-md-6 col-md-offset-3">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-responsive" Width="500px" AutoGenerateColumns="False"  CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataSourceID="SqlDataSource5" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"  >
                        <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No data is available now....!</b></center>
 </EmptyDataTemplate>
                         <Columns>
                            <asp:BoundField DataField="task" HeaderText="WORK DETAILS" SortExpression="task" />
                            
                            <asp:BoundField DataField="date" HeaderText="COMPLETED DATE" SortExpression="date"   DataFormatString="{0:MM/dd/yyyy}"/>
                             <asp:BoundField DataField="wstatus" HeaderText="STATUS" SortExpression="status" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#5bc0de" Font-Bold="True" ForeColor="White"  Font-Size="14px"/>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle Font-Size="12px"/>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT task,wstatus,date FROM task_status WHERE (T_id = @tid)">
                        <SelectParameters>
                             <asp:ControlParameter ControlID="DropDownList4" Name="tid" PropertyName="SelectedValue" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                    </div>
                    
               
               </div>

</div></div></div>
 </div>
 </div>
</asp:Content>
