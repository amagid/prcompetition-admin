const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();
const APIError = require('../APIError');

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
}, {
    classMethods: {
        getSummary,
        findById
    },
    timestamps: false
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
                throw APIError(404, 'Participant not found.');
            }
        });
}