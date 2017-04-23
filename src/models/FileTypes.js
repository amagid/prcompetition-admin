const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();
const APIError = require('../APIError');

const FileTypes = module.exports = db.define('file_types', {
	file_type: {
        field: 'file_type',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true
    },
	value: {
        field: 'value',
        type: Sequelize.DataTypes.Integer,
        allowNull: false
    }
});