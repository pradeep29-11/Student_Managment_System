<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<style>
    :root {
        --primary-color: #4361ee;
        --secondary-color: #3a0ca3;
        --success-color: #4cc9f0;
        --info-color: #7209b7;
        --warning-color: #f72585;
        --light-color: #f8f9fa;
    }
    
    .hero-section {
        background: linear-gradient(135deg, #4361ee 0%, #3a0ca3 50%, #7209b7 100%);
        color: white;
        padding: 140px 0 100px 0;
        text-align: center;
        position: relative;
        overflow: hidden;
    }
    
    .hero-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" fill="rgba(255,255,255,0.1)"><circle cx="100" cy="30" r="15"/><circle cx="800" cy="60" r="20"/><circle cx="500" cy="80" r="12"/><circle cx="300" cy="20" r="18"/></svg>');
        background-size: cover;
        animation: float 20s ease-in-out infinite;
    }
    
    .feature-card {
        transition: all 0.4s ease;
        border: none;
        border-radius: 20px;
        box-shadow: 0 8px 30px rgba(0,0,0,0.12);
        overflow: hidden;
        height: 100%;
        background: white;
    }
    
    .feature-card:hover {
        transform: translateY(-12px) scale(1.02);
        box-shadow: 0 20px 40px rgba(67, 97, 238, 0.15);
    }
    
    .card-primary { border-top: 5px solid #4361ee; }
    .card-success { border-top: 5px solid #4cc9f0; }
    .card-warning { border-top: 5px solid #f72585; }
    .card-info { border-top: 5px solid #7209b7; }
    
    .stats-section {
        background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        padding: 80px 0;
    }
    
    .stat-card {
        text-align: center;
        padding: 40px 25px;
        background: white;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        transition: all 0.3s ease;
        border: 1px solid rgba(67, 97, 238, 0.1);
    }
    
    .stat-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 15px 35px rgba(67, 97, 238, 0.15);
    }
    
    .stat-number {
        font-size: 3.5rem;
        font-weight: bold;
        background: linear-gradient(135deg, #4361ee, #7209b7);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        display: block;
        line-height: 1;
    }
    
    .quick-actions {
        padding: 80px 0;
        background: white;
    }
    
    .action-btn {
        padding: 30px 20px;
        text-align: center;
        border-radius: 20px;
        color: white;
        text-decoration: none;
        display: block;
        transition: all 0.4s ease;
        margin-bottom: 0;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        border: none;
    }
    
    .action-btn:hover {
        transform: translateY(-10px) scale(1.05);
        color: white;
        text-decoration: none;
        box-shadow: 0 20px 40px rgba(0,0,0,0.2);
    }
    
    .btn-add { 
        background: linear-gradient(135deg, #4cc9f0, #4361ee);
        background-size: 200% 200%;
        animation: gradientShift 3s ease infinite;
    }
    
    .btn-view { 
        background: linear-gradient(135deg, #7209b7, #3a0ca3);
        background-size: 200% 200%;
        animation: gradientShift 3s ease infinite 0.5s;
    }
    
    .btn-update { 
        background: linear-gradient(135deg, #f72585, #b5179e);
        background-size: 200% 200%;
        animation: gradientShift 3s ease infinite 1s;
    }
    
    .btn-delete { 
        background: linear-gradient(135deg, #f77f00, #d62828);
        background-size: 200% 200%;
        animation: gradientShift 3s ease infinite 1.5s;
    }
    
    .floating-icon {
        animation: float 3s ease-in-out infinite;
    }
    
    @keyframes float {
        0%, 100% { 
            transform: translateY(0px) rotate(0deg); 
        }
        33% { 
            transform: translateY(-15px) rotate(2deg); 
        }
        66% { 
            transform: translateY(-8px) rotate(-2deg); 
        }
    }
    
    @keyframes gradientShift {
        0%, 100% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
    }
    
    .section-title {
        position: relative;
        margin-bottom: 4rem;
        font-weight: 700;
    }
    
    .section-title::after {
        content: '';
        position: absolute;
        bottom: -15px;
        left: 50%;
        transform: translateX(-50%);
        width: 100px;
        height: 4px;
        background: linear-gradient(135deg, #4361ee, #7209b7);
        border-radius: 4px;
    }
    
    .hero-buttons .btn {
        border-radius: 50px;
        padding: 15px 35px;
        font-weight: 600;
        font-size: 1.1rem;
        transition: all 0.3s ease;
        margin: 0 10px 10px 10px;
    }
    
    .pulse {
        animation: pulse 2s infinite;
    }
    
    @keyframes pulse {
        0% { box-shadow: 0 0 0 0 rgba(67, 97, 238, 0.4); }
        70% { box-shadow: 0 0 0 15px rgba(67, 97, 238, 0); }
        100% { box-shadow: 0 0 0 0 rgba(67, 97, 238, 0); }
    }
    
    .feature-icon {
        font-size: 3.5rem;
        margin-bottom: 1.5rem;
        display: inline-block;
    }
</style>
</head>
<body>
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container position-relative" style="z-index: 2;">
            <div class="row align-items-center">
                <div class="col-lg-10 mx-auto text-center">
                    <div class="mb-4">
                        <i class="fas fa-graduation-cap fa-6x floating-icon" style="color: #ffffff; filter: drop-shadow(0 8px 20px rgba(0,0,0,0.3));"></i>
                    </div>
                    <h1 class="display-3 fw-bold mb-4 text-white" style="text-shadow: 0 4px 15px rgba(0,0,0,0.2);">
                        Student Management System
                    </h1>
                    <p class="lead mb-5 fs-4 text-white" style="opacity: 0.95; font-weight: 300; line-height: 1.6; max-width: 800px; margin: 0 auto;">
                        Transform your educational institution with our powerful, intuitive, and beautiful student management platform. 
                        Designed for schools, colleges, and training centers of all sizes.
                    </p>
                    <div class="hero-buttons d-flex justify-content-center gap-4 flex-wrap">
                        <a href="./addstudent" class="btn btn-light btn-lg px-5 pulse" 
                           style="background: rgba(255,255,255,0.95); color: #4361ee; border: none; font-weight: 700;">
                            <i class="fas fa-plus-circle me-2"></i>Add New Student
                        </a>
                        <a href="./display" class="btn btn-outline-light btn-lg px-5" 
                           style="border: 3px solid rgba(255,255,255,0.8); color: white; background: rgba(255,255,255,0.15); backdrop-filter: blur(10px); font-weight: 700;">
                            <i class="fas fa-list me-2"></i>View All Students
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Quick Actions Section -->
    <section class="quick-actions">
        <div class="container">
            <h2 class="text-center section-title" style="color: #4361ee;">Quick Actions</h2>
            <p class="text-center mb-5 fs-5 text-muted">Access all major features with just one click</p>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <a href="./addstudent" class="action-btn btn-add">
                        <i class="fas fa-user-plus fa-4x mb-3"></i>
                        <h4 class="fw-bold">Add Student</h4>
                        <p class="mb-0">Register new students quickly</p>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="./display" class="action-btn btn-view">
                        <i class="fas fa-list fa-4x mb-3"></i>
                        <h4 class="fw-bold">View Records</h4>
                        <p class="mb-0">Browse all student data</p>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="./update" class="action-btn btn-update">
                        <i class="fas fa-edit fa-4x mb-3"></i>
                        <h4 class="fw-bold">Update Info</h4>
                        <p class="mb-0">Modify student details</p>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="./delete" class="action-btn btn-delete">
                        <i class="fas fa-trash-alt fa-4x mb-3"></i>
                        <h4 class="fw-bold">Remove</h4>
                        <p class="mb-0">Delete student records</p>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <footer class="bg-dark py-4" style="background: linear-gradient(135deg, #000000, #1a1a1a, #2d2d2d) !important;">
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

    <!-- JavaScript for animations -->
    <script>
        // Counter animation for stats
        function animateCounter(element, target) {
            let current = 0;
            const increment = target / 50;
            const timer = setInterval(() => {
                current += increment;
                if (current >= target) {
                    element.textContent = target;
                    clearInterval(timer);
                } else {
                    element.textContent = Math.floor(current);
                }
            }, 30);
        }
        
        // Intersection Observer for animations
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const counters = entry.target.querySelectorAll('.stat-number');
                    counters.forEach(counter => {
                        if (counter.id === 'studentCount') {
                            animateCounter(counter, 1567);
                        }
                    });
                }
            });
        }, { threshold: 0.5 });
        
        // Observe stats section
        document.addEventListener('DOMContentLoaded', () => {
            const statsSection = document.querySelector('.py-5');
            if (statsSection) {
                observer.observe(statsSection);
            }
            
            // Add staggered animation to feature cards
            const featureCards = document.querySelectorAll('.feature-card');
            featureCards.forEach((card, index) => {
                card.style.animationDelay = `${index * 0.2}s`;
            });
        });
    </script>
</body>
</html>