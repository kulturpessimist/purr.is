<manifest>
		
	<section id="manifest">
	
		<purr-carousel>
			
			<article id="overview">
				<h1>
					{ PURR.i18n.manifest.headline }
					<span class="label manifest" data-label="{ PURR.i18n.manifest.version } "></span>
				</h1>
			</article>

			<article each="{ chapter, i in PURR.i18n.manifest.chapters }" id="{ 'chapter'+i }" >
				<h2>{ chapter.headline }</h2>
				<p>
					{ chapter.content }
				</p>
			</article>
						
		</purr-carousel>

	</section>
	
</manifest>