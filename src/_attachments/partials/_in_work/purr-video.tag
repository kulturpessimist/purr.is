<purr-video>
	<style>
		video#background{
			width: 100vw; height: 100vh;
			position: absolute;
			top: 0px; bottom: 0px;
			left: 0px; right: 0px;
			display: none;
			z-index: -999;
			object-fit: none;
		}
		div#fallback{
			width: 100vw; height: 100vh;
			position: absolute;
			top: 0px; bottom: 0px;
			left: 0px; right: 0px;
		
			background-image: url('../assets/images/rgba.png');
			background-size: cover;
			background-position: center center;
			background-repeat: no-repeat;
			display: block;
			z-index: 19;
		}
		div#mask{
			width: 100vw; height: 100vh;
			position: absolute;
			top: 0px; bottom: 0px;
			left: 0px; right: 0px;
		
			background-image: url('../assets/images/PURR-cutout.png');
			background-size: cover;
			background-position: center center;
			background-repeat: no-repeat;
			z-index: 20;
		}
		
		html.videoautoplay video#background{
			display: block;
		}
		html.videoautoplay div#fallback{
			display: none;
		}
	</style>
	
	<section id="home">
		<video autoplay loop muted id="background" src="assets/PURR-ink.min.mp4"></video>
		<div id="fallback"></div>
		<div id="mask"></div>
	</section>

</purr-video>