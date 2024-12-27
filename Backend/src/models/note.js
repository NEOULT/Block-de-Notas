import { DataTypes } from "sequelize";
import sequelize from "../config/database.js";
import User from "./user.js";

const Note = sequelize.define("Note", {
    title: {
        type: DataTypes.STRING,
        allowNull: false
    },
    content: {
        type: DataTypes.STRING,
        allowNull: false
    },

    priority: {
        type: DataTypes.STRING,
        allowNull: false
    },  

    userId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: User,
            key: 'id'
        }
    },
});

Note.belongsTo(User, { foreignKey: 'userId' });
User.hasMany(Note, { foreignKey: 'userId' });

export default Note;