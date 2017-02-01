const APIError = require('../APIError');
const Promise = require('bluebird');

module.exports = validate;

function validate(validator) {
    return (req, res, next) => {
        validator(req);

        return req.getValidationResult().then(result => {
            if (!result.isEmpty()) {
                res.promise(Promise.reject(APIError(400, 'Invalid Request.')));
            } else {
                next();
            }
        }).catch(error => {
            res.promise(Promise.reject(APIError(400, 'Invalid Request.')));
        });
    };
}