const { Schema, model } = require('mongoose')

const ContatoSchema = new Schema({
    nome: {
        type: String,
    },
    mensagem: {
        type: String,
    }
})

modelo = model("contato", ContatoSchema)

module.exports = modelo