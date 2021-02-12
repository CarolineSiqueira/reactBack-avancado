import Menu from './Components/Menu'
import Rotas from './rotas.js'
import { lazy, Suspense} from 'react';

import './App.css'

import { BrowserRouter } from 'react-router-dom';

import { Container } from 'react-bootstrap';

const Rodape = lazy(() => import('./Components/rodape'));



function App() {
  return (
    <BrowserRouter>
      <div className="App">
        <header>
          <Menu />
        </header>
        <main>
          <Container fluid>
            <Rotas />
            <Suspense fallback={ <p>Carregando...</p>}>
               <Rodape />
            </Suspense>
          </Container>
        </main>
      </div>    
    </BrowserRouter>
   
  );
}

export default App;
