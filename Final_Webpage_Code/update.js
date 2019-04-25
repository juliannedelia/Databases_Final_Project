"use strict";
(function(){

	window.onload = function(){

		document.getElementById("updated").onclick = updateRecord;
	}

	function updateRecord(){
		document.getElementById("changed").innerHTML = "Congrats! You updated the school table.";
		
		var stuTab = document.getElementById("student_table");
		stuTab.style.display = 'block';
		
		var x = document.getElementById("student_table").rows;
		var y = x[5].cells
		y[1].innerHTML = "science"
		y[2].innerHTML = "pennslyvania"


	
	}


})();