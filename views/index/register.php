<main>
    <section>
        <div class="row">
            <div class="col-sm-12 col-md-6 banner banner-register banner-s"></div>
            <div class="col-sm-12 col-md-6 d-flex justify-content-center align-items-center">
                <div class="mt-5">
                    <h2>Registarse</h2>
                    #TODO Hacer el formulario y cambiar el color de la alerta
                    <div class="alert alert-success alert-dismissible fade show w-75" role="alert">
                        <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="/action_page.php" class="w-75">
                        <div class="form-group">
                            <label for="Nombre"> Nombre </label>
                            <input type="text" class="form-control" placeholder="Jon" id="Nombre"
                                name="Nombre">
                        </div>
                        <div class="form-group">
                            <label for="Apellidos"> Apellidos </label>
                            <input type="text" class="form-control" placeholder="Doe Mostacho" id="Apellidos"
                                name="Apellidos">
                        </div>
                        <div class="form-group">
                            <label for="Email"> Email </label>
                            <input type="email" class="form-control" placeholder="mostacho@flow.com" id="Email"
                                name="Email">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Contraseña</label>
                            <input type="password" class="form-control" placeholder="**************" id="pwd"
                                name='pwd'>
                        </div>
                        <div class="form-group">
                            <label for="Empresa"> Nombre de tu empresa </label>
                            <input type="text" class="form-control" placeholder="Autopremier" id="Empresa"
                                name="Empresa">
                        </div>
                        <div class="form-group form-check">
                            
                        </div>
                        <button type="submit" class="btn btn-primary">Registarse</button>
                    </form>
                    <br>
                    <a href="?method=login">Ya tengo una cuenta</a><br>
                </div>
            </div>
        </div>
    </section>
</main>