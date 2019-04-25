"use strict";
(function(){

	window.onload = function(){

		document.getElementById("deleted").onclick = deleteNewRecord;
	}

	function deleteNewRecord(){
		document.getElementById("changed").innerHTML = "Congrats! You deleted 'iowa' from the region table.";
		var regTab = document.getElementById("region_table");
		regTab.style.display = 'block';
		document.getElementById("region_table").deleteRow(12);
	
	}


})();