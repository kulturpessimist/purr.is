/*!
 * PURR.is/coding...
 * */
purr = {
	_sectionMap: [],
	_currentSegment:0,
	//
	mount: function(){
		riot.mount('backdrop');
		riot.mount('menu');
		riot.mount('about');
		riot.mount('contact');
		
		riot.route('next', function(name){
			var nextSegment = purr._sectionMap[++purr._currentSegment] || 'home';
			zenscroll.to( document.getElementById(nextSegment) );
			riot.route(nextSegment, null, true);
		});
		riot.route.start();
	},
	updateLocation: function(){
		var segment = Math.round(window.scrollY / window.innerHeight);
		if(segment!=purr._currentSegment){
			var location = purr._sectionMap[segment];
			riot.route(location, null, true)
			document.querySelectorAll('footer i span')[0].innerHTML = '#'+location;
			document.body.className = location;
			purr._currentSegment = segment;
		}
	},
	init: function(){
		purr.mount();

		zenscroll.setup(null, 0)
		var sections = Array.prototype.slice.call(document.querySelectorAll('section'));
		sections.forEach(function(el, i) {
			purr._sectionMap.push( el.id );
		});
		
		window.document.addEventListener("scroll", purr.updateLocation);
	}
}
//
purr.init();