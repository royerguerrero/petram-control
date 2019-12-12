<main>
    <section>
        <div class="row">
            <div class="col-sm-12 col-md-6 banner banner-register banner-s"></div>
            <div class="col-sm-12 col-md-6 d-flex justify-content-center align-items-center">
                <div>
                    <h2>Registarse</h2>
                    #TODO Hacer el formulario y cambiar el color de la alerta
                    <div class="alert alert-warning alert-dismissible fade show w-75" role="alert">
                        <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="/action_page.php" class="w-75">
                        <div class="form-group">
                            <label for="nickname"> Nombre de usuario</label>
                            <input type="text" class="form-control" placeholder="jondoe09" id="nickname"
                                name="nickname">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Contraseña</label>
                            <input type="password" class="form-control" placeholder="**************" id="pwd"
                                name='pwd'>
                        </div>
                        <div class="form-group form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="rm"> Recordarme
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary">Ingresar</button>
                    </form>
                    <br>
                    <a href="?method=login">Ya tengo una cuenta</a><br>
                </div>
            </div>
        </div>
    </section>
</main>