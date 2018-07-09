<%@page import="model.bean.Rooms"%>
<%@page import="model.bean.Schedule"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
            ///** CSS cÃ„Æ’n id pagination ra giÃ¡Â»Â¯a mÃƒ n hÃƒÂ¬nh **///
            #pagination {
                display: flex;
                display: -webkit-flex; /* Safari 8 */
                flex-wrap: wrap;
                -webkit-flex-wrap: wrap; /* Safari 8 */
                justify-content: center;
                -webkit-justify-content: center;
            }
        </style>
<%@include file="/templates/inc/dashboard.jsp" %>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="jquery.twbsPagination.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
<%
String classNameContent = "" ;
String classNameContainer = "";
String styleContent = "style='margin-top:  5px;'";
if( user.getRoleId() == 3) {
	classNameContent = "content-wrapper py-3";
	classNameContainer = "container-fluid";
	styleContent = "";
}

%>
<div class="<%= classNameContent%>" <%= styleContent%>>
  <div class="<%= classNameContainer%>">
    <div class="card mb-3">
        <div class="alert alert-primary" style="font-size: larger;margin-bottom: 0px;"> 
             <i class="fa fa-fw fa-home" ></i>
             	<strong>Room List</strong>
            <!-- <div class="row">
			<div class="col-md-10"></div>
            <button class="btn btn-primary" name="addRoom"  onclick="" data-toggle="modal" data-target="#addModal">Add rooms</button>            
            </div> -->
			  </div>	
			  </div> 
         
         <%			int check=0;
                  	ArrayList<Rooms> roomlist = (ArrayList<Rooms>) request.getAttribute("roomList");
         			if(request.getAttribute("check")!=null){
             			 check = Integer.parseInt((String)request.getAttribute("check"));
         			}
         			int k=0;
         			int tong = roomlist.size();
        	%>
        	
<!-- Start room -->
        <%		if(request.getAttribute("check")!=null){

				if(check == 2){
				%>
				<div class="alert alert-success">
				  <strong>Success!</strong>
				</div>
				<%
				session.invalidate();
				}
			  	else {
			  		if(check == 1){
			  	
				%>
				<div class="alert alert-danger">
				  <strong>Error!</strong>
				</div>
				<%
				session.invalidate();
				}
			  		else {
			  			if(check == 3){
			  				%>
							<div class="alert alert-success">
							  <strong>Success!</strong>
							</div>
							<%
							session.invalidate();
			  			}
			  			else{
						  	if(check == 4){
							%>
							<div class="alert alert-danger">
							  <strong>Error!</strong>
							</div>
							<%
							session.invalidate();
							}
						  	
			  		}
			  	}
			  	}
        }
			  	%>
<!-- Stop room -->			  	

        <div class="card-body">
          <div class="table-responsive">
                <div style="margin-left: -15px; margin-bottom: 5px;">
	            	<div style="float: left" >
	            	<a style="width:auto; font-size:15px; height:auto; margin-bottom:10px; margin-left: 10px; " class="btn btn-primary" onclick="" data-toggle="modal" data-target="#addModal" role="button">Add new room</a>
	        		</div>
	            	<div style="float: left; margin-left: 15px;">
	            	<input class="btn btn-danger" style="display: none; margin-left: 10px; margin-bottom: 5px;" onclick="return confirm('Do you want to delete these rooms?')" id="deleteall" type="submit" value="Delete rooms">
                	</div>
                	<div style="clear: both"></div>
	        	</div>
	        	<table id="myTable" class="table table-bordered" width="100%"  cellspacing="0">
                  <thead>
                    <tr>
                      <th style="text-align: center;">No.</th>
                      <th style="text-align: center;">Name</th>
                      <th style="text-align: center;">Capacity</th>
                      <th style="text-align: center;">Status</th>
                      <th style="text-align: center;">Action</th>
                   
                    </tr>
                  </thead>
                  <tbody>
                  
                  	<%
                  	for (Rooms rooms: roomlist){
                  		k++;
                  %>
				   <tr class="contentPage">
				   <td style="text-align: center;" ><%=k %></td>
                  <td style="text-align: center;"><%= rooms.getName() %></td>
                  <td style="text-align: center;" ><%= rooms.getCapacity()%></td>
                  <%if(rooms.getStatus()==0){
                	  %>
                	  <td style="text-align: center;">Occupied</td>
                	  <%
                  } else {
                	  %>
                	  <td style="text-align: center;color: green">Available</td>
                	  <%
                  }
                   %>
                  <td style="text-align: center;">
                  
                  <%-- <a href="<%=request.getContextPath()%>/EditRoomController?id=<%= rooms.getRoomId()%>"
                   data-toggle="modal" data-target="#editModal"><i class="fa fa-edit"></i></a> --%>                 
                   <button type="button" class="btn btn-primary" name="editRoom" data-toggle="modal" data-target="#editModal<%=rooms.getRoomId()%>">edit</button>
                   </td>
                  </tr>
                  <div class="modal fade" id="editModal<%=rooms.getRoomId()%>" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
								<h4 class="modal-title" align="center" style="color: blue;"><strong>Edit room</strong></h4>
								</div>
								<div class="modal-body">
									<form id="add-post2" action="/managementSystem/EditRoomController?id=<%=rooms.getRoomId()%>" method="POST">
										<div class="form-group">
											<label class="required"><strong>Room Name:</strong><span
												style="color: red"> *</span>&nbsp;<span id="spnNameStatus"></span></label>
											<input class="form-control" id="roomname" type="text"
												name="name" value="<%=rooms.getName()%>"
												placeholder="Room Name" required />
										</div>
										<div class="form-group">
											<label class="required"><strong>Capacity:</strong><span
												style="color: red"> *</span></label> <input class="form-control"
												type="number" name="capacity"
												value="<%=rooms.getCapacity()%>" placeholder="Capacity"
												min="1" required />
										</div>
										<div class="form-group">
											<label class="required">Status</label> <br>
											<%
												String available = "", occupied = "";

												if (rooms.getStatus() == 0) {
											%>
											<input type="radio" name="status" value="1">
											Available <br> <input type="radio" name="status"
												value="0" checked="checked"> Occupied <br>
											<%
												} else if (rooms.getStatus() == 1) {
											%>
											<input type="radio" name="status" value="1" checked="checked">
											Available <br> <input type="radio" name="status"
												value="0"> Occupied <br>
											<%
												}
											%>
										</div>
										<button type="submit" class="btn btn-primary" id="btnSubmit">Save Room</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</form>
								</div>
							</div>
						</div>
					</div>
                  <%
                  	}
                  %>
                  </tbody>
                </table>
                <div id="pager">
					<ul id="pagination" class="pagination-sm"></ul>
				</div>


  <!-- Add Modal -->
					<div class="modal fade" id="addModal" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
								<h4 class="modal-title" align="center" style="color: blue;'"><strong>Add new room</strong></h4>
								</div>
								<div class="modal-body">
									<form id="add-post1" action="/managementSystem/AddNewRoom"
										method="POST">
										<div class="form-group">
											<label class="required"><strong>Room Name:</strong><span
												style="color: red"> *</span>&nbsp;<span id="spnNameStatus"></span></label>
											<input class="form-control" id="roomname" type="text"
												name="name" placeholder="Room Name" required />
										</div>
										<div class="form-group">
											<label class="required"><strong>Capacity:</strong><span
												style="color: red"> *</span></label> 
												<input class="form-control"
												id="txtname" type="number" name="capacity"
												placeholder="Capacity" min="1" required />
										</div>
										<div class="form-group">
											<input type="radio" name="status" value="1" checked
												style="display: none;"> 
											<input type="radio" name="status" value="0" style="display: none;">
										</div>
										<button type="submit" class="btn btn-primary" id="btnSubmit">Add
											Room</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</form>
								</div>
							</div>
						</div>
					</div>

					<%-- <%
						Rooms room = new Rooms(0, "", 0, 0);
						//HttpSession session= request.getSession();
						if (request.getAttribute("room") != null) {
							room = (Rooms) request.getAttribute("room");

						}
					%> --%>
					
			
			
<!-- Starting Edit Room -->
<%-- <form id="add-post2" action="<%=request.getContextPath() %>/EditRoomController" method="POST"  >
			<hr>
			
			<h4 style="text-align: left; color:primary;"><strong>Edit Room</strong></h4>
				<div style="height: 5%"></div>
				<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-5" style="float: left">
					<div class="form-group">
						<label class="required"><strong>Room Name:</strong><span style="color: red"> *</span>&nbsp;<span id="spnNameStatus"></span></label> 
							<input class="form-control" id="roomname" type="text" name="name" value="<%=room.getName()%>" placeholder="Room Name" required/>
					</div>
								<div class="form-group">
									<label class="required">Status</label> <br>
									<%
										String available = "", occupied = "";

										if (room.getStatus() == 0) {
									%>
									<input type="radio" name="status" value="1"> Available
									<br> <input type="radio" name="status" value="0"
										checked="checked"> Occupied <br>
									<%
										} else if (room.getStatus() == 1) {
									%>
									<input type="radio" name="status" value="1" checked="checked">
									Available <br> <input type="radio" name="status" value="0">
									Occupied <br>
									<%
										}
									%>
								</div>
							</div>
				<div class="col-md-5" style="float: right">
					<div class="form-group">
						<label class="required"><strong>Capacity:</strong><span style="color: red"> *</span></label> 
						<input class="form-control" type="number" name="capacity" value="<%=room.getCapacity()%>" placeholder="Capacity" min="1" required />
					</div>
				</div>
				</div>
				<div class = "row">
				<div class="col-md-10"></div>
				<div>
					<button type="submit" class="btn btn-primary" id="btnSubmit">Save Room</button>
					<div style="margin-bottom: 10%"></div>
				</div>
				</div>
				
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br>	
			</form> --%>
			</div>
			<script type="text/javascript">
							/* var input = document.getElementById('roomname');
							input.oninvalid = function(event) {
							    event.target.setCustomValidity('Room Name does not allow to contain special characters.');
							} */
							
							$(document).ready(function() {
		      					$('#roomname').blur(function(e) {
		      						var name = $('#roomname').val();
		          					if (validateStrings(name)) {
		      							$('#spnNameStatus').html('');
		      							$('#spnNameStatus').css('color', 'green');
		      							document.getElementById("btnSubmit").disabled = false; 
		      						}
		      						else {
		      							$('#spnNameStatus').html('Room Name just allow upper, lower letter and number');
		      							$('#spnNameStatus').css('color', 'red');
		      							document.getElementById("btnSubmit").disabled = true; 
		      						}
		       					});
		      				});

							function validateStrings(string) {
		      					var pattern = /^[^`~<>@#%&\*\$\{\}\[\]\(\)\+\=?\|\;_!]+$/;

		      					return $.trim(string).match(pattern) ? true : false;
		      				}
							</script>
							
					<div class="card-footer small text-muted">
          Updated yesterday at 11:59 PM
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
                $(document).on('change', '.checkall, .checkitem', function(){
                    var $_this = $(this);
                    document.getElementById("deleteall").style.display = "block";
                    if($_this.hasClass('checkall')){
                        $('.checkitem').prop('checked', $_this.prop('checked'));
                    }else{
                        var $_checkedall = true;
                        $('.checkitem').each(function(){
                            if(!$(this).is(':checked')){
                                $_checkedall = false;
                            }
                            $('.checkall').prop('checked', $_checkedall);
                        });
                    }
                    var $_uncheckedall = true;
                    $('.checkitem').each(function(){
                        if($(this).is(':checked')){
                            $_uncheckedall = false;
                        }
                        if($_uncheckedall){
                            document.getElementById("deleteall").style.display = "none";
                        }else{
                            document.getElementById("deleteall").style.display = "block";
                        }
                    });
                });
            });
        </script>
        <script type="text/javascript">
            $(function () {
                var pageSize = 10; // HiÃ¡Â»Æ’n thÃ¡Â»â€¹ 6 sÃ¡ÂºÂ£n phÃ¡ÂºÂ©m trÃƒÂªn 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** CÃ¡ÂºÂ§n truyÃ¡Â»Ân giÃƒÂ¡ trÃ¡Â»â€¹ vÃƒ o Ã„â€˜ÃƒÂ¢y **///
                var totalRows = <%= tong%>; // TÃ¡Â»â€¢ng sÃ¡Â»â€˜ sÃ¡ÂºÂ£n phÃ¡ÂºÂ©m hiÃ¡Â»Æ’n thÃ¡Â»â€¹ 
                var btnPage = 5; // SÃ¡Â»â€˜ nÃƒÂºt bÃ¡ÂºÂ¥m hiÃ¡Â»Æ’n thÃ¡Â»â€¹ di chuyÃ¡Â»Æ’n trang
                var iTotalPages = Math.ceil(totalRows / pageSize);
                var obj = $('#pagination').twbsPagination({
                    totalPages: iTotalPages,
                    visiblePages: btnPage,
                    onPageClick: function (event, page) {
                        console.info(page);
                        showPage(page);
                    }
                });
                console.info(obj.data());
            });
        </script>
        </div>
       </div>  
      </div>
<%@include file="/templates/inc/footer.jsp" %> 