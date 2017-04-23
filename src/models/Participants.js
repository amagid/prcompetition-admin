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
        getSummary,
        recalculateOne,
        recalculateAll
    }
});

function getSummary() {
    const queryString = "SELECT caseid, name, points FROM participants";
    return _executeQuery(queryString);
}

function recalculateOne(caseid) {
    const queryString = "";
    return _executeQuery(queryString);
}

function recalculateAll() {
    const queryString = "";
    return _executeQuery(queryString);
}

//Not sure if this process is accurate for all requests.
function _executeQuery(queryString) {
    return db.query(queryString).then(result => {
        return result[0];
    });
}