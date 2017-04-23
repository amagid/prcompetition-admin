const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Content = module.exports = db.define('content', {
	content: {
        field: 'content',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },
	multiplier: {
        field: 'multiplier',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 1
    }
});