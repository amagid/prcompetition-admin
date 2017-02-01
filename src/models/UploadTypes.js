const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const UploadTypes = module.exports = db.define('upload_types', {
    name: {
        field: 'name',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        unique: true
    },

    value: {
        field: 'value',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false
    }
});