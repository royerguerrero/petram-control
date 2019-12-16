<?php

class userController{
    #TODO Hacer las vistas de los usuarios
    public function index(){
        require_once 'views/layouts/header.php';
        require_once 'views/layouts/navbar-users.php';
        require_once 'views/users/index.php';
        require_once 'views/layouts/footer.php';
    }
}