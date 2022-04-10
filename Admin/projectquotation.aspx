<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="projectquotation.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
         <h3 class="page-header text-center">QUOTATION</h3>
        <div class="jumbotron">
            <div class="form-horizontal">
                
                   <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="To" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                    <div class="col-md-6">
                       
                         <asp:textbox runat="server" class="form-control" ID="Textbox1" OnTextChanged="Textbox1_TextChanged" placeholder="Enter to mailid" required="required"></asp:textbox>
                    </div>

                </div>
                    

                     <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Project " CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                    <div class="col-md-6">

                        <asp:textbox runat="server" class="form-control" ID="txtwname" placeholder="Enter message" required="required" ></asp:textbox>
                        <asp:HiddenField ID="HiddenField3" runat="server" />
                    </div>

                </div> 
                     <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Enter Message" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                    <div class="col-md-6">
                 <asp:textbox runat="server" class="form-control" ID="txtmessage" placeholder="Enter message" required="required" ></asp:textbox>
                      

                    </div>

                </div>    
                     <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Upload file" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF"  style="font-family: Arial; font-weight:bold"></asp:Label>
              
                  <div class="col-md-6">
                      <asp:FileUpload ID="FileUpload1" runat="server" required="required" />
                  </div>

            </div>
                   <div class="form-group">
                       <div class="col-md-6 col-md-offset-3">
                           <asp:Button ID="Button1" CssClass="form-control btn-info" runat="server" Text="Upload" OnClick="Button1_Click" />
                       </div>
                   </div>
                 <asp:HiddenField ID="HiddenField1" runat="server" />
              <asp:HiddenField ID="HiddenField2" runat="server" />
            </div>
        </div>


    </div>
       
   
    
   
</asp:Content>

