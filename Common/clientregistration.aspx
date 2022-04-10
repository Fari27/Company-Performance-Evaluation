<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Common.master" AutoEventWireup="true" CodeFile="clientregistration.aspx.cs" Inherits="Common_Default" %>



   
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container" background="../img/architect-architecture-building-911758.jpg">
        <h3 class="page-header text-center "><strong>REGISTRATION</strong> </h3>

        <div class="jumbotron">

            <div class="form-horizontal">

               
<div class="form-group">

                    <asp:Label ID="Label7" runat="server" Text="Please download the terms and condition form.Read the terms and conditions carefully,sign it  and upload it back during registration." CssClass="control-label col-md-12" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>
                   
</div>





 <div class="form-group">
            
                  <asp:Label ID="Label10" runat="server"  Text="Agreement form" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>
                     <div class="col-md-6">
                      <a href="../attachments/doc.docx"' class="style1" >
                         <strong>Click here to download</strong></a>
</div></div>
                
 <div class="form-group">

                    <asp:Label ID="Label1" runat="server" Text="Name" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtname" CssClass="form-control" placeholder="Enter name" required="required"  runat="server"></asp:TextBox>

                    </div>

                </div>

                 <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Address" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>
                  
                     <div class="col-md-6">

                         <asp:TextBox ID="txtadd" runat="server" TextMode="MultiLine" placeholder="Enter Address" required="required"  CssClass="form-control"></asp:TextBox> </div>
        </div>
                  <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Place" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtplace" CssClass="form-control" runat="server" placeholder="Enter place" required="required" ></asp:TextBox>

                    </div>

                </div>

                 <div class="form-group">
            
                  <asp:Label ID="Label4" runat="server"  Text="Phone no" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>
                     <div class="col-md-6">

                         <asp:TextBox ID="txtphone"  runat="server" CssClass="form-control" placeholder="Enter phone number" required="required" type="text" MaxLength="10"  pattern="[0-9]{10}" ></asp:TextBox> </div>
         </div>

                  <div class="form-group">
            
                  <asp:Label ID="Label5" runat="server" Text="Email id" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>
                     <div class="col-md-6">

                         <asp:TextBox ID="txtemail" type="email" runat="server" CssClass="form-control" placeholder="Enter email" required="required" ></asp:TextBox> </div>
         </div>

                  <div class="form-group">
            
                  <asp:Label ID="Label6" runat="server" Text="Password" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold"></asp:Label>
                     <div class="col-md-6">

                         <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password" required="required" ></asp:TextBox> </div>
         </div>
           <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Re-enter Password" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:TextBox ID="txtrenter" CssClass="form-control" placeholder="Re enter password" required="required" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Not matching" ControlToCompare="txtpass" ControlToValidate="txtrenter" ForeColor="Red" ValidationGroup="a"></asp:CompareValidator>
                    </div>

                </div>




                <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Photo" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6">
                        <asp:FileUpload ID="FileUpload1" runat="server" required="required" CssClass="" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold" />

                    </div>

                </div>
                 <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Agreement" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>

                    <div class="col-md-6"> 
                        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="" required="required" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight:bold" />

                    </div>

                </div>
               
                 

                <div class="form-group">

                    <div class="col-md-6 col-md-offset-3">
                        <asp:Button ID="Button1" CssClass="btn btn-info form-control" runat="server" Text="Submit" OnClick="Button1_Click" ValidationGroup="a"/>

                    </div>

                </div>

            </div>


        </div>

       
    </div>



</asp:Content>

