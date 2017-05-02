const Sequelize = require('sequelize');
const mysql = require('../services/mysql');
const db = mysql.connection();
const APIError = require('../APIError');

const Events = require('./Events');

const Opportunities = module.exports = db.define('opportunities', {
    opportunity: {
        field: 'opportunity',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },
    value: {
        field: 'value',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false
    },
    date: {
        field: 'date',
        type: Sequelize.DataTypes.DATE,
        allowNull: false
    },
    description: {
        field: 'description',
        type: Sequelize.DataTypes.STRING,
        allowNull: true
    },
    event: {
        field: 'event',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        primaryKey: true,
        references: {
            model: Events,
            key: 'event'
        }
    },
    semester: {
        field: 'semester',
        type: Sequelize.DataTypes.ENUM('spring', 'fall'),
        allowNull: false,
        primaryKey: true,
        references: {
            model: Events,
            key: 'semester'
        }
    },
    year: {
        field: 'year',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        references: {
            model: Events,
            key: 'year'
        }
    }
}, {
    classMethods: {
        addAttendance,
        checkAttendance,
        getAttendance,
        removeAttendance,
        create,
        search,
        update,
        deleteOne
    }
});

function addAttendance(caseid, data) {
    const {
        opp,
        event,
        semester,
        year,
        date
    } = data;

    const queryString = `INSERT INTO attendance VALUES ("${caseid}", "${opp}", "${event}", "${semester}", "${year}", "${date}", NOW(), NOW(), NULL, NULL);`;
    return mysql.executeQuery(queryString);
}

function checkAttendance(caseid, data) {
    const {
        opp,
        event,
        semester,
        year
    } = data;

    const queryString = `SELECT * FROM attendance a WHERE a.opportunity = "${opp}" AND a.event = "${event}" AND a.semester = "${semester}" AND a.year = "${year}" AND a.participant = "${caseid}";`;
    return mysql.executeQuery(queryString).then(result => {
        return !!result.length;
    });
}

function getAttendance(data) {
    const {
        opp,
        event,
        semester,
        year
    } = data;

    const queryString = `SELECT a.participant FROM opportunities o INNER JOIN attendance a ON o.opportunity = a.opportunity AND o.semester = a.semester AND o.year = a.year AND o.date = a.date and o.event = a.event WHERE o.opportunity = "${opp}" AND o.semester = "${semester}" AND o.year = "${year}" AND o.event = "${event}";`;
    return mysql.executeQuery(queryString);
}

function removeAttendance(caseid, data) {
    const {
        opp,
        event,
        semester,
        year
    } = data;

    const queryString = `DELETE FROM attendance WHERE participant="${caseid}" AND opportunity="${opp}" AND semester = "${semester}" AND year = "${year}" AND event = "${event}";`;
    return mysql.executeQuery(queryString);
}

function create(data) {
    const {
        opp,
        value,
        date,
        description,
        event,
        semester,
        year
    } = data;

    const queryString = `INSERT into opportunities (opportunity, value, date, description, event, semester, year, created_at, updated_at, deleted_at) VALUES ("${opp}", "${value}", "${date}", "${description}", "${event}", "${semester}", "${year}", NOW(), NOW(), NULL);`;
    return mysql.executeQuery(queryString);
}

function search(query) {
    const queryString = `SELECT opportunity, value, date, description, event, semester, year FROM opportunities;`;
    return mysql.executeQuery(queryString);
}

function update(data) {
    const {keyOpp, keyEvent, keySemester, keyYear, opp, value, date, desc, event, sem, year} = data;
    const queryString = `UPDATE opportunities set opportunity="${opp}", value="${value}", date="${date}", description="${desc}", event="${event}", semester="${sem}", year="${year}" WHERE opportunity="${keyOpp}" AND event="${keyEvent}" AND semester="${keySemester}" AND year="${keyYear}";`
    return mysql.executeQuery(queryString);
}

function deleteOne(opp, data) {
    const { opportunity, event, semester, year } = data;
    const queryString = `DELETE FROM opportunities WHERE opportunity="${opportunity}" AND event="${event}" AND semester="${semester.toLowerCase()}" AND year="${year}";`;

    return mysql.executeQuery(queryString);
}