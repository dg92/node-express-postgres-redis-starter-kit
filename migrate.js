import {migrator} from 'app/orm';

export default async function run(...args) {
  await migrator.mount({
    devDir: './migrations',
    distDir: './migrations',
    args,
    stub: `${process.cwd()}/migration.babel.stub`
  });
}

