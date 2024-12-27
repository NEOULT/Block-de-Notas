import styled from "styled-components";

const StyledButton = styled.button`
    background: #04d9b2; /* Fondo verde */
    border: none;
    border-radius: 7px;
    font-family: 'Courier New', Courier, monospace;
    color:rgb(0, 0, 0); /* Texto blanco */
    text-transform: uppercase;
    font-size: 14px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.3s ease;

    &:hover {
        background: #02b894; /* Fondo verde más oscuro al pasar el ratón */
        transform: scale(1.05); /* Aumentar ligeramente el tamaño al pasar el ratón */
    }

    &:active {
        transform: scale(0.95); /* Reducir ligeramente el tamaño al hacer clic */
    }

    @media (max-width: 768px) {
        font-size: 12px;
        padding: 8px 16px;
    }
`;

const HeaderActionButton = (props) => {
    return (
        <StyledButton onClick={props.onClick}>New Note</StyledButton>
    );
}

export default HeaderActionButton;