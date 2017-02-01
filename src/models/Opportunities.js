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