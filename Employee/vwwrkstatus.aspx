<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.master" AutoEventWireup="true" CodeFile="vwwrkstatus.aspx.cs" Inherits="Projectleader_Default" %>

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
                url: "../Employee/vwwrkstatus.aspx/moduledtls",
                data: "{'wid':'" + wid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    debugger;
                    var i = 0;

                    $("#mdapnd").html('');

                    for (i; i <=10; i++) {

                        var diff;

                        diff= 100 - data.d[i].mstatus;
                        var modulename = data.d[i].mname;
                       
                        var mnameapnd = "<div class='col-md-3'><b>Unit Name</b></div><div class='col-md-8'><b>Status</b></div><label class='col-md-3'>" + modulename + "</label>";
                       
                        var tg = "<div class='col-md-8'> <div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped  active' role='progressbar' aria-valuenow='" + data.d[i].mstatus + "'aria-valuemin='0' aria-valuemax='100' style='width:" + data.d[i].mstatus + "%'>'" + data.d[i].mstatus + "% completed' </div><div class='progress-bar progress-bar  progress-bar-danger ' role='progressbar' aria-valuenow='" + diff + "'aria-valuemin='0' aria-valuemax='100' style='width:" + diff + "%'>'" + diff + "% Remain' </div></div></div> ";

                        $("#mdapnd").append(mnameapnd + tg);


                    }


                }




            });
        }


        function selectworkstatus() {
            debugger;
            var wid = $(".ddlpro").val();
            

            $.ajax({

                type: "POST",
                url: "../Employee/vwwrkstatus.aspx/workcompleted",
                data: "{'wid':'" + wid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    debugger;
                    var i = 0;

                    $("#cnt").html('');
                    //debugger;
                    for (i; i < 1; i++) {

                        var diff = 100 - parseInt(data.d[0].pri);
                        var tg = "<label class='col-md-3'>Total Work Status</label><div class='col-md-8'><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped  active' role='progressbar' aria-valuenow='" + data.d[i].pri + "'aria-valuemin='0' aria-valuemax='100' style='width:" + data.d[i].pri + "%'>'" + data.d[0].pri + "% completed' </div><div class='progress-bar progress-bar  progress-bar-danger ' role='progressbar' aria-valuenow='" + diff + "'aria-valuemin='0' aria-valuemax='100' style='width:" + diff + "%'>'" + diff + "% Remain' </div></div></div>";

                        $("#cnt").append(tg);


                    }


                }




            });
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h3 class="page-header">View Work Status</h3>
        <div class="jumbotron">
                       <div class="form-horizontal">
         


         <div class="form-group">
                    
  <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Projects" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="ddlpro" CssClass="ddlpro" runat="server" DataSourceID="SqlDataSource3" DataTextField="work_name" DataValueField="work_id" Width="123px">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT  distinct work_request.work_id, work_request.work_name FROM work_request INNER JOIN unit ON work_request.work_id = unit.wid INNER JOIN task_allot ON unit.unitid = task_allot.unitid WHERE (task_allot.emp_id = @empid) and work_request.Status=@status">
                         <SelectParameters>
                             <asp:Parameter DefaultValue="allocated" Name="status" />
                             <asp:SessionParameter DefaultValue="" Name="empid" SessionField="user" />
                         </SelectParameters>
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

