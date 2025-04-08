# Integration testing ABAP OpenAPI REST call on GitHub Actions

Prerequsites: [Docker](https://www.docker.com) & [Node.js](https://nodejs.org/en)

Running/compiling:

```bash
npm run docker:start
npm ci
npm run express &
npm test
```

## Diagrams

![overview](/overview.drawio.svg)