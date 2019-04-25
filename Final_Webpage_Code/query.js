"use strict";
(function(){

	window.onload = function(){

		document.getElementById("query1").onclick = query1Record;
		document.getElementById("query2").onclick = query2Record;
		document.getElementById("query3").onclick = query3Record;
	}

	function query1Record(){
		document.getElementById("changed").innerHTML = "You selected Query 1";
		
		var stuTab = document.getElementById("query1Table");
		stuTab.style.display = 'block';
	
	}

	function query2Record(){
		document.getElementById("changed").innerHTML = "You selected Query 2";
		
		var stuTab = document.getElementById("query2Table");
		stuTab.style.display = 'block';
	
	}

	function query3Record(){
		document.getElementById("changed").innerHTML = "You selected Query 3";
		
		var stuTab = document.getElementById("query3Table");
		stuTab.style.display = 'block';
	
	}


})();