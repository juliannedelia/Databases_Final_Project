"use strict";
(function () {

	window.onload = function() {
		document.getElementById("stu_table").onclick = showStudent;
		document.getElementById("reg_table").onclick = showRegion;
		document.getElementById("sch_table").onclick = showSchool;
		
	}


	function showStudent(){
		document.getElementById("changed").innerHTML = "Student Table";
		document.getElementById("student_table").style.display = 'block';
	}

	function showRegion(){
		document.getElementById("changed").innerHTML = "Region Table";
		document.getElementById("region_table").style.display = 'block';
	}

	function showSchool(){
		document.getElementById("changed").innerHTML = "School Table";
		document.getElementById("school_table").style.display = 'block';
	}


	/*function checkStatus(response) {
		if (response.status >= 200 && response.status < 300 || response.status == 0) {
			return response.text();
		} 
		else { 
			return Promise.reject(new Error(response.status + ": " + response.statusText));
		}
	}*/

})();
























