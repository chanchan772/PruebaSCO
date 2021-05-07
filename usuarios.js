class Usuarios{
    constructor(idUsuario,nombre,apellido,cedula,idSede,idRol){
        this.idUsuario = idUsuario; 
        this.nombre = nombre; 
        this.apellido = apellido;
        this.cedula = cedula;
        this.idSede = idSede; 
        this.idRol = idRol; 
    }
}

module.exports = Usuarios;