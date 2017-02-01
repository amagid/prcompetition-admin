const Participants = require('./Participants');
const Groups = require('./Groups');
const Opportunities = require('./Opportunities');
const Attendance = require('./Attendance');
const UploadTypes = require('./UploadTypes');
const Uploads = require('./Uploads');
const Promise = require('bluebird');

module.exports = sync;

function sync() {
    return Participants.sync()
        .then(() => Groups.sync)
        .then(() => Opportunities.sync)
        .then(() => Attendance.sync)
        .then(() => UploadTypes.sync)
        .then(() => Uploads.sync);
}