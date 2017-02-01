const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Opportunities = module.exports = db.define('opportunities', {
    name: {
        field: 'name',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        unique: true
    },

    value: {
        field: 'value',
        type: Sequelize.DataTypes.STRING,
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

const Groups = require('./Groups');
const Participants = require('./Participants');

Opportunities.belongsTo(Groups, {
    foreignKey: 'group_id'
});

Opportunities.belongsToMany(Participants, {
    through: 'attendance',
    foreignKey: 'o_id',
    otherKey: 'p_id'
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
                throw APIError(404, 'Opportunity not found.');
            }
        });
}