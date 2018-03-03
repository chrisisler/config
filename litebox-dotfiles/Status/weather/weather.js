// openweathermap.org/api

const fetch = require('node-fetch')

// fetch and display local weather info
async function main () {
  try {
    const response = await fetch(url())
    if (response.ok) {
      const data = await response.json()

      // const max = Math.round(data.main.temp_max)
      // const min = Math.round(data.main.temp_min)
      // const tempRange = `${max}-${min}°F`
      const description = data.weather.map(_ => _.main).join(' ')
      const temperature = Math.round(data.main.temp) + 'F'
      // const temperature = Math.round(data.main.temp) + '°F'
      const windSpeedMPH = Math.round(data.wind.speed)

      let result = `${temperature}`

      if (windSpeedMPH > 20) {
        result = `${result} ${windSpeedMPH}mph`
      }

      console.log(result)
    } 
  } catch (error) {
    console.error('Error: ' + error.message)
    process.exit(-1)
  }
}

main()

function url () {
  return 'https://'
    + 'api.openweathermap.org/data/2.5/weather'
    + '?mode=json'
    + '&units=imperial'
    + '&q=Boston'
    + '&APPID=' + process.env.openWeatherMapAPIKey
}

// function capitalize (str) {
//   return str[0].toUpperCase() + str.slice(1)
// }
