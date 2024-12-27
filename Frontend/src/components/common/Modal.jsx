import styled from "styled-components";

const ModalWrapper = styled.div`
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: rgba(28, 30, 34, 0.95); /* Fondo oscuro translúcido */
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
    z-index: 1000;
    color: #04d9b2; /* Texto verde */
    font-family: 'Courier New', Courier, monospace; /* Fuente tipo consola */
    max-width: 90%;
    width: 400px;

    @media (max-width: 768px) {
        width: 90%;
        padding: 15px;
    }
`;

const Overlay = styled.div`
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7); /* Fondo oscuro para el overlay */
    z-index: 999;
`;

const Modal = (props) => {
    if (!props.isOpen) return null;

    return (
        <>
            <Overlay onClick={props.onClose} />
            <ModalWrapper>
                {props.children}
            </ModalWrapper>
        </>
    );
}

export default Modal;