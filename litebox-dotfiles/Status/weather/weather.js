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
      // const temperature = Math.round(data.main.temp) + '°F'

      let description = data.weather.map(_ => _.main)
      if (description.includes('Mist') && description.includes('Rain')) {
        description = description.filter(s => s !== 'Mist')
      }
      if (description.includes('Thunderstorm') && description.includes('Rain')) {
        description = description.filter(s => s !== 'Rain' && s !== 'Fog').join(' ')
      }

      const temperature = Math.round(data.main.temp) + 'F'

      let result = temperature
      // let result = `${temperature} ${description}`

      const humidityPercent = data.main.humidity
      if (humidityPercent > 85) {
        if (humidityPercent !== 100) {
          // Humidity will be high when it is raining (that is the nature of rain).
          // I only want to know the humidity if it is worth knowing.
          if (!['Fog', 'Mist', 'Thunderstorm', 'Rain'].some(_ => description.includes(_))) {
            // result += ` Humid:${humidityPercent}%`
          }
        }
      }

      const windSpeedMPH = Math.round(data.wind.speed)
      if (windSpeedMPH > 20) {
        result += ` ${windSpeedMPH}mph`
      }

      process.stdout.write(result)
    } 
  } catch (error) {
    console.error('Error: ' + error.message)
    // process.exit(-1)
  }
}

main()

function url () {
  return 'https://'
    + 'api.openweathermap.org/data/2.5/weather'
    + '?mode=json'
    + '&units=imperial'
    + '&q=Boston'
    // + '&q=Minneapolis'
    + '&APPID=' + process.env.openWeatherMapAPIKey
}
