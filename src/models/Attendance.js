const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Attendance = module.exports = db.define('attendance', {
    date: {
        field: 'date',
        type: Sequelize.DataTypes.DATE,
        allowNull: false
    },
    comment: {
        field: 'comment',
        type: Sequelize.DataTypes.STRING
    }
});