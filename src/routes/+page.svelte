<script lang="ts">
	import GridOverlay from './GridOverlay.svelte';
	import HeroBanner from './HeroBanner.svelte';
	import Navigation from './Navigation.svelte';
	import PageShell from './PageShell.svelte';
	import ProfileButtons, { type LinkSpec } from './ProfileButtons.svelte';

	const profileLinks: LinkSpec[] = [
		{
			href: '/works',
			label: 'My Works',
			variant: 'pink',
			icon: 'works'
		},
		{
			href: 'https://github.com/aster-void',
			label: 'GitHub',
			variant: 'cyan',
			rel: 'noopener noreferrer',
			target: '_blank',
			icon: 'github'
		},
		{
			href: 'https://zenn.dev/aster_void',
			label: 'Zenn',
			variant: 'purple',
			rel: 'noopener noreferrer',
			target: '_blank',
			icon: 'zenn'
		}
	];

	let showButtons = $state(false);

	function onHeroComplete() {
		showButtons = true;
	}
</script>

<GridOverlay />
<Navigation />

<PageShell>
	<div class="space-y-8 text-center">
		<HeroBanner onSequenceComplete={onHeroComplete} />
		<ProfileButtons links={profileLinks} visible={showButtons} />
	</div>
</PageShell>
