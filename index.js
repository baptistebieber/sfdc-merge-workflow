'use strict';
const fs = require('fs');
const path = require('path');
const workflowsBuilder = require('./lib/utils/workflows-builder');
const asyncReadFile = require('./lib/utils/async-read-file');
const asyncXmlParser = require('./lib/utils/async-xml-parser');

const wfKeys = ['alerts','fieldUpdates','outboundMessages','rules','tasks'];

module.exports = (config,logger) => {

  // Check if we have enough config options
  if(typeof config.workflows === 'undefined' || config.workflows === null) {
    throw new Error('Not enough config options');
  }

  return new Promise((resolve, reject) => {
    Promise.all(config.workflows.map(x => asyncReadFile(x).then(asyncXmlParser)))
    .then(wfs => {
      const newwf = {};
      wfs.forEach((wf) => {
        wfKeys.forEach(k => {
          if(wf.Workflow[k]) {
            if(newwf[k] === undefined || newwf[k] === null) newwf[k] = {};
            wf.Workflow[k].forEach((w) => { newwf[k][w.fullName[0]] = w });
          }
        });
      });
      fs.mkdirSync(path.dirname(config.output), {recursive: true});
      fs.writeFileSync(config.output, workflowsBuilder(newwf));
    })
    .catch(err =>
      reject(new Error(err))
    );
  });
};