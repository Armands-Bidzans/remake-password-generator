let timer = document.getElementById("timer");
let minutes = 25;
let seconds = 0;
// Input filtering for password length
const display = document.getElementById('timer');

function startTimer() {
  timer = setInterval(updateTimer, 1000);
}

function updateTimer() {
  if (seconds === 0) {
    if (minutes === 0) {
      clearInterval(timer);
      alert("Time's up!");
      return;
    } else {
      minutes--;
      seconds = 59;
    }
  } else {
    seconds--;
  }

  display.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
}

function resetTimer() {
  clearInterval(timer);
  minutes = 25;
  seconds = 0;
  display.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
}