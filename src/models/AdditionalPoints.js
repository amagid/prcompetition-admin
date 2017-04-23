const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const AdditionalPoints = module.exports = db.define('additional_points', {
	title: {
        field: 'title',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true
    },
	description: {
        field: 'title',
        type: Sequelize.DataTypes.String,
        allowNull: true
    },
	date: {
        field: 'date',
        type: Sequelize.DataTypes.Date,
        allowNull: true
    },
	value: {
        field: 'value',
        type: Sequelize.DataTypes.Integer,
        allowNull: false
    },
	recipient: {
        field: 'recipient',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        FOREIGN_KEY
    },
	event: {
        field: 'event',
        type: Sequelize.DataTypes.String,
        allowNull: true,
        FOREIGN_KEY
    },
	semester: {
        field: 'semester',
        type: Sequelize.DataTypes.Enum('spring','fall'),
        allowNull: false
    },
	year: {
        field: 'year',
        type: Sequelize.DataTypes.Integer,
        allowNull: false
    }
});