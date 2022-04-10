<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="staff.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h3 class="page-header text-center "><strong>STAFFS</strong> </h3>

        <div class="jumbotron">

            <div class="form-horizontal">
                <div class="form-group">
                    <asp:Label ID="lbldpt" runat="server" Text="Departments" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                    <div class="col-md-6">
                         <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Dept_name" DataValueField="dept_id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"><asp:ListItem Value="0">--Select--</asp:ListItem></asp:DropDownList>
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
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT dept_id, Dept_name FROM department">
                         </asp:SqlDataSource>
                    </div>

                </div>
                <div class="form-group">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"  DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" Width="1075px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" >
                        <EmptyDataTemplate>
  <center> <b style="color:#0099FF;font-size:large">  No data is available now....!</b></center>
 </EmptyDataTemplate>

                        <Columns>


                        <asp:TemplateField HeaderText="PHOTO" ItemStyle-Width="80">
                    
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Photo") %>' Height="80px" Width="80px"/>
                <ItemStyle Width="80px" />
                </ItemTemplate>
                    </asp:TemplateField>
                            <asp:BoundField DataField="fname" HeaderText="NAME" SortExpression="fname" />
                               <asp:BoundField DataField="gender" HeaderText="GENDER" SortExpression="gender" ItemStyle-Width="50" />
                                
                            <asp:BoundField DataField="address" HeaderText="ADDRESS" SortExpression="address" />
                              <asp:BoundField DataField="dob" HeaderText="DOB" SortExpression="dob" ItemStyle-Width="50" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="email" HeaderText="EMAIL" SortExpression="email" />
                            <asp:BoundField DataField="phone" HeaderText="PHONE" SortExpression="phone" />
                             <asp:BoundField DataField="experience" HeaderText="EXPERIENCE" SortExpression="experience" />
                            <asp:BoundField DataField="qualification" HeaderText="QUALIFICATION" SortExpression="qualification" />
                            <asp:BoundField DataField="skills" HeaderText="SKILLS" SortExpression="Skills" />
                            <asp:BoundField DataField="salary" HeaderText="SALARY" SortExpression="salary" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#5bc0de" Font-Bold="True" ForeColor="White" Font-Size="12px" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle  Font-Size="12px"/>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT login.Photo,staffregisters.dob,staffregisters.gender,staffregisters.fname,staffregisters.address,staffregisters.experience,staffregisters.skills,staffregisters.dob,staffregisters.email,staffregisters.phone,staffregisters.qualification,staffregisters.salary,staffregisters.skills FROM staffregisters INNER JOIN login  ON  login.usernsme= staffregisters.email WHERE (did = @did) AND (pid = @pid) ">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="did" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DropDownList2" Name="pid" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div></


                </div></div></div>

     
</asp:Content>

