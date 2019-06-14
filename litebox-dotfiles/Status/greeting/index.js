const chalk = require('chalk')

const fetchWeather = require('../weather/fetch-weather')

async function main () {
  const temperature = (await fetchWeather()).trim()

  let now = new Date()
  const fullDayName = dayNumberToName(now.getDay())
  const dayOfMonth = dayOfMonthPostfix(now.getDate())
  const monthName = monthNumberToName(now.getMonth())

  // TODO
  // https://www.wordsapi.com
  // https://developer.wordnik.com
  const wordOfTheDay = await Promise.resolve('foo')

  console.log(chalk.italic.blue('Today is %s, the %s of %s'), fullDayName, dayOfMonth, monthName)
  console.log(chalk.cyan(`The temperature is ${chalk.italic('%s')}`), temperature)
  console.log(chalk.green(`Word of the day: ${chalk.italic('%s')}`), wordOfTheDay)
}

main()

function dayNumberToName (dayNumber) {
  if (dayNumber === 0) return 'Sunday'
  else if (dayNumber === 1) return 'Monday'
  else if (dayNumber === 2) return 'Tuesday'
  else if (dayNumber === 3) return 'Wednesday'
  else if (dayNumber === 4) return 'Thursday'
  else if (dayNumber === 5) return 'Friday'
  else if (dayNumber === 6) return 'Saturday'
  else return 'Err'
}

function monthNumberToName (monthNumber) {
  if (monthNumber === 0) return 'January'
  else if (monthNumber === 1) return 'February'
  else if (monthNumber === 2) return 'March'
  else if (monthNumber === 3) return 'April'
  else if (monthNumber === 4) return 'May'
  else if (monthNumber === 5) return 'June'
  else if (monthNumber === 6) return 'July'
  else if (monthNumber === 7) return 'August'
  else if (monthNumber === 8) return 'September'
  else if (monthNumber === 9) return 'October'
  else if (monthNumber === 10) return 'November'
  else if (monthNumber === 11) return 'December'
  return 'Err'
}

function dayOfMonthPostfix (dayNumber) {
  const lastDayNumber = +('' + dayNumber).slice(-1)
  if (lastDayNumber === 1) return `${dayNumber}st`
  else if (lastDayNumber === 2) return `${dayNumber}nd`
  else if (lastDayNumber === 3) return `${dayNumber}rd`
  return `${dayNumber}th`
}
