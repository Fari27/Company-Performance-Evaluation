<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="chatting.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">



 <script>

     $(document).ready(function () {

         $(".ddlpro").change(function () {

             selectworkstatus();
             selctmodulestatus()

         }
                );
     });

     function selctmodulestatus() {
         debugger;
         var wid = $(".ddlpro").val();


         $.ajax({

             type: "POST",
             url: "../Admin/chatting.aspx/moduledtls",
             data: "{'wid':'" + wid + "'}",
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (data) {

                 debugger;
                 var i = 0;

                 $("#mdapnd").html('');

                 for (i; i <= 45; i++) {

                     var tg = "<div style='text-align:left;height:50px;margin-top: 0.1em;margin-bottom: 0.1em;max-width: 80%;float: left;background-color: #efe9e9 !important;text-align: left;border-bottom-left-radius: 4px;border-bottom-right-radius: 4px;border-top-right-radius: 4px;' class='col-md-12'>" + data.d[i].msg+ "</div>";

                        $("#mdapnd").append( tg);


                 }


             }




         });
     }


     function selectworkstatus() {
         debugger;
         var wid = $(".ddlpro").val();

         //  $("#cnt").html('');

         $.ajax({

             type: "POST",
             url: "../Admin/vwwrkstatus.aspx/workcompleted",
             data: "{'wid':'" + wid + "'}",
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (data) {

                 debugger;
                 var i = 0;

                 //debugger;
                

                 }


             }




         });
     }

    </script>

    <style type="text/css">
        .auto-style1 {
            display: block;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
         <h3 class="page-header text-center"><strong>Chat</strong></h3>
        
        <div class="jumbotron">
                       <div class="form-horizontal">
                           <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Name" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="ddlpro" CssClass="ddlpro" runat="server" DataSourceID="SqlDataSource3" DataTextField="usernsme" DataValueField="usernsme" Width="123px">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                   
                                                             
                     
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT usernsme FROM login">
                     </asp:SqlDataSource>
                     
                </div>
               </div>
             <div class="form-group" id="mdapnd">
                 
             </div>

             <div class="form-group" id="cnt" >
                 


             </div>
             
             
            





             </div></div>

        </div>
   

</asp:Content>

