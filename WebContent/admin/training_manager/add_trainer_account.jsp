
<%@page import="model.bean.Skills"%>
<%@page import="model.bo.SkillBo"%>
<%@page import="model.bean.Roles"%>
<%@page import="java.util.List"%>
<%@page import="model.bo.RoleBo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp"%>

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
			<div class="card-header alert alert-primary" style="font-size: larger;margin-bottom: 0px;"> 
             <i class="fa fa-fw fa-user" ></i>
			    <strong>&nbsp;Add trainer's account </strong>
			  </div>
			  
			<div>
			  	<%
				if(request.getAttribute("error") != null){
				%>
				<div class="alert alert-danger">
				  <strong>Error!</strong><%= request.getAttribute("error")%>
				</div>
				<%
				}
			  	%>
			  </div>
			<form id="add-trainer-post" action="<%= request.getContextPath() %>/trainer/add" method="POST"  enctype="multipart/form-data">
				<div style="height: 2%"></div>

				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<div>
								<div class="form-group" class="col-sm-2" style="float: left">
								<img id="blah"
									src="<%=request.getContextPath()%>/files/default.jpg"/>
							</div>
							<br><br><br>
								<div class="form-group" class="col-sm-4" style="float: left">
									<label class="required"><strong>Avatar:</strong> <span
										style="color: red"> *</span><em style="color: red">(jpg,
											png, gif)</em> </label> <input class="form-control" id="image" type="file"
										name="avatar" onchange="readURL(this);" />
								</div>
								<script type="text/javascript">
									function readURL(input) {
										if (input.files && input.files[0]) {
											var reader = new FileReader();

											reader.onload = function(e) {
												$('#blah').attr('src',
														e.target.result).width(
														300);
											};
											reader.readAsDataURL(input.files[0]);
										}
									}
								</script>

								<div style="clear: both"></div>
							</div>
				
							<div class="form-group">
								<label class="required"><strong>Email:</strong><span
									style="color: red"> *</span> &nbsp;<span id="spnEmailStatus"></span></label>
								<input class="form-control" id="txtemail" type="text"
									name="email" placeholder="Email" />
							</div>
							<div class="form-group">
								<label class="required"><strong>Username:</strong><span
									style="color: red"> *</span>&nbsp;<span id="spnUserNameStatus"></span></label>
								<input class="form-control" id="txtusername" type="text"
									name="username" placeholder="Username" />
							</div>

							<div class="form-group">
								<label class="required"><strong>Password&nbsp;:</strong>:
								<span style="color: red"> *</span>&nbsp;
								<span id="spnPassStatus"></span></label> 
								<input class="form-control" id="txtpassword" type="password" name="password" placeholder="Password" />
							</div>
							<div class="form-group">
								<label class="required"><strong>Confirm password&nbsp;:</strong>:
								<span style="color: red"> *</span>&nbsp;
								<span id="spnPassStatus"></span></label> 
								<input class="form-control"
									id="confirmpass" type="password" name="confirmpass"
									placeholder="Confirm Password" /><span id='message'></span>
							</div>

						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label class="required"><strong>Full Name:</strong><span
									style="color: red"> *</span>&nbsp;<span id="spnFullNameStatus"></span></label>
								<input class="form-control" id="txtfullname" type="text"
									name="fullname" placeholder="Fullname" />
							</div>

							<div class="form-group">
								<label class="required"><strong>Gender:</strong><span
									style="color: red"> *</span></label> <br> <input type="radio"
									name="gender" value="1"> Male <input type="radio"
									name="gender" value="2">Female <input type="radio"
									name="gender" value="0">Other
							</div>
							<div class="form-group">
								<label class="required"><strong>Address</strong><span
									style="color: red"> *</span>&nbsp;<span id="spnAddressStatus"></span></label>
								<input class="form-control" id="txtaddress" type="text"
									name="address" value="" placeholder="Address" />
							</div>

							<div class="form-group">
								<label class="required"><strong>Phone Number:</strong><span
									style="color: red"> *</span> &nbsp;<span id="spnPhoneStatus"></label>
								<input class="form-control" id="txtphone" type="text"
									name="phone" placeholder="Phone" />
							</div>

							<div class="form-group">
								<label class="required"><strong>Day of Birth:</strong><span
									style="color: red"> *</span></label> <input class="form-control"
									id="txtname" type="date" name="dateOfBirth"
									placeholder="Birthday" />
							</div>


							<div class="form-group">
								<label class="required"><strong>Ability:</strong><span
									style="color: red"> *</span></label><br> 
									<select
									class="form-inline" name="skillId">
									<%
							SkillBo skillBo= new SkillBo();
							List<Skills> skills= skillBo.getSkills();
							for(Skills skill: skills){
							%>
									<option value="<%=skill.getSkillId()%>"><%=skill.getName()%></option>
									<%}%>
								</select> <input class="form-group" id="txtname" type="number"
									name="experience" placeholder="Experience Year" min="0"
									max="50" />
							</div>
							<div class="error"></div>
							<br> <br>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5"></div>
						<input class="btn btn-primary btn-lg" type="submit" name="submit"
							id="btnSubmit" value="Add" style="margin-right: 0.5em;" /> <input
							class="btn btn-secondary btn-lg" type="reset" value="Reset" />
					</div>
					<div style="margin-bottom: 10%"></div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result).width(300);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
	$(document).ready(function() {
		$("#add-trainer-post").validate({
			rules : {
				email : {
					required : true,
					email : true
				},
				username : "required",
				password : {
					required : true,
					minlength : 6,
				},
				confirmpass : {
					required : true,
					minlength : 6,
					equalTo : "#password"
				},
				fullname : "required",
				address : "required",
				dateOfBirth : "required",
			},
			messages : {
				username : "Username is required!",
				password : {
					required : "Password is required!",
					minlength : "Password must be at least 6 characters!",
				},
				confirmpass : {
					required : "Password is required!",
					minlength : "Password must be at least 6 characters!",
					equalTo : "Password does not matching!"
				},
				fullname : "Fullname is required!",
				address : "Address is required!",
				dateOfBirth : "Day of Birth is required!",
			}
		});
	});

	$(document).ready(function() {
		$('#txtphone').blur(function(e) {
			if (checkPhoneNumber()) {
				$('#spnPhoneStatus').html('');
				$('#spnPhoneStatus').css('color', 'green');
				document.getElementById("btnSubmit").disabled = false;
			} else {
				$('#spnPhoneStatus').html('Phone number must be 10 digits.');
				$('#spnPhoneStatus').css('color', 'red');
				document.getElementById("btnSubmit").disabled = true;
			}
		});
	});

	function checkPhoneNumber() {
		var flag = false;
		var phone = $('#txtphone').val().trim(); // ID của trường Số điện thoại
		if (phone != '') {
			var firstNumber = phone.substring(0, 2);
			if ((firstNumber == '09' || firstNumber == '08')
					&& phone.length == 10) {
				if (phone.match(/^\d{10}/)) {
					flag = true;
				}
			} else if (firstNumber == '01' && phone.length == 11) {
				if (phone.match(/^\d{11}/)) {
					flag = true;
				}
			}
		}
		return flag;
	}
	$(document).ready(function(e) {
		$('#txtemail').blur(function() {
			var sEmail = $('#txtemail').val();
			if ($.trim(sEmail).length == 0) {
				$('#spnEmailStatus').html('Please enter valid email address!');
				$('#spnEmailStatus').css('color', 'red');
				document.getElementById("btnSubmit").disabled = true;
			}
			if (validateEmail(sEmail)) {
				$('#spnEmailStatus').html('');
				$('#spnEmailStatus').css('color', 'green');
				document.getElementById("btnSubmit").disabled = false;
			} else {
				$('#spnEmailStatus').html('Please enter valid email address!');
				$('#spnEmailStatus').css('color', 'red');
				document.getElementById("btnSubmit").disabled = true;
			}
		});
	});

	function validateEmail(sEmail) {
		var filter = /^([A-Za-z]+.[A-Za-z0-9]*)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (filter.test(sEmail)) {
			return true;
		} else {
			return false;
		}
	}

	$(document).ready(function() {
		$('#txtusername').blur(function(e) {
			var userName = $('#txtusername').val();
			if (validateStrings(userName)) {
				$('#spnUserNameStatus').html('');
				$('#spnUserNameStatus').css('color', 'green');
				document.getElementById("btnSubmit").disabled = false;
			} else {
				$('#spnUserNameStatus').html('Username is invalid!');
				$('#spnUserNameStatus').css('color', 'red');
				document.getElementById("btnSubmit").disabled = true;
			}
		});
	});

	$(document).ready(function() {
		$('#txtfullname').blur(function(e) {
			var fullName = $('#txtfullname').val();
			if (validateStrings(fullName)) {
				$('#spnFullNameStatus').html('');
				$('#spnFullNameStatus').css('color', 'green');
				document.getElementById("btnSubmit").disabled = false;
			} else {
				$('#spnFullNameStatus').html('Fullname is invalid!');
				$('#spnFullNameStatus').css('color', 'red');
				document.getElementById("btnSubmit").disabled = true;
			}
		});
	});

	$(document).ready(function() {
		$('#txtaddress').blur(function(e) {
			var addr = $('#txtaddress').val();
			if (validateAddress(addr)) {
				$('#spnAddressStatus').html('');
				$('#spnAddressStatus').css('color', 'green');
				document.getElementById("btnSubmit").disabled = false;
			} else {
				$('#spnAddressStatus').html('Address is invalid!');
				$('#spnAddressStatus').css('color', 'red');
				document.getElementById("btnSubmit").disabled = true;
			}
		});
	});

	$(document)
			.ready(
					function() {
						$('#txtpassword')
								.blur(
										function(e) {
											var pass = $('#txtpassword').val();
											if (validatePassword(pass)) {
												$('#spnPassStatus').html('');
												$('#spnPassStatus').css(
														'color', 'green');
												document
														.getElementById("btnSubmit").disabled = false;
											} else {
												$('#spnPassStatus')
														.html(
																'Password have minimum eight characters, at least one letter, one number and one special character!');
												$('#spnPassStatus').css(
														'color', 'red');
												document
														.getElementById("btnSubmit").disabled = true;
											}
										});
					});

	function validateStrings(string) {
		//var pattern = /^[^`~<>@#%&\*\$\{\}\[\]\(\)\+\=?\|\;_!0-9]+$/;
		var pattern = /^[a-zA-Z]+$/;
		return $.trim(string).match(pattern) ? true : false;
	}

	function validateFullName(string) {
		var pattern = /^[^`~<>@#%&\*\$\{\}\[\]\(\)\+\=?\|\;_!0-9]+$/;
		//var pattern = /^[a-zA-Z]+$/;
		return $.trim(string).match(pattern) ? true : false;
	}

	function validatePassword(password) {
		var pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		return $.trim(password).match(pattern) ? true : false;
	}

	function validateAddress(string) {
		var pattern = /^[^`~<>@#%&\*\$\{\}\[\]\(\)\+\=?\|\;_!]+$/;
		return $.trim(string).match(pattern) ? true : false;
	}
</script>

</body>
</html>
<%@include file="/templates/inc/footer.jsp"%>