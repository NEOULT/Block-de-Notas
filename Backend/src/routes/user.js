import { Router } from "express";
import { getUsers, createUser, getUserById, updateUser, deleteUser } from "../controllers/userController.js";

const router = Router();


// Rutas de los usuarios

// Obtener todos los usuarios
router.get('/users', getUsers);

// Crear un nuevo usuario
router.post('/users', createUser);

// Obtener un usuario por ID
router.get('/users/:id', getUserById);

// Actualizar un usuario
router.put('/users/:id', updateUser);

// Eliminar un usuario
router.delete('/users/:id', deleteUser);

export default router;