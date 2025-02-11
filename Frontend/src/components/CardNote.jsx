import styled from "styled-components";
import PropTypes from 'prop-types';

const CardNoteWrapper = styled.div`
    background-color: ${props => props.backgroundColor || 'rgba(28, 30, 34, 0.85)'}; /* Fondo oscuro translúcido */
    padding: 20px;
    border-radius: 12px;
    display: flex;
    flex-direction: column;
    margin: 10px;
    border: 1px solid ${props => props.borderColor || '#04d9b2'}; /* Borde verde */
    box-shadow: 0 15px 25px rgba(0, 0, 0, 0.5); /* Sombra para darle profundidad */
    animation: fadeIn 1s ease-in-out;
    max-width: 400px; /* Ancho máximo para la tarjeta */
    overflow: hidden; /* Ocultar contenido desbordado */

    @media (max-width: 768px) {
        padding: 15px;
        margin: 5px;
        max-width: 100%; /* Ancho completo en pantallas pequeñas */
    }
`;

const CardNoteBody = styled.div`
    display: flex;
    flex-direction: column;
    align-items: start;
    flex-grow: 1; /* Permite que el cuerpo crezca para llenar el espacio disponible */
    overflow: hidden; /* Ocultar contenido desbordado */

    > h2, p {
        margin: 5px 0;
        color: ${props => props.textColor || '#04d9b2'}; /* Texto verde */
        font-family: 'Courier New', Courier, monospace; /* Fuente tipo consola */
        white-space: nowrap; /* Evitar que el texto se desborde en varias líneas */
        overflow: hidden; /* Ocultar contenido desbordado */
        text-overflow: ellipsis; /* Añadir puntos suspensivos al final del texto desbordado */
    }

    > h2 {
        font-size: 18px;
        @media (max-width: 768px) {
            font-size: 16px;
        }
    }

    > p {
        font-size: 16px;
        @media (max-width: 768px) {
            font-size: 14px;
        }
    }
`;

const CardNoteFooter = styled.div`
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    margin-top: 10px; /* Espacio entre el cuerpo y el pie de la tarjeta */
`;

const ActionButton = styled.button`
    text-transform: uppercase;
    color: ${(props) => (props.isRemove ? "#ff4d4d" : "#04d9b2")}; /* Rojo para eliminar, verde para editar */
    font-size: 14px;
    background: none;
    border: 1px solid ${(props) => (props.isRemove ? "#ff4d4d" : "#04d9b2")}; /* Borde del color correspondiente */
    cursor: pointer;
    padding: 5px 10px;
    border-radius: 8px;
    transition: background-color 0.3s, color 0.3s;

    &:hover {
        background-color: ${(props) => (props.isRemove ? "#ff4d4d" : "#04d9b2")}; /* Fondo del color correspondiente al pasar el ratón */
        color: #fff; /* Texto blanco al pasar el ratón */
    }

    @media (max-width: 768px) {
        justify-content: center;
    }
`;

const CardNote = (props) => {
    return (
        <CardNoteWrapper
            backgroundColor={props.cardConfig.backgroundColor}
            borderColor={props.cardConfig.borderColor}
            textColor={props.cardConfig.textColor}
        >
            <CardNoteBody textColor={props.cardConfig.textColor}>
                <h2>{props.title}</h2>
                <p>{props.description}</p>
            </CardNoteBody>
            <CardNoteFooter>
                <ActionButton onClick={props.onEdit}>Edit</ActionButton>
                <ActionButton isRemove onClick={props.onRemove}>Delete</ActionButton>
            </CardNoteFooter>
        </CardNoteWrapper>
    );
}

CardNote.propTypes = {
    title: PropTypes.string.isRequired,
    description: PropTypes.string.isRequired,
    onEdit: PropTypes.func.isRequired,
    onRemove: PropTypes.func.isRequired,
    cardConfig: PropTypes.shape({
        backgroundColor: PropTypes.string,
        borderColor: PropTypes.string,
        textColor: PropTypes.string
    }).isRequired
};

export default CardNote;