
<%@page import="model.bean.User"%>
<%@page import="model.bean.Schedule"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="jquery.twbsPagination.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>

  <%
   	ArrayList<Schedule> schedule = (ArrayList<Schedule>) request.getAttribute("schedule");
   	int k=0;
   	int tong = schedule.size();
   	User ur = (User) request.getAttribute("ur");
%>
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
         <div class="alert alert-primary"  style="font-size: larger;margin-bottom: 0px;"> 
             <i class="fa fa-fw fa-book" ></i>
			    <strong><%=ur.getUsername()%>'s schedule</strong>
         </div>
			  
			  <div>
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
        <div class="card-body">
          <div class="table-responsive">
            <form action=""  method="post">
                <input style="display: none; margin-left: 10px; margin-bottom: 10px; color: red" id="deleteall" type="submit" value="Delete">
                <table id="myTable" class="table table-bordered" width="100%"  cellspacing="0">
                  <thead>
                    <tr>
                      <th style="text-align: center;">No.</th>
                      <th style="text-align: center;">Class</th>
                       <th style="text-align: center;">Room</th>
                      <th style="text-align: center;">Course</th>
                      <th style="text-align: center;">Time Of Date</th>
                      <th style="text-align: center;">Date Of Week</th>
                      <th style="text-align: center;">Hours Taught</th>
                      <th style="text-align: center;">Duration</th>
                      <th style="text-align: center;">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  	<%
                  	for (Schedule list : schedule){
                  		k+=1;
                  		String s="";
                  	 	String str=list.getDateOfWeek();
                  	 	String arr[]=str.split(",");
	                  	 for(int i=0; i<arr.length;i++){
	                  		 switch(arr[i]){
	                  		 case "2":
	                  		 {
	                  			 s+="Mon";
	                  			 break;
	                  		 }
	                  		 case "3":
	                  		 {
	                  			 s+="Tue";
	                  			break;
	                  		 }
	                  		 case "4":
	                  		 {
	                  			 s+="Wed";
	                  			break;
	                  		 }
	                  		case "5":
	                  		 {
	                  			 s+="Thu";
	                  			break;
	                  		 }
	                  		case "6":
	                  		 {
	                  			 s+="Fri";
	                  			break;
	                  		 }
	                  		case "7":
	                  		 {
	                  			 s+="Sat";
	                  			break;
	                  		 }
	                  		case "8":
	                  		 {
	                  			 s+="Sun";
	                  			break;
	                  		 }
	                  	    default:
	                  	    {
	                  	        
	                  	    }
	                  		 }
	                  		if (i< (arr.length-1)) {
	                 			 s+=", ";
	                 		 }
	                 		 else {
	                 			 s+=".";
	                 		 }
                  	 	}
                  %>
				   <tr class="contentPage">
                  <td align="center"><%= k %></td>
                  <td ><%= list.getNameclass()%></td>
                   <td align="center"><%= list.getNameroom()%></td>
                   <td ><%= list.getCourse()%></td>
                   <td align="center"><%= list.getTimeOfDate()%></td>
                   <td ><%= s%></td>
                   <td align="center"><%= list.getCountLession()%></td>
                   <td align="center"><%= list.getDuration() %></td>
                    <td align="center"> <a href="/managementSystem/trainer/list?class_id=<%= list.getClassid() %>&name=<%= list.getNameclass()%>" class="fa fa-eye" style="font-size:24px; text-decoration: none;"></a>
                   <button  type="button" class="btn btn-primary" style="float: right;" data-toggle="modal" data-target="#myModal<%=k%>">Send</button>
                   <div class="modal fade" id="myModal<%=k %>" role="dialog">
						    <div class="modal-dialog ">
						      <div class="modal-content">
						        <div class="modal-header; alert alert-primary">
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						          <h4 class="modal-title">Request take a day off</h4>
						        </div>
						        <div class="modal-body">
						          <table border="0px">
						          <tr>
						          <th>Day of week</th>
						          <td>
						          <form action="/action_page.php" method="get">
									  <input type="checkbox" name="2" value="2"> 2<br>
									  <input type="checkbox" name="3" value="3" checked> 3<br>
									  <input type="checkbox" name="4" value="4" checked> 4<br>
									  <input type="checkbox" name="5" value="5" checked> 5<br>
									  <input type="checkbox" name="6" value="6" checked> 6<br>
									  <input type="checkbox" name="7" value="7" checked> 7<br>
									  <input type="checkbox" name="8" value="8" checked> 8<br>
									</form>
									</td>
						          </tr>
						          <tr>
						          <th>Class</th>
						          <td><%= list.getNameclass()%></td>
						          </tr>
						          <tr>
						          <th>Room</th>
						          <td><%= list.getNameroom()%></td>
						          </tr>
						          <tr>
						          <th colspan="2"><label>Content</label><textarea rows="5" cols="45"></textarea></th>
						          </tr>
						          
						          </table>
						        </div>
						        <div class="modal-footer">
						          <button type="button" class="btn btn-default; alert alert-primary" data-dismiss="modal">Close</button>
						          <button type="button" class="btn btn-default; alert alert-primary" >OK</button>
						        </div>
						      </div>
						    </div>
						  </div>
                  </td>
                  </tr>
                  <%
                  	}
                  %>
                  </tbody>
                </table>
                <div id="pager">
					<ul id="pagination" class="pagination-sm"></ul>
				</div>
            </form>
          </div>
        </div>
        <div class="card-footer small text-muted">
          Updated yesterday at 11:59 PM
        </div>
      </div>
    </div>
  </div>
<%@include file="/templates/inc/footer.jsp" %> 