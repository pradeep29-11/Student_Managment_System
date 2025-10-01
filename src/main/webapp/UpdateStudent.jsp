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
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        
        .container {
            flex: 1;
        }
        
        .footer {
            margin-top: auto;
            background: linear-gradient(135deg, #000000, #1a1a1a, #2d2d2d) !important;
        }

        .table-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-top: 30px;
            margin-bottom: 40px;
            border: 1px solid #dee2e6;
        }
        .search-box {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 10px;
            margin-bottom: 2rem;
        }
        
        /* Pagination Styles */
        .pagination-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 10px;
        }

        .pagination-info {
            margin: 0 20px;
            font-weight: 500;
            color: #495057;
        }

        .pagination .page-item.active .page-link {
            background-color: #007bff;
            border-color: #007bff;
        }

        .pagination .page-link {
            color: #007bff;
            border: 1px solid #dee2e6;
            margin: 0 2px;
            border-radius: 5px;
        }

        .pagination .page-link:hover {
            background-color: #e9ecef;
            border-color: #dee2e6;
        }
        
        .records-info {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
    
    <script>
        function openUpdatePopup(trno) {
            var tr = document.getElementById(trno);
            var td = tr.getElementsByTagName("td");

            var srno = td[0].textContent;  
            var sname = td[1].textContent;
            var sper = td[2].textContent;

            // Remove % if present in percentage
            sper = sper.replace('%', '').trim();

            var modelrno = document.getElementById("modalRno");
            var modelper = document.getElementById("modalPer");
            var modelname = document.getElementById("modalName");
            
            modelrno.value = srno;
            modelname.value = sname;
            modelper.value = sper;

            // Reset validation styles
            modelname.classList.remove('is-invalid');
            modelper.classList.remove('is-invalid');
            
            new bootstrap.Modal(document.getElementById("updateModal")).show();
        }
        
        function validateForm() {
            var name = document.getElementById("modalName").value.trim();
            var per = document.getElementById("modalPer").value.trim();
            var isValid = true;
            
            // Name validation
            if(name === "" || name.length < 2) {
                document.getElementById("modalName").classList.add('is-invalid');
                isValid = false;
            } else {
                document.getElementById("modalName").classList.remove('is-invalid');
            }
            
            // Percentage validation
            var percentage = parseFloat(per);
            if(isNaN(percentage) || percentage < 0 || percentage > 100) {
                document.getElementById("modalPer").classList.add('is-invalid');
                isValid = false;
            } else {
                document.getElementById("modalPer").classList.remove('is-invalid');
            }
            
            return isValid;
        }
        
        function modify() {
            if(!validateForm()) {
                swal("Validation Error", "Please check the form fields and try again.", "warning");
                return;
            }
            
            var modelrno = document.getElementById("modalRno");
            var modelper = document.getElementById("modalPer");
            var modelname = document.getElementById("modalName");

            var updateSrno = modelrno.value;
            var updateSname = modelname.value.trim();
            var updatePer = modelper.value;
            
            // Show loading state
            swal({
                title: "Updating...",
                text: "Please wait while we update the record",
                button: false,
                closeOnClickOutside: false,
                closeOnEsc: false
            });
            
            fetch("http://localhost:8081/StudentManagementApp/update", {
                method: 'POST',
                body: new URLSearchParams({
                    "srno": updateSrno,
                    "sname": updateSname,
                    "sper": updatePer
                })
            })
            .then(response => response.text())
            .then(data => {
                if(data.trim() == 'success') {
                    document.querySelector('#updateModal .btn-close').click();
                    swal("Success!", "Student record has been updated successfully!", "success")
                    .then((value) => {
                        location.reload();
                    });
                } else if(data.trim() == 'failed') {
                    swal("Error!", "Failed to update student record. Please try again.", "error");
                }
            })
            .catch(err => {
                console.error("Update Error: ", err);
                swal("Error!", "An error occurred while updating the record.", "error");
            });
        }
        
        // Close modal and reset form
        function resetModal() {
            document.getElementById("modalName").classList.remove('is-invalid');
            document.getElementById("modalPer").classList.remove('is-invalid');
        }
    </script>
</head>
<body>
<div class="container" style="margin-top: 100px">
    <h2 class="text-center text-primary mb-4">
        <i class="fas fa-edit"></i> Update Student
    </h2>
    
    <!-- Search Section -->
    <div class="search-section">
        <div class="row justify-content-end">
            <div class="col-md-8">
                <form class="d-flex" role="search" method="Get" action="./update">
                    <input class="form-control me-2" type="text" name="srno" 
                           placeholder="Enter roll number to search...">
                    <button class="btn btn-success me-2" type="submit" name="sbtn" value="Search">
                        <i class="fas fa-search"></i> Search
                    </button>
                    <button class="btn btn-outline-secondary" type="submit" name="sbtn" value="Referesh">
                        <i class="fas fa-sync-alt"></i> Refresh
                    </button>
                </form>
            </div>
        </div>
    </div>

    <%
    // Pagination logic
    List<Student> allStudents = (List<Student>) request.getAttribute("students");
    int totalRecords = (allStudents != null) ? allStudents.size() : 0;
    int pageSize = 10; // Records per page
    int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
    int currentPage = 1;
    
    // Get current page from request parameter
    String pageParam = request.getParameter("page");
    if (pageParam != null && !pageParam.isEmpty()) {
        try {
            currentPage = Integer.parseInt(pageParam);
            if (currentPage < 1) currentPage = 1;
            if (currentPage > totalPages) currentPage = totalPages;
        } catch (NumberFormatException e) {
            currentPage = 1;
        }
    }
    
    // Calculate start and end indices for current page
    int startIndex = (currentPage - 1) * pageSize;
    int endIndex = Math.min(startIndex + pageSize, totalRecords);
    
    // Get sublist for current page
    List<Student> currentPageStudents = new ArrayList<>();
    if (allStudents != null && !allStudents.isEmpty()) {
        currentPageStudents = allStudents.subList(startIndex, endIndex);
    }
    %>

    
    <!-- Students Table -->
    <div class="table-container">
        <table class="table table-hover">
            <thead class="table-dark">
                <tr>
                    <th><i class="fas fa-hashtag"></i> Roll No</th>
                    <th><i class="fas fa-user"></i> Name</th>
                    <th><i class="fas fa-percentage"></i> Percentage</th>
                    <th><i class="fas fa-cog"></i> Action</th>     
                </tr>
            </thead>
            <tbody>
                <%
                if(currentPageStudents == null || currentPageStudents.isEmpty()) {
                %>
                    <tr>
                        <td colspan="4" class="text-center py-4">
                            <i class="fas fa-inbox fa-3x text-muted mb-3"></i><br>
                            <span class="text-muted h5">No students found</span><br>
                            <small class="text-muted">Add some students or try a different search</small>
                        </td>
                    </tr>
                <%
                } else {
                    for(Student ob : currentPageStudents) {
                %>
                    <tr id="<%=ob.getRno() %>">
                        <td class="fw-bold text-primary"><%=ob.getRno() %></td>
                        <td><%=ob.getName() %></td>
                        <td>
                            <span class="badge 
                                <% if(ob.getPer() >= 75) { %>bg-success
                                <% } else if(ob.getPer() >= 40) { %>bg-warning
                                <% } else { %>bg-danger<% } %>">
                                <%=ob.getPer() %>%
                            </span>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary btn-sm action-btn" 
                                    onclick="openUpdatePopup('<%=ob.getRno() %>')">
                                <i class="fas fa-edit"></i> Update
                            </button>
                        </td>
                    </tr>
                <% 
                    }
                }
                %>
            </tbody>
        </table>
    </div>

    <!-- Pagination -->
    <% if (totalPages > 1) { %>
    <div class="pagination-container">
        <nav aria-label="Page navigation">
            <ul class="pagination mb-0">
                

                <!-- Previous Page -->
                <% if (currentPage > 1) { %>
                    <li class="page-item">
                        <a class="page-link" href="?page=<%= currentPage - 1 %>" aria-label="Previous">
                            <i class="fas fa-angle-left"></i>
                        </a>
                    </li>
                <% } else { %>
                    <li class="page-item disabled">
                        <span class="page-link"><i class="fas fa-angle-left"></i></span>
                    </li>
                <% } %>

                <!-- Page Numbers -->
                <%
                int startPage = Math.max(1, currentPage - 2);
                int endPage = Math.min(totalPages, currentPage + 2);
                
                for (int i = startPage; i <= endPage; i++) {
                    if (i == currentPage) {
                %>
                    <li class="page-item active">
                        <span class="page-link"><%= i %></span>
                    </li>
                <% } else { %>
                    <li class="page-item">
                        <a class="page-link" href="?page=<%= i %>"><%= i %></a>
                    </li>
                <% }
                } %>

                <!-- Next Page -->
                <% if (currentPage < totalPages) { %>
                    <li class="page-item">
                        <a class="page-link" href="?page=<%= currentPage + 1 %>" aria-label="Next">
                            <i class="fas fa-angle-right"></i>
                        </a>
                    </li>
                <% } else { %>
                    <li class="page-item disabled">
                        <span class="page-link"><i class="fas fa-angle-right"></i></span>
                    </li>
                <% } %>

               
            </ul>
        </nav>

        <div class="pagination-info">
            Page <%= currentPage %> of <%= totalPages %>
        </div>
    </div>
    <% } %>
</div>

<!-- Update Modal -->
<div class="modal fade" tabindex="-1" id="updateModal" data-bs-backdrop="static">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Header -->
      <div class="modal-header text-white">
        <h5 class="modal-title">
            <i class="fas fa-user-edit"></i> Update Student Information
        </h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" 
                aria-label="Close" onclick="resetModal()"></button>
      </div>
      
      <!-- Body -->
      <div class="modal-body">
        <div class="mb-3">
            <label class="form-label fw-bold">Roll Number</label>
            <input type="text" class="form-control" id="modalRno" readonly
                   style="background-color: #e9ecef;">
            <div class="form-text">Roll number cannot be changed</div>
        </div>
                
        <div class="mb-3">
            <label class="form-label fw-bold">Student Name</label>
            <input type="text" class="form-control" id="modalName" 
                   placeholder="Enter student name">
            <div class="invalid-feedback">
                Please enter a valid name (at least 2 characters)
            </div>
        </div>
        
        <div class="mb-3">
            <label class="form-label fw-bold">Percentage</label>
            <input type="number" class="form-control" id="modalPer" 
                   step="0.01" min="0" max="100" placeholder="Enter percentage (0-100)">
            <div class="form-text">Enter percentage between 0 and 100</div>
            <div class="invalid-feedback">
                Please enter a valid percentage (0-100)
            </div>
        </div>
      </div>
      
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" 
                onclick="resetModal()">
            <i class="fas fa-times"></i> Cancel
        </button>
        <button type="button" class="btn btn-primary" onclick="modify()">
            <i class="fas fa-save"></i> Update Student
        </button>
      </div>
    </div>
  </div>
</div>

<footer class="footer bg-dark py-4">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-3 mb-lg-0">
                <h5 class="fw-bold mb-2 text-white">
                    <i class="fas fa-graduation-cap me-2" style="color: #4361ee;"></i>Student Management
                </h5>
                <p style="color: #e5e7eb; line-height: 1.5; opacity: 0.9; font-size: 0.9rem;">
                    Comprehensive solution for managing student records, grades, and academic information efficiently.
                </p>
                <div class="social-links mt-2">
                    <a href="https://www.linkedin.com/in/pradeep-jadhav-889746289/" target="_blank" class="text-decoration-none me-2" style="color: #4361ee; transition: all 0.3s ease;">
                        <i class="fab fa-linkedin-in fa-md"></i>
                    </a>
                    <a href="https://github.com/pradeep29-11/" target="_blank" class="text-decoration-none me-2" style="color: #4361ee; transition: all 0.3s ease;">
                        <i class="fab fa-github fa-md"></i>
                    </a>
                    <a href="https://www.instagram.com/pradeep_jadhav_2/" target="_blank" class="text-decoration-none" style="color: #4361ee; transition: all 0.3s ease;">
                        <i class="fab fa-instagram fa-md"></i>
                    </a>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 mb-3 mb-md-0">
                <h6 class="fw-bold mb-2 text-white" style="font-size: 0.9rem;">Quick Links</h6>
                <div class="d-flex flex-column">
                    <a href="./addstudent" class="text-decoration-none mb-1 footer-link" style="color: #e5e7eb; transition: color 0.3s ease; font-size: 0.85rem;">Add Student</a>
                    <a href="./display" class="text-decoration-none mb-1 footer-link" style="color: #e5e7eb; transition: color 0.3s ease; font-size: 0.85rem;">View Students</a>
                    <a href="./update" class="text-decoration-none mb-1 footer-link" style="color: #e5e7eb; transition: color 0.3s ease; font-size: 0.85rem;">Update Records</a>
                    <a href="./delete" class="text-decoration-none footer-link" style="color: #e5e7eb; transition: color 0.3s ease; font-size: 0.85rem;">Delete Student</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-3 mb-md-0">
                <h6 class="fw-bold mb-2 text-white" style="font-size: 0.9rem;">Support</h6>
                <div class="d-flex flex-column">
                    <a href="./About.jsp" class="text-decoration-none mb-1 footer-link" style="color: #e5e7eb; transition: color 0.3s ease; font-size: 0.85rem;">About Us</a>
                    <a href="#" class="text-decoration-none mb-1 footer-link" style="color: #e5e7eb; transition: color 0.3s ease; font-size: 0.85rem;">Help Center</a>
                    <a href="#" class="text-decoration-none mb-1 footer-link" style="color: #e5e7eb; transition: color 0.3s ease; font-size: 0.85rem;">Privacy Policy</a>
                    <a href="#" class="text-decoration-none footer-link" style="color: #e5e7eb; transition: color 0.3s ease; font-size: 0.85rem;">Terms of Service</a>
                </div>
            </div>
            <div class="col-lg-3">
                <h6 class="fw-bold mb-2 text-white" style="font-size: 0.9rem;">Connect With Me</h6>
                <div class="d-flex flex-column">
                    <a href="https://www.linkedin.com/in/pradeep-jadhav-889746289/" target="_blank" class="text-decoration-none mb-2 footer-link" style="color: #e5e7eb; transition: color 0.3s ease; font-size: 0.85rem;">
                        <i class="fab fa-linkedin me-2" style="color: #0077b5;"></i>LinkedIn
                    </a>
                    <a href="https://github.com/pradeep29-11/" target="_blank" class="text-decoration-none mb-2 footer-link" style="color: #e5e7eb; transition: color 0.3s ease; font-size: 0.85rem;">
                        <i class="fab fa-github me-2" style="color: #f0f6fc;"></i>GitHub
                    </a>
                    <a href="https://www.instagram.com/pradeep_jadhav_2/" target="_blank" class="text-decoration-none footer-link" style="color: #e5e7eb; transition: color 0.3s ease; font-size: 0.85rem;">
                        <i class="fab fa-instagram me-2" style="color: #e4405f;"></i>Instagram
                    </a>
                </div>
            </div>
        </div>
        <hr class="my-3" style="border-color: rgba(255,255,255,0.2);">
        <div class="text-center">
            <p class="mb-0" style="color: #9ca3af; opacity: 0.8; font-size: 0.8rem;">&copy; 2025 Student Management System. All rights reserved.</p>
        </div>
    </div>
</footer>
<!-- Add Font Awesome -->
<script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>