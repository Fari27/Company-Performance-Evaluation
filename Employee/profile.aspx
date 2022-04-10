<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="Projectleader_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <h3 class="page-header text-center"><strong>EDIT PROFILE</strong></h3>
 
    
     <div class="jumbotron">

            <div class="form-horizontal">

                <div class="form-group">
                    <asp:FormView ID="FormView1" runat="server" CssClass="table table-responsive" DataSourceID="SqlDataSource1" OnItemCommand="FormView1_ItemCommand" >
                        <EditItemTemplate>
                             <div class="form-horizontal">
                             <div class="form-group">
                                 <asp:Label ID="Label1" runat="server" Text="Name" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                                     <asp:TextBox ID="nameTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px"  Text='<%# Bind("fname") %>' />
                                       </div>
                                 </div>
                            
                              <div class="form-group">
                                 <asp:Label ID="Label2" runat="server" Text="Gender" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                                   <asp:TextBox ID="genderTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF"  Text='<%# Bind("gender") %>' />
                                </div>
                                  </div>
                                 <div class="form-group">
                                 <asp:Label ID="Label3" runat="server" Text="Date of birth" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>
                                    <div class="col-md-6">
               
                                  <asp:TextBox ID="dobTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("dob") %>' />
                                 </div>
                                     </div>
                                      <div class="form-group">
                                 <asp:Label ID="Label4" runat="server" Text="Address" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
                                <asp:TextBox ID="addressTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("address") %>' />
                                </div>
                                 </div>
                                 <div class="form-group">
                                 <asp:Label ID="Label5" runat="server" Text="Phone no" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>
                                    <div class="col-md-6">
               
                                 <asp:TextBox ID="phoneTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("phone") %>' />
                                 </div>
                                     </div>
                                  <div class="form-group">
                                 <asp:Label ID="Label6" runat="server" Text="Mail id" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                                 <asp:TextBox ID="usernsmeTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF"  Text='<%# Bind("usernsme") %>' />
                                 </div>
                                      </div>
                                  <div class="form-group">
                                 <asp:Label ID="Label7" runat="server" Text="Qualification" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                                <asp:TextBox ID="qualificationTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("qualification") %>' />
                               </div>
                                      </div>
                            
                                 <div class="form-group">
                                 <asp:Label ID="Label8" runat="server" Text="Experience" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:TextBox ID="experienceTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF"  Text='<%# Bind("experience") %>' />
                              </div>
                              </div>
                             <div class="form-group">
                                 <asp:Label ID="Label9" runat="server" Text="Skills" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:TextBox ID="skillsTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("skills") %>' />
                            </div>
                             
                                 </div>
                                 <div class="form-group">
                                 <asp:Label ID="Label10" runat="server" Text="" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                     </div>
                                  <div class="form-group">

                            <div class="col-md-6 col-md-offset-2">
                   
                            <asp:LinkButton ID="UpdateButton" runat="server" CssClass="btn btn-info form-control" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        
                               </div>
                                </div>
                                 </div>
                                 </EditItemTemplate>
                        <InsertItemTemplate>
                            Name:
                            <asp:TextBox ID="nameTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text ='<%# Bind("fname") %>' />
                            <br />
                            Gender:
                            <asp:TextBox ID="genderTextBox" runat="server"  CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("gender") %>' />
                            <br />
                            Date of Birth:
                            <asp:TextBox ID="dobTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("dob") %>' />
                            <br />
                            Address:
                            <asp:TextBox ID="addressTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("address") %>' />
                            <br />
                            Phone:
                            <asp:TextBox ID="phoneTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("phone") %>' />
                            <br />
                            Mail id:
                            <asp:TextBox ID="usernsmeTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("usernsme") %>' />
                            <br />
                            Qualification:
                            <asp:TextBox ID="qualificationTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("qualification") %>' />
                            <br />
                            Experience:
                            <asp:TextBox ID="experienceTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("experience") %>' />
                            <br />
                            Skills:
                            <asp:TextBox ID="skillsTextBox" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("skills") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            

                            <div class="form-horizontal">
                               <div class="form-group">
                                 <asp:Label ID="Label19" runat="server" Text="Photo" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                             <div class="col-md-6">
               
                             /<asp:Image ID="Image1" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Height="111px" Width="109px" ImageUrl='<%# "~"+Eval("photo") %>' />
                            
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
               
                            <asp:Label ID="nameLabel" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("fname") %>' />
                            </div>
                              </div>
                                <div class="form-group">
                                 <asp:Label ID="Label11" runat="server" Text="Gender" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
                                          
                            <asp:Label ID="genderLabel" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("gender") %>' />
                              </div>
                             </div>
                            
                            <div class="form-group">
                                 <asp:Label ID="Label12" runat="server" Text="Date of Birth" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:Label ID="dobLabel" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Eval("dob","{0:d}") %>' />
                              </div>
                              </div>
                            <div class="form-group">
                                 <asp:Label ID="Label13" runat="server" Text="Address" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:Label ID="addressLabel" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("address") %>' />
                            </div>
                            </div>
                            <div class="form-group">
                                 <asp:Label ID="Label14" runat="server" Text="Phone no" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:Label ID="phoneLabel" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("phone") %>' />
                            </div>
                                </div>
                            <div class="form-group">
                                 <asp:Label ID="Label15" runat="server" Text="Mail id" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:Label ID="usernsmeLabel" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("usernsme") %>' />
                            </div>
                            </div>

                            <div class="form-group">
                                 <asp:Label ID="Label16" runat="server" Text="Qualification" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:Label ID="qualificationLabel" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("qualification") %>' />
                            </div>
                                </div>
                             <div class="form-group">
                                 <asp:Label ID="Label17" runat="server" Text="Experience" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:Label ID="experienceLabel" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("experience") %>' />
                            </div>
                            </div>
                            <div class="form-group">
                                 <asp:Label ID="Label18" runat="server" Text="Skills" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                                   <div class="col-md-6">
               
                            <asp:Label ID="skillsLabel" runat="server" CssClass="control-label col-md-3 " font-size="16px" ForeColor="#0099FF" Text='<%# Bind("skills") %>' />
                            </div>
                            </div>
                                <div class="form-group">

                    <div class="col-md-3 col-md-offset-2">
                 
                            <asp:Button ID="Button1" runat="server"  CssClass="btn btn-info form-control" CommandName="edit" Text="EDIT" />
                            </div>
                            </div>
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                    

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT staffregisters.fname, staffregisters.gender, staffregisters.dob, staffregisters.address, staffregisters.phone, login.usernsme, staffregisters.qualification, staffregisters.experience, staffregisters.skills, login.photo FROM login INNER JOIN staffregisters ON login.usernsme = staffregisters.email WHERE (staffregisters.email = @username)" UpdateCommand="UPDATE staffregisters SET name = @name, gender = @gender, dob = @dob, address = @address, phone = @phone, qualification = @qualification, experience = @experience, skills = @skills WHERE (email = @emailid)">
                        <SelectParameters>
                            <asp:SessionParameter Name="username" SessionField="user" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" />
                            <asp:Parameter Name="gender" />
                            <asp:Parameter Name="dob" />
                            <asp:Parameter Name="address" />
                            <asp:Parameter Name="phone" />
                            <asp:Parameter Name="qualification" />
                            <asp:Parameter Name="experience" />
                            <asp:Parameter Name="skills" />
                            <asp:SessionParameter Name="emailid" SessionField="user" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    

                    </div>
                </div>
         </div>
        </div>

    
</asp:Content>

