<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="Client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="container">
        <h3 class="page-header text-center"><strong>EDIT PROFILE</strong></h3>
 
    
     <div class="jumbotron">

            <div class="form-horizontal">

                <div class="form-group">
                    <asp:FormView ID="FormView1" runat="server" BackColor="#CCCCCC" BorderColor="#5bc0de" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" GridLines="Both" DataSourceID="SqlDataSource1" OnItemCommand="FormView1_ItemCommand" Width="837px" ForeColor="Black">
                        <EditItemTemplate>
                            Name:
                            <asp:TextBox ID="name" runat="server" Text='<%# Bind("name") %>' />
                            <br />
                            Address:
                            <asp:TextBox ID="address" runat="server" Text='<%# Bind("address") %>' />
                            <br />
                            Place:
                            <asp:TextBox ID="place" runat="server" Text='<%# Bind("place") %>' />
                            <br />
                            Phoneno:
                            <asp:TextBox ID="phone" runat="server" Text='<%# Bind("phone") %>' />
                            <br />
                            photo:
                            <asp:TextBox ID="photo" runat="server" Text='<%# Bind("photo") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle  />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            name:
                            <asp:TextBox ID="name" runat="server" Text='<%# Bind("name") %>' />
                            <br />
                            address:
                            <asp:TextBox ID="address" runat="server" Text='<%# Bind("address") %>' />
                            <br />
                            place:
                            <asp:TextBox ID="place" runat="server" Text='<%# Bind("place") %>' />
                            <br />
                            phoneno:
                            <asp:TextBox ID="phoneno" runat="server" Text='<%# Bind("phone") %>' />
                            <br />
                            username:
                            <asp:TextBox ID="usernsme" runat="server" Text='<%# Bind("usernsme") %>' />
                            <br />
                            photo:
                            <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>


                             <div class="form-horizontal">
                               <div class="form-group">

                             <div class="col-md-offset-2">
               
                             <asp:Image ID="Image1" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Height="111px" Width="109px" ImageUrl='<%# "~"+Eval("photo") %>' />
                            
                             <div class="col-md-3 ">
                            <asp:FileUpload ID="FileUpload1"  runat="server" CssClass="form-control"/>
                             <div class="col-md-4">
                            <asp:LinkButton ID="LinkButton1"  CssClass="btn btn-info" runat="server" CommandName="upd" >Upload</asp:LinkButton>
                            </div>
                             </div>
                             </div>
                             </div>
                          
                                                    <div class="form-group">
                                 <asp:Label ID="Label10" runat="server" Text="Name" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:Label ID="Label1" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("name") %>' />
                            </div>
                              </div>


                                  <div class="form-group">
                                 <asp:Label ID="Label2" runat="server" Text="Address" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:Label ID="addressLabel" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("address") %>' />
                            </div>
                              </div>
         <div class="form-group">
                                 <asp:Label ID="Label3" runat="server" Text="Place" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:Label ID="placeLabel" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("place") %>' />
                            </div>
                              </div>



                            <div class="form-group">
                                 <asp:Label ID="Label4" runat="server" Text="PhoneNumber" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:Label ID="phonenoLabel" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("phone") %>' />
                            </div>
                              </div>

                         
                        

                                  <div class="form-group">

                    <div class="col-md-3 col-md-offset-2">
                 
                            <asp:Button ID="Button1" runat="server"  CssClass="btn btn-info form-control" CommandName="edit" Text="EDIT" />
                            </div>
                            </div>
                            </div>
                        </ItemTemplate>
                        <PagerStyle ForeColor="Black" HorizontalAlign="Left" BackColor="#CCCCCC" />
                        <RowStyle BackColor="White" />
                    </asp:FormView>


                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT registration.name, registration.address, registration.place, registration.phone,registration.email, login.photo FROM login INNER JOIN registration ON login.usernsme = registration.email WHERE (registration.email = @id)" UpdateCommand="UPDATE registration SET name = @name, address = @address, place = @place, phone= @phone WHERE (email = @email)">
                        <SelectParameters>
                            <asp:SessionParameter Name="id" SessionField="user" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" />
                            <asp:Parameter Name="address" />
                            <asp:Parameter Name="place" />
                            <asp:Parameter Name="phone" Type="String"/>
                            <asp:SessionParameter Name="email" SessionField="user" />
                        </UpdateParameters>
                    </asp:SqlDataSource>


                </div>
                </div>
         </div></div>
   
</asp:Content>

