<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"
         isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>ShopIeasy</title>
    <link rel="icon" type="image/x-icon" href="/resource/images/favicon1.png"/>
    <script src="/resource/js/jquery.js" type="text/javascript"></script>
</head>
<body onload="showError()">
<script>
 function showError() {
  const myModal = $('#myModal')
  if (myModal !== null) {
   myModal.modal('show')
  }
 }
</script>
<c:if test="${param.get('errorMessage') != null}">
 <div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
   <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
     <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
      <h4 class="modal-title">Error!!</h4>
     </div>
     <div class="modal-body">
      <p>${param.get('errorMessage')}</p>
      <p>Please contact 'admin@gmail.com'</p>
     </div>
     <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
     </div>
    </div>
   </div>
  </div>
 </div>
</c:if>
<%@ include file="navbar.jsp" %>
<%@ include file="slider.jsp" %>
<%@ include file="productGrid.jsp" %>
<%@ include file="footer.jsp" %>
<script>
 function f(){
  var x=document.getElementsByClassName("price");
  for(var i=0;i<x.length;i++){
   if(x[i].innerHTML.indexOf("E")>0){
    var y=x[i].innerHTML.split("E");
    var price=y[0]*10**y[1];
    x[i].innerHTML=price.toString()+" VND";
   }
  }
 }
 document.getElementsByTagName("body").item(0).onload=f;
</script>
</body>
</html>
