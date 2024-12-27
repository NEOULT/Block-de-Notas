import Note from "../models/note.js";

// Obtener todas las notas
export const getNotes = async (req, res) => {
    const notes = await Note.findAll();
    res.json(notes);
};

// Obtener notas de un usuario específico
export const getUserNotes = async (req, res) => {
    try {
        const { userId } = req.params;
        const notes = await Note.findAll({ where: { userId } });
        res.json(notes);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Crear una nueva nota para un usuario específico
export const createUserNote = async (req, res) => {
    try {
        const { userId } = req.params;
        const { title, content, priority } = req.body;
        
        if (!title || !content || !priority) {
            return res.status(400).json({ error: 'Title, content, and priority are required' });
        }
        const note = await Note.create({ title, content, priority, userId });
        res.json(note);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Actualizar una nota
export const updateNote = async (req, res) => {
    try {
        const { id } = req.params;
        const { title, content, priority } = req.body;
        const note = await Note.findByPk(id);
        note.title = title;
        note.content = content;
        note.priority = priority;
        await note.save();
        res.json(note);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Eliminar una nota
export const deleteNote = async (req, res) => {
    try {
        const { id } = req.params;
        const note = await Note.findByPk(id);
        await note.destroy();
        res.json({ success: 'Note deleted' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};