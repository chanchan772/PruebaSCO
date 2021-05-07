const { TestScheduler } = require('@jest/core');
var Db  = require('./dbOperaciones');
var Ciudad = require('./ciudad');
var Sede = require('./sede');
var Usuario =require('./usuarios');

test('Es Admin',()=>{
    expect(InicioSesionUsuarioAdmin(Usuario)).toBe('Es Admin')
});