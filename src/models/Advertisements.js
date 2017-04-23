const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Participants = require('./Participants');
const AdTypes = require('./AdTypes');

const Advertisements = module.exports = db.define('advertisements', {
	buyer: {
        field: 'buyer',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },
	event: {
        field: 'event',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },
	semester: {
        field: 'semester',
        type: Sequelize.DataTypes.ENUM('spring','fall'),
        allowNull: false,
        primaryKey: true
    },
	year: {
        field: 'year',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true
    },
	creator: {
        field: 'creator',
        type: Sequelize.DataTypes.STRING,
        allowNull: true,
        references:  {
            model: Participants,
            key: 'caseid'
        }
    },
	comment: {
        field: 'comment',
        type: Sequelize.DataTypes.STRING,
        allowNull: true
    },
	interest: {
        field: 'interest',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: true
    },
	received: {
        field: 'received',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: true
    },
	paid: {
        field: 'paid',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: true
    },
	initial_contact_date: {
        field: 'initial_contact_date',
        type: Sequelize.DataTypes.DATE,
        allowNull: true
    },
	last_contact_date: {
        field: 'last_contact_date',
        type: Sequelize.DataTypes.DATE,
        allowNull: true
    },
	seller: {
        field: 'seller',
        type: Sequelize.DataTypes.STRING,
        allowNull: true,
        references: {
            model: Participants,
            key: 'caseid'
        }
    },
	ad_type: {
        field: 'ad_type',
        type: Sequelize.DataTypes.STRING,
        allowNull: true,
        references: {
            model: AdTypes,
            key: 'ad_type'
        }
    },
	buyer_type: {
        field: 'buyer_type',
        type: Sequelize.DataTypes.ENUM('business','university organization','student organization'),
        allowNull: true,
    }
});