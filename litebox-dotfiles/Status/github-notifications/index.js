let command = require('execa')

async function main() {
  try {
    // prettier-ignore
    let result = await command('echo', ['hello', 'world'])
    // curl --silent --user "chrisisler:$GithubPersonalAccessToken" https://api.github.com/notifications
  } catch (error) {
    console.error(error)
  }
}

main()
