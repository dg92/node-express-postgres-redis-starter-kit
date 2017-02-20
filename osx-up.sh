echo '******** lets name your project now ********'
echo -n "Enter your project name > "
read projectname
mkdir $projectname
cd $projectname

echo 'We are ready now so lets setup project
---------------------------------------------------'
npm init

echo 'lets add git to it'
git init
echo 'Creating .gitignore'
touch .gitignore
echo "
node_modules
npm-debug.log
/config.js
/*.pid
*.rdb
.DS_Store
" >> .gitignore

cp ../migration.babel.stub migration.babel.stub

echo 'Now let us install some dev dependencies
---------------------------------------------------'
npm install --save-dev babel-cli@6.10.1 babel-core@6.10.4 babel-eslint@4.1.6 babel-plugin-add-module-exports@0.2.1 babel-polyfill@6.9.1 nodemon@1.8.1
npm install --save-dev babel-preset-es2015@6.9.0 babel-preset-stage-0@6.5.0 eslint@1.10.3 eslint-plugin-babel@3.0.0 eslint-plugin-react@3.12.0 supertest@1.2.0
echo 'and some more dependencies
---------------------------------------------------'
npm install --save bcrypt body-parser cors errorhandler express lodash moment rand-token request-promise tabel pg
echo '******** Dependencies installed successfully *********'

echo 'creating .babelrc'
touch .babelrc
echo '
{
  "presets": ["stage-0", "es2015"],
  "plugins": [
    "add-module-exports"
  ]
}
' >> .babelrc

echo 'Creating .eslintrc'
touch .eslintrc

echo '
{
  "ecmaFeatures": {
    "arrowFunctions": true,
    "binaryLiterals": false,
    "blockBindings": true,
    "classes": true,
    "defaultParams": true,
    "destructuring": true,
    "forOf": true,
    "generators": true,
    "modules": true,
    "objectLiteralComputedProperties": true,
    "objectLiteralDuplicateProperties": false,
    "objectLiteralShorthandMethods": true,
    "objectLiteralShorthandProperties": true,
    "octalLiterals": false,
    "regexUFlag": false,
    "regexYFlag": false,
    "restParams": true,
    "spread": true,
    "superInFunctions": true,
    "templateStrings": true,
    "unicodePointEscapes": true,
    "globalReturn": false,
    "jsx": true
  },
  "env": {
    "browser": true,
    "node": true,
    "mocha": true
  },
  "parser": "babel-eslint",
  "plugins": [
    "babel",
    "react"
  ],
  "rules": {

    /*Possible Errors */
    "comma-dangle": [1, "never"],
    "no-cond-assign": [1, "except-parens"],
    "no-console": 0,
    "no-constant-condition": 1,
    "no-control-regex": 1,
    "no-debugger": 1,
    "no-dupe-args": 1,
    "no-dupe-keys": 1,
    "no-duplicate-case": 0,
    "no-empty-character-class": 1,
    "no-empty": 1,
    "no-ex-assign": 1,
    "no-extra-boolean-cast": 1,
    "no-extra-parens": 0,
    "no-extra-semi": 1,
    "no-func-assign": 1,
    "no-inner-declarations": [1, "functions"],
    "no-invalid-regexp": 1,
    "no-irregular-whitespace": 1,
    "no-negated-in-lhs": 1,
    "no-obj-calls": 1,
    "no-regex-spaces": 1,
    "no-reserved-keys": 0,
    "no-sparse-arrays": 1,
    "no-unexpected-multiline": 1,
    "no-unreachable": 1,
    "use-isnan": 1,
    "valid-jsdoc": 1,
    "valid-typeof": 1,

    /* Best Practices */
    "accessor-pairs": 0,
    "block-scoped-var": 0, // see Babel section
    "complexity": 0,
    "consistent-return": 1,
    "curly": [1, "all"],
    "default-case": 0,
    "dot-notation": [1, { "allowKeywords": true, "allowPattern": "" }],
    "dot-location": [1, "property"],
    "eqeqeq": 1,
    "guard-for-in": 0,
    "no-alert": 1,
    "no-caller": 1,
    "no-console": 1,
    "no-div-regex": 1,
    //"no-else-return": 1,
    "no-empty-label": 1,
    "no-eq-null": 0,
    "no-eval": 1,
    "no-extend-native": 1,
    "no-extra-bind": 1,
    "no-fallthrough": 0,
    "no-floating-decimal": 1,
    "no-implied-eval": 1,
    "no-iterator": 1,
    "no-labels": 1,
    "no-lone-blocks": 1,
    "no-loop-func": 1,
    "no-multi-spaces": 1,
    "no-multi-str": 1,
    "no-native-reassign": 1,
    "no-new-func": 1,
    "no-new-wrappers": 1,
    "no-new": 1,
    "no-octal-escape": 1,
    "no-octal": 1,
    "no-param-reassign": 0,
    "no-process-env": 0,
    "no-proto": 1,
    "no-redeclare": 1,
    "no-return-assign": 1,
    "no-script-url": 1,
    "no-self-compare": 1,
    "no-sequences": 1,
    "no-throw-literal": 1,
    "no-unused-expressions": 0,
    "no-void": 0,
    "no-warning-comments": [1, { "terms": ["todo", "tofix"], "location": "start" }],
    "no-with": 1,
    "radix": 1,
    "vars-on-top": 1,
    "wrap-iife": [1, "inside"],
    "yoda": [1, "never"],

    /* Strict Mode */
    "strict": [1, "never"],

    /* Variables */
    "no-catch-shadow": 0,
    "no-delete-var": 1,
    "no-label-var": 1,
    "no-shadow-restricted-names": 1,
    "no-shadow": 0,
    "no-undef-init": 1,
    "no-undef": 1,
    "no-undefined": 1,
    "no-unused-vars": [1, { "vars": "local", "args": "after-used" }],
    "no-use-before-define": 0,

    /* Node.js */
    "handle-callback-err": 1,
    "no-mixed-requires": 1,
    "no-new-require": 1,
    "no-path-concat": 1,
    "no-process-exit": 1,
    "no-restricted-modules": [1, ""], // add any unwanted Node.js core modules
    "no-sync": 1,

    /* Stylistic Issues */
    "array-bracket-spacing": [1, "never"],
    "brace-style": [1, "1tbs", { "allowSingleLine": true }],
    //"camelcase": [1, { "properties": "never" }],
    "comma-spacing": [1, { "before": false, "after": true }],
    "comma-style": [1, "last"],
    "computed-property-spacing": 0,
    "consistent-this": 0,
    "eol-last": 1,
    "func-names": 1,
    "func-style": 0,
    "indent": [1, 2, {"SwitchCase": 1}],
    "key-spacing": [1, { "beforeColon": false, "afterColon": true }],
    "linebreak-style": 0,
    "max-nested-callbacks": [0, 3],
    "new-cap": 0, // see Babel section
    "new-parens": 1,
    "newline-after-var": 0,
    "no-array-constructor": 1,
    "no-continue": 1,
    "no-inline-comments": 0,
    "no-lonely-if": 0,
    "no-mixed-spaces-and-tabs": 1,
    "no-multiple-empty-lines": [1, { "max": 1 }],
    "no-nested-ternary": 0,
    "no-new-object": 1,
    "no-spaced-func": 1,
    "no-ternary": 0,
    "no-trailing-spaces": 1,
    "no-underscore-dangle": 0,
    "no-unneeded-ternary": 1,
    "object-curly-spacing": 0, // see Babel section
    "one-var": [1, "never"],
    "operator-assignment": [1, "never"],
    "padded-blocks": [0, "never"],
    "quote-props": [0, "as-needed"],
    "quotes": [1, "single"],
    "semi-spacing": [1, { "before": false, "after": true }],
    "semi": [1, "always"],
    "sort-vars": 0,
    "space-after-keywords": 0,
    "space-before-blocks": [1, "always"],
    "space-before-function-paren": [1, "never"],
    "space-in-parens": [1, "never"],
    //"space-infix-ops": 1,
    "space-return-throw-case": 1,
    "space-unary-ops": 0,
    "spaced-comment": [1, "always"],
    "wrap-regex": 1,

    /* ECMAScript 6 */
    "constructor-super": 1,
    "generator-star-spacing": 0, // see Babel section
    "no-this-before-super": 1,
    "no-var": 1,
    "object-shorthand": 0, // see Babel section
    "prefer-const": 1,

    /* Legacy */
    "max-depth": [0, 3],
    "max-len": [1, 121, 2],
    "max-params": 0,
    "max-statements": 0,
    "no-bitwise": 1,
    "no-plusplus": 1,

    /* Babel */
    // "babel/block-scoped-var": 1,
    "babel/object-shorthand": [1, "always"],
    // "babel/generator-star": 1, // deprecated
    "babel/generator-star-spacing": [1, "after"],
    "babel/new-cap": 0,
    "babel/object-curly-spacing": [1, "never"],
    // "babel/space-in-brackets": 1, // deprecated
  }
}
' >> .eslintrc

echo 'Creating config.js'
touch config.js

echo "
export default {
  orm: {
    db: {
      client: 'postgresql',
      connection: {
        database: 'dev',
        host: 'localhost',
        port: 5432
      },
      pool: {
        min: 2,
        max: 10
      },
      migrations: 'knex_migrations'
    },
    redis: {
      host: 'localhost',
      port: '6379'
    }
  },

  auth: {
    lifetime: 2 * 24 * 3600 * 1000
  },

  http: {
    host: '0.0.0.0',
    port: 3000
  }
};
" >> config.js

mkdir app
cd app
echo '********** Creating folders
1. http: where all your routes are present.
2. orm: where all your relationships and mapping with database occur.
3. reducer: which has a custom vaildator created.
4. tasks: for creating task triggered from cli
5. util: where all your utility files are saved.
**********'

mkdir auth http orm reducer tasks util
cd util
touch index.js

echo "
import {
  isObject,
  isArray,
  isFunction,
  isRegExp,
  isNumber,
  isString,
  isElement,
  isDate
} from 'lodash';

export function handleAsyncExceptions() {
  if (handleAsyncExceptions.hooked === false) {
    process.on('unhandledRejection', (err) => {
      throw err;
    });
    handleAsyncExceptions.hooked = true;
  }
}

export function isEmail(email) {
  const re = /\S+@\S+\.\S+/;
  return re.test(email);
}

handleAsyncExceptions.hooked = false;

export function printIp() {
  const os = require('os');
  const ifaces = os.networkInterfaces();

  Object.keys(ifaces).forEach((ifname) => {
    let alias = 0;

    ifaces[ifname].forEach((iface) => {
      if (iface.family !== 'IPv4' || iface.internal !== false) {
        // skip over internal (i.e. 127.0.0.1) and non-ipv4 addresses
        return;
      }

      if (alias >= 1) {
        // this single interface has multiple ipv4 addresses
        console.log(ifname + ':' + alias, iface.address);
      } else {
        // this interface has only one ipv4 adress
        console.log(ifname, iface.address);
      }
      alias = alias+1;
    });
  });
}

export function isUsableObject(val) {
  return isObject(val) && ! (
    isArray(val) || isFunction(val) || isRegExp(val) || isNumber(val) || isString(val) ||
    isElement(val) || isDate(val)
  );
}
" >> index.js
echo '********** Util folder setup completed **********'
cd ../tasks
mkdir seeds
touch index.js migrate.js seed.js dev.js

echo "
import dev from './dev';
import migrate from './migrate';
import seed from './seed';

export default {
  dev,
  migrate,
  seed
};
" >> index.js

echo "
import {migrator} from 'app/orm';

export default async function run(...args) {
  await migrator.mount({
    devDir: './migrations',
    distDir: './migrations',
    args,
    stub: `${process.cwd()}/migration.babel.stub`
  });
}
" >> migrate.js

echo "
import seeds from './seeds';

export default async function run() {
  await Object.keys(seeds).map((tableName) => seeds[tableName]).reduce(
      (chain, seed) => chain.then(() => seed.run()),
      Promise.resolve({})
    )
  ;
}
" >> seed.js

echo "
export default async function run() {
  console.log('dev');
}
" >> dev.js

cd seeds
touch index.js

echo "
export default {
};
" >> index.js

echo '********** tasks setup successfully **********'

cd ../../reducer
touch index.js Validator.js

echo "
import Validator from './Validator';

export {
  Validator
};
" >> index.js

echo "
import {assign, isArray, toPlainObject} from 'lodash';

import {isUsableObject} from 'app/util';

export default class Validator {
  constructor(validations=[]) {
    this.validations = new Map();
    this.addValidations(validations);
  }

  addValidations(validations=[]) {
    if (isUsableObject(validations)) {
      validations = toPlainObject(validations);
      validations = Object.keys(validations).map((k) => ({key: k, validation: validations[k]}));
    }

    validations.forEach(({key, validation}) => {
      this.validations.set(key, validation);
    });

    return this;
  }

  addValidation({key, validation}) {
    this.validations.set(key, validation);
    return this;
  }

  merge(validator) {
    Array.from(validator.validation.keys()).forEach((k) => {
      this.validations.set(k, validator.validations.get(k));
    });

    return this;
  }

  errors(input={}) {
    const keys = Array.from(this.validations.keys());

    return Promise.all(
      keys.map((k) => {
        const validated = this.validations.get(k).bind(this)(input[k], input, k);
        if (validated instanceof Promise) {
          return validated.then((errors) => {
            return {key: k, errors};
          });
        } else if (validated instanceof Validator) {
          return validated.errors(input[k]).then((errors) => {
            return {key: k, errors};
          });
        } else {
          return {key: k, errors: validated};
        }
      })
    )
    .then((errorMessages) => errorMessages.filter((msg) => {
      return isArray(msg.errors) ? msg.errors.length > 0 : !!msg.errors;
    }))
    .then((errorMessages) => {
      if (errorMessages.length === 0) {
        return null;
      } else {
        return errorMessages.reduce((allErrors, {key, errors}) => {
          return assign(allErrors, {
            [key]: isArray(errors) ? errors : (
              isUsableObject(errors) ? toPlainObject(errors) : [errors]
            )
          });
        }, {});
      }
    });
  }

  run(input={}) {
    return this.errors(input).then((errors) => {
      if (errors) {
        throw errors;
      } else {
        return input;
      }
    });
  }
}
" >> Validator.js

cd ../orm
mkdir tables
touch config.js index.js

echo "
import {orm} from 'config';

export default orm;
" >> config.js

echo "
import Tabel from 'tabel';
import config from './config';
import loadTables from './tables';

const orm = new Tabel(config);

loadTables(orm);

export default orm.exports;
" >> index.js

cd tables
touch index.js

echo "
export default function loadTables(orm) {
}
" >> index.js
echo "Orm setup successfully"

cd ../../http
mkdir auth
touch config.js index.js

echo "
import {http} from 'config';

export default http;
" >> config.js

echo "
import express from 'express';
import bodyParser from 'body-parser';
import errorhandler from 'errorhandler';
import cors from 'cors';

import {loggedIn} from 'app/auth/filters';
import auth from './auth';

const app = express();

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({extended: true}));
// parse application/json
app.use(bodyParser.json({limit: '50mb'}));
// parse multipart-form-data
app.use(cors());
// handle errors, should only be enabled in dev, but everything is dev
// right now
app.use(errorhandler());

if (process.env.NODE_ENV === 'production') {
  // trust proxy in production from local nginx front server
  app.set('trust proxy', 'loopback');
}
app.use('/auth', auth);

app.get('/', (req, res) => {
  res.send({msg: 'Nodejs is live. Lets go and chanage the world.'});
});

app.use(loggedIn);

// catch all route
app.all('*', (req, res) => {
  res.status(404).send({msg: 'not found'});
});
export default app;
" >> index.js

cd auth
touch index.js

echo "
import express from 'express';
import {omit} from 'lodash';

import {table} from 'app/orm';
import {login, logout} from 'app/auth';

import {
  loggedIn,
  loggedOut,
  getAuthKeyFromRequest
} from 'app/auth/filters';

const app = express();

app.post('/login', loggedOut, async (req, res) => {
  const {email, password} = req.body;
  const {success, token, user} = await login(email, password);
  if (success) {
    const teams = (await table('users')
      .where({id: user.id})
      .eagerLoad('teams')
      .first()).teams
    ;
    return res.status(200).send({msg: 'logged in', token, user: omit(user, ['password']), teams});
  } else {
    return res.status(400).send({email: 'Email password combination is invalid.'});
  }
});

app.post('/logout', loggedIn, async (req, res) => {
  const authKey = getAuthKeyFromRequest(req);

  await logout(authKey);

  return res.send({msg: 'logged out'});
});

export default app;
" >> index.js
echo "********** Http setup successfully **********"

cd ../../auth
touch config.js filters.js index.js

echo "
import {auth} from 'config';

export default auth;
" >> config.js

echo "
import {check} from './index';

export async function loggedIn(req, res, next) {
  const authKey = getAuthKeyFromRequest(req);
  const user = await check(authKey);

  if (user !== null) {
    req.user = user;
    req.authKey = authKey;
    next();
  } else {
    res.status(401).send({msg: 'Unauthorized'});
  }
}

export async function loggedOut(req, res, next) {
  const authKey = getAuthKeyFromRequest(req);
  const user = await check(authKey);

  if (user !== null) {
    res.status(400).send({msg: 'already logged in'});
  } else {
    next();
  }
}

export function getAuthKeyFromRequest(req) {
  return req.header('auth-token');
}
" >> filters.js

echo "
import {isString, shuffle} from 'lodash';
import bcrypt from 'bcrypt';
import randToken from 'rand-token';

import {table, cache} from 'app/orm';
import {isUsableObject} from 'app/util';
import config from './config';

const authHash = cache.hash('auth');

export async function login(email, password) {
  const user = await findUserByCredentials(email, password);
  if (user === null) {
    return {success: false, token: null, user: null};
  }
  const authKey = await generateUniqueAuthKey(user);
  await authHash.set(authKey, user.id, config.lifetime);

  return {success: true, token: authKey, user};
}

export async function check(authKey) {
  const userId = await authHash.get(authKey);

  if (userId === null) {
    return null;
  }

  const user = await table('users').find({id: userId});

  return isUsableObject(user) ? user : null;
}

export async function logout(authKey) {
  await authHash.del(authKey);

  return true;
}

async function findUserByCredentials(email, password) {
  if (! isString(email) || ! isString(password)) {
    return null;
  }
  const user = await table('users').find({email});
  if (! isUsableObject(user)) {
    return null;
  }

  const isValidUser = await bcryptCheck(password, user.password);
  return isValidUser ? user : null;
}

async function bcryptCheck(password, hash) {
  return await new Promise((resolve) => (
    bcrypt.compare(password, hash, (err, res) => {
      if (err) {
        return resolve(false);
      }

      return resolve(res);
    })
  ));
}

async function generateUniqueAuthKey(user) {
  const key = shuffle(randToken.generate(72)).join('');

  const existing = await authHash.get(key);

  if (existing === null) {
    return key;
  } else {
    return await generateUniqueAuthKey(user);
  }
}
" >> index.js

echo "Auth setup successfully"

cd ../../app
touch cli.js server.js

echo "
import {orm} from 'app/orm';
import {handleAsyncExceptions} from 'app/util';

import tasks from './tasks';

// the task runner
async function run(taskName, ...args) {
  const taskNames = Object.keys(tasks);
  if (taskNames.indexOf(taskName) === -1) {
    console.log('paste here a command to show tasks')
    return Promise.resolve(null);
  }

  try {
    return await tasks[taskName](...args);
  } catch (err) {
    throw err;
  }
}

if (require.main === module) {
  // handle async exceptions
  handleAsyncExceptions();
  // run the task runner
  const [taskName, ...args] = process.argv.slice(2);

  (async () => {
    await run(taskName, ...args);
    await new Promise((resolve) => setTimeout(async () => {
      await orm.close();
      resolve();
    }, 2500));
  })();
}

export default run;
" >> cli.js

echo "
import http from 'app/http';
import config from 'app/http/config';
import {printIp, handleAsyncExceptions} from 'app/util';

async function run() {
  http.listen(config.port, config.host, () => {
    console.log('server is running ......')
    printIp();
  });
}

export default run;

if (require.main === module) {
  handleAsyncExceptions();
  run(...process.argv.slice(2));
}
" >> server.js

echo 'Copy paste this in package.json remove the old scripts
"scripts": {
  "task": "NODE_PATH=. babel-node ./app/cli.js",
  "server": "NODE_PATH=. babel-node ./app/server.js",
  "nodemon:server": "NODE_PATH=. nodemon --exec \"babel-node\" ./app/server.js"
},
"babel": {
  "presets": [
    "es2015"
  ]
},'

echo -n "****** Press enter when you have done that"
read ok

echo ">>>>Go and create database dev and then a user table by typing npm run task migrate make users<<<<"
echo -n "****** Press enter when you have done that"
read ok

echo "A migration directory at root of project is created copy paste or edit as required
function up(knex, Promise) {
  return knex.schema.createTable('users', (t) => {
    t.uuid('id').primary();
    t.string('email').unique();
    t.string('name');
    t.date('birthday');
    t.string('gender');
    t.string('phone_number');
    t.string('password');
    t.timestamps();
  });
}

function down(knex, Promise) {
  return knex.schema.dropTable('users');
}

module.exports = {up, down};
"
echo -n "****** Press enter when you have done that"
read ok

echo ">>>>>after that is done type npm run task migrate latest<<<<<"

echo "**************** successfully setup *****************"

echo "go inside project and type npm run nodemon:server once started Lets go to browser and type localhost:3000"
