<%@ Page Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="sentitems.aspx.cs" Inherits="Client_sentitems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h3 class="page-header text-center"><strong> VIEW SENT FILES</strong></h3>
        <div class="jumbotron">
            <div class="form-horizontal">
                <div class="form-group">
                    <asp:Label ID="Label1" CssClass="control-label col-md-3" runat="server" Text="Select Work" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>
                    <div class="col-md-6">
                        <asp:DropDownList ID="DropDownList1" CssClass="dropdown form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="work_name" DataValueField="work_id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT work_id, work_name FROM work_request  WHERE  (status = @status) and client_id=@clientid">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="allocated" Name="status" Type="String" />
                                <asp:SessionParameter DefaultValue="" Name="clientid" SessionField="user" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="form-group">
                    <asp:GridView ID="GridView1" CssClass="table table-hover table-responsive col-md-offset-1" Width="900px" runat="server" AutoGenerateColumns="False" DataKeyNames="file_id" DataSourceID="SqlDataSource2" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="toid" HeaderText="TO" SortExpression="fromid" />
                            <asp:BoundField DataField="file_id" HeaderText="file_id" InsertVisible="False" ReadOnly="True" SortExpression="file_id" Visible="False" />
                            <asp:BoundField DataField="filename" HeaderText="SUBJECT" SortExpression="filename" />
                            <asp:BoundField DataField="work_id" HeaderText="work_id" SortExpression="work_id" Visible="False" />
                            <asp:BoundField DataField="date" DataFormatString="{0:d}" HeaderText="DATE" SortExpression="date" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT fromid ,toid, file_id, filename, work_id, date, path FROM fileupload WHERE (work_id = @case_id)  and fromid=@to">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="case_id" PropertyName="SelectedValue" Type="Int32" />
                            <asp:SessionParameter Name="to" SessionField="user" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>


            </div>

        </div>
    </div>
</asp:Content>

