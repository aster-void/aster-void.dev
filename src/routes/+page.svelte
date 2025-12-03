<script lang="ts">
	import BackgroundGrid from './BackgroundGrid.svelte';
	import ContentLayout from './ContentLayout.svelte';
	import DescriptionSection from './DescriptionSection.svelte';
	import FooterCommand from './FooterCommand.svelte';
	import HeroSection from './HeroSection.svelte';
	import LinkSection from './LinkSection.svelte';
</script>

/*! 🌼 daisyUI 5.1.7 */ /*! 🌼 daisyUI 5.1.7 */
<BackgroundGrid />

<ContentLayout>
	<div class="space-y-8 text-center">
		<HeroSection />
		<DescriptionSection />
		<LinkSection />
		<FooterCommand />
	</div>
</ContentLayout>
