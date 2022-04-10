<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.master" AutoEventWireup="true" CodeFile="addtask.aspx.cs" Inherits="Employee_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
     <script>

         $(document).ready(function () {

             $("#btnadd").click(function () {



                 var count = $("#txtcount").val();


                 count = parseInt(count) + 1;

                 $("#txtcount").val(count);

                 var modulename = "<div class='form-group'><label class='control-label col-md-3 text-info'>Module Name</label><div class='col-md-6'><input type='text' id='txtmname" + count + "' required='required' class='form-control' /> </div></div>";
                 var moduledtls = " <div class='form-group'><label class='control-label col-md-3 text-info'>Details</label><div class='col-md-6'><textarea id='txtdtls" + count + "' required='required' class='form-control'></textarea></div></div>";
                 $("#modulecont").append(modulename + moduledtls);



             });


             $("#btnsub").click(function () {

                 var count = $("#txtcount").val();
                 var wid = $('#<%=DropDownList4.ClientID %> option:selected').val();

                 var module, modulename;
                 for (var i = 1; i <= count; i++) {
                     debugger;
                     modulename = $("#txtmname" + i).val();

                     module = $("#txtdtls" + i).val();


                     $.ajax({

                         type: "POST",
                         url: "../Manager/addmodules.aspx/InsertModules",
                         data: "{'wid':'" + wid + "','module':'" + module + "','modulename':'" + modulename + "'}",
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (ar) {

                             if (ar.d == "success") {



                             }

                         }

                     });


                 }
                 $("#divmsg").html('');
                 $("#divmsg").append(" <div class='alert alert-success alert-dismissable'><a href='addmodules.aspx' class='close' data-dismiss='alert' aria-label='close'>&times</a><strong>Success! </strong>Modules added Successfully.</div>")
             });





         });

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h3 class="page-header text-center">ADD UNIT</h3>
        <div class="form-horizontal">
        <div class="jumbotron">
            <div id="modulecont">
                <div class="form-group" id="divmsg">

                </div>
             <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Select Work" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="ddlwork" runat="server"  DataSourceID="SqlDataSource3" 
                         DataTextField="work_name" DataValueField="work_name"  CssClass="form-control" 
                         onselectedindexchanged="ddlwork_SelectedIndexChanged">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                       <input type="hidden" id="txtcount" value="1" />
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT Distinct(work_request.work_name) FROM work_request INNER JOIN task_allot ON work_request.work_name = task_allot.wname WHERE (task_allot.emp_id = @managerid)">
                         <SelectParameters>
                             <asp:SessionParameter Name="managerid" SessionField="user" DefaultValue="" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     
                </div>
               </div>

                 <div class="form-group">
                    
  <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Task" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4" DataTextField="unitname" DataValueField="unitid" AutoPostBack="True" CssClass="form-control">
                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList4" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT unit.unitid, unit.unitname FROM unit INNER JOIN work_request ON work_request.work_id=unit.wid  WHERE (work_request.work_name= @wid)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="ddlwork" Name="wid" PropertyName="SelectedValue" Type="Int32" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     
                </div>
               </div>


               <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Projects" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="work_name" DataValueField="work_name" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged1"> <asp:ListItem Value="0">--Select--</asp:ListItem></asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList3" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT Distinct(work_request.work_name) FROM work_request INNER JOIN task_allot ON work_request.work_name = task_allot.wname WHERE (task_allot.emp_id = @managerid)">
                         <SelectParameters>
                             <asp:SessionParameter Name="plid" SessionField="user" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     
                </div>
               </div>

                     <div class="form-group">
                    
  <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Section" CssClass="control-label col-md-3" font-size="16px" ForeColor="#0099FF" style="font-family: Arial; font-weight: bold"></asp:Label>
                 <div class="col-md-6">
                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="unitname" DataValueField="unitid" AutoPostBack="True" CssClass="form-control">
                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList4" ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT unitid, unitname FROM unit  WHERE (wid = @wid)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="DropDownList3" Name="wid" PropertyName="SelectedValue" Type="Int32" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     
                </div>
               </div>

  


              <div class="form-group">
                       <label class="control-label col-md-3 text-info">Task Name</label>
                 <div class="col-md-6">
                 
                     <input type="text" id="txtmname1" required="required" class="form-control" />
                     
                  
                     
                </div>
               </div>
             <div class="form-group">
                    <label class="control-label col-md-3 text-info">Details</label>
                 <div class="col-md-6">
                      <textarea id="txtdtls1" required="required" class="form-control"></textarea>
              
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


