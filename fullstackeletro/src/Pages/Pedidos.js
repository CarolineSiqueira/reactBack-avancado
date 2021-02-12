import { useState } from 'react';
import { Form, Button, Row } from 'react-bootstrap';


export default function Pedidos() {
    const [ form, setForm ] = useState({
        nome:"",
        endereco:"",
        fone:"",
        nome_produto:"",
        quantidade:"",
        valor_unitario:"",
        valor_total:""
    });

    const controleMudanca = (evento) => {
       console.log(evento.target.value)
       console.log(form)
           setForm({  
           ...form,
           [evento.target.id]: evento.target.value
       })
       
    }

    const controleEnvio = async (evento) => { 
        evento.preventDefault();        
        const valor_total = parseFloat(form.valor_unitario) * parseFloat(form.quantidade);
        document.getElementById("valor_total").value = `R$ ${valor_total}`;

        const json = JSON.stringify(form);

        const opcoes = {
            crossDomain: true,
            mode: 'cors',
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: json
        }

        const resposta = await fetch('http://localhost:1910/postpedidos',
        opcoes);
        const dados = await resposta.json()
        console.log(dados);
     }

             

    
    return (
        <Row>
            <div className="col-lg-6 col-md-6 mx-auto">
                <Form onSubmit={controleEnvio}>
                    <h4>Fazer Pedido</h4>
                    <Form.Group>
                        <Form.Label>Nome:</Form.Label>
                        <Form.Control onChange={controleMudanca} type="text" id="nome" />
                    </Form.Group>
                    <Form.Group>
                        <Form.Label>Endereço:</Form.Label>
                        <Form.Control onChange={controleMudanca} type="text" id="endereco" />
                    </Form.Group>
                    <Form.Group>
                        <Form.Label>Telefone:</Form.Label>
                        <Form.Control onChange={controleMudanca} type="text" id="fone" />
                    </Form.Group>
                    <Form.Group>
                        <Form.Label>Produto:</Form.Label>
                        <Form.Control onChange={controleMudanca} type="text" id="nome_produto" />
                    </Form.Group>
                    <Form.Group>
                        <Form.Label>Quantidade</Form.Label>
                        <Form.Control onChange={controleMudanca} type="text" id="quantidade" />
                    </Form.Group>
                    <Form.Group>
                        <Form.Label>Valor Unitário:</Form.Label>
                        <Form.Control onChange={controleMudanca} type="text" id="valor_unitario" />
                    </Form.Group>
                    <Form.Group>
                        <Form.Label>Valor Total:</Form.Label>
                        <Form.Control disabled type="text" id="valor_total" />
                    </Form.Group>
                    <Button variant="primary" type="submit">Cadastrar</Button>
                </Form>
            </div>
        </Row>
    )
}