const execa = require('execa')

function clean(configString) {
  return configString.replace(/^.*= /, '').replace(/"/g, '')
}

const command = 'defaults read /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist | grep LastConnected -A 7'

const manySpacesRegEx = /\s{2,}/g

async function main() {
  try {
    let { failed, stdout } = await execa.shell(command)
    if (!failed) {
      let connections = stdout.split('\n--\n').map(s => s.replace(manySpacesRegEx, ''))
      let [ { networkName } ] = connections
        .map(connection => {
          let [ lastConnected, networkName ] = connection
            .split(';')
            .filter(str => str.startsWith('LastConnected') || str.startsWith('SSIDString'))
          lastConnected = new Date(clean(lastConnected))
          networkName = clean(networkName)
          return { lastConnected, networkName }
        })
        .sort((a, b) => a.lastConnected < b.lastConnected ? 1 : -1)
      process.stdout.write(networkName)
    }
  } catch (error) {
    process.stderr.write(error)
    process.exit(-1)
  }
}

main()
