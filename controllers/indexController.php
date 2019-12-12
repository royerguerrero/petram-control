<?php 
    class indexController{

        function index(){
            require_once 'views/layouts/header.php';
            require_once 'views/layouts/navbar.php';
            require_once 'views/index/index.php';
            require_once 'views/layouts/footer.php';
        }

        function login(){
            require_once 'views/layouts/header.php';
            require_once 'views/layouts/navbar.php';
            require_once 'views/index/login.php';
            require_once 'views/layouts/footer.php';
        }
    }