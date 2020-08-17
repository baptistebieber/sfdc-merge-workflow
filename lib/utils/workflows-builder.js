'use strict';
const xmlbuilder = require('xmlbuilder');

const xmlElements = ['value', 'description', 'formula', 'name', 'literalValue', 'label', 'endpointUrl', 'subject'];
const wfKeys = ['alerts','fieldUpdates','outboundMessages','rules','tasks'];

const cleanData = (e) => {
  let re = new RegExp('\'',"gi");
  e = e.replace(re, '&apos;');
  let elems = xmlElements.join('|');
  re = new RegExp('(<(' + elems + ')>.*?)"(.*?</(' + elems + ')>)',"gi");
  while(e.match(re) != null) {
    e = e.replace(re, '$1&quot;$3');
  }
  return e;
}

const workflowsBuilder = (wf) => {
  const xml = xmlbuilder.create('Workflow')
  .att('xmlns', 'http://soap.sforce.com/2006/04/metadata')
  .dec('1.0', 'UTF-8');

  wfKeys.forEach(k => {
    if(wf[k] !== undefined && wf[k] !== null) {
      Object.keys(wf[k]).sort().forEach(i=>{
        let elem = xml.ele(k);
        elem.ele(wf[k][i]);
        // Object.entries(wf[i]).forEach((e) => elem.ele(e[0],e[1][0]))
      });
    }
  });
  return cleanData(xml.end({ pretty: true, indent: '    ', newline: '\n' })) + '\n';
};
module.exports = workflowsBuilder;