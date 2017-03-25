const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();
const APIError = require('../APIError');

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
        findById,
        create,
        deleteOne,
        update
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

function create(name, multiplier) {
    const fields = {
        name,
        multiplier
    };

    return this.constructor.prototype.create.call(this, fields);
}

function deleteOne(id) {
    const options = {};

    options.where = {
        id
    };

    return this.constructor.prototype.destroy.call(this, options);
}

function update(id, updates) {
    const options = {};

    options.where = {
        id
    };

    return this.constructor.prototype.update.call(this, updates, options);
}