import { Router } from "express";
import { getNotes, getUserNotes, createUserNote, updateNote, deleteNote } from "../controllers/noteController.js";

const router = Router();

// Rutas de las notas

// Obtener todas las notas
router.get('/notes', getNotes);

// Obtener notas de un usuario específico
router.get('/notes/:userId', getUserNotes);

// Crear una nueva nota para un usuario específico
router.post('/notes/:userId', createUserNote);

// Actualizar una nota
router.put('/notes/:id', updateNote);

// Eliminar una nota
router.delete('/notes/:id', deleteNote);

export default router;