___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "YangRong Form",
  "categories": ["LEAD_GENERATION"],
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Tag template for YangRong forms",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "formId",
    "displayName": "Form Id",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "POSITIVE_NUMBER",
        "errorMessage": "Pleas input correct form id",
        "enablingConditions": []
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const queryPermission = require('queryPermission');
const log = require('logToConsole');
const encodeUriComponent = require('encodeUriComponent');
const injectScript = require('injectScript');
const url = 'https://mat001.maverickcrm.com/form/generate.js?id='+data.formId;
if (queryPermission('inject_script', url)) {
  injectScript(url, () => {
    log('Loaded');
    // Call data.gtmOnSuccess when the tag is finished.
    data.gtmOnSuccess();
  }, data.gtmOnFailure);
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://mat001.maverickcrm.com/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Untitled test 1
  code: |-
    const mockData = {
      // Mocked field values
      formId:11
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    assertApi('injectScript').wasCalled();

    // Verify that the tag finished successfully.
    //assertApi('gtmOnSuccess').wasCalled();
- name: Quick Test
  code: runCode();
setup: ''


___NOTES___

Created on 1/11/2021, 4:24:24 PM


