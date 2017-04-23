const AdditionalPoints = require('./AdditionalPoints');
const AdTypes = require('./AdTypes');
const Advertisements = require('./Advertisements');
const Attendance = require('./Attendance');
const Content = require('./Content');
const Events = require('./Events');
const FileTypes = require('./FileTypes');
const Opportunities = require('./Opportunities');
const Participants = require('./Participants');
const Uploads = require('./Uploads');


const Promise = require('bluebird');

module.exports = sync;

function sync() {
    return Participants.sync()
        .then(() => Events.sync)
        .then(() => FileTypes.sync)
        .then(() => Content.sync)
        .then(() => AdTypes.sync)
        .then(() => Advertisements.sync)
        .then(() => Opportunities.sync)
        .then(() => Attendance.sync)
        .then(() => Uploads.sync)
        .then(() => AdditionalPoints.sync);
}