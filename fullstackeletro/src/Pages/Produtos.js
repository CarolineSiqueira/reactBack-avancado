import {useState, useEffect} from 'react';


import Produto from '../Components/Produto'
import { Container, Row } from 'react-bootstrap'

export default function Produtos() {
    const [ produtos, setProdutos] = useState([]);

    useEffect (async () =>  {
        const resposta = await fetch('http://localhost:1910/')
        const dados = await resposta.json()
        setProdutos(dados);        
    }, []);
    

    return (
        <Container>
            <Row>
            {produtos && produtos.map(item => <Produto categoria={item.fogao} descricao={item.descricao} preco={item.preco}
             precofinal={item.precofinal} imagem={item.imagem} />)}
            </Row>
        </Container>
        
    )
}