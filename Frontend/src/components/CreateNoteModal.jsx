import { useState } from 'react';
import styled from 'styled-components';
import Modal from './common/Modal';
import { createApiNote } from '../Services';

const FormGroup = styled.div`
    margin-bottom: 15px;
`;

const Label = styled.label`
    display: block;
    margin-bottom: 5px;
    color: #04d9b2; /* Texto verde */
    font-family: 'Courier New', Courier, monospace; /* Fuente tipo consola */
`;

const Input = styled.input`
    width: 100%;
    padding: 10px;
    border: 1px solid ${props => props.error ? 'red' : '#04d9b2'}; /* Borde rojo si hay error */
    border-radius: 5px;
    background: rgba(28, 30, 34, 0.85); /* Fondo oscuro translúcido */
    color: #ffffff; /* Texto blanco */
    font-family: 'Courier New', Courier, monospace; /* Fuente tipo consola */
    outline: none;
    transition: border-color 0.3s ease;

    &:focus {
        border-color: ${props => props.error ? 'red' : '#02b894'}; /* Borde rojo si hay error */
    }
`;

const Textarea = styled.textarea`
    width: 100%;
    height: 100px; /* Altura fija para el textarea */
    padding: 10px;
    border: 1px solid ${props => props.error ? 'red' : '#04d9b2'}; /* Borde rojo si hay error */
    border-radius: 5px;
    background: rgba(28, 30, 34, 0.85); /* Fondo oscuro translúcido */
    color: #ffffff; /* Texto blanco */
    font-family: 'Courier New', Courier, monospace; /* Fuente tipo consola */
    outline: none;
    resize: none; /* Evitar que el usuario cambie el tamaño del textarea */
    transition: border-color 0.3s ease;

    &:focus {
        border-color: ${props => props.error ? 'red' : '#02b894'}; /* Borde rojo si hay error */
    }
`;

const Select = styled.select`
    width: 100%;
    padding: 10px;
    border: 1px solid #04d9b2; /* Borde verde */
    border-radius: 5px;
    background: rgba(28, 30, 34, 0.85); /* Fondo oscuro translúcido */
    color: #ffffff; /* Texto blanco */
    font-family: 'Courier New', Courier, monospace; /* Fuente tipo consola */
    outline: none;
    transition: border-color 0.3s ease;

    &:focus {
        border-color: #02b894; /* Borde verde más oscuro al enfocar */
    }
`;

const Button = styled.button`
    background: #04d9b2; /* Fondo verde */
    border: none;
    border-radius: 7px;
    color: #ffffff; /* Texto blanco */
    text-transform: uppercase;
    font-size: 14px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.3s ease;
    margin-right: 10px;

    &:hover {
        background: #02b894; /* Fondo verde más oscuro al pasar el ratón */
        transform: scale(1.05); /* Aumentar ligeramente el tamaño al pasar el ratón */
    }

    &:active {
        transform: scale(0.95); /* Reducir ligeramente el tamaño al hacer clic */
    }
`;

const CreateNoteModal = (props) => {
    const [formData, setFormData] = useState({
        title: '',
        content: '',
        priority: 'low' // Valor predeterminado
    });

    const [errors, setErrors] = useState({});

    const handleInputOnChange = (e) => {
        const { name, value } = e.target;
        setFormData({
            ...formData,
            [name]: value
        });
        setErrors({
            ...errors,
            [name]: false
        });
    };

    const handleAccept = async () => {
        const newErrors = {};
        if (!formData.title) newErrors.title = 'Title is required';
        if (formData.title.length > 50) newErrors.title = 'Title cannot exceed 50 characters';
        if (!formData.content) newErrors.content = 'Content is required';
        if (formData.content.length > 5000) newErrors.content = 'Content cannot exceed 5000 characters';

        if (Object.keys(newErrors).length > 0) {
            setErrors(newErrors);
            return;
        }

        try {
            await createApiNote(formData);
            props.onCreate();
        } catch (error) {
            console.error('Error creating note:', error);
        }
    };

    return (
        <Modal isOpen={props.isOpen} onClose={props.onClose}>
            <h2>Create a new note</h2>
            <FormGroup>
                <Label htmlFor="title">Title</Label>
                <Input type="text" id="title" name="title" onChange={handleInputOnChange} error={errors.title} />
                {errors.title && <span style={{ color: 'red' }}>{errors.title}</span>}
            </FormGroup>
            <FormGroup>
                <Label htmlFor="content">Content</Label>
                <Textarea id="description" name="content" onChange={handleInputOnChange} error={errors.content} />
                {errors.content && <span style={{ color: 'red' }}>{errors.content}</span>}
            </FormGroup>
            <FormGroup>
                <Label htmlFor="priority">Priority</Label>
                <Select id="priority" name="priority" value={formData.priority} onChange={handleInputOnChange}>
                    <option value="low">Low</option>
                    <option value="medium">Medium</option>
                    <option value="high">High</option>
                </Select>
            </FormGroup>
            <div>
                <Button onClick={handleAccept}>Create</Button>
                <Button onClick={props.onClose}>Cancel</Button>
            </div>
        </Modal>
    );
};

export default CreateNoteModal;