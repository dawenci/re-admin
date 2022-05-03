import { Plugin } from 'vite'
import execa from 'execa'
import npmRunPath from 'npm-run-path'
import chalk from 'chalk'

const logPrefix = chalk.cyan('[vite-plugin-rescript]')

/**
 * @param {boolean} watch
 */
async function launchReScript(watch) {
  const cmd = watch
    ? 'rescript build -with-deps -w'
    : 'rescript build -with-deps';

  const result = execa.command(cmd, {
    env: npmRunPath.env(),
    extendEnv: true,
    shell: true,
    windowsHide: false,
    cwd: process.cwd(),
  })

  let compileOnce = (_value) => {}

  function dataListener(chunk) {
    const output = chunk.toString().trimEnd()
    console.log(logPrefix, output);
    if (watch && output.includes('>>>> Finish compiling')) {
      compileOnce(true)
    }
  }

  const { stdout, stderr } = result;
  stdout && stdout.on('data', dataListener)
  stderr && stderr.on('data', dataListener)

  if (watch) {
    await new Promise((resolve) => {
      compileOnce = resolve
    })
  } else {
    await result
  }

  return
}

/**
 * @returns {Plugin}
 */
export default function createReScriptPlugin() {
  return {
    name: 'vite-plugin-rescript',
    async configResolved(resolvedConfig) {
      await launchReScript(resolvedConfig.command === 'serve')
    },
  }
}
