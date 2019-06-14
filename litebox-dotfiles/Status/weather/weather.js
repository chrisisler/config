const fetchWeather = require('./fetch-weather')

async function main() {
  let weather = await fetchWeather()
  console.log(weather)
}

main()
