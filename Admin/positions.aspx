<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="positions.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <div class="container">
      <h3 class="page-header text-center"><strong>ADD POSITIONS</strong></h3>

    
     

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
                        <strong>Success! </strong>New position added Successfully.

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
                    <asp:Label ID="Label12" runat="server" Text="Departments" CssClass="control-label col-md-3 col-md-offset-2" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6 col-md-offset-1">
                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Dept_name" Width="300px" DataValueField="dept_id" AutoPostBack="True" CssClass="form-control"> 
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT dept_id,Dept_name FROM department"></asp:SqlDataSource>
                </div>
               </div>

    

                <div class="form-group">
                 <div class="col-md-6 col-md-offset-3">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table" 
                        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" 
                        ForeColor="Black" GridLines="Horizontal" BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataKeyNames="pid"
                        Width="600px">
                       <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No data is available now....!</b></center>
 </EmptyDataTemplate>

                         <Columns>
                            <asp:BoundField DataField="pid" HeaderText="pid" SortExpression="pid" InsertVisible="False" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="position_name" HeaderText="Position" SortExpression="position" />
                            <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn form-control" CancelText="cancel" UpdateText="Confirm" ControlStyle-BackColor="#0099ff" ControlStyle-ForeColor="White" ControlStyle-Height="30px" ControlStyle-Width="60px" ControlStyle-Font-Size="10px" EditText="Edit" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#5bc0de" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT position.pid,position.position_name FROM position INNER JOIN department ON position.did = department.dept_id
where department.dept_id=@deptid" UpdateCommand="UPDATE position SET position_name =@position_name where pid=@pid">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="deptid" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="position_name" />
                            <asp:Parameter Name="pid" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    </div>
                    </div>

                    
                    <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Add new position" CssClass="control-label col-md-3 col-md-offset-2" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6 col-md-offset-1">
                        <asp:TextBox ID="txtpos" CssClass="form-control" required="required" runat="server" placeholder="Enter new position" Width="300px"></asp:TextBox>

                    </div>
                        </div>
                        <div class="col-md-6 col-md-offset-5">
                        <asp:Button ID="Button2" CssClass="btn btn-info form-control" runat="server" BackColor="#0099ff" Text="Add" OnClick="Button2_Click" Width="200px" />

                    </div>


              
                


              </div>

           


        </div>

       
    

</asp:Content>

