<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - Student Management System</title>
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
    
    .about-card {
        background: white;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        padding: 3rem;
        margin: 2rem 0;
    }
    
    .page-title {
        color: #2c3e50;
        font-weight: 700;
        margin-bottom: 1.5rem;
        text-align: center;
        border-bottom: 3px solid #3498db;
        padding-bottom: 0.5rem;
        display: inline-block;
    }
    
    .developer-card {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-radius: 15px;
        color: white;
        padding: 2rem;
        margin: 2rem 0;
    }
    
    .tech-stack {
        background: rgba(52, 152, 219, 0.1);
        border-radius: 10px;
        padding: 1.5rem;
        border-left: 4px solid #3498db;
    }
    
    .profile-img {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        object-fit: cover;
        border: 5px solid #3498db;
        margin: 0 auto 1rem;
    }
</style>
</head>
<body>
    <div class="container" style="margin-top: 100px">
        <div class="about-card">
            <div class="text-center mb-4">
                <i class="fas fa-graduation-cap" style="font-size: 4rem; color: #3498db;"></i>
            </div>
            <h3 class="page-title">About Student Management System</h3>
            
            <div class="row">
                <div class="col-lg-10 mx-auto">
                    <p class="lead text-center text-muted mb-4">
                        Efficient Student Data Management Solution
                    </p>
                    
                    <div style="line-height: 1.8; font-size: 16px; color: #555;">
                        <p style="text-align:justify;">
                            The <strong>Student Management System</strong> is a comprehensive web application designed to streamline the process of managing student records in educational institutions. Built with modern technologies, this system provides an intuitive interface for performing all essential CRUD (Create, Read, Update, Delete) operations on student data.
                        </p>
                        
                        <p style="text-align:justify;">
                            This project demonstrates the implementation of enterprise-level Java web applications using servlets, JSP, and PostgreSQL database. The system features a responsive design, real-time data validation, and interactive user experience with SweetAlert notifications.
                        </p>
                    </div>
                </div>
            </div>
            
            <!-- Developer Information -->
            <div class="developer-card">
                <div class="row align-items-center">
                    <div class="col-md-3 text-center">
                        <div class="profile-img-placeholder bg-light rounded-circle d-flex align-items-center justify-content-center mx-auto" 
                             style="width: 150px; height: 150px; border: 5px solid white;">
                            <i class="fas fa-user fa-4x text-primary"></i>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <h4 class="mb-2">Pradeep Jalindar Jadhav</h4>
                        <p class="mb-1">
                            <i class="fas fa-university me-2"></i>
                            <strong>JSPM Rajarshi Shahu College of Engineering, Pune</strong>
                        </p>
                        <p class="mb-1">
                            <i class="fas fa-laptop-code me-2"></i>
                            Bachelor of Technology in Information Technology
                        </p>
                        <p class="mb-3">
                            <i class="fas fa-calendar-alt me-2"></i>
                            Third Year Student
                        </p>
                        
                        <div class="social-links">
                            <a href="https://www.linkedin.com/in/pradeep-jadhav-889746289/" target="_blank" class="btn btn-outline-light btn-sm me-2">
                                <i class="fab fa-linkedin me-1"></i> LinkedIn
                            </a>
                            <a href="https://github.com/pradeep29-11/" target="_blank" class="btn btn-outline-light btn-sm me-2">
                                <i class="fab fa-github me-1"></i> GitHub
                            </a>
                            <a href="https://www.instagram.com/pradeep_jadhav_2/" target="_blank" class="btn btn-outline-light btn-sm">
                                <i class="fab fa-instagram me-1"></i> Instagram
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Technical Stack -->
            <div class="tech-stack mt-4">
                <h5 class="mb-3" style="color: #2c3e50;">
                    <i class="fas fa-code me-2"></i>Technical Stack
                </h5>
                <div class="row g-4">
                    <div class="col-md-6">
                        <h6 style="color: #3498db;">Backend Technologies</h6>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i>Java Servlets</li>
                            <li><i class="fas fa-check text-success me-2"></i>Java Server Pages (JSP)</li>
                            <li><i class="fas fa-check text-success me-2"></i>PostgreSQL Database</li>
                            <li><i class="fas fa-check text-success me-2"></i>JDBC for Database Connectivity</li>
                            <li><i class="fas fa-check text-success me-2"></i>Apache Tomcat Server</li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <h6 style="color: #3498db;">Frontend Technologies</h6>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i>HTML5 & CSS3</li>
                            <li><i class="fas fa-check text-success me-2"></i>Bootstrap 5</li>
                            <li><i class="fas fa-check text-success me-2"></i>JavaScript (ES6+)</li>
                            <li><i class="fas fa-check text-success me-2"></i>SweetAlert2 for Notifications</li>
                            <li><i class="fas fa-check text-success me-2"></i>Font Awesome Icons</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Features -->
            <div class="row mt-5">
                <div class="col-md-6 mb-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body text-center">
                            <i class="fas fa-user-plus fa-2x text-primary mb-3"></i>
                            <h5 class="card-title">Add Students</h5>
                            <p class="card-text">Easily add new student records with roll number, name, and percentage with real-time validation.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body text-center">
                            <i class="fas fa-list fa-2x text-success mb-3"></i>
                            <h5 class="card-title">View Records</h5>
                            <p class="card-text">Browse all student records with pagination and search functionality for easy navigation.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body text-center">
                            <i class="fas fa-edit fa-2x text-warning mb-3"></i>
                            <h5 class="card-title">Update Information</h5>
                            <p class="card-text">Modify student details through interactive modals with form validation.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body text-center">
                            <i class="fas fa-trash-alt fa-2x text-danger mb-3"></i>
                            <h5 class="card-title">Delete Records</h5>
                            <p class="card-text">Safely remove student records with confirmation dialogs to prevent accidental deletion.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Project Purpose -->
            <div class="text-center mt-5 p-4" style="background: rgba(52, 152, 219, 0.1); border-radius: 15px; border-left: 5px solid #3498db;">
                <h5 style="color: #3498db;">Project Purpose</h5>
                <p class="mb-3" style="font-style: italic;">
                    "This Student Management System was developed as part of my academic journey to demonstrate proficiency in full-stack Java web development, database management, and modern web technologies."
                </p>
                <p class="mt-3 mb-0">
                    <strong>Pradeep Jalindar Jadhav</strong><br>
                    <small class="text-muted">BTech IT, JSPM RSCOE Pune</small>
                </p>
            </div>
        </div>
    </div>
    
<footer class="footer bg-dark py-4" style="margin-top: 70px">
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

<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>