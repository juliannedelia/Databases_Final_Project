"use strict";
(function(){

	window.onload = function(){

		document.getElementById("added").onclick = insertNewRecord;
	}

	function insertNewRecord(){
		document.getElementById("changed").innerHTML = "Congrats! You added a record to the student table!";
		var studTab = document.getElementById("student_table");
		studTab.style.display = 'block';
		var row = studTab.insertRow(10);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		var cell6 = row.insertCell(5);
		var cell7 = row.insertCell(6);

		cell1.innerHTML = "8928";
		cell2.innerHTML = "science";
		cell3.innerHTML = "pennslyvania";
		cell4.innerHTML = "92000";
		cell5.innerHTML = "private";
		cell6.innerHTML = "ED2";
		cell7.innerHTML = "asian";
	}


})();