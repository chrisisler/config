// openweathermap.org/api

let fetch = require('node-fetch')

let timeRestricted = require('./time-restricted')

let url
  = 'https://'
  + 'api.openweathermap.org/data/2.5/weather'
  + '?mode=json'
  + '&units=imperial'
  + '&q=Boston'
  // + '&q=Minneapolis'
  + '&APPID=' + process.env.openWeatherMapAPIKey


let minutes = 30
let fetchWeather = timeRestricted({ minutes }, async () => {
  try {
    minutes = 30
    let response = await fetch(url)

    if (response.ok) {
      let data = await response.json()

      // const max = Math.round(data.main.temp_max)
      // const min = Math.round(data.main.temp_min)
      // const tempRange = `${max}-${min}°F`
      // const temperature = Math.round(data.main.temp) + '°F'
      let temperature = Math.round(data.main.temp) + '°F'

      let description = data.weather.map(_ => _.main)
      if (description.includes('Mist') && description.includes('Rain')) {
        description = description.filter(s => s !== 'Mist')
      }
      if (description.includes('Thunderstorm') && description.includes('Rain')) {
        description = description.filter(s => s !== 'Rain' && s !== 'Fog').join(' ')
      }

      let result = temperature
      // let result = `${temperature} ${description}`

      /*
      let humidityPercent = data.main.humidity
      if (humidityPercent > 85 && humidityPercent !== 100) {
        // Humidity will be high when it is raining (that is the nature of rain).
        // I only want to know the humidity if it is worth knowing.
        if (!['Fog', 'Mist', 'Thunderstorm', 'Rain'].some(_ => description.includes(_))) {
          // result += ` Humid:${humidityPercent}%`
        }
      }
      */

      let windSpeedMPH = Math.round(data.wind.speed)
      if (windSpeedMPH > 20) {
        result += ` ${windSpeedMPH}mph`
      }

      // process.stdout.write(result)
      return result
    } 
  } catch (error) {
    minutes = 1
    // console.error('Error: ' + error.message)
    // process.exit(-1)
    return ''
    // return 'Error: ' + error.message
  }
})

async function main() {
  // if (execa('../internet') !== '') {
  //   return
  // }
  let weather = await fetchWeather()
  console.log(weather)
}

main()
