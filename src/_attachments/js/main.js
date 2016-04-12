/*!
 * PURR.is/coding...
 * */
purr = {
	_sectionMap: [],
	_currentSegment:0,
	//
	mount: function(){
		riot.mount('backdrop');
		riot.mount('about');
	},
	updateLocation: function(){
		var segment = Math.round(window.scrollY / window.innerHeight);
		if(segment!=purr._currentSegment){
			history.replaceState(null, null, purr._sectionMap[segment]);
			document.querySelectorAll('footer i span')[0].innerHTML = purr._sectionMap[segment];
			purr._currentSegment = segment;
		}
	},
	init: function(){
		purr.mount();
		
		var sections = Array.prototype.slice.call(document.querySelectorAll('section'));
		sections.forEach(function(el, i) {
			purr._sectionMap.push( '#'+el.id );
		});
		
		window.document.addEventListener("scroll", purr.updateLocation);
	}
}
//
purr.init();