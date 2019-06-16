// See openweathermap.org/api

const fetch = require('node-fetch')

const timeRestricted = require('./time-restricted')

let minutes = 30
let url
  = 'https://'
  + 'api.openweathermap.org/data/2.5/weather'
  + '?mode=json'
  + '&units=imperial'
  + '&q=Boston'
  // + '&q=Minneapolis'
  + '&APPID=' + process.env.openWeatherMapAPIKey

module.exports = timeRestricted({ minutes }, async () => {
  try {
    minutes = 30
    let response = await fetch(url)
    if (response.ok) {
      const data = await response.json()

      // const max = Math.round(data.main.temp_max)
      // const min = Math.round(data.main.temp_min)
      // const temperature = `${min}-${max}°F`
      const temperature = Math.round(data.main.temp) + '°F'

      let result = temperature
      // let result = `${temperature} ${description}`

      let humidityPercent = data.main.humidity
      if (humidityPercent > 85 && humidityPercent !== 100) {
        let description = data.weather.map(_ => _.main)
        // Humidity will be high when it is raining (that is the nature of rain).
        // I only want to know the humidity if it is worth knowing.
        if (!['Fog', 'Mist', 'Thunderstorm', 'Rain'].some(_ => description.includes(_))) {
          result += ` Humid:${humidityPercent}%`
        }
      }

      // let windSpeedMPH = Math.round(data.wind.speed)
      // if (windSpeedMPH > 20) {
      //   result += ` ${windSpeedMPH}mph`
      // }
      return ' ' + result
    } 
  } catch (error) {
    minutes = 1
    return ` Err ${error.code}: ${error.message}`
  }
})
