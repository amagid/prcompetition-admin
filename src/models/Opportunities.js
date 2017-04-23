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
        type: Sequelize.DataTypes.ENUM('spring','fall'),
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
        removeAttendance      
    }
});

function addAttendance(data) {
    const {opp, event, semester, year} = data;

    const queryString = ``;
    return mysql.executeQuery(queryString);
}

function checkAttendance(caseid, data) {
    const {opp, event, semester, year} = data;

    const queryString = ``;
    return mysql.executeQuery(queryString);
}

function getAttendance(data) {
    const {opp, event, semester, year} = data;

    const queryString = ``;
    return mysql.executeQuery(queryString);
}

function removeAttendance(data) {
    const {opp, event, semester, year} = data;

    const queryString = ``;
    return mysql.executeQuery(queryString);
}