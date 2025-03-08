const timer = {
  min: 25,
  sec: 0,
  isRunning: false,
  isPaused: false,
  elements: ['timerInput', 'startButton', 'pauseButton', 'resumeButton', 'resetButton']
    .reduce((accumulator, elementId) => {
      accumulator[elementId] = document.getElementById(elementId);
      return accumulator;
    }, {}),
  update() {
    this.elements.timerInput.value = 
      `${this.min.toString().padStart(2, '0')}:${this.sec.toString().padStart(2, '0')}`;
  },
  toggleButtons(...states) {
    states.forEach(([elementId, state]) => {
      this.elements[elementId].classList.toggle('hidden', !state);
    });
  },
  start() {
    if (this.isRunning) return;
    this.isRunning = true;
    this.elements.timerInput.disabled = true;
    this.toggleButtons(['startButton', false], ['pauseButton', true]);
    timerInterval = setInterval(() => this.tick(), 1000);
  },
  pause() {
    if (!this.isPaused) {
      clearInterval(timerInterval);
      this.isPaused = true;
      this.toggleButtons(['pauseButton', false], ['resumeButton', true]);
    }
  },
  resume() {
    if (this.isPaused) {
      timerInterval = setInterval(() => this.tick(), 1000);
      this.isPaused = false;
      this.toggleButtons(['resumeButton', false], ['pauseButton', true]);
    }
  },
  reset() {
    clearInterval(timerInterval);
    this.min = 25;
    this.sec = 0;
    this.isRunning = false;
    this.isPaused = false;
    this.elements.timerInput.disabled = false;
    this.toggleButtons(['startButton', true], ['pauseButton', false], ['resumeButton', false]);
    this.update();
  },
  tick() {
    if (this.sec === 0) {
      if (this.min === 0) {
        alert("Время вышло!");
        this.reset();
        return;
      }
      this.min--;
      this.sec = 59;
    } else {
      this.sec--;
    }
    this.update();
  }
};

timer.elements.startButton.onclick = () => timer.start();
timer.elements.pauseButton.onclick = () => timer.pause();
timer.elements.resumeButton.onclick = () => timer.resume();
timer.elements.resetButton.onclick = () => timer.reset();
timer.elements.timerInput.oninput = () => {
  const [minutes, seconds] = timer.elements.timerInput.value.split(':').map(Number);
  if (!isNaN(minutes) && !isNaN(seconds) && seconds < 60 && minutes >= 0) {
    timer.min = minutes;
    timer.sec = seconds;
    timer.update();
  }
};
timer.update();