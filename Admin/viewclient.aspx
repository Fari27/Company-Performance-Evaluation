<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="viewclient.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<div class="container">
       <h3 class="page-header text-center"><strong>VIEW WEBSITE CONTENT</strong></h3>

    
     

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
                        <strong>Success! </strong>Updated website Successfully.

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
              
                    <asp:GridView ID="GridView1" runat="server" Width="700px" CssClass="table col-md-offset-2" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataKeyNames="clid">
                       <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No data is available now....!</b></center>
 </EmptyDataTemplate>

                         <Columns>
                           <asp:TemplateField HeaderText="PHOTO" ItemStyle-Width="150">
                    
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("photoin") %>' Height="100px" Width="100px"/>
                <ItemStyle Width="80px" />
                </ItemTemplate>
                    </asp:TemplateField>
                            <asp:BoundField DataField="company_name" HeaderText="LOCATION" SortExpression="company_name" />
                            
                            <asp:CommandField ShowEditButton="True" EditText="Update" ControlStyle-CssClass="btn form-control" CancelText="cancel" UpdateText="Confirm" ControlStyle-BackColor="#0099ff" ControlStyle-ForeColor="White" ControlStyle-Height="30px" ControlStyle-Width="60px" ControlStyle-Font-Size="10px" />
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
                        SelectCommand="SELECT clid,company_name,url,photoin from clients" DeleteCommand="DELETE FROM department WHERE dept_id = @dept_id" InsertCommand="INSERT INTO department (Dept_name) VALUES (@dept_name)" UpdateCommand="UPDATE clients SET company_name = @company_name,url=@url WHERE clid = @clid"
                        ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>">

                        <UpdateParameters>
                        
                         <asp:Parameter Name="company_name" />
                         <asp:Parameter Name="url" />
                         <asp:Parameter Name="clid" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
</asp:Content>

