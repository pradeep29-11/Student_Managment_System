<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Registration</title>
    
    <!-- Include SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    
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
        .form-container {
            background: #f8f9fa;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin: 2rem 0;
        }
        body {
            background-color: #f8f9fa;
        }
        .navbar-brand { font-weight: bold; }
        .dropdown-menu { border: none; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        .nav-link { transition: color 0.3s ease; }
        .nav-link:hover { color: #007bff !important; }
        
         .footer {
            margin-top: auto;
            background: linear-gradient(135deg, #000000, #1a1a1a, #2d2d2d) !important;
        }
    </style>
</head>
<body>
    <%@include file="header.jsp" %>
    
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form-container">
                    <h1 class="text-primary text-center mb-4">
                        <i class="fas fa-user-plus"></i> Student Registration
                    </h1>
                    <hr>
                    
                    <!-- Test Button to check SweetAlert -->
                    <div class="text-center mb-3">
                        
                    </div>
                    
                    <form method="Post" action="./addstudent" id="studentForm">
                        <div class="mb-3">
                            <label for="rollNumber" class="form-label fw-bold mt-3">Roll Number</label>
                            <input type="text" name="rno" class="form-control form-control-lg" id="rollNumber" required 
                                   placeholder="Enter roll number">
                        </div>

                        <div class="mb-3">
                            <label for="studentName" class="form-label fw-bold mt-3">Full Name</label>
                            <input type="text" name="name" class="form-control form-control-lg" id="studentName" required 
                                   placeholder="Enter full name">
                        </div>

                        <div class="mb-3">
                            <label for="percentage" class="form-label fw-bold mt-3">Percentage</label>
                            <input type="number" name="per" class="form-control form-control-lg" id="percentage" 
                                   step="0.01" min="0" max="100" required placeholder="Enter percentage">
                            <div class="form-text">Enter percentage between 0 and 100</div>
                        </div>

                        <div class="d-grid gap-2">	
                            <button type="submit" class="btn btn-primary btn-lg" id="submitBtn">
                                <i class="fas fa-save"></i> Save Student
                            </button>
                        </div>	
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
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

    <!-- Include SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
    
    <script>
        // Test function to check if SweetAlert is working
        function testSweetAlert() {
            Swal.fire({
                title: 'Test Alert!',
                text: 'If you can see this, SweetAlert is working!',
                icon: 'info',
                confirmButtonText: 'OK'
            });
        }

        // Show SweetAlert based on message type - SIMPLIFIED VERSION
        document.addEventListener('DOMContentLoaded', function() {
            console.log('Page loaded, checking for messages...');
            
            // Check if we have a message from server
            const serverMsg = '${msg}';
            const alertType = '${alertType}';
            
            console.log('Server message:', serverMsg);
            console.log('Alert type:', alertType);
            
            if (serverMsg && serverMsg.trim() !== '') {
                console.log('Showing alert...');
                
                if (alertType === 'success') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: serverMsg,
                        confirmButtonColor: '#28a745',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        // Clear form after success
                        if (result.isConfirmed) {
                            document.getElementById('studentForm').reset();
                        }
                    });
                } else if (alertType === 'error') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: serverMsg,
                        confirmButtonColor: '#dc3545',
                        confirmButtonText: 'Try Again'
                    });
                }
            }
            
            // Form submission handler
            const form = document.getElementById('studentForm');
            if (form) {
                form.addEventListener('submit', function() {
                    // Show loading state
                    const submitBtn = document.getElementById('submitBtn');
                    if (submitBtn) {
                        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Saving...';
                        submitBtn.disabled = true;
                    }
                });
            }
        });
    </script>
</body>
</html>