const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Groups = module.exports = db.define('groups', {
    name: {
        field: 'name',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        unique: true
    },

    multiplier: {
        field: 'multiplier',
        type: Sequelize.DataTypes.INTEGER,
        allowNUll: false,
        defaultValue: 1
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
                throw APIError(404, 'Group not found.');
            }
        });
}