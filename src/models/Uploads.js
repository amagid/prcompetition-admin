const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Uploads = module.exports = db.define('uploads', {
    filename: {
        field: 'filename',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        unique: true
    },

    used: {
        field: 'used',
        type: Sequelize.DataTypes.BOOLEAN,
        allowNull: false
    },

    date: {
        field: 'date',
        type: Sequelize.DataTypes.DATE,
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

function findById(id) {
    const options = {};

    options.where = {
        id
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