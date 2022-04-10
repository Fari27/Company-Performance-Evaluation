<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.master" AutoEventWireup="true" CodeFile="addmodules.aspx.cs" Inherits="Projectleader_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
     <script>

        $(document).ready(function ()

        {
           
            $("#btnadd").click(function () {

                
               
              var  count = $("#txtcount").val();


                count = parseInt(count) + 1;
              
                $("#txtcount").val(count);

                var modulename = "<div class='form-group'><label class='control-label col-md-3 text-info'>Unit Name</label><div class='col-md-6'><input type='text' id='txtmname" + count + "' required='required' class='form-control' /> </div></div>";
                var moduledtls = " <div class='form-group'><label class='control-label col-md-3 text-info'>Details</label><div class='col-md-6'><textarea id='txtdtls" + count + "' required='required' class='form-control'></textarea></div></div>";
                $("#modulecont").append(modulename + moduledtls);



            });


            $("#btnsub").click(function ()
            {
               
                var  count = $("#txtcount").val();
                 var wid =  $('#<%=ddlwork.ClientID %> option:selected').val();
               
                var module, modulename;
                for (var i = 1; i <= count ; i++)
                {
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
                $("#divmsg").append(" <div class='alert alert-success alert-dismissable'><a href='addmodules.aspx' class='close' data-dismiss='alert' aria-label='close'>&times</a><strong>Success! </strong>Units added Successfully.</div>")});

            



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
                     <asp:DropDownList ID="ddlwork" runat="server"  DataSourceID="SqlDataSource3" DataTextField="work_name" DataValueField="work_id"  CssClass="form-control">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                     </asp:DropDownList>
                       <input type="hidden" id="txtcount" value="1" />
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eeeConnectionString %>" ProviderName="<%$ ConnectionStrings:eeeConnectionString.ProviderName %>" SelectCommand="SELECT work_request.work_id, work_request.work_name FROM work_request INNER JOIN workallot ON work_request.work_id = workallot.W_id WHERE (workallot.manager_id = @managerid)">
                         <SelectParameters>
                             <asp:SessionParameter Name="managerid" SessionField="user" DefaultValue="" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     
                </div>
               </div>

              <div class="form-group">
                       <label class="control-label col-md-3 text-info">Unit Name</label>
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

