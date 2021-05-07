var config = require('./dbconfig');
const sql = require('mssql');

//ciudades
async function getCiudades() {
    try {
        let pool = await sql.connect(config);
        let ciudades = await pool.request().query("SELECT [id],[nombreCiu] FROM [PruebaBank].[dbo].[Ciudad]");
        return ciudades.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getCiudad(ciudadId) {
    try {
        let pool = await sql.connect(config);
        let ciudad = await pool.request()
            .input('input_parameter', sql.Int, ciudadId)
            .query("SELECT * from Ciudad where Id = @input_parameter");
        return ciudad.recordsets;

    }
    catch (error) {
        console.log(error);
    }
}


async function addCiudad(ciudad) {

    try {
        let pool = await sql.connect(config);
        let insertCiudad = await pool.request()
            .input('nombreCiu', sql.NVarChar, ciudad.nombreCiu)
            .execute('InsertCiudad');
        return insertProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }

}

//sedes

async function getSedes() {
    try {
        let pool = await sql.connect(config);
        let sedes = await pool.request().query("SELECT [idSede],[nombre],[idCiudad] FROM [PruebaBank].[dbo].[Sede]");
        return sedes.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getSede(sedeId) {
    try {
        let pool = await sql.connect(config);
        let sede = await pool.request()
            .input('input_parameter', sql.Int, sedeId)
            .query("SELECT * from Sede where idSede = @input_parameter");
        return sede.recordsets;

    }
    catch (error) {
        console.log(error);
    }
}


async function addSede(sede) {

    try {
        let pool = await sql.connect(config);
        let insertSede = await pool.request()
            .input('nombre', sql.NVarChar, sede.nombre)
            .input('idCiudad', sql.NVarChar, sede.idCiudad)
            .execute('InsertSede');
        return insertSede.recordsets;
    }
    catch (err) {
        console.log(err);
    }

}

//Usuarios

async function getUsuarios() {
    try {
        let pool = await sql.connect(config);
        let Usuarios = await pool.request().query("SELECT [idUsuario] ,[nombre],[apellido] ,[cedula] ,[idSede] ,[idRol] FROM [PruebaBank].[dbo].[Usuarios]");
        return Usuarios.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getUsuario(usuarioId) {
    try {
        let pool = await sql.connect(config);
        let usuario = await pool.request()
            .input('input_parameter', sql.Int, usuarioId)
            .query("SELECT * from Usuarios where idUsuario = @input_parameter");
        return usuario.recordsets;

    }
    catch (error) {
        console.log(error);
    }
}


async function addUsuario(usuario) {

    try {
        let pool = await sql.connect(config);
        let insertUsuario = await pool.request()
            .input('nombre', sql.NVarChar, usuario.nombre)
            .input('apellido', sql.NVarChar, usuario.apellido)
            .input('cedula', sql.NVarChar, usuario.cedula)
            .input('idSede', sql.NVarChar, usuario.idSede)
            .input('idRol', sql.NVarChar, usuario.idRol)
            .execute('InsertUsuario');
        return insertUsuario.recordsets;
    }
    catch (err) {
        console.log(err);
    }

}

//Inicio de sesion 
async function InicioSesionUsuarioAdmin(usuario) {

    try {
        let pool = await sql.connect(config);
        let InicioSesionUsuarioAdmin = await pool.request()
            .input('nombre', sql.NVarChar, usuario.nombre)
            .input('cedula', sql.NVarChar, usuario.cedula)
            .execute('InicioSesionUsuarioAdmin');
        return InicioSesionUsuarioAdmin.recordsets;
    }
    catch (err) {
        console.log(err);
    }

}

//Usuarios Por sede


async function UsuariosPorSede(idusuario) {
    try {
        let pool = await sql.connect(config);
        let usuario = await pool.request()
            .input('input_parameter', sql.Int, idusuario)
            .query("SELECT * from Usuarios where idSede = @input_parameter");
        return usuario.recordsets;

    }
    catch (error) {
        console.log(error);
    }
}


module.exports = {
    getCiudades: getCiudades,
    getCiudad : getCiudad,
    addCiudad : addCiudad,
    getSedes: getSedes,
    getSede : getSede,
    addSede : addSede,
    getUsuarios: getUsuarios,
    getUsuario : getUsuario,
    addUsuario : addUsuario,
    InicioSesionUsuarioAdmin : InicioSesionUsuarioAdmin,
    UsuariosPorSede : UsuariosPorSede
}