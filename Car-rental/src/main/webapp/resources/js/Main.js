// 이동
	document.querySelector('#login').addEventListener('click', e=>{
		location.href='service?command=loginForm';
	});
	document.querySelector('#rental').addEventListener('click', e=>{
		location.href='service?command=rentalForm';
	});
	document.querySelector('#community').addEventListener('click', e=>{
		location.href='service?command=communityForm';
	});
	document.querySelector('#main').addEventListener('click', e=>{
		location.href='service?command=main';
	});
	
	
	$(".rentalbtn").on("click", e=>{
		location.href='service?command=rentalForm';
	});
	
	
	$( function() {
	    $( "#menu" ).menu();
	} );
	
	// 지역선택
	document.querySelector('li.area1').addEventListener('click', e=>{
		console.log("e.target" + e.target.innerText);
		$("#areaChoise").val(e.target.innerText);
	});
	document.querySelector('li.area2').addEventListener('click', e=>{
		console.log("e.target" + e.target.innerText);
		$("#areaChoise").val(e.target.innerText);
	});
	document.querySelector('li.area3').addEventListener('click', e=>{
		console.log("e.target" + e.target.innerText);
		$("#areaChoise").val(e.target.innerText);
	});
	document.querySelector('li.area4').addEventListener('click', e=>{
		console.log("e.target" + e.target.innerText);
		$("#areaChoise").val(e.target.innerText);
	});
	document.querySelector('li.area5').addEventListener('click', e=>{
		console.log("e.target" + e.target.innerText);
		$("#areaChoise").val(e.target.innerText);
	});
	
	
	
	
	// 달력
	$(".allChoise").on("click", e=>{
		console.log("ddd");
		const date1 = $("input#period_1").val();
		const date2 = $("input#period_2").val();
		const time1 = $("input#time1").val();
		const time2 = $("input#time2").val();
		const detail = $("#reserveDetail").val();
		const area = $("#areaChoise").val();
		if(!date1 || !date2){
			alert("날짜를 다시 선택해주세요");
		}
		else{
			if(!time1 || !time2){
				alert("시간을 선택해주세요");
			}
			else{
				$("#reserveDetail").val(date1 + "(" +time1 + ")" +"/" + date2 + "(" + time2 + ") " + area);
				$("#date1").val(date1);
				$("#date2").val(date2);
				$("#time11").val(time1);
				$("#time22").val(time2);
				$("#area").val(area);
				console.log($("#reserveDetail").val());
			}
		}
	});

	
	
	var CDate = new Date(); 
	var today = new Date();
	var selectCk = 0;
	
	var buildcalendar = function(){
		var htmlDates = ''; 
		var prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0); //지난 달의 마지막 날 
		var thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1); //이번 달의 첫쨰 날
		var thisLast = new Date(CDate.getFullYear(), CDate.getMonth() + 1, 0); //이번 달의 마지막 날
		document.querySelector(".year").innerHTML = CDate.getFullYear() + "년";  // year에 년도 출력
		document.querySelector(".month").innerHTML = (CDate.getMonth() + 1) + "월";  //month에 월 출력
		const dates = []; 
		if(thisFirst.getDay()!=0){ 
			for(var i = 0; i < thisFirst.getDay(); i++){
				dates.unshift(prevLast.getDate()-i); // 지난 달 날짜 채우기
			} 
		} 
		for(var i = 1; i <= thisLast.getDate(); i++){
				 dates.push(i); // 이번 달 날짜 채우기 
		} 
		for(var i = 1; i <= 13 - thisLast.getDay(); i++){ 
				 dates.push(i); // 다음 달 날짜 채우기 (나머지 다 채운 다음 출력할 때 42개만 출력함)
		} 
		
		for(var i = 0; i < 42; i++){
			if(i < thisFirst.getDay()){
				htmlDates += '<div class="date last">'+dates[i]+'</div>'; 
			}else if(today.getDate()==dates[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){
				 htmlDates += '<div id="date_'+dates[i]+'" class="date today" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>'; 
			}else if(i >= thisFirst.getDay() + thisLast.getDate()){
				 htmlDates += '<div class="date next">'+dates[i]+'</div>'; 
			}else{
				htmlDates += '<div id="date_'+dates[i]+'" class="date" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>'; 
			}
		 } 
	document.querySelector(".dates").innerHTML = htmlDates; 
	} 
	
	function prevCal(){
		 CDate.setMonth(CDate.getMonth()-1); 
		 buildcalendar(); 
	} 
	function nextCal(){
		 CDate.setMonth(CDate.getMonth()+1);
		 buildcalendar(); 
	}
	
	function fn_selectDate(date){
		
		var year = CDate.getFullYear();
		var month = CDate.getMonth() + 1;
		var date_txt = "";
		if(CDate.getMonth + 1 < 10){
			month = "0" + (CDate.getMonth() + 1);
		}
		if(date < 10){
			date_txt = "0" + date;
		}
		
		if(selectCk == 0){
			$(".date").css("background-color", "");
			$(".date").css("color", "");
			$("#date_"+date).css("background-color", "red");
			$("#date_"+date).css("color", "white");
			
			$("#period_1").val(year+"-"+month+"-"+date);
			$("#period_2").val("");
			selectCk = date;
		}else{
			$("#date_"+date).css("background-color", "red");
			$("#date_"+date).css("color", "white");		
			for(var i = selectCk + 1 ; i < date ; i++){
				$("#date_"+i).css("background-color", "#FFDDDD");
			}
			
			$("#period_2").val(year+"-"+month+"-"+date);
			selectCk = 0;
		}
	}
	buildcalendar();
	
	$(function() {
	    $("#time1").timepicker({
	    	timeFormat: 'HH:mm ',
	        interval: 60,
	        minTime: '10',
	        maxTime: '11:00pm',
	        
	        startTime: '10:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true
	    });
	});
	$(function() {
	    $("#time2").timepicker({
	    	timeFormat: 'HH:mm ',
	        interval: 60,
	        minTime: '10',
	        maxTime: '11:00pm',
	        startTime: '10:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true
	    });
	});