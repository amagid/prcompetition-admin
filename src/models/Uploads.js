const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const FileTypes = require('./FileTypes');
const Participants = require('./Participants');
const Events = require('./Events');

const Uploads = module.exports = db.define('uploads', {
	filename: {
        field: 'filename',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },
	extension: {
        field: 'extension',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },
	date: {
        field: 'date',
        type: Sequelize.DataTypes.DATE,
        allowNull: true
    },
	used: {
        field: 'used',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0
    },
	content: {
        field: 'content',
        type: Sequelize.DataTypes.STRING,
        allowNull: false
    },
	file_type: {
        field: 'file_type',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        references: {
            model: FileTypes,
            key: 'file_type'
        }
    },
	submitter: {
        field: 'submitter',
        type: Sequelize.DataTypes.STRING,
        allowNull: true,
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