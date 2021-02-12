import { Jumbotron, Container, Row } from 'react-bootstrap';
import {lazy, Suspense} from 'react';

const QuemSomos = lazy(() => import('../Components/QuemSomos'));
const BemVindo = lazy(() => import('../Components/BemVindo'));

export default function Home(){
    return(
      <Row>
        <Jumbotron fluid>
       <Suspense fallback={ <p>Carregando...</p>}>
                <BemVindo />
        </Suspense>
        </Jumbotron>
        <Suspense fallback={ <p>Carregando...</p>}>
                <QuemSomos />
        </Suspense>
      </Row>

      
    )
}