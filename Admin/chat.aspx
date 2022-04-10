<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="chat.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>

        img:hover
        {
            height:50px;
            width:50px;
        }
    </style>
    <script>
       $(document).ready(function ()
        {
          
            //page load online users
         OnlineUsers();

       });



       // online users
       function OnlineUsers() {
           $("#test").html('');
           $.ajax({

               type: "POST",
               url: "../Admin/chat.aspx/onuser",
               data: '',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (data) {
                   var i = 0

                   //debugger;
                   for (i; i < data.d.length; i++) {

                       $("#test").append("<tr><td><img src='" + data.d[i].photo + "' class='img-rounded img-circle' height='20px' width='20px'/>  </td><td><a id='" + data.d[i].user + "'  onclick=LoadMessages(this.id,'" + data.d[i].photo + "') style='cursor:pointer;font-weight: bold;font-size='16px'; ForeColor='#5bc0de';text-decoration:none !important;color: #1b85a5 !important; >" + data.d[i].user + "</a></td></tr>");


                   }
               }

           });

       }




       function LoadMessages(usernsme,photo) {

           debugger;
           $("#MessageContainer").load("Chatroom.aspx?Email=" + usernsme + "&Photo=" + photo);
       }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="container">
    
    <div class="form-horizontal">
        <h3 class="page-header text-center " >CHAT</h3>
        <div class="form-group">
            <div class="col-md-3" >
        <h4 class="page-header text-center"  >Online</h4>
                <div class="container-fluid" style="overflow:scroll; height:400px ">
                <table id="test" ></table>
            </div></div>
            <div class="col-md-8">
        <h4 class="page-header text-center">Messages</h4>
                <div class="container-fluid" id="MessageContainer">
                    



                </div>
                

        </div>
    </div>

    </div>

    </div>


</asp:Content>

