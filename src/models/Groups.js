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
});