const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Participants = module.exports = db.define('participants', {
    name: {
        field: 'name',
        type: Sequelize.DataTypes.STRING,
        allowNull: false
    },

    caseid: {
        field: 'caseid',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        unique: true
    },

    points: {
        field: 'points',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0
    }
});

const Opportunities = require('./Opportunities');

Participants.belongsToMany(Opportunities, {
    through: 'attendance',
    foreignKey: 'p_id',
    otherKey: 'o_id'
});