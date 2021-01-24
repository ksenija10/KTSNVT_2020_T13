# Serbioneer

![Project Image](serbioneer-front/src/assets/images/baner_pozadina.png)

---

### Table of Contents

-   [Description](#description)
-   [How To Use](#how-to-use)
-   [License](#license)
-   [Author Info](#author-info)

---

## Description

Application that allows users to view cultural sites in Serbia and find information about specific cultural sites.
Users can subscribe, comment and receive news about subscribed sites.
Admins can add new cultural sites, categories and types.

### Technologies

-   Spring Boot
-   Angular
-   TypeScript
-   Java
-   Python
-   Maven
-   Selenium
-   Balsamiq
-   Jasmine
-   Karma

[Back To The Top](#serbioneer)

---

## How To Use

### Installation

For this application you need to have:
[Java](https://jdk.java.net/15/) v11 +
[NodeJS](https://nodejs.org/download/release/v14.15.1/) v14.15.1

#### Backend

For installation of application backend position yourself in KTSNVT_2020_T13/serbioneer folder
with command:

```
cd .\KTSNVT_2020_T13\serbioneer\
```

To install dependencies run:

```
mvn clean install
```

And finally to start server run:

```
mvn spring-boot:run
```

#### Frontend

Make sure you use the latest version of the CLI ([upgrade guide](#upgrade))

For installation of application frontend position yourself in KTSNVT_2020_T13/serbioneer-front
folder with command:

```
cd .\KTSNVT_2020_T13\serbioneer-front\
```

To install dependencies run:

```
npm install
```

To run frontend application run:

```
ng serve --ssl
```

### <a id="upgrade"></a>How to upgrade the CLI

To upgrade the CLI run commands

#### Windows

```
npm uninstall -g angular-cli @angular/cli
npm cache clean --force
npm install -g @angular/cli
```

#### Linux/Mac

```
sudo npm uninstall -g angular-cli @angular/cli
npm cache clean --force
sudo npm install -g @angular/cli
```

[Back To The Top](#serbioneer)

---

## License

MIT License

Copyright (c) [2021][tim13]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[Back To The Top](#serbioneer)

---

## Authors Info

-   [Ksenija Prćić](https://github.com/ksenija10)
-   [Eva Janković](https://github.com/evaj10)
-   [Milica Filipović](https://github.com/fmilica)
-   [Igor Lukić](https://github.com/cigor99)

[Back To The Top](#serbioneer)
