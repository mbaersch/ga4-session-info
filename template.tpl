___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "GA4 Session Info",
  "categories": [
     "UTILITY"
  ],
  "description": "get last event timestamp, session id or time since last event from GA4 session cookie",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "method",
    "displayName": "Cookie identification method",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "measurement_id",
        "displayValue": "Measurement ID"
      },
      {
        "value": "cookiename",
        "displayValue": "Enter cookie name"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "measurement_id"
  },
  {
    "type": "TEXT",
    "name": "measurementId",
    "displayName": "Measurement ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "enablingConditions": [
      {
        "paramName": "method",
        "paramValue": "measurement_id",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "cookieName",
    "displayName": "Cookie name",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "enablingConditions": [
      {
        "paramName": "method",
        "paramValue": "cookiename",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "resultType",
    "displayName": "Result type",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "timestamp",
        "displayValue": "Last event timestamp"
      },
      {
        "value": "duration",
        "displayValue": "Seconds since last event"
      },
      {
        "value": "session_id",
        "displayValue": "Session ID"
      },
      {
        "value": "session_number",
        "displayValue": "Session number"
      },
      {
        "value": "cookie_content",
        "displayValue": "Cookie content"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "timestamp"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Vorlagencode hier eingeben.
const getCookieValues = require("getCookieValues");
const makeString = require("makeString");
const Math = require("Math");

const rt = data.resultType||"timestamp";
const cn = (data.method === "cookiename") ? data.cookieName : (data.measurementId||"").replace('G-', '_ga_');

const cookieValue = makeString(getCookieValues(cn)||"");
const cookieParts = (cookieValue).split(".");

if (rt === "cookie_content") return cookieValue;
if (rt === "session_id") return cookieParts[2];
if (rt === "session_number") return cookieParts[3];
if (rt === "timestamp") return cookieParts[5];
if (rt === "duration") return Math.round(Math.round(require("getTimestampMillis")() / 1000) - cookieParts[5]);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "any"
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

scenarios: []
setup: ''


___NOTES___

Created on 14.8.2023, 00:10:37


