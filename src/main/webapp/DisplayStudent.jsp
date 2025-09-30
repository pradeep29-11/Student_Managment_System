<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.tca.entities.*" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Display Student</title>
    
  </head>
<body>

<div class="container" style="margin-top:100px">

<h2 class="text-center text-primary mt-5 mb-5">Display Student</h2>

<div  class="container-fluid d-flex justify-content-end">

    <form class="d-flex" role="search"   method="Get" action="display" >

        <input class="form-control me-2 mb-4"  type="search" name="srno" placeholder="Search Here">
        <input class="btn btn-outline-success me-2 mb-4" type="submit" name="sbtn" value="Search">
        <input class="btn btn-outline-success me-2 mb-4" type="submit" name="sbtn" value="Refersh">
    </form>
</div> 
<table class="table table-hover table-bordered text-center ">
    <tr class="table-primary">
        <th >RNO</th>
        <th>NAME</th>
        <th>PER</th>
    </tr>
    <%
    List<Student> L = (List<Student>) request.getAttribute("students");

    if (L == null || L.isEmpty()) 
    {
%>
    <tr>
        <td class="text-danger bg-danger-subtle" colspan="3">No Data Found !!!</td>
    </tr>
<%
    } 
    else 
    {
            for (Student ob : L) {
%>
        <tr>
            <td><%= ob.getRno() %></td>
            <td><%= ob.getName() %></td>
            <td><%= ob.getPer() %></td>
        </tr>
<%
    }
}
%>
</table>
</div> <!-- End of container -->

</body>
</html>
