# GA4 Session Info

**Custom Variable Template for Google Tag Manager**

Reads GA4 `_ga_xxxxxx` cookie and extracts data 

[![Template Status](https://img.shields.io/badge/Community%20Template%20Gallery%20Status-published-green)](https://tagmanager.google.com/gallery/#/owners/mbaersch/templates/ga4-session-info) ![Repo Size](https://img.shields.io/github/repo-size/mbaersch/ga4-session-info) ![License](https://img.shields.io/github/license/mbaersch/ga4-session-info)

---

## Usage
Pick a method to determine a cookie name for the right session either by entering the cookie name or just the measurement id for a data stream.

### Result type
Chose what value to return:
  - **Last event timestamp**: GA4 updates a timestamp every time an event is sent
  - **Seconds since last event**: calculates elapsed time since last event timestamp
  - **Session ID**: id for current session (matches timestamp of session start)
  - **Session number**: number of current session 
  - **Session engaged marker**: 1 if session is engaged, otherwise 0
  - **User ID hash**: hash if user id is set
  - **Cookie value**: full cookie value (undecoded)     
