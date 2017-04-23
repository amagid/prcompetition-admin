const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();
const APIError = require('../APIError');

const Participants = module.exports = db.define('participants', {
	caseid: {
        field: 'caseid',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true
    },
	name: {
        field: 'name',
        type: Sequelize.DataTypes.String,
        allowNull: false
    },
	points: {
        field: 'points',
        type: Sequelize.DataTypes.Integer,
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