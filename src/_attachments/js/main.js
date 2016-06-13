/*!
 * PURR.is/coding...
 * */
PURR = {
	_sectionMap: [],
	_currentSegment:0,
	//
	colors: {
		'turquoise':'#50e3c2',
		'blue': 	'#039BE5',
		'red': 		'#FC4058',
		'lilac': 	'#6653FF',
		'paper': 	'#FDF3E2'
	},
	supportedLanguages: ['de', 'en'],
	language: String( (window.navigator.userLanguage || window.navigator.language).split('-')[0] ).toLowerCase(),
	store: riot.observable(),
	_debounce: function(func, wait, immediate){
		var timeout;
		return function() {
			var context = this, args = arguments;
			var later = function() {
				timeout = null;
				if (!immediate) func.apply(context, args);
			};
			var callNow = immediate && !timeout;
			clearTimeout(timeout);
			timeout = setTimeout(later, wait);
			if (callNow) func.apply(context, args);
		};
	},
	//
	mount: function(){
		riot.mount('*', PURR.store);
		riot.route('next', function(name){
			var nextSegment = PURR._sectionMap[PURR._currentSegment+1] || 'home';
			zenscroll.to( document.getElementById(nextSegment) );
			//riot.route(nextSegment, null, true);
		});
		riot.route.start();
		//
		zenscroll.setup(null, 0)
		var sections = Array.prototype.slice.call(document.querySelectorAll('section'));
		sections.forEach(function(el, i) {
			PURR._sectionMap.push( el.id );
		});
		document.addEventListener("scroll", PURR._debounce(PURR.updateLocation, 50) );
	},
	loadLanguages: function(){
		if( PURR.supportedLanguages.indexOf(PURR.language)==-1 ){
			PURR.language=PURR.supportedLanguage[0]; // fallback to language 0
		}
		fetch('resources/'+PURR.language+'.json')
			.then(function(response) {
				if(response.ok) {
					return response.json();
		  		}else{
					console.log('Network response was not ok.');
		  		}
			})
			.then(function(json) {
				PURR.i18n = json;
			
				Array.prototype.forEach.call(document.querySelectorAll('meta[name=description], meta[name="twitter:description"], meta[property="og:description"], meta[itemprop=description]'), function(el){
					el.content = PURR.i18n.meta;
				});

				PURR.mount();
			})
			.catch(function(error) {
		  		console.log('There has been a problem with your fetch operation: ' + error.message);
			});
	},
	switchLanguage: function(lang){
		if( PURR.supportedLanguages.indexOf(lang)!=-1 ){
			PURR.language = lang;
			PURR.loadLanguages();
		}
	},
	updateLocation: function(){
		var segment = Math.round(window.scrollY / window.innerHeight);
		if(PURR._currentSegment!==segment){
			var location = PURR._sectionMap[segment];
			riot.route(location, null, true)
			document.querySelectorAll('footer i span')[0].innerHTML = '#'+location;
			document.body.className = 'section--'+location;
			PURR._currentSegment = segment;
		}
	},
	randomColor: function(){
		var keys = Object.keys(PURR.colors)
		return PURR.colors[keys[ keys.length * Math.random() << 0]];
	},
	init: function(){
		PURR.loadLanguages();
	}
}
//
PURR.init();