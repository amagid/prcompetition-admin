const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Advertisements = module.exports = db.define('advertisements', {
	buyer: {
        field: 'buyer',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true
    },
	event: {
        field: 'event',
        type: Sequelize.DataTypes.String,
        allowNull: false,
        primaryKey: true
    },
	semester: {
        field: 'semester',
        type: Sequelize.DataTypes.Enum('spring','fall'),
        allowNull: false,
        primaryKey: true
    },
	year: {
        field: 'year',
        type: Sequelize.DataTypes.Integer,
        allowNull: false,
        primaryKey: true
    },
	creator: {
        field: 'creator',
        type: Sequelize.DataTypes.String,
        allowNull: true,
        FOREIGN_KEY
    },
	comment: {
        field: 'comment',
        type: Sequelize.DataTypes.String,
        allowNull: true
    },
	interest: {
        field: 'interest',
        type: Sequelize.DataTypes.Integer,
        allowNull: true
    },
	received: {
        field: 'received',
        type: Sequelize.DataTypes.Integer,
        allowNull: true
    },
	paid: {
        field: 'paid',
        type: Sequelize.DataTypes.Integer,
        allowNull: true
    },
	initial_contact_date: {
        field: 'initial_contact_date',
        type: Sequelize.DataTypes.Date,
        allowNull: true
    },
	last_contact_date: {
        field: 'last_contact_date',
        type: Sequelize.DataTypes.Date,
        allowNull: true
    },
	seller: {
        field: 'seller',
        type: Sequelize.DataTypes.String,
        allowNull: true,
        FOREIGN_KEY
    },
	ad_type: {
        field: 'ad_type',
        type: Sequelize.DataTypes.String,
        allowNull: true,
        FOREIGN_KEY
    },
	buyer_type: {
        field: 'buyer_type',
        type: Sequelize.DataTypes.Enum('business','university organization','student organization'),
        allowNull: true,
    }
});