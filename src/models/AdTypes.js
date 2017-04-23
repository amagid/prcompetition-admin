const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const AdTypes = module.exports = db.define('ad_types', {
	ad_type: {
        field: 'ad_type',
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