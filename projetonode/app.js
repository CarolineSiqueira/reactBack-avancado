const express = require("express");
const app = express();
const router = express.Router();

const connection =require('./src/db/connection') 
const Contato = require('./src/models/Contato')

const cors = require('cors');
app.use(cors())
app.use(express.json());

app.get("/", (req, res, next) => {
    const mysql = require('mysql')
    const connection = mysql.createConnection({
        host: 'localhost', 
        user: 'root',
        password: '',
        database: 'fseletro'
    }); 
    connection.query("select * from produtos",  (error, result)  => {
        res.json(result)
    })
});

app.get('/post', (req,res) => {
    res.render('secao/index')
})

app.post("/postcontato", async (req, res) => {
    const { nome, mensagem } = req.body

    let resultado = await Contato.create({ nome, mensagem })
    res.json(resultado)
})

app.post('/postpedidos', (req, res) => {
    const mysql = require('mysql')
    const connection = mysql.createConnection({
        host: 'localhost', 
        user: 'root',
        password: '',
        database: 'fseletro',
    });
    const { nome } = req.body
    const { endereco } = req.body
    const { fone } = req.body
    const { nome_produto } = req.body
    const { quantidade } = req.body
    const { valor_unitário } = req.body
    const { valor_total } = req.body
    let dados = []
    dados.push({
        nome: nome,
        endereco: endereco,
        fone: fone,
        nome_produto: nome_produto,
        quantidade: quantidade,
        valor_unitário: valor_unitário,
        valor_total: valor_total
    })
    connection.query('INSERT INTO pedidos set ?',dados,() =>{
        dados = []
        return res.json({message: "Dados enviados com Sucesso!"})
    })
})

app.listen(1910, () => {
  console.log("O servidor subiu na porta 1910");
});

module.exports = router;