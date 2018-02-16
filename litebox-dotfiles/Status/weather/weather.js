// Fetch and output various weather information.
// see http://openweathermap.org/current


/** @type {String -> Promise<Response>} */
const fetch = require('node-fetch')


const url =
  'https://' // must be absolute url
  + 'api.openweathermap.org/data/2.5/weather' // base url
  + '?mode=json' // response data format
  + '&units=imperial' // fahrenheit
  + '&q=Boston' // location
  + '&APPID=' + process.env.openWeatherMapAPIKey // api key


/** @type {String -> String} */
const capitalize = s => s[0].toUpperCase() + s.slice(1)


async function main() {
  try {
    const response = await fetch(url)
    if (response.ok) {
      const data = await response.json()

      const max = Math.round(data.main.temp_max)
      const min = Math.round(data.main.temp_min)
      const tempRange = `${max}-${min}F`
      const description = data.weather.map(_ => _.description).join(', ')

      console.log(capitalize(description), tempRange)
    } 
  } catch (error) {
    console.error('Error: ' + error.message)
    process.exit(-1)
  }
}


main()


/**
 * Example output of entire `response.json()`:
 *
 * { coord: { lon: -71.06, lat: 42.36 },
 *   weather: 
 *    [ { id: 500, main: 'Rain', description: 'light rain', icon: '10d' },
 *      { id: 701, main: 'Mist', description: 'mist', icon: '50d' } ],
 *   base: 'stations',
 *   main: 
 *    { temp: 282.23,
 *      pressure: 1006,
 *      humidity: 81,
 *      temp_min: 280.15,
 *      temp_max: 284.15 },
 *   visibility: 16093,
 *   wind: { speed: 2.1 },
 *   clouds: { all: 1 },
 *   dt: 1518724560,
 *   sys: 
 *    { type: 1,
 *      id: 1951,
 *      message: 0.0049,
 *      country: 'US',
 *      sunrise: 1518694771,
 *      sunset: 1518733061 },
 *   id: 4930956,
 *   name: 'Boston',
 *   cod: 200 }
 */
