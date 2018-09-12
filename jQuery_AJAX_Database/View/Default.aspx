<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/HomeMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="View.ViewDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-12">
                <h2>New Joining Form</h2>
            </div>
            <br />
            <div class="col-lg-8">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Employee Details </h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group col-lg-4">
                            <label>Job</label>
                            <input type="text" name="Job" id="Job" class="form-control" placeholder="Job" required="" />
                        </div>

                        <div class="form-group col-lg-4">
                            <label>Experience</label>
                            <input type="text" name="Experience" id="Experience" class="form-control" placeholder="5" required="" />
                        </div>
						
						<%-- <div class="form-group col-lg-6">
                            <label>LastDate</label>
                            <input type="date" name="LastDate" id="LastDate" class="form-control datepicker" required="" />
                        </div>--%>
						
                        <div class="form-group col-lg-6">
                            <label>LastDate </label>
                            <input type="date" name="LastDate" id="LastDate" min="1920-01-02" class="form-control datepicker" required="" />
                        </div>

                         <div class="form-group col-lg-6">
                            <label>ApplicationReceived </label>
                            <input type="date" name="ApplicationReceived" id="ApplicationReceived" min="1920-01-02" class="form-control datepicker" required="" />
                        </div>

						 <%--<div class="form-group col-lg-6">
                            <label>ApplicationReceived</label>
                            <input type="date" name="ApplicationReceived" id="ApplicationReceived" class="form-control datepicker" required="" />
                        </div>--%>
						
						
						<div class="form-group col-lg-4">
                            <label>Quantity</label>
                            <input type="text" name="Quantity" id="Quantity" class="form-control" placeholder="5" required="" />
                        </div>
						
						
						
						<div class="form-group col-lg-6">
                            <label>IJPStatus</label>
                            <select name="IJPStatus" id="IJPStatus" class="form-control" required="">
                                <option value="" disabled="disabled">-- Select -- </option>
                                <option value="Submitted">Submitted</option>
                                <option value="Open">Open</option>
                                <option value="Closed">Closed</option>
                                <option value="Hold">Hold</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
						
                    </div>
                </div>
            </div>
            <div class="form-group col-lg-8">
                <div style="float: right">
                    <input type="button" value="Cancel" id="BtnCancel" class="btn btn-primary" />
                    <input type="button" class="btn btn-primary" name="submitButton" id="btnSave" value="Save" />
                </div>
            </div>
            <br />
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Admin Employee Details Tables
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="dataTables_length" id="dataTables-example_length">
                                            <label>
                                                Show
                                            <select name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm">
                                                <option value="10">10</option>
                                                <option value="25">25</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                            </select>
                                                entries</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div id="dataTables-example_filter" class="dataTables_filter">
                                            <label>Search:<input type="search" class="form-control input-sm" placeholder="" aria-controls="dataTables-example" /></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="table-responsive">
                                        <table id="dataTables-example" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="dataTables-example_info">
                                            <thead>
                                                <tr role="row">
                                                    <th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" style="width: 175px;" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Job</th>
                                                    <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" style="width: 203px;" aria-label="Browser: activate to sort column ascending">Experience</th>
                                                    <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" style="width: 184px;" aria-label="Platform(s): activate to sort column ascending">LastDate</th>
                                                    <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" style="width: 150px;" aria-label="Engine version: activate to sort column ascending">ApplicationReceived</th>
                                                    <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" style="width: 108px;" aria-label="CSS grade: activate to sort column ascending">Quantity</th>
                                                    <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" style="width: 108px;" aria-label="CSS grade: activate to sort column ascending">IJPStatus</th>
                                                 
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (var data = 0; data < TableData.Rows.Count; data++)
                                                   { %>
                                                <tr class="gradeA odd" role="row">
                                                    <td class="sorting_1"><%=TableData.Rows[data]["Job"]%>
                                                    <td><%=TableData.Rows[data]["Experience"]%></td>
                                                    <td><%=TableData.Rows[data]["LastDate"]%></td>
                                                    <td><%=TableData.Rows[data]["ApplicationReceived"]%></td>
                                                    <td><%=TableData.Rows[data]["Quantity"]%></td>
                                                    <td><%=TableData.Rows[data]["IJPStatus"]%></td>
                                                    <td>
                                                        <input type="button" class="btn btn-primary editButton" data-id="<%=TableData.Rows[data]["Id"] %>" data-toggle="modal" data-target="#myModal" name="submitButton" id="btnEdit" value="Edit" /></td>
                                                    <td>
                                                        <input type="button" class="btn btn-primary deleteButton" data-id="<%=TableData.Rows[data]["Id"] %>" name="submitButton" id="btnDelete" value="Delete" /></td>
                                                </tr>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
        </div>
    </div>
    <!-- For Modal Popup  -->
   

    
			
			
 
 
 
 <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="myModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h2 class="modal-title" id="myModalLabel">Modal title</h2>
                </div>
                <div class="modal-body">
                    <div class="panel-body">
                        <div class="form-group col-lg-4">
                            <label>Job</label>
                            <input type="text" name="Job" id="Job1" class="form-control" placeholder="Java" required="" />
                        </div>

                        <div class="form-group col-lg-4">
                            <label>Experience</label>
                            <input type="text" name="Experience" id="Experience1" class="form-control" placeholder="5" required="" />
                        </div>
                        <div class="form-group col-lg-4 ">
                            <label>LastDate</label>
                            <input type="text" name="LastDate" id="LastDate1" class="form-control" placeholder="" required="" />
                        </div>
						
						
						<div class="form-group col-lg-4 ">
                            <label>ApplicationReceived</label>
                            <input type="text" name="ApplicationReceived" id="ApplicationReceived1" class="form-control" placeholder="" required="" />
                        </div>

                        <div class="form-group col-lg-4 ">
                            <label>Quantity</label>
                            <input type="text" name="Quantity" id="Quantity1" class="form-control" placeholder="" required="" />
                        </div>

						<div class="form-group col-lg-6">
                            <label>IJPStatus</label>
                            <select name="IJPStatus" id="IJPStatus1" class="form-control" required="">
                               <option value="" disabled="disabled">-- Select -- </option>
                                <option value="Submitted">Submitted</option>
                                <option value="Open">Open</option>
                                <option value="Closed">Closed</option>
                                <option value="Hold">Hold</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
						
						
						
                      
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" id="btnUpdate" class="btn btn-primary" edit-id="" data-dismiss="modal">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <!-- For Modal Popup  -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/json2/0.1/json2.js"></script>
    

    
     <script type="text/javascript">
        
         debugger
         $(function () {
             $("#btnSave").click(function () {
                 debugger
                 var user = {};
                 user.Job = $("#Job").val();
                 user.Experience = $("#Experience").val();
                 user.LastDate = $("#LastDate").val();
                 user.ApplicationReceived = $("#ApplicationReceived").val();
                 user.Quantity = $("#Quantity").val();
                 user.IJPStatus = $("#IJPStatus").val();

                 $.ajax({
                     type: "POST",
                     contentType: "application/json; charset=utf-8",
                     url: "Default.aspx/SaveUser",
                     data: '{objEmployee: ' + JSON.stringify(user) + '}',
                     dataType: "json",
                     success: function () {
                         alert("User has been added successfully.");
                         getDetails();
                     },
                     error: function () {
                         alert("Error while inserting data");
                     }
                 });
                 return false;
             });

             function getDetails() {
                 $.ajax({
                     type: "POST",
                     contentType: "application/json; charset=utf-8",
                     url: "Default.aspx/GetData",
                     data: {},
                     dataType: "json",
                     success: function (data) {
                         $('#dataTables-example tbody').remove();
                         //console.log(data.d);
                         for (var i = 0; i < data.d.length; i++) {
                             $("#dataTables-example").append(
                                 "<tr><td>" + data.d[i].Job + "</td><td>" + data.d[i].Experience + "</td>" +
                                 "<td>" + data.d[i].LastDate + "</td>" + "<td>" + data.d[i].ApplicationReceived + "</td>" +
                                 "<td>" + data.d[i].Quantity + "</td>" + "<td>" + data.d[i].IJPStatus + "</td>" +
                                 "<td>" + "<input type='button' class='btn btn-primary editButton' data-id='" + data.d[i].Id + "' data-toggle='modal' data-target='#myModal' name='submitButton' id='btnEdit' value='Edit' />" + "</td>" +
                                 "<td><input type='button' class='btn btn-primary deleteButton' data-id='" + data.d[i].Id + "' name='submitButton' id='btnDelete' value='Delete'/> </td></tr>");
                         }
                     },
                     error: function () {
                         alert("Error while Showing update data");
                     }
                 });
             }

             $(document).on("click", ".deleteButton", function () {
                 var id = $(this).attr("data-id");
                 $.ajax({
                     type: "Post",
                     contentType: "application/json; charset=utf-8",
                     url: "Default.aspx/Remove",
                     data: '{Id: ' + id + '}',
                     dataType: "json",
                     success: function () {
                         if (confirm("Are you sure you want to delete !") == true) {
                             alert("Data Deleted successfully");
                         } else {
                             alert("You have canceled the changes");
                         }
                         //alert("Data Updated successfully");
                         getDetails();
                     },
                     error: function (data) {
                         alert("Error while Updating data of :" + id);
                     }
                 });


             });
             $(document).on("click", ".editButton", function () {
                 $('#myModal').focus();
                 var id = $(this).attr("data-id");
                 console.log(id);
                 $("#btnUpdate").attr("edit-id", id);
                 //alert(id);  //getting the row id 
                 $.ajax({
                     type: "Post",
                     contentType: "application/json; charset=utf-8",
                     url: "Default.aspx/EditData",
                     data: '{Id: ' + id + '}',
                     dataType: "json",
                     success: function (data) {
                         var empDetails = $.parseJSON(data.d);
                         $.each(empDetails, function (index, value) {
                             //console.log(v.Fname);
                             $("#Job1").val(value.Job);
                             $("#Experience1").val(value.Experience);
                             $("#LastDate1").val(value.LastDate);
                             $("#ApplicationReceived1").val(value.ApplicationReceived);
                             $("#Quantity1").val(value.Quantity);
                             $("#IJPStatus1").val(value.IJPStatus);

                         });
                         //$("#FirstName1").val(empDetails.Fname);
                         //$("#LastName1").val(empDetails.Lname);
                         //empDetails.Fname;
                         //console.log(empDetails.Fname);
                     },
                     error: function () {
                         alert("Error while retrieving data of :" + id);
                     }
                 });
             });

             $("#btnUpdate").click(function () {
                 var id = $(this).attr("edit-id");
                 var user = {};
                 user.Job = $("#Job1").val();
                 user.Experience = $("#Experience1").val();
                 user.LastDate = $("#LastDate1").val();
                 user.ApplicationReceived = $("#ApplicationReceived1").val();
                 user.Quantity = $("#Quantity1").val();
                 user.IJPStatus = $("#IJPStatus1").val();

                 user.ModifiedDateTime = new Date();
                 $.ajax({
                     type: "Post",
                     contentType: "application/json; charset=utf-8",
                     url: "Default.aspx/UpdateData",
                     data: '{objEmployee: ' + JSON.stringify(user) + ', Id : ' + id + '}',
                     //JSON.stringify({ objEmployee: user, Id: id }),
                     //'{objEmployee: ' + JSON.stringify(user) + ', Id : + ' + id + '}',
                     dataType: "json",
                     success: function (data) {
                         if (confirm("Are you sure you want to change !") == true) {
                             alert("Data Updated successfully");
                         } else {
                             alert("You have canceled the changes");
                         }
                         //alert("Data Updated successfully");
                         getDetails();
                     },
                     error: function (data) {
                         alert("Error while Updating data of :" + id);
                     }
                 });
             });


         });

    </script>

    <script src="../Content/js/jquery.dataTables.js"></script>
</asp:Content>

