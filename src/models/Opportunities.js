const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();
const APIError = require('../APIError');

const Opportunities = module.exports = db.define('opportunities', {
	opportunity: {
        field: 'opportunity',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true
    },
	value: {
        field: 'value',
        type: Sequelize.DataTypes.Integer,
        allowNull: false
    },
	date: {
        field: 'date',
        type: Sequelize.DataTypes.Date,
        allowNull: false
    },
	description: {
        field: 'description',
        type: Sequelize.DataTypes.String,
        allowNull: true
    },
	event: {
        field: 'event',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true,
        references: {
            model: Events,
            key: 'event'
        }
    },
	semester: {
        field: 'semester',
        type: Sequelize.DataTypes.Enum('spring','fall'),
        allowNull: false,
        primaryKey: true,
        references: {
            model: Events,
            key: 'semester'
        }
    },
	year: {
        field: 'year',
        type: Sequelize.DataTypes.Integer,
        allowNull: false,
        primaryKey: true,
        references: {
            model: Events,
            key: 'year'
        }
    }
}, {
    classMethods: {
        findById
    }
});

const Events = require('./Events');

function findByName(opportunity) {
    const options = {};

    options.where = {
        opportunity
    };

    return this.constructor.prototype.findOne.call(this, options)
        .then(result => {
            if (result) {
                return result;
            } else {
                throw APIError(404, 'Opportunity not found.');
            }
        });
}