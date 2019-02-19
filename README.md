# kc2wong-itsmicrosrv-tools
Some scripts and tools for kc2wong's itsmicrosrv project. For details of itsmicrosrv project, please client [here](https://github.com/kc2wong/itsmicrosrv)

  - Startup and Shutdown scripts for Spring Cloud mode and monolithic mode of itsmicrosrv
    - run\_monolith\_mode.sh
    - stop\_monolith\_mode.sh
    - run\_spring\_cloud\_mode.sh
    - stop\_spring\_cloud\_mode.sh  
  - Startup and Shutdown scripts for each modules
    - start\_itsXXX.sh
    - stop\_itsXXX.sh
  - Check the status of each module
    - check\_app\_status.sh
  - Tools for testing APIs
    - test\_get\_hkd\_currency.sh
    - test\_get\_order.sh
    - test\_get\_account.sh
    - test\_get\_market\_data.sh

---

## Installation

1. Deploy "scripts" directory to the home directory of itsmicrosrv
2. Set "project\_home" in "scripts/linux/admin/setenv.sh. For exmaple:
```
project_home=/home/yuenyuen/itsmicrosrv-master
```

## Usage

### Start itsmicrosrv in monolithic mode
```
cd ${project_home}/scripts/linux/admin
./run_monolith_mode.sh   

Wait until complete. Timeout is set to 180s.
```

### Stop itsmicrosrv in monolithic mode
```
cd ${project_home}/scripts/linux/admin
./stop_monolith_mode.sh

The application will be stopped immediately.
```

### Start itsmicrosrv in Spring Cloud mode
```
cd ${project_home}/scripts/linux/admin
./run_spring_cloud_mode.sh

Wait until complete. Timeout is set to 180s for each module. (Stupid version. The modules will be started one by one. )
```

### Stop itsmicrosrv in Spring Cloud mode
```
cd ${project_home}/scripts/linux/admin
./stop_spring_cloud_mode.sh

All modules will be stopped immediately.
```

### Start a single module (For example, start itsdiscovery.)
```
cd ${project_home}/scripts/linux/admin
./start_itsdiscovery.sh

Wait until complete. Timeout is set to 180s. Other scripts are ready for starting itsconfig, itsauthen and etc...
```

### Stop a single module (For example, stop itsdiscovery.)
```
cd ${project_home}/scripts/linux/admin
./stop_itsdiscovery.sh

The module will be stopped immediately. Other scripts are ready for stopping itsconfig, itsauthen and etc...
```

### Stop a single module (For example, stop itsdiscovery.)
```
cd ${project_home}/scripts/linux/admin
./check_app_status.sh

Sample output:

==============================
Application Status
==============================
itsmonolith     [STARTED]
itsdiscovery    [SHUTDOWN]
itsconfig       [SHUTDOWN]
itsauthen       [SHUTDOWN]
itsstaticdata   [SHUTDOWN]
itsaccount      [SHUTDOWN]
itsorder        [SHUTDOWN]
itsmarketdata   [SHUTDOWN]
itsgateway      [SHUTDOWN]
==============================
```

### Scripts for testing API (For exmaple, test static data related APIs)
```
cd ${project_home}/scripts/linux/test_tools
./test_get_hkd_currency.sh

Sample output:

TOKEN
====================
Bearer eyJhbGciOiJIUzUxMiJ9.eyJ1c2VyT2lkIjoiNjAwMDEwMDMwMyIsInN1YiI6IkFEMjkyMzcwMiIsImF1dGgiOiJINHNJQUFBQUFBQUFBQTJVaHhIRElBQURWeklkeGdIY2U3ZVQrK0dURFhUUzZ3c0VFb1hHWUhGNEFwRkVwcVNpcHFHbG8yZGdaR0ptWVdWajUrRGs0dWJoNWNNWFVTQUVRaUlVUWlNTXdpSWN3aU1DSWlJU0lpTktSSVdvRVEyaVJYU0lIakVnUnNTRW1CRUxZa1ZzaUIxeElFN0VoYmdSRCtKRmZCQmZaSUg4cDVaSWhkUklnN1JJaC9USWdJekloTXpJRWxraGEyU0RiSkVkc2tjT3lCRTVJV2ZrZ2x5UkczSkhIc2dUZVNGdjVJTjhrUi9rRjFXZ0JPcGZrVUpwbEVGWmxFTjVWRUJGVkVKbFZJbXFVRFdxUWJXb0R0V2pCdFNJbWxBemFrR3RxQTIxb3c3VWlicFFOK3BCdmFnUDZvc3UwQUl0MGY4OU5OcWdMZHFoUFRxZ0l6cWhNN3BFVitnYTNhQmJkSWZ1MFFONlJFL29HYjJnVi9TRzN0RUgra1JmNkJ2OW9GLzBCLzNGRkJpQmtSaUYrWTl2TUJiak1CNFRNQkdUTUJsVFlpcE1qV2t3TGFiRDlKZ0JNMkltekl4Wk1DdG13K3lZQTNOaUxzeU5lVEF2NW9QNVlndXN3RXFzd21yc256U0xkVmlQRGRpSVRkaU1MYkVWdHNZMjJCYmJZWHZzZ0IyeEUzYkdMdGdWdTJGMzdJRTlzUmYyeGo3WUYvdkJmbkVGVHVBa1R1RTB6dUQrV0R1Y3h3VmN4Q1ZjeHBXNENsZmpHbHlMNjNBOWJzQ051QWszNHhiY2l0dHdPKzdBbmJnTGQrTWUzSXY3NEw3NEFpL3dFcS93R20vd0Z2Ly9rTWNIZk1RbmZNYVgrQXBmNHh0OGkrL3dQWDdBai9nSlArTVgvSXJmOER2K3dKLzRDMy9qSC95TC8rQy9oSUlnQ0pLZ0NKcGdDSmJnQ1AvREJrSWtKRUltbElTS1VCTWFRa3ZvQ0QxaElJeUVpVEFURnNKSzJBZzc0U0NjaEl0d0V4N0NTL2dRdnNTQ0tJaVNxSWlhYUlpVzZJaWUrTGRESkNaaUpwYkVpbGdURzJKTDdJZzljU0NPeElrNEV4ZmlTdHlJTy9FZ25zU0xlQk1mNGt2OEVMK2tnaVJJa3FSSW1tUklsdVJJbmhSSWZ4VWxVaWFWcElwVWt4cFNTK3BJUFdrZ2phU0pOSk1XMGtyYVNEdnBJSjJraTNTVEh0SkwrcEMrNUlJc3lKS3N5SnBzeUpic3lKNGN5Skg4OTE0bWwrU0tYSk1iY2t2dXlEMTVJSS9raVR5VEYvSkszc2c3K1NDZjVPc0huREg5OEVnRkFBQT0iLCJleHAiOjE1NTA2NjY0NDZ9.osZlpcPVolbkdVT2t6G-wbcgsrS9DEMyD9rC5eNs6QPNF7ArQgT8IrutCTpd82pXto2a9ctX7Qm4UxciJTsDjA
====================

RESULT
====================
{"currencyCode":"HKD","isoCode":"HKD","decimalPoint":2,"descptDefLang":"Hong Kong Dollar","descpt2ndLang":"港幣","descpt3rdLang":"港币","unitName":"Dollar","subUnitName":"Cent","lastModUser":"SYSADMALL","lastModTimestamp":"2011-11-19 09:17:46","syncstr":"2000/01/01 00:00:00","status":"A","version":1}
====================

Other scripts are ready for testing order, trading accout, market data related APIs
```

