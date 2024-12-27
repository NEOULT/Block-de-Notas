import styled from "styled-components";

const CardNoteGridWrapper = styled.div`
    margin: auto;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    column-gap: 10px;
    row-gap: 10px;
    max-height: 80vh; /* Altura máxima del contenedor */
    overflow-y: auto; /* Desplazamiento vertical */

    @media (max-width: 1200px) {
        grid-template-columns: repeat(2, 1fr);
    }

    @media (max-width: 768px) {
        grid-template-columns: 1fr;
    }

    /* Estilos para el scroll */
    &::-webkit-scrollbar {
        width: 8px;
    }

    &::-webkit-scrollbar-track {
        background: #1a1a1a; /* Color de fondo del track */
    }

    &::-webkit-scrollbar-thumb {
        background-color: #04d9b2; /* Color del thumb */
        border-radius: 10px;
        border: 2px solid #1a1a1a; /* Espacio alrededor del thumb */
    }
`;

const CardNoteGrid = (props) => {
    return (
        <CardNoteGridWrapper>
            {props.children}
        </CardNoteGridWrapper>
    );
}

export default CardNoteGrid;