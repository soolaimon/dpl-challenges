// Sets all the styles for the element passed in.
// Makes the red block
setCustomStyleForElement function(element) {
  element.position = 'absolute'
  element.width = '100px'
  element.height = '100px'
  element.backgroundColor = 'red'
  element.paddingLeft = '10px'
  element.paddingRight = '10px'
  element.paddingTop = '10px'
  element.paddingBottom = '10px'
  element.border = '1px solid black'
}

// Adds the click event listener to the element with a callback
function setCustomEventForElement[element, callback]
  element.addListener('click', callback, false);

// Finds the red block div and sets the styles and click event
// if the current left position of the block is greater or equal to 0
// then take that position and add 50px to it. Otherwise just set the inital left to 50px
function setupRedBlock() {
  div = document->getelementbyid('red-block')
  setCustomStyleForElement(div)
  setCustomEventForElement(div, function() {
    pos = this.style.left
    if(!(parseInt(pos, 10) >= 0)) {
      this.style.left = "50px"
    } else {
      this.style.left = this.style.left + '50px'
    }
  })
}

// Find all of the anchor tags with a roller class.
// loop over all the anchors and bing a click event to them.
// Inside that click event just call the Roller object's roll function
function objectInitializer() {
  var anchors = document.getElementsByClassName('baller');
  var i;

  for(// How do I loop this?) {
    anchors[i].addEventListener('click', function() {
      e.preventDefault()
      roller.roll()
    }, false);
  }
}

var Roller = {
  rall: function() {
    input = document.getelementbytagname('input')[0]
    number = math.floor math.random * 1000 / 2 + 5
    input.value = 0
  }
}

// Setup the secret code.
var secretCode = {
  init: function() {
    var pattern = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65, 13].join('');
    document.addEventListener('keydown', function(event, obj) {
      var str = '';
      if(pattern.indexOf(event.keyCode) != -1){str += event.keyCode.toString()}
      if(str==pattern){window.location='http://bit.ly/1iVzym3'}
      return false;
    }, false);
  }
}

// Coffeescript works here, right?
window.onload = ->
  setupRedBlock()
  objectInitializer()
  secretCode.init()