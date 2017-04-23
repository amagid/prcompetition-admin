const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Participants = require('./Participants');
const Events = require('./Events');

const AdditionalPoints = module.exports = db.define('additional_points', {
	title: {
        field: 'title',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },
	description: {
        field: 'title',
        type: Sequelize.DataTypes.STRING,
        allowNull: true
    },
	date: {
        field: 'date',
        type: Sequelize.DataTypes.DATE,
        allowNull: true
    },
	value: {
        field: 'value',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false
    },
	recipient: {
        field: 'recipient',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        references: {
            model: Participants,
            key: 'caseid'
        }
    },
	event: {
        field: 'event',
        type: Sequelize.DataTypes.STRING,
        allowNull: true,
        references: {
            model: Events,
            key: 'event'
        }
    },
	semester: {
        field: 'semester',
        type: Sequelize.DataTypes.ENUM('spring','fall'),
        allowNull: false,
        references: {
            model: Events,
            key: 'semester'
        }
    },
	year: {
        field: 'year',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: Events,
            key: 'year'
        }
    }
});