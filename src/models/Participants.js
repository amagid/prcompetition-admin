const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();
const APIError = require('../APIError');

const Participants = module.exports = db.define('participants', {
	caseid: {
        field: 'caseid',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },
	name: {
        field: 'name',
        type: Sequelize.DataTypes.STRING,
        allowNull: false
    },
	points: {
        field: 'points',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0
    }
}, {
    classMethods: {
        getSummary
    }
});

function getSummary() {
    const options = {};
    options.attributes = [
        "name",
        "caseid",
        "points"
    ];
    return this.constructor.prototype.findAll.call(this, options);
}