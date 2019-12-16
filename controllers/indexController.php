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

        function register(){
            require_once 'views/layouts/header.php';
            require_once 'views/layouts/navbar.php';
            #TODO crear la vista de registro
            require_once 'views/index/register.php';
            require_once 'views/layouts/footer.php';
        }

        function restore_password(){
            require_once 'views/layouts/header.php';
            require_once 'views/layouts/navbar.php';
            #TODO crear la vista de recuperacion de la contraseña
            require_once 'views/index/restore.php';
            require_once 'views/layouts/footer.php';
        }

        function verification_code(){
            require_once 'views/layouts/header.php';
            require_once 'views/layouts/navbar.php';
            #TODO crear la vista de codigo de verificacion de la contraseña
            require_once 'views/index/verification-code.php';
            require_once 'views/layouts/footer.php';
        }

        function dashboard(){
            require_once 'views/layouts/header.php';
            require_once 'views/layouts/users/navbar.php';
            require_once 'views/users/dash.php';
            require_once 'views/layouts/users/footer.php';
        }

    }