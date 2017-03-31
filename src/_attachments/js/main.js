/*!
 * PURR.is/coding...
 * */
PURR = {
	_sectionMap: [],
	_currentSegment: 0,
	//
	colors: {
		'turquoise': '#50e3c2',
		'blue': '#039BE5',
		'red': '#FC4058',
		'lilac': '#6653FF',
		'paper': '#FDF3E2'
	},
	random: function (collection) {
		return collection[Math.floor(Math.random() * collection.length)];
	},
	_debounce: function (func, wait, immediate) {
		var timeout;
		return function () {
			var context = this,
				args = arguments;
			var later = function () {
				timeout = null;
				if (!immediate) func.apply(context, args);
			};
			var callNow = immediate && !timeout;
			clearTimeout(timeout);
			timeout = setTimeout(later, wait);
			if (callNow) func.apply(context, args);
		};
	},
	_router: function(evt){
		if(document.location.hash=='#next'){
			// trigger scroll to next segment...
			var nextSegment = PURR._sectionMap[PURR._currentSegment+1] || 'home';
			zenscroll.to( document.getElementById(nextSegment) );
		}
	},
	routes: function () {
		window.addEventListener('hashchange', PURR._router);
		zenscroll.setup(null, 0);
		var sections = Array.prototype.slice.call(document.querySelectorAll('section'));
		sections.forEach(function (el, i) {
			PURR._sectionMap.push(el.id);
		});
		document.addEventListener("scroll", PURR._debounce(PURR.updateLocation, 50));
	},
	updateLocation: function () {
		var segment = Math.round(window.scrollY / window.innerHeight);
		if (PURR._currentSegment !== segment) {
			var location = PURR._sectionMap[segment];
			document.querySelectorAll('footer i span')[0].innerHTML = '#' + location;
			document.body.className = 'section--' + location;
			document.location.hash = '#'+location;
			PURR._currentSegment = segment;
		}
	},

	randomColor: function () {
		var keys = Object.keys(PURR.colors)
		return PURR.colors[keys[keys.length * Math.random() << 0]];
	},

	team: {
		rotate: function () {
			var currentRotation = parseInt((document.querySelectorAll('#team #container')[0].style.transform || "0").match(/\d+/g), 10);
			document.querySelectorAll('#team #container')[0].style.transform = 'rotateZ(-' + (currentRotation + 180) + 'deg)';
			document.body.classList.toggle('rotated');
		}
	},

	init: function () {
		PURR.routes();
	}
}
//
PURR.init();

