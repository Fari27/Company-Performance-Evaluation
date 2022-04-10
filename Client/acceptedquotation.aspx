<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="acceptedquotation.aspx.cs" Inherits="Client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class="container">
        <h3 class="page-header text-center"><strong>QUOTATION</strong></h3>
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

                        <a href="viewquotation.aspx" class="close" data-dismiss="alert" aria-label="close">&times</a>
                        <strong>Success! </strong>Quotation accepted Successfully.

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
                    <asp:Label ID="Label1" CssClass="control-label col-md-3" runat="server" Text="Select Project" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>
                    <div class="col-md-6">
                        <asp:DropDownList ID="DropDownList1" CssClass="dropdown form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="work_name" DataValueField="work_id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Value="0" Selected="True">--Select--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT  work_id, work_name  FROM work_request  WHERE client_id=@cid and (Status='approved' or Status='Accepted' or Status='allocated')">
                            <SelectParameters>
                                
                                <asp:SessionParameter DefaultValue="" Name="cid" SessionField="user" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="form-group">
                 <div class="col-md-6 col-md-offset-3">
                    <asp:GridView ID="GridView1" CssClass="table table-hover table-responsive" Width="500px" runat="server" AutoGenerateColumns="False" DataKeyNames="file_id" DataSourceID="SqlDataSource2"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    
                                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("work_id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:BoundField DataField="date" DataFormatString="{0:d}" HeaderText="DATE" SortExpression="date" />
                            <asp:BoundField DataField="work_id" HeaderText="Project No" SortExpression="work_id" Visible="False" />
                            <asp:BoundField DataField="file_id" HeaderText="file_id" InsertVisible="False" ReadOnly="True" SortExpression="file_id" Visible="False" />
                            <asp:BoundField DataField="filename" HeaderText="QUOTATION" SortExpression="filename" />
                             <asp:BoundField DataField="path" HeaderText="Path" SortExpression="path" Visible="False" />
                             <asp:TemplateField>
                        <ItemTemplate>
                            <a href ='..<%#Eval("path") %>'>View/Download</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT work_id, file_id, date, filename,path FROM quotation WHERE (work_id = @wid) ">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="wid" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                </div>
            </div>
            


        </div>
    </div>

</asp:Content>

