<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<%
	String ctxPath = request.getContextPath();
%> 


<style type="text/css">

.card:hover{
	top: -15px;
}

</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
	});// end of $(document).ready(function(){})-------------------
	
	function showChatroom() { window.open('<%=ctxPath%>/chat/chatroom.on','채팅방', height=400, width=300, left=100, top=50);}
	
</script>

<h2>채팅</h2>


<div class="row row-cols-1 row-cols-md-3 g-4">
  <div class="col mb-3">
    <div class="card" style="height: 250px; background-color: lavender;" onclick = "showChatroom()">
      <div style= "padding: 5px 10px;"> <i class="fas fa-users"></i> 5</div>
      <div class="card-body text-center" style="line-height:150px">
      
        	방이름
      </div>
    </div>
  </div>
  <div class="col mb-3">
    <div class="card" style="height: 250px; background-color: lavender;">
      <div style= "padding: 5px 10px;"> <i class="fas fa-users"></i> 5</div>
      <div class="card-body text-center" style="line-height:150px">
      
        	방이름
      </div>
    </div>
  </div>
  <div class="col mb-3">
    <div class="card" style="height: 250px; background-color: lavender;">
      <div style= "padding: 5px 10px;"> <i class="fas fa-users"></i> 5</div>
      <div class="card-body text-center" style="line-height:150px">
      
        	방이름
      </div>
    </div>
  </div>
  <div class="col mb-3">
    <div class="card" style="height: 250px; background-color: lavender;">
      <div style= "padding: 5px 10px;"> <i class="fas fa-users"></i> 5</div>
      <div class="card-body text-center" style="line-height:150px">
      
        	방이름
      </div>
    </div>
  </div>
  <div class="col mb-3">
    <div class="card" style="height: 250px; background-color: lavender;">
      <div style= "padding: 5px 10px;"> <i class="fas fa-users"></i> 5</div>
      <div class="card-body text-center" style="line-height:150px">
      
        	방이름
      </div>
    </div>
  </div>
  <div class="col mb-3">
    <div class="card" style="height: 250px; background-color: lavender;">
      <div style= "padding: 5px 10px;"> <i class="fas fa-users"></i> 5</div>
      <div class="card-body text-center" style="line-height:150px">
      
        	방이름
      </div>
    </div>
  </div>
  <div class="col mb-3">
    <div class="card" style="height: 250px; background-color: lavender;">
      <div style= "padding: 5px 10px;"> <i class="fas fa-users"></i> 5</div>
      <div class="card-body text-center" style="line-height:150px">
      
        	방이름
      </div>
    </div>
  </div>
  <div class="col mb-3">
    <div class="card" style="height: 250px; background-color: lavender;">
      <div style= "padding: 5px 10px;"> <i class="fas fa-users"></i> 5</div>
      <div class="card-body text-center" style="line-height:150px">
      
        	방이름
      </div>
    </div>
  </div>
</div>
