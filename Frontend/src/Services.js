const API_URL = import.meta.env.VITE_API_URL;

let userId = null;

export async function getApiNotes() {
    try {
        const token = localStorage.getItem('authToken');
        if (!token) throw new Error('Token not found in localStorage');

        // Decodificar el payload del JWT
        const payloadBase64 = token.split('.')[1];
        const decodedPayload = JSON.parse(atob(payloadBase64));
        userId = decodedPayload.id; // Asumiendo que el token tiene un campo userId

        // Hacer la petición con el token
        const response = await fetch(`${API_URL}/notes/${userId}`, {
            headers: {
                Authorization: `Bearer ${token}`,
            },
        });
        
        const data = await response.json();
        return data;
    } catch (error) {
        console.error('Error fetching notes', error);
    }
}

export async function createApiNote(payload) {

    try {   
        const response = await fetch(`${API_URL}/notes/${userId}`,{
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(payload)
        })
        const data = await response.json();
        
        return data;
        
    } catch (error) {
        console.error('Error creating note', error);  
    }
    
}

export async function updateApiNote(payload) {
    try {        
        const response = await fetch(`${API_URL}/notes/${payload.id}`,{
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(payload)
        })
        const data = await response.json();
        return data;
        
    } catch (error) {
        console.error('Error updating note', error);
    }
}

export async function deleteApiNote(id) {
    try {
        const response = await fetch(`${API_URL}/notes/${id}`,{
            method: 'DELETE',
        })
        const data = await response.json();
        return data;
        
    } catch (error) {
        console.error('Error deleting note', error);
    }
}
