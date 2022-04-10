<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.master" AutoEventWireup="true" CodeFile="addnewtask.aspx.cs" Inherits="Employee_Default" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script>

     $(document).ready(function () {

         $("#btnadd").click(function () {



             var count = $("#txtcount").val();


             count = parseInt(count) + 1;

             $("#txtcount").val(count);

             var modulename = "<div class='form-group'><label class='control-label col-md-3'>Task</label><div class='col-md-6'><input type='text' id='txtmname" + count + "' required='required' class='form-control' /> </div></div>";
           
             $("#modulecont").append(modulename);



         });


         $("#btnsub").click(function () {

             var count = $("#txtcount").val();
             var wid = $('#<%=DropDownList1.ClientID %> option:selected').val();

             var module, modulename;
             for (var i = 1; i <= count; i++) {
                 debugger;
                 modulename = $("#txtmname" + i).val();

                


                 $.ajax({

                     type: "POST",
                     url: "../Employee/addnewtask.aspx/InsertModules",
                     data: "{'wid':'" + wid + "','modulename':'" + modulename+"'}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (ar) {

                         if (ar.d == "success") {



                         }

                     }

                 });


             }
             $("#divmsg").html('');
             $("#divmsg").append(" <div class='alert alert-success alert-dismissable'><a href='addnewtask.aspx' class='close' data-dismiss='alert' aria-label='close'>&times</a><strong>Success! </strong>Tasks added Successfully.</div>")
         });





     });

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h3 class="page-header text-center">ADD Task</h3>
        <div class="form-horizontal">
        <div class="jumbotron">
            <div id="modulecont">
                <div class="form-group" id="divmsg">

                </div>
                <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Project" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList2" runat="server"  AutoPostBack="True" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="work_name" DataValueField="work_id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="select  distinct work_request.work_id, work_request.work_name FROM work_request INNER JOIN unit ON work_request.work_id = unit.wid INNER JOIN task_allot ON unit.unitid = task_allot.unitid WHERE (task_allot.emp_id = @empid) and work_request.Status=@status" >
                         <SelectParameters>
                         <asp:Parameter DefaultValue="allocated" Name="status" Type="String" />
                             <asp:SessionParameter Name="empid" SessionField="user" />
                         </SelectParameters>
                     </asp:SqlDataSource>
              </div>
          </div>
                       
     
     <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Work" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList1" runat="server"  DataSourceID="SqlDataSource1"  DataTextField="unitname" DataValueField="unitid" AutoPostBack="True" CssClass="form-control">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT  distinct unit.unitid,unit.unitname FROM work_request INNER JOIN unit ON work_request.work_id = unit.wid INNER JOIN task_allot ON unit.unitid = task_allot.unitid WHERE (task_allot.emp_id = @empid) and unit.wid=@wid">
                         <SelectParameters>
                             <asp:SessionParameter Name="empid" SessionField="user" />
                             <asp:ControlParameter ControlID="DropDownList2" Name="wid" PropertyName="SelectedValue" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </div>
               </div>

                <input type="hidden" id="txtcount" value="1" />
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT work_request.work_id, work_request.work_name FROM work_request INNER JOIN workallot ON work_request.work_id = workallot.W_id WHERE (workallot.manager_id = @managerid)">
                         <SelectParameters>
                             <asp:SessionParameter Name="managerid" SessionField="user" DefaultValue="" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     
                 <div class="form-group">
                       <label class="control-label col-md-3 text-info">Task</label>
                 <div class="col-md-6">
                 
                     <input type="text" id="txtmname1" required="required" class="form-control" />
                     
                  
                     
                </div>
               </div>
                </div>
             <div class="form-group" style="margin-top: 20px;">
                     <div class="col-md-6 col-md-offset-2">

                         <input type="button" id="btnadd" value="add more" class="btn-info"  />
                     </div>
                 </div>
                        <div class="form-group">

                    <div class="col-md-6 col-md-offset-3">
                         <input type="button" id="btnsub" value="Submit" class="btn-info btn form-control"  />
                       

                    </div>

                </div>

            
    </div> 


               

                </div></div>


</asp:Content>


      

