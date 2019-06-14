// const promisify = require('../JS/Bin/personal-lib/promisify.js')

const date = new Date()

const weekday = () => abbreviate(dayNumberToName(date.getDay()))
const dayOfMonth = () => date.getDate()
const monthName = () => abbreviate(monthNumberToName(date.getMonth()))
const militaryHoursAndMinutes = () => getHours() + ':' + getMinutes()

function main () {
  const currentTime
    = ''
    + monthName()
    + ' ' + dayOfMonth()
    + ' ' + weekday()
    + ' ' + militaryHoursAndMinutes()
  console.log(currentTime)
}


main()


function getHours() {
  let hoursNumber = date.getHours()

  if (hoursNumber.toString().length === 1) {
    return '0' + hoursNumber
  }

  return hoursNumber
}

function getMinutes() {
  let minutesNumber = date.getMinutes()

  if (minutesNumber.toString().length === 1) {
    return '0' + minutesNumber
  }

  return minutesNumber
}


function abbreviate (s) {
  return s.slice(0, 3)
}


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
  else return 'Err'
}
