<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.tca.entities.*" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Delete Student</title>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <script>
            function del(srno)
            {
                var status = confirm("Do you want to delete Student for Roll Number : "+srno);
                
                if( status == true)
                {
                    //call  a deleteServlet with rno as srno=101 with request method post
                    //collect status[success,faild] from servlet
                    
                    //success --> show delete message
                    //faild --> falure message 
                    
                    
                    fetch("http://localhost:8081/StudentManagementApp/delete",
                        {
                            method :'POST',
 
                            body   : new URLSearchParams({'trno':srno})
                        }   
                    )
                    .then(response => response.text())
                    .then(data => {
                                    if(data.trim() == "success")
                                    {
                                        swal("Success", "Record is Deleted Succesfully !!", "success");
                                        var tr = document.getElementById(srno);
                                        tr.remove();
                                    
                                    }
                                    else if (data.trim() == "failed")
                                    {
                                        swal("Failure !!", "Failure to Delete Record !!", "error")
                                    }
                                }
                    
                    
                    )
                    .catch(error => console.error("MyError while Deleting RollNumber="+srno));
                }
                else
                {
                    //alert("Delete Scikpped !!");
                    swal("Failure !!", "Record is Scikpped !!", "error")
                }
            }
    </script>
    
  </head>
<body>
<div class="container" style="margin-top:100px">
    <h2 class="text-center text-primary mt-5 mb-5">Delete Student</h2>
    
<div class="container-fluid d-flex justify-content-end"">

    <form class="d-flex" role="search"   method="Get" action="./delete">
        <input class = "form-control me-2 mb-4"type="text" name="srno">
        <input class = "btn btn-outline-success me-2 mb-4" type="submit" name ="sbtn" value="Search">
        <input class = "btn btn-outline-success me-2 mb-4" type="submit" name = "sbtn" value="Referesh">
    </form>
</div > 
    
    <table class="table table-hover table-bordered text-center">
        <tr class="table-primary">
            <th>RNO</th>
            <th>NAME</th>
            <th>PER</th>
            <th>ACTION</th>     
        </tr>
        <%
        List<Student> L = (List<Student>) request.getAttribute("students");
        
        if(L.isEmpty())
        {
            %>
                <tr>
                    <td class="text-danger bg-danger-subtle" colspan="4">No Data Found !!!</td>
                </tr>
            <%
        }
        else
        {
            for(Student ob : L)
            {
                %>
                    <tr id="<%=ob.getRno() %>">
                    
                        <td><%=ob.getRno() %></td>
                        <td><%=ob.getName() %></td>
                        <td><%=ob.getPer() %></td>
                        <td>
                            <button type="button" class="btn btn-danger" onclick="del(<%=ob.getRno() %>)">Delete</button>
                        </td>
                        
                    </tr>
                <% 
            }
            
        }
        
        %>
    </table>
</div> <!-- End of the container -->

</body>
</html>
