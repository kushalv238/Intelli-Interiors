const path = require('path');
const fs = require('fs');
const fsPromises = require('fs').promises;

const { v4: uuid } = require('uuid');
const { format } = require('date-fns');

const logEvents = async (message, logFileName) => {
    const dateTime = format(new Date(), 'dd/MM/yyy\tHH:mm:ss');
    const logItem = `${dateTime}\t${uuid()}\t${message}\n`;

    try {
        if(!fs.existsSync(path.join(__dirname, '..', 'logs'))) {
            await fsPromises.mkdir(path.join(__dirname, '..', 'logs'));
        }

        await fsPromises.appendFile(path.join(__dirname, '..', 'logs', logFileName), logItem);

    } catch(err) {
        console.error(err)
    }
}

const logger = (req, res, next) => {
    logEvents(`${req.message}\t${req.headers.origin}\t${req.method}\t${req.url}`, 'reqLog.log');
    console.log(`${req.method} ${req.path}`);
    next();
}

module.exports = {logEvents, logger}