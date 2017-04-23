const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Events = module.exports = db.define('events', {
	event: {
        field: 'event',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true
    },
	semester: {
        field: 'semester',
        type: Sequelize.DataTypes.Enum('spring','fall'),
        allowNull: false,
        primaryKey: true
    },
	year: {
        field: 'year',
        type: Sequelize.DataTypes.Integer,
        allowNull: false,
        primaryKey: true
    },
	multiplier: {
        field: 'multiplier',
        type: Sequelize.DataTypes.Integer,
        allowNull: false,
        defaultValue: 1
    }
});