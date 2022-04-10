<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Common.master" AutoEventWireup="true" CodeFile="samplebootstrap.aspx.cs" Inherits="Common_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h3 class="page-header text-center ">Test</h3>

        <div class="jumbotron">

            <div class="form-horizontal">

                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="name" CssClass="control-label col-md-2"></asp:Label>

                    <div class="col-md-9">
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

                 <div class="form-group">
            
                   <label class="control-label col-md-2">Gender</label>
                     <div class="col-md-6">

                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>male</asp:ListItem>
                    <asp:ListItem>female</asp:ListItem>
                         </asp:RadioButtonList>
            </div>
        </div>

                <div class="form-group">

                    <div class="col-md-6 col-md-offset-2">
                        <asp:Button ID="Button1" CssClass="btn btn-info form-control" runat="server" Text="Submit" />

                    </div>

                </div>

            </div>


        </div>

       
    </div>


</asp:Content>

