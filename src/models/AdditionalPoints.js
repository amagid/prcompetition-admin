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
        references: {
            model: Participants,
            key: 'caseid'
        }
    },
	event: {
        field: 'event',
        type: Sequelize.DataTypes.String,
        allowNull: true,
        references: {
            model: Events,
            key: 'event'
        }
    },
	semester: {
        field: 'semester',
        type: Sequelize.DataTypes.Enum('spring','fall'),
        allowNull: false,
        references: {
            model: Events,
            key: 'semester'
        }
    },
	year: {
        field: 'year',
        type: Sequelize.DataTypes.Integer,
        allowNull: false,
        references: {
            model: Events,
            key: 'year'
        }
    }
});

const Participants = require('./Participants');
const Events = require('./Events');