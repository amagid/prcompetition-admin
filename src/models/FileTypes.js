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
}, {
    classMethods: {
        findById
    }
});

function findByName(file_type) {
    const options = {};

    options.where = {
        file_type
    };

    return this.constructor.prototype.findOne.call(this, options)
        .then(result => {
            if (result) {
                return result;
            } else {
                throw APIError(404, 'Upload Type not found.');
            }
        });
}