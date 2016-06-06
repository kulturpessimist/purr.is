<purr-home>
	
	<style>
		#color {
			background-color: rgba(80, 227, 194, 1);
			/*background-blend-mode: multiply;*/
			mix-blend-mode: multiply;
			z-index: 20;
			background: linear-gradient(23deg, #50e3c2, #fc4058, #f4f4f0, #6653ff, #50e3c2, #50e3c2);
			background-size: 1200% 1200%;
			animation: ColorCycle 59s ease infinite;
		
			display: none;
		}
		
		@keyframes ColorCycle {
		  	0% { background-position: 0% 79% }
		  	50% { background-position: 100% 22% }
		  	100% { background-position: 0% 79% }
		}
	</style>
	
	<section id="home">
		<canvas id="seen-canvas"></canvas>
		<!--
			<svg id="seen-canvas"></svg>
			<div id="color"></div>
		-->
		<div id="mask"></div>
	</section>
	
	<script>
		
		this.isElementOutViewport = function(el) {
			var rect = el.getBoundingClientRect();
			return rect.bottom < 0 || rect.right < 0 || rect.left > window.innerWidth || rect.top > window.innerHeight;
		}
		
		this.viewState = false;
		this.checkViewport = function(){
			var state = this.isElementOutViewport( this.home );
			if(state && !this.viewState){
				console.log('stop animation...');
				this.animator.stop();
				clearInterval(this.checkInterval);
			}else if(!state && this.viewState){
				console.log('start animation...');
				this.animator.start();
				this.setupCheckInterval();
			}
			this.viewState = state;
		}.bind(this);
		
		this.checkVisibility = function(){
			if(document.hidden){
				console.log('stop animation...');
				this.animator.stop();
				clearInterval(this.checkInterval);
			}else{
				console.log('start animation...');
				this.animator.start();
				this.setupCheckInterval();
		  	}
		}.bind(this);
		
		document.addEventListener('visibilitychange', this.checkVisibility, false);
		document.addEventListener('scroll', this.checkViewport, false);
		document.addEventListener('resize', this.checkViewport, false);
		
		this.setupCheckInterval = function(){
			this.checkInterval = setInterval(function(){
				this.checkViewport();
			}.bind(this), 1000);
		}
		
		this.on('mount', function() {
		
		  	var context, equilateralAltitude, height, noiser, patch_height, patch_width, scene, shape, triangleScale, width;
		
		  	width = window.innerWidth / 2;
		  	height = window.innerHeight / 2;
		  	document.getElementById('seen-canvas').width = width;
		  	document.getElementById('seen-canvas').height = height;
		
		  	equilateralAltitude = 3;
		  	triangleScale = 7;
		  	patch_width = width * 1.5;
		  	patch_height = height * 1.5;
		
		
		  	shape = seen.Shapes.patch(
					patch_width / triangleScale / equilateralAltitude,
			  		patch_height / triangleScale
				)
				.scale(triangleScale * 3)
				.translate(-patch_width / 2, -patch_height / 2)
				.rotx(-0.3)
				.fill( PURR.randomColor() )
		  	//seen.Colors.randomSurfaces(shape, 0.1, 0.8);
		  	//seen.Colors.randomSurfaces2(shape, 0.1, 0.5, 0.4);
				
		  	scene = new seen.Scene({
				model: seen.Models["default"]().add(shape),
				viewport: seen.Viewports.center(width, height),
				shader: seen.Shaders.phong(),
				fractionalPoints: true
		  	});
		
		  	context = seen.Context('seen-canvas', scene).render();
		
		  	noiser = new seen.Simplex3D(shape);
		
		  	this.animator = context.animate().onBefore(function(t, d) {

				var i, j, len, len1, p, ref, ref1, results, surf;
				ref = shape.surfaces;
				results = [];
				for (i = 0, len = ref.length; i < len; i++) {
			  		surf = ref[i];
			  		ref1 = surf.points;
			  		for (j = 0, len1 = ref1.length; j < len1; j++) {
						p = ref1[j];
						p.z = 8 * noiser.noise(p.x / 18, p.y / 18, t * 9e-5);
			  		}
			  		results.push(surf.dirty = true);
				}

				//shape
			  		//.rotz(Math.sin(d / 1000))
			  		//.roty( Math.sin(d/1000) * 5e-2)
		
				return results;
		  	});
		  	this.animator.start();
			this.setupCheckInterval();
		});
		
	</script>

</purr-home>