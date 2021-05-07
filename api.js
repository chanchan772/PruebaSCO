var Db  = require('./dbOperaciones');
var Ciudad = require('./ciudad');
var Sede = require('./sede');
var Usuario =require('./usuarios');
const dboperations = require('./dbOperaciones');

var express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors');
var app = express();
var router = express.Router();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
app.use('/api', router);


router.use((request,response,next)=>{
   console.log('middleware');
   next();
})
//ciudad
router.route('/ciudad').get((request,response)=>{

    dboperations.getCiudades().then(result => {
       response.json(result[0]);
    })

})

router.route('/ciudad/:id').get((request,response)=>{

    dboperations.getCiudad(request.params.id).then(result => {
       response.json(result[0]);
    })

})

router.route('/ciudad').post((request,response)=>{

    let ciudad = {...request.body}

    dboperations.addCiudad(ciudad).then(result => {
       response.status(201).json(result);
    })

})

//Sede
router.route('/sede').get((request,response)=>{

    dboperations.getSedes().then(result => {
       response.json(result[0]);
    })

})

router.route('/sede/:id').get((request,response)=>{

    dboperations.getSede(request.params.id).then(result => {
       response.json(result[0]);
    })

})

router.route('/sede').post((request,response)=>{

    let sede = {...request.body}

    dboperations.addSede(sede).then(result => {
       response.status(201).json(result);
    })

})

//Usuarios

router.route('/usuario').get((request,response)=>{

    dboperations.getUsuarios().then(result => {
       response.json(result[0]);
    })

})

router.route('/usuario/:id').get((request,response)=>{

    dboperations.getUsuario(request.params.id).then(result => {
       response.json(result[0]);
    })

})

router.route('/usuario').post((request,response)=>{

    let usuario = {...request.body}

    dboperations.addUsuario(usuario).then(result => {
       response.status(201).json(result);
    })

})

//Inicio de sesion

router.route('/iniciosesion').post((request,response)=>{

    let usuario = {...request.body}

    dboperations.InicioSesionUsuarioAdmin(usuario).then(result => {
       response.status(201).json(result);
    })

})

//Usuarios Por sede

router.route('/usuariosede/:id').get((request,response)=>{

    dboperations.UsuariosPorSede(request.params.id).then(result => {
       response.json(result[0]);
    })

})

var port = process.env.PORT || 8090;
app.listen(port);
console.log('Order API is runnning at ' + port);