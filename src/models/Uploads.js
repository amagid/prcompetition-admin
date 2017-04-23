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
        FOREIGN_KEY
    },
	submitter: {
        field: 'submitter',
        type: Sequelize.DataTypes.String,
        allowNull: true,
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
}, {
    classMethods: {
        findById
    }
});

const Participants = require('./Participants');
const UploadTypes = require('./UploadTypes');
const Groups = require('./Groups');

Uploads.belongsTo(Participants, {
    foreignKey: 'p_id'
});

Uploads.belongsTo(UploadTypes, {
    foreignKey: 'type_id'
});

Uploads.belongsTo(Groups, {
    foreignKey: 'group_id'
});

function findByFileInfo(filename, extension) {
    const options = {};

    options.where = {
        filename,
        extension
    };

    return this.constructor.prototype.findOne.call(this, options)
        .then(result => {
            if (result) {
                return result;
            } else {
                throw APIError(404, 'Upload not found.');
            }
        });
}