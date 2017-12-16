# Document Management - Performance Tests
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/hmcts/document-management-performance-tests.svg?branch=master)](https://travis-ci.org/hmcts/document-management-performance-tests)
[![codecov](https://codecov.io/gh/hmcts/document-management-performance-tests/branch/master/graph/badge.svg)](https://codecov.io/gh/hmcts/document-management-performance-tests) 
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/7404b261716741eb8bbd25e52ccc85af)](https://www.codacy.com/app/HMCTS/document-management-performance-tests)
[![Known Vulnerabilities](https://snyk.io/test/github/hmcts/document-management-performance-tests/badge.svg)](https://snyk.io/test/github/hmcts/document-management-performance-tests)

This repo contains the tests for verifying the performance between document management
and its dependencies.

## Quickstart
### Clone Repo

```bash
#Clone repo
git clone https://github.com/hmcts/document-management-performance-tests.git
cd document-management-performance-tests/
#Run Tests
./testme.sh
```
### Environment Variables
- DM_GW_BASE_URI - The base url of Document Management Api Gateway Web server
- DM_STORE_BASE_URI - The base url of Document Management Store App server
- IDAM_USER_BASE_URI - The base url of IDAM User server
- IDAM_S2S_BASE_URI - The base url of IDAM S2S server

### Run Performance Tests
```bash
./testme.sh
```
