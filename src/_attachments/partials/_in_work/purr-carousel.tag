<purr-carousel>

	<style>

		purr-carousel {
			position: relative;
			overflow: hidden;
			overflow-x: hidden;
		  	width: 100vw; height: 100vh;

		}

		div#slider {
		  	position: relative;
		  	margin: 0;
		  	left: 0%;
		  	text-align: left;
		  	transition: left 1s;
		}
				
		div.forward,
		div.backward{
			width: 40px;
			height: 100vh;
			
			background-image: url('data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2222%22%20height%3D%22142%22%20viewBox%3D%220%200%2022%20142%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%3Cpath%20d%3D%22M1%20141l20-70-20-70%22%20stroke-width%3D%222%22%20stroke%3D%22%23039be5%22%20fill%3D%22none%22%2F%3E%3C%2Fsvg%3E');
			background-position: center center;
			background-repeat: no-repeat;
			background-size: 30%;
		
			cursor: pointer;
			position: relative;
			top: 0px;
			left: 0px;
			transition: opacity 1s ease;
		}
		div.backward{
			transform: rotate(180deg);
		}
		div.forward{
			margin-left: calc(100vw - 50px);
			margin-top: -100vh;
			z-index: 9999998;
		}
		
		div#slider > *{
		  	width: 100vw;
		  	min-height:100vh;
		  	float: left;
		}
		
		.invisible{
			opacity: 0;
			cursor: default;
			pointer-events: none;
		}
		/*
		* media queries ...
		**/

		/* Larger than mobile screen */
		@media (min-width: 40.0rem) {
			div.forward,
			div.backward{
				width: 100px;
				background-size: inherit;
			}
			div.forward{
				margin-left: calc(100vw - 100px);
			}
		}
		/* Larger than tablet screen */
		@media (min-width: 80.0rem) {
			
		}
		/* Larger than desktop screen */
		@media (min-width: 120.0rem) {
			
		}
	</style>
		
	<div id="slider">
		
		<yield />
	
	</div>

	<div class="{ backward:true, invisible:(this.counter==0) }" onclick="{ this.previouse }"></div>
	<div class="forward" onclick="{ this.next }"></div>

	<script>
		this.counter = 0;
		
		this.on('mount', function() {
			this.counter = 0;
			this.max = this.slider.querySelectorAll('div#slider > *').length-1 ;
			this.slider.style.width = (this.max+1) * 100 + "%";
		});
	
		this.previouse = function() {
		  	this.counter==0?this.counter=this.max:--this.counter;
		  	this.slider.style.left = "-"+(this.counter*100)+"%";
		}
		this.next = function() {
		  	this.counter==this.max?this.counter=0:++this.counter;
		  	this.slider.style.left = "-"+(this.counter*100)+"%";
		}
	</script>
	
</purr-carousel>