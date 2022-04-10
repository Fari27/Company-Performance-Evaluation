<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="services.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <h3 class="page-header text-center"><strong>ADD SERVICES</strong></h3>

    
     

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
                        <strong>Success! </strong>New services added Successfully.

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
                    <asp:Label ID="Label2" runat="server" Text="Add new services" CssClass="control-label col-md-3 col-md-offset-2" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6 col-md-offset-1">
                        <asp:TextBox ID="txtdept" CssClass="form-control" required="required" runat="server" placeholder="Enter new service" Width="300px"></asp:TextBox>

                    </div>
                        </div>
                
                           <div class="col-md-6 col-md-offset-5">
                        <asp:Button ID="Button1" CssClass="btn btn-info form-control" runat="server" BackColor="#0099ff" Text="Add" OnClick="Button1_Click" Width="200px" />

                    </div>

                <br /><br />
                </br>
                <div class="form-group">
                <div class="col-md-6 col-md-offset-4">
                    <asp:GridView ID="GridView1" runat="server" Width="500px" CssClass="table" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataKeyNames="dept_id">
                       <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No data is available now....!</b></center>
 </EmptyDataTemplate>

                         <Columns>
                            <asp:BoundField DataField="dept_name" HeaderText="Services" SortExpression="dept_name" />
                            <asp:BoundField DataField="dept_id" HeaderText="dept_id" InsertVisible="False" ReadOnly="True" SortExpression="dept_id" Visible="False" />
                            <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn form-control" CancelText="cancel" UpdateText="Confirm" ControlStyle-BackColor="#0099ff" ControlStyle-ForeColor="White" ControlStyle-Height="30px" ControlStyle-Width="60px" ControlStyle-Font-Size="10px" EditText="Edit" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#5bc0de" Font-Bold="True" ForeColor="White" Font-Size="16px"/>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle Font-Size="16px"/>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />

                       
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" 
                        SelectCommand="SELECT dept_name,dept_id FROM services" DeleteCommand="DELETE FROM department WHERE dept_id = @dept_id" InsertCommand="INSERT INTO department (Dept_name) VALUES (@dept_name)" UpdateCommand="UPDATE services SET Dept_name = @dept_name WHERE dept_id = @dept_id"
                        ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>">

                        <UpdateParameters>
                        
                         <asp:Parameter Name="Dept_name" />
                        
                         <asp:Parameter Name="dept_id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    </div>
                    </div>

    




                
                
                


              </div>

            </div>


        </div>

       
    
</asp:Content>

