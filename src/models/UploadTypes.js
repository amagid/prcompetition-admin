const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const UploadTypes = module.exports = db.define('upload_types', {
    name: {
        field: 'name',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        unique: true
    },

    value: {
        field: 'value',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false
    }
}, {
    classMethods: {
        findById
    }
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
                throw APIError(404, 'Upload Type not found.');
            }
        });
}