const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Attendance = module.exports = db.define('attendance', {
	participant: {
        field: 'participant',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true,
        references: {
            model: Participants,
            key: 'caseid'
        }
    },
	opportunity: {
        field: 'opportunity',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true,
        references: {
            model: Opportunities,
            key: 'opportunity'
        }
    },
	event: {
        field: 'event',
        type: Sequelize.DataTypes.String,
        allowNull: true,
        references: {
            model: Opportunities,
            key: 'event'
        }
    },
	semester: {
        field: 'semester',
        type: Sequelize.DataTypes.Enum('spring','fall'),
        allowNull: false,
        references: {
            model: Opportunities,
            key: 'semester'
        }
    },
	year: {
        field: 'year',
        type: Sequelize.DataTypes.Integer,
        allowNull: false,
        references: {
            model: Opportunities,
            key: 'year'
        }
    },
	date: {
        field: 'date',
        type: Sequelize.DataTypes.Date,
        allowNull: true
    },
	comment: {
        field: 'comment',
        type: Sequelize.DataTypes.String,
        allowNull: true
    }
});

const Participants = require('./Participants');
const Opportunities = require('./Opportunities');