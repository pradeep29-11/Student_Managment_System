<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@ page import="java.util.*,com.tca.entities.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Student</title>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script >
    
            function openUpdatepopup(trno) 
            {
                var tr = document.getElementById(trno);
                var td = tr.getElementsByTagName("td"); // get all <td> in that row

                var srno = td[0].textContent;  
                var sname = td[1].textContent;
                var sper = td[2].textContent;

                //alert("Hi ---> " + srno + " --- " + sname + " -- " + sper);
                
                var modelrno = document.getElementById("modalRno");
                var modelper = document.getElementById("modalPer");
                var modelname = document.getElementById("modalName");
                
                modelrno.value = srno;
                modelname.value = sname;
                modelper.value = sper;

                
                new bootstrap.Modal(document.getElementById("updateModal")).show();
                
                
            }
            function modify()
            {
                var modelrno = document.getElementById("modalRno");
                var modelper = document.getElementById("modalPer");
                var modelname = document.getElementById("modalName");

                
                var updateSrno = modelrno.value;
                var updateSname = modelname.value;
                var updatePer = modelper.value;
            
            fetch("http://localhost:8081/StudentManagementApp/update",
                    {
                        method:'POST',
                        body : new URLSearchParams({"srno":updateSrno,"sname":updateSname,"sper":updatePer})
                    }
                        
            )
            .then(response=>response.text())
            .then(data=>
                {
                    if(data.trim()=='success')
                    {
                        //alert("Record is Updated Succesfully !!");
                        document.querySelector('#updateModal .btn-close').click();
                        
                        swal("Success", "Record is Updated Succesfully !!", "success")
                        .then((value) => {
                            location.reload();
                        });
                        
                    }
                    if(data.trim() == 'failed')
                    {
                        //alert("Faild to Update Record !!");   
                        swal("Failure !!", "Failure to Update Record !!", "error")
                    }
                }
            )
            .catch(err=>console.error("Error : ",err))
    
            }
    </script>
    
  </head>
<body>
<div class="container" style="margin-top:100px">
    <h2 class="text-center text-primary mt-5 mb-5">Update Student</h2>
    
<div class="container-fluid d-flex justify-content-end">

    <form class="d-flex" role="search"   method="Get" action="./update">
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
                            <button type="button" class="btn btn-primary" onclick="openUpdatepopup('<%=ob.getRno() %>')">Update</button>
                        </td>
                        
                    </tr>
                <% 
            }
            
        }
        
        %>
    </table>
</div> <!-- End of the container -->

<!-- Modal -->
<div class="modal" tabindex="-1" id="updateModal">
  <div class="modal-dialog">
    <div class="modal-content">
    
    <!-- header part -->
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title ">Update Student</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <!-- body part -->
      <div class="modal-body">
        
        <div>
            <label class="form-label"> Roll Number</label>
            <input type="text" class="form-control" id="modalRno" readonly>
        </div>
                
        <div>
                    <label class="form-label"> Name </label>
                <input type="text" class="form-control" id="modalName" >
        </div>
        
        <div>
                    <label class="form-label"> Percentage </label>
                <input type="text" class="form-control" id="modalPer" >
        </div>
        
      </div>
      
      
      <!-- footer part -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="modify()">Update changes</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>
