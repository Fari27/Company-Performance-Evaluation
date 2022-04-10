<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Chatroom.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
            .btimg{
                background: url(../img/cht.png) no-repeat;
                cursor:pointer;
                border: none;
                height:60px;
                width:70px
            }
        </style>
    <script>
        
         $(".ddlpro").change(function () {
               
                ShowMessages();
            }
                );
        });



           function ShowMessages()

         {
               $("#test").html('');
               var ph = $("#HiddenField1").val();

            var fid ='<%=Session["user"].ToString() %>';


             debugger;
            var wid = $(".ddlpro").val();
          
   
         
            $.ajax({
                type: "POST",
                 
                url: "../Admin/ChatRoom.aspx/ChatMessages",
                  data: "{'wid':'" + wid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    $("#MessagesChat").html('');
                    $("#MessagesChatFooter").html('');

                    $("#MessagesChat").append("<div class='form-group col-md-12'><img src='<%="+wid+"%>' class='img-rounded img-circle' height='50px' width='50px'/><%=hdntoid.Value%>  <input type='hidden' value='<%="+wid+"%>' id='hdtoid' /></div>");
                   
                    for (var i = 0; i < data.d.length; i++)
                    {
                        debugger;
                        if (data.d[i].Me == fid)
                        {
                            $("#MessagesChat").append("<div style='text-align:right;margin-top: 0.1em;margin-bottom: 0.1em;background-color:rgba(128, 128, 128, 0.36);height:50px;max-width: 80% !important;background-color: #5bc0de;float: right;text-align: right;border-bottom-left-radius: 4px;border-bottom-right-radius: 4px;border-top-left-radius: 4px;' class='col-md-12'>" + data.d[i].Message + "</div>");
                        }
                        if (data.d[i].Me != fid)

                        {
                            $("#MessagesChat").append("<div style='text-align:left;height:50px;margin-top: 0.1em;margin-bottom: 0.1em;max-width: 80%;float: left;background-color: #efe9e9 !important;text-align: left;border-bottom-left-radius: 4px;border-bottom-right-radius: 4px;border-top-right-radius: 4px;' class='col-md-12'>" + data.d[i].Message + "</div>");
                        }
                        

                    }

                    $("#MessagesChatFooter").append("<div class='row' style='display: inline-flex;width: 100%;margin: auto;'><textarea id='txtmsg' class='form-control'></textarea><input class='btimg'  type='button' name='button' onclick=Insertmessage() /></div>");

                    

                    
                }
                
            });
          
            $("#MessagesChat").html('');
            setTimeout(ShowMessages, 60000);

        }

         // load images
        function LoadMessages(usernsme, photo) {

            debugger;
            $("#MessageContainer").load("Chatroom.aspx?Email=" + usernsme + "&Photo=" + photo);
        }


         // insert mesage

        function Insertmessage()
        {

            debugger;
           
            var you = $("#hdtoid").val();

   var me = '<%=Session["user"].ToString() %>';
          
            var msg = $("#txtmsg").val();
            if (me != '' && you != '' && msg)
            {

                $.ajax({

                    type: "POST",
                    url: "../Admin/Chatroom.aspx/InsertMessages",
                    data: "{'me':'" + me + "','you':'" + you + "','msg':'" + msg + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (ar)
                    {
                      
                        if (ar.d == "success")
                        {

                            $("#MessagesChat").html('');
                            ShowMessages();
                        }
                        
                    }
                });
            }
        }

       

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="form-horizontal">
                           <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Projects" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="ddlpro" CssClass="ddlpro" runat="server" DataSourceID="SqlDataSource3" DataTextField="fname" DataValueField="usernsme" Width="123px">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                   
                                                             
                     
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT staffregisters.fname,login.usernsme FROM staffregisters inner join login on staffregisters.email=login.usernsme">
                     </asp:SqlDataSource>
                     
                </div>




<div class="container" style="width: 100% !important;">
    <div id="MessagesChat" class="container-fluid" style="width:100%;max-height: 250px;min-height: 250px;overflow: auto;">
  
        <asp:HiddenField ID="hdntoid" runat="server" />
       
        <asp:HiddenField ID="HiddenField1" runat="server" />
       
    </div>
    <div id="MessagesChatFooter" class="container-fluid" style="width:100%;">

    </div>
    </div>

</asp:Content>

