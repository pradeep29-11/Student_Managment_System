<%-- header.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Include all CSS and JS in head -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
    /* Navbar styling */
    .navbar {
        min-height: 60px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
        .navbar-nav .nav-link {
            padding: 0.5rem 1rem;
        }
        
        .student-management-dropdown {
            margin-top: 10px;
        }
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <!-- Brand on the left -->
        <a class="navbar-brand" href="./">
            <i class="fas fa-graduation-cap"></i> Student Management System
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarNav" aria-controls="navbarNav" 
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- All other items on the right -->
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="./">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./About.jsp">
                        <i class="fas fa-info-circle"></i> About US
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" 
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user-graduate"></i> Student Management
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="./addstudent">
                            <i class="fas fa-plus-circle text-success me-2"></i> Add Student
                        </a></li>
                        <li><a class="dropdown-item" href="./display">
                            <i class="fas fa-list text-info me-2"></i> Display Students
                        </a></li>
                        <li><a class="dropdown-item" href="./update">
                            <i class="fas fa-edit text-warning me-2"></i> Update Student
                        </a></li>
                        <li><a class="dropdown-item" href="./delete">
                            <i class="fas fa-trash text-danger me-2"></i> Delete Student
                        </a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Add space for fixed navbar -->
<div style="height: 80px;"></div>

<!-- Bootstrap JS at the end -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>