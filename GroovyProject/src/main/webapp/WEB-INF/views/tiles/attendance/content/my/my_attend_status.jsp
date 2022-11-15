<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>    


<style>
	.hoverShadow {
		transition: all 0.5s;
	}
	
	.hoverShadow:hover {
		box-shadow: 1px 1px 8px #ddd;
	}
	
	.hoverShadowText {
		transition: all 0.5s;
	}
	
	.hoverShadowText:hover {
		text-shadow: -1px -1px #ddd;
	}
	
	#workBox {
		border: solid 1px #bfbfbf;
		width: 80%;
		height: 150px;
		margin: 0 auto;
		padding-left: 30px;
		padding-top: 20px;
		border-radius: 5px;
	}
	
	.timeBoxes {
		display: inline-block;
		/* border: solid 1px pink; */
		width: 150px;
		margin-right: 15px;
		margin-top: 15px;
		padding-right: 20px;
	}
	
	.timeBoxes_1 {
		font-size: 11pt;
		text-align: center;
		margin-bottom: 15px;
	}
	
	.timeBoxes_2 {
		color: #086BDE;
		font-size: 18pt;
		text-align: center;
	}
	
	#workModalBtn {
		color: white;
		background-color: #086BDE;
		height: 27px;
		font-size: 10pt;	
		margin: 2% 10% 1% 0;
		
		
	}
	
	/* 박스 끝 */
	/* 테이블 시작 */
	
	.widths {
		width: 90%; 
		margin: 0 auto;
		padding-top: 50px;
	}
	
	.weeks {
		margin: 20px 0 0 10px;
	}
	
	/* 모달 */
	.modals-fullsize {
    	width: 500px;
    	height: 300px;
    }
    
    .modal { 
 		top : 30%;
 		z-index: 1050;
	}
	

</style>   

<script>
	$(document).ready(function(){ // ==============================
	
		$("#table_week2").hide();
		$("#table_week3").hide();
		$("#table_week4").hide();
		$("#table_week5").hide();
		
	}); // end of $(document).ready() =============================
		
	function toggle(e){	
		const id = 'table_'+e;
		$('#'+id).slideToggle("fast");
	}

</script> 
    
<div style="font-size: 18pt; margin: 40px 0 50px 30px;" >근태 조회</div>

<div style="font-size: 18pt; text-align: center;">
	<i class="glyphicon glyphicon-menu-left" style="color: #bfbfbf; font-size: 14pt;"></i>
	2022.11
	<span class="glyphicon glyphicon-menu-right" style="color: #bfbfbf; font-size: 14pt;"></span>
</div>



<div style="display: flex; justify-content: space-between;">	
	<button class="btn btn-primary" id="workModalBtn" data-toggle="modal" data-target="#workModal" style="margin-left: auto;">근태 신청</button>
		
	<div id="workBox">
		<div class="timeBoxes" style="border-right: solid 1px #bfbfbf;">
			<div class="timeBoxes_1">이번주 누적</div>
			<div class="timeBoxes_2">9h 20m 52s</div>
		</div>
		<div class="timeBoxes">
			<div class="timeBoxes_1">이번주 초과</div>
			<div class="timeBoxes_2">9h 20m 52s</div>
		</div>
		<div class="timeBoxes" style="border-right: solid 1px #bfbfbf;">
			<div class="timeBoxes_1">이번주 잔여</div>
			<div class="timeBoxes_2">9h 20m 52s</div>
		</div>
		<div class="timeBoxes">
			<div class="timeBoxes_1">이번달 누적</div>
			<div class="timeBoxes_2" style="color: #b3b3b3;">9h 20m 52s</div>
		</div>
		<div class="timeBoxes">
			<div class="timeBoxes_1">이번달 연장</div>
			<div class="timeBoxes_2" style="color: #b3b3b3;">9h 20m 52s</div>
		</div>
	</div>
</div>


<div id="week1" class="widths">
	<div onclick="toggle('week1')" class="weeks">
		<span class="glyphicon glyphicon-menu-down" style="font-size: 11pt;"></span>
		&nbsp;1 주차
	</div>
	<hr>
	<div id="table_week1">
		<table style="width: 100%;">
			<thead>
				<tr style="height: 30px; border-bottom: solid 1px #f2f2f2;">
					<th style="width:13%; padding: 0 0 10px 30px;">일자</th>
					<th style="width:13%; padding-bottom: 10px;">업무시작</th>
					<th style="width:13%; padding-bottom: 10px;">업무종료</th>
					<th style="width:13%; padding-bottom: 10px;">총근무시간</th>
					<th style="padding-bottom: 10px;">근무시간 상세</th>
					<th style="width:20%; padding-bottom: 10px;">승인요청내역</th>
				</tr>
			</thead>
			<tbody> 				
				<tr style="height: 30px; padding-top: 10px;">
					<td style="text-align: left; padding-left: 30px;">07 월</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">5h 0m 0s</td>
					<td style="text-align: left;">기본 5h 0m 0s/ 연장 5h 0m 0s/야간 5h 0m 0s</td>
					<td style="text-align: left;"></td>						
				</tr>
								
				<tr style="height: 30px; padding-top: 10px;">
					<td style="text-align: left; padding-left: 30px;">08 화</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">5h 0m 0s</td>
					<td style="text-align: left;">기본 5h 0m 0s/ 연장 5h 0m 0s/야간 5h 0m 0s</td>
					<td style="text-align: left;"></td>						
				</tr>
				
				<tr style="height: 30px; padding-top: 10px;">
					<td style="text-align: left; padding-left: 30px;">09 수</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">5h 0m 0s</td>
					<td style="text-align: left;">기본 5h 0m 0s/ 연장 5h 0m 0s/야간 5h 0m 0s</td>
					<td style="text-align: left;"></td>						
				</tr>
				
				<tr style="height: 30px; padding-top: 10px;">
					<td style="text-align: left; padding-left: 30px;">10 목</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">5h 0m 0s</td>
					<td style="text-align: left;">기본 5h 0m 0s/ 연장 5h 0m 0s/야간 5h 0m 0s</td>
					<td style="text-align: left;"></td>						
				</tr>
				
				<tr style="height: 30px; padding-top: 10px;">
					<td style="text-align: left; padding-left: 30px;">11 금</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">5h 0m 0s</td>
					<td style="text-align: left;">기본 5h 0m 0s/ 연장 5h 0m 0s/야간 5h 0m 0s</td>
					<td style="text-align: left;"></td>						
				</tr>	
				
								
			</tbody>
		</table>
	</div>


</div>

<div id="week2" class="widths">
	<div onclick="toggle('week2')" class="weeks">
		<span class="glyphicon glyphicon-menu-down" style="font-size: 11pt;"></span>
		&nbsp;2 주차
	</div>
	<hr>
	<div id="table_week2">
		<table style="width: 100%;">
			<thead>
				<tr style="height: 30px; border-bottom: solid 1px #f2f2f2;">
					<th style="width:13%; padding: 0 0 10px 30px;">일자</th>
					<th style="width:13%; padding-bottom: 10px;">업무시작</th>
					<th style="width:13%; padding-bottom: 10px;">업무종료</th>
					<th style="width:13%; padding-bottom: 10px;">총근무시간</th>
					<th style="padding-bottom: 10px;">근무시간 상세</th>
					<th style="width:20%; padding-bottom: 10px;">승인요청내역</th>
				</tr>
			</thead>
			<tbody> 				
				<tr style="height: 30px; padding-top: 10px;">
					<td style="text-align: left; padding-left: 30px;">07 월</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">5h 0m 0s</td>
					<td style="text-align: left;">기본 5h 0m 0s/ 연장 5h 0m 0s/야간 5h 0m 0s</td>
					<td style="text-align: left;"></td>						
				</tr>	
								
			</tbody>
		</table>
	</div>

</div>

<div id="week3" class="widths">
	<div onclick="toggle('week3')" class="weeks">
		<span class="glyphicon glyphicon-menu-down" style="font-size: 11pt;"></span>
		&nbsp;3 주차
	</div>
	<hr>
	<div id="table_week3">
		<table style="width: 100%;">
			<thead>
				<tr style="height: 30px; border-bottom: solid 1px #f2f2f2;">
					<th style="width:13%; padding: 0 0 10px 30px;">일자</th>
					<th style="width:13%; padding-bottom: 10px;">업무시작</th>
					<th style="width:13%; padding-bottom: 10px;">업무종료</th>
					<th style="width:13%; padding-bottom: 10px;">총근무시간</th>
					<th style="padding-bottom: 10px;">근무시간 상세</th>
					<th style="width:20%; padding-bottom: 10px;">승인요청내역</th>
				</tr>
			</thead>
			<tbody> 				
				<tr style="height: 30px; padding-top: 10px;">
					<td style="text-align: left; padding-left: 30px;">07 월</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">5h 0m 0s</td>
					<td style="text-align: left;">기본 5h 0m 0s/ 연장 5h 0m 0s/야간 5h 0m 0s</td>
					<td style="text-align: left;"></td>						
				</tr>	
								
			</tbody>
		</table>
	</div>

</div>

<div id="week4" class="widths">
	<div onclick="toggle('week4')" class="weeks" >
		<span class="glyphicon glyphicon-menu-down" style="font-size: 11pt;"></span>
		&nbsp;4 주차
	</div>
	<hr>
	<div>
		<table style="width: 100%;" id="table_week4">
			<thead>
				<tr style="height: 30px; border-bottom: solid 1px #f2f2f2;">
					<th style="width:13%; padding: 0 0 10px 30px;">일자</th>
					<th style="width:13%; padding-bottom: 10px;">업무시작</th>
					<th style="width:13%; padding-bottom: 10px;">업무종료</th>
					<th style="width:13%; padding-bottom: 10px;">총근무시간</th>
					<th style="padding-bottom: 10px;">근무시간 상세</th>
					<th style="width:20%; padding-bottom: 10px;">승인요청내역</th>
				</tr>
			</thead>
			<tbody> 				
				<tr style="height: 30px; padding-top: 10px;">
					<td style="text-align: left; padding-left: 30px;">07 월</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">5h 0m 0s</td>
					<td style="text-align: left;">기본 5h 0m 0s/ 연장 5h 0m 0s/야간 5h 0m 0s</td>
					<td style="text-align: left;"></td>						
				</tr>	
								
			</tbody>
		</table>
	</div>

</div>

<div id="week5" class="widths">
	<div onclick="toggle('week5')" class="weeks" >
		<span class="glyphicon glyphicon-menu-down" style="font-size: 11pt;"></span>
		&nbsp;5 주차
	</div>
	<hr>
	<div>
		<table style="width: 100%;" id="table_week5">
			<thead>
				<tr style="height: 30px;">
					<th style="width:13%; padding: 0 0 10px 30px;">일자</th>
					<th style="width:13%; padding-bottom: 10px;">업무시작</th>
					<th style="width:13%; padding-bottom: 10px;">업무종료</th>
					<th style="width:13%; padding-bottom: 10px;">총근무시간</th>
					<th style="text-align:center; padding-bottom: 10px;">근무시간 상세</th>
					<th style="width:20%; padding-bottom: 10px;">승인요청내역</th>
				</tr>
			</thead>
			<tbody> 				
				<tr style="height: 30px; padding-top: 10px;">
					<td style="text-align: left; padding-left: 30px;">07 월</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">12:00:00</td>
					<td style="text-align: left;">5h 0m 0s</td>
					<td style="text-align: left;">기본 5h 0m 0s/ 연장 5h 0m 0s/야간 5h 0m 0s</td>
					<td style="text-align: left;"></td>						
				</tr>	
								
			</tbody>
		</table>
	</div>

</div>



<div class="modal" id="workModal">
	<div class="modal-dialog">
		<div class="modal-content modals-fullsize">
			<div class='modal-body'>모달 안보임</div>
		</div>
	</div>
</div>

