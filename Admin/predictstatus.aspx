<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="predictstatus.aspx.cs" Inherits="Admin_Default" %>

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
                url: "../Admin/predictstatus.aspx/moduledtls",
                data: "{'wid':'" + wid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    debugger;
                    var i = 0;

                    $("#mdapnd").html('');

                    for (i; i <= 3; i++) {

                        var diff;

                        diff = 100 - parseInt(data.d[i].mstatus);
                        var modulename = data.d[i].mname;

                        

                        var tg = "<label class='col-md-3'>Present Work Status</label><div class='col-md-8'> <div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped  active' role='progressbar' aria-valuenow='" + data.d[i].mstatus + "'aria-valuemin='0' aria-valuemax='100' style='width:" + data.d[i].mstatus + "%'>'" + data.d[i].mstatus + "% completed' </div><div class='progress-bar progress-bar  progress-bar-danger ' role='progressbar' aria-valuenow='" + diff + "'aria-valuemin='0' aria-valuemax='100' style='width:" + diff + "%'>'" + diff + "% Remain' </div></div></div> ";

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
                url: "../Admin/predictstatus.aspx/workcompleted",
                data: "{'wid':'" + wid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    debugger;
                    var i = 0;

                    //debugger;
                    $("#cnt").html('');
                    for (i; i < 1; i++) {

                        var diff = 100 - parseInt(data.d[0].pri);
                        var tg = "<label class='col-md-3'>Coming Work Status</label><div class='col-md-8'><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped  active' role='progressbar' aria-valuenow='" + data.d[i].pri + "'aria-valuemin='0' aria-valuemax='100' style='width:" + data.d[i].pri + "%'>'" + data.d[0].pri + "% completed' </div><div class='progress-bar progress-bar  progress-bar-danger ' role='progressbar' aria-valuenow='" + diff + "'aria-valuemin='0' aria-valuemax='100' style='width:" + diff + "%'>'" + diff + "% Remain' </div></div></div>";

                        $("#cnt").append(tg);


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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
         <h3 class="page-header text-center"><strong> PREDICT WORK STATUS</strong></h3>
        
        <div class="jumbotron">
                       <div class="form-horizontal">
                           <div class="form-group">
                               
                            <asp:Label ID="Label2" runat="server" Text="Projects" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="ddlpro" CssClass="ddlpro" runat="server" DataSourceID="SqlDataSource3" DataTextField="work_name" DataValueField="work_id" Width="123px">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                   
                                                             
                     
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT work_request.work_id, work_request.work_name FROM workallot INNER JOIN work_request ON workallot.w_id = work_request.work_id ">
                     </asp:SqlDataSource>
                     
                </div>
               </div>
             <div class="form-group" id="mdapnd">
                 
             </div>

             <div class="form-group" id="cnt" >
                 


             </div>
             
             
            





             </div></div>

        </div>
    </div>
</asp:Content>


