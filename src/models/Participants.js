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
        getSummary,
        findById
    }
});

const Opportunities = require('./Opportunities');

Participants.belongsToMany(Opportunities, {
    through: 'attendance',
    foreignKey: 'p_id',
    otherKey: 'o_id'
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

function findByCaseID(caseid) {
    const options = {};

    options.where = {
        caseid
    };

    return this.constructor.prototype.findOne.call(this, options)
        .then(result => {
            if (result) {
                return result;
            } else {
                throw APIError(404, 'Participant not found.');
            }
        });
}