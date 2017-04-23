const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Uploads = module.exports = db.define('uploads', {
	filename: {
        field: 'filename',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true
    },
	extension: {
        field: 'extension',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true
    },
	date: {
        field: 'date',
        type: Sequelize.DataTypes.Date,
        allowNull: true
    },
	used: {
        field: 'used',
        type: Sequelize.DataTypes.Integer,
        allowNull: false,
        defaultValue: 0
    },
	content: {
        field: 'content',
        type: Sequelize.DataTypes.String,
        allowNull: false
    },
	file_type: {
        field: 'file_type',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        references: {
            model: FileTypes,
            key: 'file_type'
        }
    },
	submitter: {
        field: 'submitter',
        type: Sequelize.DataTypes.String,
        allowNull: true,
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

const FileTypes = require('./FileTypes');
const Participants = require('./Participants');
const Events = require('./Events');