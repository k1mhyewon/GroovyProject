<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>    


<style>

	.hoverShadow {	transition: all 0.5s;	}
	
	.hoverShadow:hover {	box-shadow: 1px 1px 8px #ddd;	}
	
	.hoverShadowText {	transition: all 0.5s;	}
	
	.hoverShadowText:hover {	text-shadow: -1px -1px #ddd;	}
	
	/* 상단 박스 시작 */	
	#workBox {
		border: solid 1px #bfbfbf;
		width: 80%;
		height: 150px;
		margin: 0 auto;
		padding: 35px 140px;
		border-radius: 5px;
	}
	
	.timeBoxes {
		display: inline-block;
		width: 100px;
		margin-right: 20px;
	}
	
	.timeBoxes_1 {
		font-size: 11pt;
		text-align: center;
		margin-bottom: 15px;
	}
	
	.timeBoxes_2 {
		font-size: 18pt;
		text-align: center;
		color: #b3b3b3;
	}
	
	#calMonth {
		width: 100px;
		font-size: 16pt;		
		text-align: center;
		border: none;
	} 
	
	#calMonth:hover {	cursor: pointer;	}
	
	/* 상단 박스 끝 */
	
	/* 상세검색 시작 */
	#searchBox {
		width: 90%;
		margin: 0 auto;
		padding: 50px 0;
	}
	
	#searchSelect {
		width: 100px;
		height: 25px;
		border-radius: 5px;
		border: solid 1px #bfbfbf;
		
	}
		
	#searchText {	display: inline-block;	}
	
	.searchTxt {
		width: 130px;
		height: 25px;
		border-radius: 5px;
		border: solid 1px #bfbfbf;
	}
	
	
	.searchBtn {
		border: none;
		border-radius: 5px;
		height: 25px;
	}
	
	#searchCalBox {	display: inline-block;	}
	
	.searchCal {
		width: 100px;
		height: 25px;
		border-radius: 5px;
		border: solid 1px #bfbfbf;
		text-align: center;
	}
	
	/* 상세검색 끝 */
	
	#filter {
		font-size: 10pt; 
		float: right; 
		margin-right: 4%;
	}
	
	#filter:hover {	cursor: pointer;	}
	
	/* 하단 표 시작 */
	#workTable {	width: 97%;	}
	
	#workTable:hover {	cursor: pointer;	}
	
	.tbltexts {
		text-align: center;
		padding: 5px 0;
	}
	
	.today{	color: #086BDE;	} /* 표에서 오늘에 해당하는 날짜는 파란색으로 */
	
	.tblBtn { /* 비고 */
		color: #086BDE;
		background-color: #E3F2FD;
		width: 50px;
		height: 25px;
		border-radius: 5px;
		border: none;
		font-size: 10pt;
	}
	/* 하단 표 끝 */

	/* 모달 */
	#filterModal {		
		
	}
	.modals-fullsize {
    	width: 500px; 
		height: 320px; 
		padding: 5% 0 5% 5%;
    }
    
    .modal { 
 		top : 30%; 
 		z-index: 1050;
	}
	
	.labels {
		font-size: 10pt;
		font-weight: normal;
		position: relative;
		top: -1.5px;
		width: 100px;
	}
	
	.filterBtns {
		width: 80px;
		border: none;
		border-radius: 5px;
		font-size: 11pt;
		height: 30px;
	}
		

</style>

<script> 

	$(document).ready(function(){
		
		$("#searchText").hide();
		$("#searchCalBox").hide();
		
		$("#searchSelect").change(function(){
			const selectVal = $("#searchSelect option:selected").val();
			// console.log(selectVal);
			
			$("#searchText").hide();
			$("#searchCalBox").hide();
				
			if(selectVal == "name"){
				$("#searchText").show();
				$("#searchCalBox").hide();
			}
			else if(selectVal == "date"){
				$("#searchText").hide();
				$("#searchCalBox").show();
			}			
			
		}); // end of $("#searchSelect").change() --------------------
		
		$("#searchInput").keyup(function(){
			// console.log("ff");
		}); // end of $("#searchInput").keyup() ----------------------
		
		
		$("#prevMonth").click(function(){ // ------------------------------------
			
			let monthVal = $("#calMonth").val();
			monthVal = new Date(monthVal.substr(0,4), parseInt(monthVal.substr(5,2))-2);
			// console.log(monthVal);
			
			let newMonth;
			if( parseInt(monthVal.getMonth())+1 <10 ){
				newMonth = monthVal.getFullYear()+"-0"+(parseInt(monthVal.getMonth())+1);
			}
			else {
				newMonth = monthVal.getFullYear()+"-"+(parseInt(monthVal.getMonth())+1);
			}
			
			$("#calMonth").val(newMonth);
			
		}); // end of $("#prevMonth").click() -----------------------------------
		
		
		const now = new Date();		
		const year = now.getFullYear();
		const month = now.getMonth()+1;
		const thisMonth = year+"-"+month;
		$("#calMonth").val(thisMonth);
		
		$("#nextMonth").click(function(){ // ------------------------------------
			let monthVal = $("#calMonth").val();
			if(thisMonth != monthVal){			
				monthVal = new Date(monthVal.substr(0,4), parseInt(monthVal.substr(5,2)));
				// console.log(monthVal);
				
				let newMonth;
				if( parseInt(monthVal.getMonth())+1 <10 ){
					newMonth = monthVal.getFullYear()+"-0"+(parseInt(monthVal.getMonth())+1);
				}
				else {
					newMonth = monthVal.getFullYear()+"-"+(parseInt(monthVal.getMonth())+1);
				}
				
				$("#calMonth").val(newMonth);
			}
		}); // end of $("#nextMonth").click() ------------------------------------
		
		
	}); // end of $(document).ready() ===========================================================
	
	
	// 테이블에서 회원을 클릭하면 상세정보 팝업이 뜨게 하기
	function managePopup(userid){ // -------------------------
		
		const url = "<%=ctxPath%>/attend/team_manage_popup.on";
		const name = "managePopup";
		const option = "width=1250, height=650, top=100, left=150";
		window.open(url, name, option);
		
		
		
	} // end of function managePopup(){} ---------------

</script>

<div style="font-size: 18pt; margin: 40px 0 50px 30px;" >부서 근태관리</div>

<div style="font-size: 18pt; text-align: center; margin-bottom: 20px;">
	<span class="fas fa-angle-left" id="prevMonth" style="color: #bfbfbf; font-size: 14pt;"></span>
	<input id="calMonth" class="cals hoverShadowText" type="text" value="" onfocus="this.blur()"/>
	<span class="fas fa-angle-right" id="nextMonth" style="color: #bfbfbf; font-size: 14pt;"></span>
</div>

<div> <%-- 상단 박스 시작 --%>
	<div id="workBox">
		<div class="timeBoxes" style="">
			<div class="timeBoxes_1">출근 미체크</div>
			<div class="timeBoxes_2">-</div>
		</div>
		<div class="timeBoxes">
			<div class="timeBoxes_1">퇴근 미체크</div>
			<div class="timeBoxes_2">1</div>
		</div>
		<div class="timeBoxes" style="">
			<div class="timeBoxes_1">지각</div>
			<div class="timeBoxes_2">1</div>
		</div>
		<div class="timeBoxes">
			<div class="timeBoxes_1">결근</div>
			<div class="timeBoxes_2">1</div>
		</div>
		<div class="timeBoxes">
			<div class="timeBoxes_1">연차</div>
			<div class="timeBoxes_2">3</div>
		</div>
	</div>
</div> <%-- 상단 박스 끝 --%>

<div id="searchBox"> <%-- 상세검색 시작 --%>
	<form>
		<span style="font-size: 14pt; margin: 0 10px 10px 0; ">상세검색</span>
		<select name="searchDetail" id="searchSelect" class="hoverShadow">
			<option>전체</option>
			<option value="name">부서원</option>
			<option value="date">날짜</option>
		</select>	
	
		<div id="searchText">		
			<input id="searchInput" class="searchTxt hoverShadow" type="text" placeholder="">
			<button class="searchBtn hoverShadow" type="button"><i class="fas fa-search" style="color:gray;"></i></button>		
		</div>
				
		<div id="searchCalBox">		
			<input id="searchCalStart" class="searchCal" type="text" placeholder="2022-11-07">
			<button class="searchBtn hoverShadow" type="button"><i style="color:gray;" class="fas fa-calendar-alt "></i></button>		
			<span>~</span>
			<input id="searchCalEnd" class="searchCal" type="text" placeholder="">
			<button class="searchBtn hoverShadow" type="button"><i style="color:gray;" class="fas fa-calendar-alt"></i></button>		
		</div>
	</form>
</div> <%-- 상세검색 끝 --%>



<div style="margin: 5% 5%;"> <%-- 하단 테이블 시작 --%>
	<span style="font-size: 10pt; margin: 0 0 3px 5px; ">44개의 데이터가 있습니다.</span>
	<span id="filter" data-toggle="modal" data-target="#filterModal"><i class="fas fa-bars hoverShadowText"></i>&nbsp;목록 관리</span>
	<div style="clear: both;"></div>
	<table style="font-size: 10pt;" class="table-hover" id="workTable">
		<thead>
			<tr style="border-bottom: solid 1px #bfbfbf; border-top: solid 1px #bfbfbf;">
				<th style="width: 12%; padding-left: 30px;">부서원</th>
				<th class="tbltexts" style="width: 12%;">부서명</th>
				<th class="tbltexts" style="width: 16%;">날짜<i class="fas fa-sort-alt"></i></th>
				<th class="tbltexts" style="width: 12%;">출근</th>
				<th class="tbltexts" style="width: 12%;">퇴근</th>
				<th class="tbltexts" style="width: 10%;">지각</th>
				<th class="tbltexts" style="width: 10%">결근</th>
				<th class="tbltexts" style="width: 10%">연차</th>
				<th class="" style="width: 6%;"></th> <%-- 빈칸 --%>
			</tr>
		</thead>
		<tbody> 				
			<tr onclick="managePopup('userid')">
				<td style="padding-left: 30px;">김혜원</td>
				<td class="tbltexts" style="">경영지원</td>
				<td class="tbltexts" style="">2022-11-08(화)</td>
				<td class="tbltexts" style="">10:00</td>
				<td class="tbltexts" style="">15:00</td>
				<td class="tbltexts" style=""></td>		
				<td class="tbltexts" style=""></td>
				<td class="tbltexts" style=""></td>	
				<td class="tbltexts" style=""><input class="" type="text" value="userid" /></td> <%-- userid 전달 --%>		
			</tr>
			
			<tr>
				<td style="padding-left: 30px;">김원티드</td>
				<td class="tbltexts" style="">경영지원</td>
				<td class="tbltexts" style="">2022-11-08(화)</td>
				<td class="tbltexts" style="">미등록</td>
				<td class="tbltexts" style="">미등록</td>
				<td class="tbltexts" style=""></td>		
				<td class="tbltexts" style=""></td>
				<td class="tbltexts" style="">연차</td>	
				<td class="tbltexts" style=""></td> <%-- 빈칸 --%>		
			</tr>					
		</tbody>
	</table>
</div> <%-- 하단 테이블 끝 --%>



<div class="modal" id="filterModal">
	<div class="modal-dialog">
		<div class="modal-content modals-fullsize">
			<div>
				<div style="font-size: 14pt; margin-bottom: 15px;">목록 관리</div>
				<div>
					<input type="checkbox" id="noStartCheck" value="noStartCheck"><label for="noStartCheck" class="labels">출근 미체크</label>
					<span class="labels">출근(업무)체크가 이루어지지 않은 경우(연차 제외)</span><br>
					<input type="checkbox" id="noEndCheck" value="noEndCheck"><label for="noEndCheck" class="labels">퇴근 미체크</label>
					<span class="labels">퇴근(업무종료)체크가 이루어지지 않은 경우(연차 제외)</span><br>
					<input type="checkbox" id="late" value="late"><label for="late" class="labels">지각</label>
					<span class="labels">12시 이후에 출근체크를 한 경우</span><br>
					<input type="checkbox" id="absent" value="absent"><label for="absent" class="labels">결근</label>
					<span class="labels">연차 등록 없이 출,퇴근 미체크로 결근처리가 된 경우</span><br>
					<input type="checkbox" id="dayoff" value="dayoff"><label for="dayoff" class="labels">연차</label>
					<span class="labels">1일 연차 등 휴가를 사용한 경우</span><br>
					<input type="checkbox" id="extend" value="extend"><label for="extend" class="labels">연장근무</label>
					<span class="labels">기본 근무시간(36시간)을 초과하여 업무를 수행한 경우</span><br>
				</div>
				<div style="margin: 20px 120px 30px 120px;">
					<button id="filterSearchBtn" class="filterBtns hoverShadow" type="button" style="background-color: #E3F2FD;">검색</button>
					<button id="filterCancelBtn" class="filterBtns hoverShadow" type="button">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>


