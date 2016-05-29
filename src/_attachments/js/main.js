/*!
 * PURR.is/coding...
 * */
PURR = {
	_sectionMap: [],
	_currentSegment:0,
	//
	supportedLanguages: ['de'],
	language: String( (window.navigator.userLanguage || window.navigator.language).split('-')[0] ).toLowerCase(),
	store: riot.observable(),
	//
	mount: function(){
		riot.mount('*', PURR.store);
		riot.route('next', function(name){
			var nextSegment = PURR._sectionMap[++PURR._currentSegment] || 'home';
			zenscroll.to( document.getElementById(nextSegment) );
			riot.route(nextSegment, null, true);
		});
		riot.route.start();
		//
		zenscroll.setup(null, 0)
		var sections = Array.prototype.slice.call(document.querySelectorAll('section'));
		sections.forEach(function(el, i) {
			PURR._sectionMap.push( el.id );
		});
		
		window.document.addEventListener("scroll", PURR.updateLocation);
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
				PURR.mount();
			})
			.catch(function(error) {
		  		console.log('There has been a problem with your fetch operation: ' + error.message);
			});
	},
	updateLocation: function(){
		var segment = Math.round(window.scrollY / window.innerHeight);
		if(segment!=PURR._currentSegment){
			var location = PURR._sectionMap[segment];
			riot.route(location, null, true)
			document.querySelectorAll('footer i span')[0].innerHTML = '#'+location;
			document.body.className = 'section--'+location;
			PURR._currentSegment = segment;
		}
	},
	init: function(){
		PURR.loadLanguages();
	}
}
//
PURR.init();