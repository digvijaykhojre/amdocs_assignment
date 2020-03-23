<!DOCTYPE html>
<html>
<head>
<title>API Test</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	function getUser() {

		clearFields();
		if (document.getElementById("userId").value == null
				|| document.getElementById("userId").value == "") {
			alert("Invalid User Id");
			return;
		}

		var xhr = new XMLHttpRequest();
		var url = "/getUser?userId=" + $("#userId").val();
		xhr.open("GET", url, true);
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var json = JSON.parse(xhr.responseText);
				console.log(json.password);
				setResponse(json);

			} else if (xhr.readyState === 4 && xhr.status === 403) {
				alert("Unauthorized Access")
			}
		};
		xhr.send();

	}

	function saveUser() {

		clearFields();
		if (document.getElementById("userId").value == null
				|| document.getElementById("userId").value == "") {
			alert("Invalid User Id");
			return;
		}
		if (document.getElementById("userName").value == null
				|| document.getElementById("userName").value == "") {
			alert("Invalid User Name");
			return;
		}
		if (document.getElementById("password").value == null
				|| document.getElementById("password").value == "") {
			alert("Invalid password");
			return;
		}
		var xhr = new XMLHttpRequest();
		var url = "/saveUser";
		xhr.open("POST", url, true);
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var json = JSON.parse(xhr.responseText);
				setResponse(json);
			} else if (xhr.readyState === 4 && xhr.status === 403) {
				alert("Unauthorized Access")
			}
		};
		var data = JSON.stringify({
			"userId" : $("#userId").val(),
			"userName" : $("#userName").val(),
			"password" : $("#password").val(),
			"status" : $("#status").val(),
			"errorCode" : "",
			"errorDesc" : ""
		});
		xhr.send(data);

	}

	function updateUser() {

		clearFields();
		var xhr = new XMLHttpRequest();
		var url = "/updateUser";
		xhr.open("PUT", url, true);
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var json = JSON.parse(xhr.responseText);
				setResponse(json);
			} else if (xhr.readyState === 4 && xhr.status === 403) {
				alert("Unauthorized Access")
			}
		};
		var data = JSON.stringify({
			"userId" : $("#userId").val(),
			"userName" : $("#userName").val(),
			"password" : $("#password").val(),
			"status" : $("#status").val(),
			"errorCode" : "",
			"errorDesc" : ""
		});
		xhr.send(data);

	}


	function deleteUser() {

		clearFields();
		if (document.getElementById("userId").value == null
				|| document.getElementById("userId").value == "") {
			alert("Invalid User Id");
			return;
		}
		var xhr = new XMLHttpRequest();
		var url = "/deleteUser";
		xhr.open("DELETE", url, true);
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var json = JSON.parse(xhr.responseText);
				setResponse(json);
			} else if (xhr.readyState === 4 && xhr.status === 403) {
				alert("Unauthorized Access")
			}
		};
		var data = JSON.stringify({
			"userId" : $("#userId").val(),
			"userName" : $("#userName").val(),
			"password" : $("#password").val(),
			"status" : $("#status").val(),
			"errorCode" : "",
			"errorDesc" : ""
		});
		xhr.send(data);

	}
	function clearFields() {

		document.getElementById("sUserId").innerHTML = "";
		document.getElementById("sUserName").innerHTML = "";
		document.getElementById("sUserPassword").innerHTML = "";
		document.getElementById("sStatus").innerHTML = "";
		document.getElementById("sErrCode").innerHTML = "";
		document.getElementById("sErrDesc").innerHTML = "";

	}
	function setResponse(json) {
		document.getElementById("sUserId").innerHTML = json.userId;
		document.getElementById("sUserName").innerHTML = json.userName;
		document.getElementById("sUserPassword").innerHTML = json.password;
		document.getElementById("sStatus").innerHTML = json.status;
		document.getElementById("sErrCode").innerHTML = json.errorCode;
		document.getElementById("sErrDesc").innerHTML = json.errorDesc;

	}
</script>
</head>
<body>
	<form>
		<table>
			<tr>
				<td>User Id:</td>

				<td><input type=number id=userId name=userId required /></td>
			</tr>
			<tr>
				<td>User Name:</td>

				<td><input type=text id=userName name=userNameuserName /></td>
			</tr>

			<tr>
				<td>Password:</td>

				<td><input type=password id=password name=password /></td>
			</tr>

			<tr>
				<td>Status Id:</td>

				<td><select id=status name=status>
						<option value="Active" selected>Active</option>
						<option value="In-Active">In-Active</option>
				</select></td>
			</tr>
			<tr>
		</table>
	</form>
	<table>
		<tr>
			<td><button name="getUser" id="getUser" onclick="getUser()">Get
					User</button></td>
			<td><button name="saveUser" id="saveUser" onclick="saveUser()">Save
					User</button></td>
			<td><button name="updateUser" id="updateUser"
					onclick="updateUser()">Update User</button></td>
			<td><button name="deleteUser" id="deleteUser"
					onclick="deleteUser()">Delete User</button></td>
		</tr>
	</table>

	<h1>Response:</h1>
	<br>

	<table>
		<tr>
			<td>User Id:<span id="sUserId"></span></td>
		</tr>
		<tr>
			<td>User Name:<span id="sUserName"></span></td>
		</tr>
		<tr>
			<td>User Password:<span id="sUserPassword"></span></td>
		</tr>
		<tr>
			<td>User Status:<span id="sStatus"></span></td>
		</tr>
		<tr>
			<td>Error Code:<span id="sErrCode"></span></td>
		</tr>
		<tr>
			<td>Error Description:<span id="sErrDesc"></span></td>
		</tr>
	</table>





</body>
</html>