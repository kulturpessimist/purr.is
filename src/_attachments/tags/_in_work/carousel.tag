<carousel>
	
	<style>
	
		.riotCarousel {
			display: block;
			width: 100%;
			height: 100%;
			overflow: hidden;
			margin: 0 auto;
			-ms-user-select: none;
			-moz-user-select: none;
			-webkit-user-select: none;
			user-select: none;
			text-space-collapse: trim-inner;
		}
		.riotCarousel[data-show-indicators="true"][data-indicators-position="in"] {
			-webkit-margin-after: -25px; /* Webkit only as only Webkit-based browsers will support the dots in the wrapper */
		}
		.riotCarousel[data-animation-style] {
			-moz-transition-timing-function: ease-in-out;
			-webkit-transition-timing-function: ease-in-out;
			transition-timing-function: ease-in-out;
		}
		/* Inherit all animation properties from parent element */
		.riotCarousel[data-animation-style] *,
		.riotCarousel[data-show-buttons="true"][data-animation-style] label:before,
		.riotCarousel[data-show-buttons="true"][data-animation-style] label:after {
			-moz-transition-duration: inherit;
			-webkit-transition-duration: inherit;
			transition-duration: inherit;
			-moz-transition-timing-function: inherit;
			-webkit-transition-timing-function: inherit;
			transition-timing-function: inherit;
		}
		/* WRAPPER */
		.riotCarouselWrapper {
			display: block;
			width: 100%;
			height: 100%;
			position: relative;
			/* Styling */
			text-align: center;
		}
		slides{
			width: 100%;
			height: 100%;
			display: block;
		}
		/* Indicators */
		.riotCarousel[data-show-indicators="true"] input {
			width: 10px;
			height: 10px;
			outline: none;
			position: relative;
			top: calc(100% + 7px);
			-ms-transform: scale(1); /* fallback for IE: supports radio button resizing, does not support :after. Not necessary, put for readibility. */
			-moz-transform: scale(0.6); /* fallback for Firefox: does not radio button resizing, does not support :after */
			-webkit-appearance: none; /* hide radio buttons for Webkit: supports :after */
		}
		.riotCarousel[data-show-indicators="true"] input:checked {
			-ms-transform: scale(1.25); /* fallback for IE: supports radio button resizing, does not support :after */
			-moz-transform: scale(0.9); /* fallback for Firefox: does not radio button resizing, does not support :after */
		}
		/* Webkit-only goodness - for now */
		.riotCarousel[data-show-indicators="true"] input:after {
			content: '';
			display: block;
			position: absolute;
			left: 0;
			width: 8px;
			height: 8px;
			border: 1px solid;
			border-radius: 100%;
			cursor: pointer;
			z-index: 4;
			-moz-transition-property: transform, background;
			-webkit-transition-property: transform, background;
			transition-property: transform, background;
		}
		.riotCarousel[data-show-indicators="true"][data-indicators-position="under"] input:after {
			top: -2px;
			background: rgba(0, 0, 0, 0);
			border-color: rgb(0, 0, 0);
		}
		.riotCarousel[data-show-indicators="true"][data-indicators-position="in"] input:after {
			top: -35px;
			box-shadow: inset 0 0 2px rgba(0, 0, 0, 0.25), 0 0 2px rgba(0, 0, 0, 0.25);
			background: rgba(235, 235, 235, 0);
			border-color: rgb(235, 235, 235);
		}
		.riotCarousel[data-show-indicators="true"] input:checked:after {
			-webkit-transform: scale(1.25);
		}
		.riotCarousel[data-show-indicators="true"][data-indicators-position="under"] input:checked:after {
			background: rgb(0, 0, 0)
		}
		.riotCarousel[data-show-indicators="true"][data-indicators-position="in"] input:checked:after {
			box-shadow: 0 0 2px rgba(0, 0, 0, 0.25);
			background: rgb(235, 235, 235);
		}
		.riotCarousel:not([data-show-indicators="true"]) input {
			display: none;
		}
		/* SLIDES */
		.riotCarousel label {
			display: inline-block;
			width: 100%;
			height: 100%;
			position: absolute;
			top: 0;
		}
		.riotCarousel[data-animation-style="slide"] label {
			-moz-transition-property: left;
			-webkit-transition-property: left;
			transition-property: left;
		}
		.riotCarousel label img {
			width: 100%;
			height: 100%;
		}
		/* Slides on the left */
		.riotCarousel label {
			left: -100%;
		}
		/* Slides on the right */
		.riotCarousel input:checked ~ label {
			left: 100%;
		}
		/* Active slide */
		.riotCarousel input:checked + label {
			left: 0;
		}
		/* PREV/NEXT ARROWS */
		.riotCarousel[data-show-buttons="true"] label:before,
		.riotCarousel[data-show-buttons="true"] label:after {
			display: block;
			position: absolute;
			width: 60px;
			height: 60px;
			top: calc((100% - 60px) / 2);
			/* Styling */
			background: rgb(235, 235, 235);
			font-size: 35px;
			font-weight: 800;
			font-family: Consolas;
			line-height: 56px;
			color: black;
			z-index: 1;
			cursor: pointer;
		}
		.riotCarousel[data-show-buttons="true"][data-animation-style="slide"] label:before,
		.riotCarousel[data-show-buttons="true"][data-animation-style="slide"] label:after {
			-moz-transition-property: left, right;
			-webkit-transition-property: left, right;
			transition-property: left, right;
		}
		.riotCarousel[data-show-buttons="true"] label:hover:before,
		.riotCarousel[data-show-buttons="true"] label:hover:after {
			/* Styling */
			background: rgb(245, 245, 245);
		}
		/* Slides on the left */
		.riotCarousel[data-show-buttons="true"] label:before {
			right: -100%;
			opacity: 0;
			/* Styling */
			content: '>'; /* next */
		}
		.riotCarousel[data-show-buttons="true"] label:after {
			left: 100%;
			opacity: 1;
			/* Styling */
			content: '<'; /* previous */
		}
		/* Slides on the right */
		.riotCarousel[data-show-buttons="true"] input:checked ~ label:before {
			right: 100%;
			opacity: 1;
		}
		.riotCarousel[data-show-buttons="true"] input:checked ~ label:after {
			left: -100%;
			opacity: 0;
			cursor: default;
		}
		/* Active slide */
		.riotCarousel[data-show-buttons="true"] input:checked + label:before {
			right: 0;
			opacity: 0;
			cursor: default;
		}
		.riotCarousel[data-show-buttons="true"] input:checked + label:after {
			left: 0;
		}
		/* Buttons positioning */
		.riotCarousel[data-show-buttons="true"] label:after {
			z-index: 3; /* move "previous" buttons forward... */
		}
		.riotCarousel[data-show-buttons="true"] input:checked ~ label:after {
			z-index: 1; /* ...except the one for an active slide */
		}
		.riotCarousel[data-show-buttons="true"] input:checked + label + input + label:before {
			z-index: 3; /* move "next" button one slide ahead forward... */
		}
		/* WRAP ARROWS */
		.riotCarousel[data-show-buttons="true"][data-show-wrap-buttons="true"] label:first-of-type:before,
		.riotCarousel[data-show-buttons="true"][data-show-wrap-buttons="true"] label:last-of-type:after {
			z-index: 2 !important;
			opacity: 1 !important;
			cursor: pointer !important;
			/* Styling */
			letter-spacing: -9px;
			text-align: left;
			padding-left: 14px;
			width: 46px;
		}
		.riotCarousel[data-show-buttons="true"][data-show-wrap-buttons="true"] label:first-of-type:before {
			content: '<<'; /* jump to first */
			right: 0 !important;
		}
		.riotCarousel[data-show-buttons="true"][data-show-wrap-buttons="true"] input:not(:checked) + label:first-of-type:before {
			right: -100% !important;
		}
		.riotCarousel[data-show-buttons="true"][data-show-wrap-buttons="true"] label:last-of-type:after {
			content: '>>'; /* jump to last */
			left: 0 !important;
		}
		.riotCarousel[data-show-buttons="true"][data-show-wrap-buttons="true"] input:not(:checked) + label:last-of-type:after {
			left: -100% !important;
		}
	</style>
	
	<div class="riotCarousel" style="transition-duration: 0.5s;"
		data-show-indicators="false"
		data-indicators-position="in"
		data-show-buttons="true"
		data-show-wrap-buttons="false"
		data-animation-style="slide">
		
		<div class="riotCarouselWrapper">
			
			<slides each={ slide, i in opts.slides }>
				<input type="radio" name="css3slideshow" id="{ 'slide'+i }" checked="checked" />
				<label for="{ 'slide'+i }">
					<raw content="{ slide }"></raw>
				</label>
			</slides>
			
		</div>
	</div>

	
</carousel>