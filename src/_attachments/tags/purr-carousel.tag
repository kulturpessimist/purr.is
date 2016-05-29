<purr-carousel>

	<style>

		carousel {
			position: relative;
			overflow: hidden;
		  	width: 100vw; height: 100vh;
		}

		div#slider {
		  	position: relative;
		  	margin: 0;
		  	left: 0%;
		  	text-align: left;
		  	font-size: 0;
		  	transition: left 1s;
		}
		div.navigation{
			width: 100px;
			height: 100vh;
			margin-left: calc(100vw - 100px);
			
			position: relative;
			z-index: 9999999;
			
			background-image: url('data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2222%22%20height%3D%22142%22%20viewBox%3D%220%200%2022%20142%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%3Cpath%20d%3D%22M1%20141l20-70-20-70%22%20stroke-width%3D%222%22%20stroke%3D%22%23039be5%22%20fill%3D%22none%22%2F%3E%3C%2Fsvg%3E');
			background-position: center center;
			background-repeat: no-repeat;
		
			cursor: pointer;
		}
		
		div#slider > *{
		  	width: 100vw;
		  	min-height:100vh;
		  	float: left;
		}
		
	</style>
		
	<div id="slider">
		
		<yield />
	
	</div>

	<div class="navigation" onclick="{ this.next }"></div>
	
	<script>
		
		this.on('mount', function() {
			this.counter = 0;
			this.max = this.slider.querySelectorAll('div#slider > *').length-1 ;
			this.slider.style.width = (this.max+1) * 100 + "%";
		});
	
		this.next = function() {
		  	this.counter==this.max?this.counter=0:++this.counter;
		  	this.slider.style.left = "-"+(this.counter*100)+"%";
		}
			
	</script>
	
</purr-carousel>