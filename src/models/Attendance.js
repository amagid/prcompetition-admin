const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Attendance = module.exports = db.define('attendance', {
	participant: {
        field: 'participant',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true,
        references: {
            model: Participants,
            key: 'caseid'
        }
    },
	opportunity: {
        field: 'opportunity',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true,
        references: {
            model: Opportunities,
            key: 'opportunity'
        }
    },
	event: {
        field: 'event',
        type: Sequelize.DataTypes.String,
        allowNull: true,
        references: {
            model: Opportunities,
            key: 'event'
        }
    },
	semester: {
        field: 'semester',
        type: Sequelize.DataTypes.Enum('spring','fall'),
        allowNull: false,
        references: {
            model: Opportunities,
            key: 'semester'
        }
    },
	year: {
        field: 'year',
        type: Sequelize.DataTypes.Integer,
        allowNull: false,
        references: {
            model: Opportunities,
            key: 'year'
        }
    },
	date: {
        field: 'date',
        type: Sequelize.DataTypes.Date,
        allowNull: true
    },
	comment: {
        field: 'comment',
        type: Sequelize.DataTypes.String,
        allowNull: true
    }
}, {
    classMethods: {
        findByIds
    }
});

const Participants = require('./Participants');
const Opportunities = require('./Opportunities');

function findByIds(submitter, opportunity) {
    const options = {};

    options.where = {
        submitter,
        opportunity
    };

    return this.constructor.prototype.findOne.call(this, options)
        .then(result => {
            if (result) {
                return result;
            } else {
                throw APIError(404, 'Attendance Record not found.');
            }
        });
}